//
//  ViewModel.swift
//  CountOnMe
//
//  Created by Quentin on 29/10/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Model {

    var elements: [String]

    var calcul: Calcul
    init() {
        elements = [String]()
        calcul = Calcul()
    }

    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != CalculType.add.rawValue && elements.last != CalculType.substract.rawValue
        && elements.last != CalculType.divide.rawValue && elements.last != CalculType.multiplies.rawValue
    }

    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    var canAddOperator: Bool {
        return elements.last != CalculType.add.rawValue && elements.last != CalculType.substract.rawValue
        && elements.last != CalculType.multiplies.rawValue && elements.last != CalculType.divide.rawValue
    }
    var expressionHaveResult: Bool {
        return !elements.filter { $0.contains("=") }.isEmpty
    }

    // Perform calcul process and return a displayable result
    func calculating() -> String? {
        var result = 0.0
        var operationToReduce = elements

        // If operationToReduce not contain "Invalid operation" elements
        if !operationToReduce.filter({ $0.contains("Invalid") }).isEmpty {
            return nil
        }

        while operationToReduce.count > 1 {
            let nextOp = findNextOperation(inTab: operationToReduce)

            if let opeL = Double(operationToReduce[nextOp?[0] ?? 0]),
               let operande = CalculType(rawValue: operationToReduce[nextOp?[1] ?? 1]),
               let opeR = Double(operationToReduce[nextOp?[2] ?? 2]) {

                result = calcul.executeOperation(firstOperande: opeL, operator: operande, secondeOperande: opeR)
                if result == Double.greatestFiniteMagnitude {
                    return " = Invalid"
                }

                operationToReduce.removeSubrange((nextOp?[0] ?? 0)...(nextOp?[2] ?? 2))
                operationToReduce = Array(operationToReduce)
                // move the result at the good place
                operationToReduce.insert("\(result)", at: (nextOp?[0] ?? 0))

            }
        }
        return " = \(operationToReduce.first!)"
    }

    // Find the next prior operator and return -1, index and + 1 index
    private func findNextOperation(inTab tab: [String]) -> [Int]? {
        for (index, str) in tab.enumerated() {
            if str == CalculType.multiplies.rawValue || str == CalculType.divide.rawValue {
                return [index - 1, index, index + 1]
            }
        }
        return nil
    }
}
