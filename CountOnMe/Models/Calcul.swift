//
//  Calcul.swift
//  CountOnMe
//
//  Created by Quentin on 29/10/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
class Calcul {

    func executeOperation(firstOperande op1: Double, operator ope: CalculType, secondeOperande op2: Double) -> Double {
        switch ope {
        case .add:
            return addition(firstOperande: op1, secondeOperande: op2)
        case .substract:
            return substraction(firstOperande: op1, secondeOperande: op2)
        case .divide:
            return divide(firstOperande: op1, secondeOperande: op2)
        case .multiplies:
            return multiplication(firstOperande: op1, secondeOperande: op2)
        }
    }

    private func addition(firstOperande: Double, secondeOperande: Double) -> Double {
        return firstOperande + secondeOperande
    }

    private func substraction(firstOperande: Double, secondeOperande: Double) -> Double {
        return firstOperande - secondeOperande
    }

    private func multiplication(firstOperande: Double, secondeOperande: Double) -> Double {
        return firstOperande * secondeOperande
    }
    private func divide(firstOperande: Double, secondeOperande: Double) -> Double {
        if secondeOperande == 0 {
            return Double.greatestFiniteMagnitude
        }
        return firstOperande / secondeOperande
    }
}

// Operande type
enum CalculType: String {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiplies = "*"
}
