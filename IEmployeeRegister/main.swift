//
//  main.swift
//  IEmployeeRegister
//
//  Created by Romero Mendonça on 17/05/23.


import Foundation

let employeeRepository: EmployeeRepository = EmployeeRepositoryImp()
let application: IEmployeeRegisterApplication = IEmployeeRegisterApplication(repository: employeeRepository)
application.start();
