//
//  ViewModel.swift
//  CountOnMe
//
//  Created by Quentin on 29/10/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

class ViewModel {

    var elements: [String]

    var calcul: Calcul
    init() {
        elements = [String]()
        calcul = Calcul()
    }

    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-"
    }

    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-"
    }
    var expressionHaveResult: Bool {
        return !elements.filter { field in
            field.contains("=")
        }.isEmpty
    }

    func calculating() -> String? {
        var result = 0
        var operationToReduce = elements

        // If operationToReduce not contain "Invalid operation" elements
        if !operationToReduce.filter({ $0.contains("Invalid") }).isEmpty {
            return nil
        }

        while operationToReduce.count > 1 {
            if let opeL = Int(operationToReduce[0]),
               let operande = CalculType(rawValue: operationToReduce[1]),
               let opeR = Int(operationToReduce[2]) {

                result = calcul.executeOperation(firstOperande: opeL, operator: operande, secondeOperande: opeR)
                operationToReduce = Array(operationToReduce.dropFirst(3))
                operationToReduce.insert("\(result)", at: 0)
            } else {
                return " = Invalid"
            }
        }
        return " = \(operationToReduce.first!)"
    }
}
