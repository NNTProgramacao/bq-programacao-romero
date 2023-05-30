//
//  create_employee.swift
//  IEmployeeRegister
//
//  Created by Romero Mendonça on 30/05/23.
//

import Foundation

extension EmployeeController {
    func createEmployee() -> String {
        
        do {
            print("Nome: ", terminator: " ")
            guard let nome = readLine()else {
                return "Nome Inválido. Operação Cancelada";
            }
            
            print("Cargo: ", terminator: " ")
            guard let cargo = readLine() else {
                return "Cargo Inválido. Operação Cancelada";
            }
            
            print("Salário: ", terminator: " ")
            guard let salario = Double(readLine()!) else {
                return "Salário Inválido. Operação Cancelada";
            }
            let id : UUID = UUID()
            let employee: Employee = Employee(id: id.uuidString, nome: nome, cargo: cargo, salario: salario);
            try repository.createEmployee(employee: employee);
            
            return "Funcionário Cadastrado com Sucesso!";
        } catch AppError.databaseError {
            return "Não foi possível acessar o banco de dados!";
        } catch AppError.imcompleteRegister{
            return "Cadastro Incompleto. Operação Cancelada"
        } catch {
            return "Erro Desconhecido: \(error)";
        }
    }
}
