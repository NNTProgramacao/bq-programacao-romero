//
//  employee.swift
//  IEmployeeRegister
//
//  Created by Romero Mendonça on 23/05/23.
//

import Foundation

struct Employee: Codable {
    var id: String;
    var nome: String;
    var cargo: String;
    var salario: Double;
    
    init(id: String, nome: String, cargo: String, salario: Double) {
        self.id = id;
        self.nome = nome;
        self.cargo = cargo;
        self.salario = salario;
    }
}
