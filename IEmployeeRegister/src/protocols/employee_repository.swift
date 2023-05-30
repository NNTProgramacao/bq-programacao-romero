//
//  employee_protocol.swift
//  IEmployeeRegister
//
//  Created by Romero Mendonça on 23/05/23.
//

import Foundation

//1) Cadastrar Funcionario:
//      - Nome
//      - Cargo
//      - Salário
//  2) Listar todos os funcionários
//  3) Excluir Funcionários pelo nome
//  4)Buscar funcionário por nome

protocol EmployeeRepository {
    func createEmployee(employee: Employee) throws -> Void;
    func findByName(name: String) throws -> [Employee];
    func findById(id: String) throws -> Employee;
    func findAll() throws -> [Employee];
    func deleteById(id: String) throws -> Void;
}
