//
//  delete_employee.swift
//  IEmployeeRegister
//
//  Created by Romero Mendonça on 30/05/23.
//

import Foundation

extension EmployeeController {
    func deleteById() -> String {
        do {
            let employeers: [Employee] = try repository.findAll();
            
            if employeers.isEmpty {
                return "Não há funcionários cadastrados.";
            }
            
            var output: String = """
            Lista de Funcionários:
            
            """;
            
            for (index, employee) in employeers.enumerated() {
                
                output += """
                    \(index + 1) - \(employee.nome):
                        Cargo: \(employee.cargo)
                        Salário: \(employee.salario)
                
                """;
            }
            
            
            
            print(output);
            
            print("Número do funcionário que deseja remover: ", terminator: " ");
            guard let selectedIndex = Int(readLine()!) else { return "Valor Inválido"  };
        
            
            
            try repository.deleteById(id: employeers[selectedIndex - 1].id);
            
            return "Funcionário Removido com Sucesso!";
        } catch AppError.employeeNotFound {
            return "Funcionário Não Encontrado";
        } catch {
            return "Erro Desconhecido \(error)";
        }
    }
}
