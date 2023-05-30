//
//  app_error.swift
//  IEmployeeRegister
//
//  Created by Romero Mendonça on 29/05/23.
//

import Foundation

enum AppError: Error {
    case employeersIsEmpty
    case employeeNotFound
    case databaseError
    case imcompleteRegister
}
