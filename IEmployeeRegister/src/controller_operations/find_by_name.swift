//
//  find_by_name.swift
//  IEmployeeRegister
//
//  Created by Romero Mendonça on 30/05/23.
//

import Foundation

extension EmployeeController {
    func findByName() -> String {
        do {
            
            print("Nome:", terminator: " ")
            guard let nome = readLine() else {
                return "Nome Inválido. Operação Cancelada";
            }
            
            let employeers: [Employee] = try repository.findByName(name: nome);
            
            var output: String = """
            Lista de Funcionários Com Iniciais "\(nome):
            
            """;
            
            for (index, employee) in employeers.enumerated() {
                
                output += """
                    \(index + 1) - \(employee.nome):
                        Cargo: \(employee.cargo)
                        Salário: \(employee.salario)
                
                """;
            }
            return output;
        } catch AppError.employeeNotFound {
            return "Não foram encontrados funcionários com iniciais informadas";
        } catch  AppError.employeersIsEmpty {
            return "Não há funcionários cadastrados";
        } catch {
            return "Erro Desconhecido \(error)";
        }
    }

}


