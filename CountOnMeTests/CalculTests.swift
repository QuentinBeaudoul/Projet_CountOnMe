//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculTests: XCTestCase {

    let calcul = Model().calcul

    func testGivenTwoNumbers_WhenAdditioning_ThenFirstOperandShouldAddSecondeOperande() {
        // Given
        let firstOperande = 5.0
        let secondeOperande = 10.0

        // When
        let result = calcul.executeOperation(firstOperande: firstOperande,
                                                       operator: CalculType.add,
                                                       secondeOperande: secondeOperande)
        // Then
        XCTAssertEqual(result, 15)
    }

    func testGivenTwoNumbers_WhenSubstractioning_ThenFirstOperandShouldBeSubstractBySecondeOperande() {
        // Given
        let firstOperande = 5.0
        let secondeOperande = 2.0

        // When
        let result = calcul.executeOperation(firstOperande: firstOperande,
                                                       operator: CalculType.substract,
                                                       secondeOperande: secondeOperande)
        // Then
        XCTAssertEqual(result, 3)
    }

    func testGivenTwoNumbers_WhenMultiplicationing_ThenFirstOperandShouldMultiplieSecondeOperande() {
        // Given
        let firstOperande = 5.0
        let secondeOperande = 2.0

        // When
        let result = calcul.executeOperation(firstOperande: firstOperande,
                                                       operator: CalculType.multiplies,
                                                       secondeOperande: secondeOperande)
        // Then
        XCTAssertEqual(result, 10)
    }

    func testGivenTwoNumbers_WhenDividing_ThenFirstOperandShouldBeDividedBySecondeOperande() {
        // Given
        let firstOperande = 10.0
        let secondeOperande = 2.0

        // When
        let result = calcul.executeOperation(firstOperande: firstOperande,
                                                       operator: CalculType.divide,
                                                       secondeOperande: secondeOperande)
        // Then
        XCTAssertEqual(result, 5)
    }

    func testGivenTwoNumbersDiviserIsZero_WhenDividing_ThenFirstOperandShouldBeDividedBySecondeOperande() {
        // Given
        let firstOperande = 10.0
        let secondeOperande = 0.0

        // When
        let result = calcul.executeOperation(firstOperande: firstOperande,
                                                       operator: CalculType.divide,
                                                       secondeOperande: secondeOperande)
        // Then
        // Double.greatestFiniteMagnitude mean the result is impossible
        XCTAssertEqual(result, Double.greatestFiniteMagnitude)
    }

}
