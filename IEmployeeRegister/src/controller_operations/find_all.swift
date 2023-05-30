//
//  find_all.swift
//  IEmployeeRegister
//
//  Created by Romero Mendonça on 30/05/23.
//

import Foundation

extension EmployeeController {
    func findAll() -> String {
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
            
            return output;
            
        } catch  AppError.employeersIsEmpty {
            return "Não há funcionários cadastrados";
        } catch {
            return "Erro Desconhecido \(error)";
        }
    }
    
}
