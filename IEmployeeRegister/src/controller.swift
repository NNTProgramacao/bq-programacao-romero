//
//  core.swift
//  IEmployeeRegister
//
//  Created by Romero Mendonça on 30/05/23.
//

import Foundation

struct EmployeeController {
    var repository: EmployeeRepository;
    
    init(repository: EmployeeRepository) {
        self.repository = repository;
    }
    
}
