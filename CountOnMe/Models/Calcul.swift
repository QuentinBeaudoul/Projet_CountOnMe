//
//  Calcul.swift
//  CountOnMe
//
//  Created by Quentin on 29/10/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
class Calcul {

    func executeOperation(firstOperande op1: Int, operator ope: CalculType, secondeOperande op2: Int) -> Int {
        switch ope {
        case .add:
            return addition(firstOperande: op1, secondeOperande: op2)
        case .substract:
            return substraction(firstOperande: op1, secondeOperande: op2)
        case .divide:
            print("TODO")
            return 0
        case .multiplies:
            print("TODO")
            return 0
        }
    }

    private func addition(firstOperande: Int, secondeOperande: Int) -> Int {
        return firstOperande + secondeOperande
    }
    private func substraction(firstOperande: Int, secondeOperande: Int) -> Int {
        return firstOperande - secondeOperande
    }

}

// Operande type
enum CalculType {
    case add
    case substract
    case divide
    case multiplies
}
