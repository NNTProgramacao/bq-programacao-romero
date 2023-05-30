//
//  ui.swift
//  IEmployeeRegister
//
//  Created by Romero Mendonça on 23/05/23.
//

import Foundation


struct IEmployeeRegisterApplication {
    private var controller: EmployeeController;
    private var options: [() -> String];
    
    init(repository: EmployeeRepository) {
        print("Bem Vindo ao IEmployee Register");
        self.controller = EmployeeController(repository: repository);
        self.options = [
            self.controller.createEmployee,
            self.controller.findAll,
            self.controller.findByName,
            self.controller.deleteById
        ]
    }
    
    func start() -> Void {
        while true {
            defer {
                print("Pressione qualquer tecla para continuar...\n", terminator: " ");
                readLine();
            }
            
            printOptions()
            
            let option: UInt = inputOptions();
            
            
            if option == 5 {
                break
            }
            
            let result: String = executeSelectedOption(option: option);
            print(result)
        }
        
        print("Aplição Finalizada Com Sucesso")
    }
    
    
    private func printOptions() -> Void {
        print("""
        Selecione uma das opções a seguir:
            1 - Cadastrar Funcionário
            2 - Listar Todos Funcionários
            3 - Listar Funcionários por Nome
            4 - Apagar Funcionário
            5 - Sair do Sistema
        """);
    }
    
    private func inputOptions() -> UInt {
        print("Digite o número da opção:", terminator: " ")
        let option = UInt(readLine()!) ?? 0;
        
        while  !(1..<6).contains(option) {
            print("Opção Inválida!");
            return self.inputOptions();
        }
        
        return UInt(option);
    }
    
    private func executeSelectedOption(option: UInt) -> String {
        let selectedOption = options[Int(option) - 1];
        
        return selectedOption();
    }
    
    
}
