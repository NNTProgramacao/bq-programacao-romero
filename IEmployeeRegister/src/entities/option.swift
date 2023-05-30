//
//  option.swift
//  IEmployeeRegister
//
//  Created by Projeto Apraxia on 29/05/23.
//

import Foundation

struct Option {
    var name: String
    var execute: (Any?) -> String
    
    init(name: String, execute: @escaping (Any?) -> String) {
        self.name = name
        self.execute = execute
    }
}
