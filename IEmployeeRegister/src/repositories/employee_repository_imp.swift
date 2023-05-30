//
//  employee_repository_imp.swift
//  IEmployeeRegister
//
//  Created by Romero Mendonça on 29/05/23.
//

import Foundation

struct EmployeeRepositoryImp: EmployeeRepository {
    let encoder = JSONEncoder();
    let decoder = JSONDecoder();
    let database = UserDefaults.standard;
    
    private func saveEmployeers(employeers: [Employee]) throws -> Void {
        let data = try encoder.encode(employeers)
        database.set(data, forKey: "employeers");
    }
    
    func findAll() throws -> [Employee] {
        guard let data = database.object(forKey: "employeers") as? Data  else {
            return [];
        }
        let employeers = try? decoder.decode([Employee].self, from: data)
        
        return employeers ?? [];
    }
    
    func createEmployee(employee: Employee) throws -> Void {
        
        if(employee.nome.isEmpty || employee.cargo.isEmpty) {
            throw AppError.imcompleteRegister;
        }
        var employeersList: [Employee] = try self.findAll();
        employeersList.append(employee);
        try saveEmployeers(employeers: employeersList);
    }
    
    func findByName(name: String) throws -> [Employee] {
        let allEmployeers: [Employee] = try self.findAll();
        let selectedEmployeers: [Employee] = allEmployeers.filter({$0.nome.lowercased().hasPrefix(name.lowercased()) });
        
        if selectedEmployeers.isEmpty {
            throw AppError.employeeNotFound;
        }
            
        return selectedEmployeers;
    }
    
    func findById(id: String) throws -> Employee {
        let allEmployeers: [Employee] = try self.findAll();
        guard let selectedEmployee: Employee = allEmployeers.first(where: {$0.id == id}) else {
            throw AppError.employeeNotFound;
        };
        
        return selectedEmployee;
    }
    
    func deleteById( id: String) throws -> Void {
        let selectedEmployee: Employee = try findById(id: id);
        
        let allEmployers: [Employee] = try findAll().filter({$0.id != selectedEmployee.id});
        try saveEmployeers(employeers: allEmployers);
        
    }
    
}
