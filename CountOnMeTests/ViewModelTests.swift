//
//  ViewModelTests.swift
//  CountOnMeTests
//
//  Created by Quentin Beaudoul on 03/11/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
import XCTest
@testable import CountOnMe

class ViewModelTests: XCTestCase {

    let viewModel = ViewModel()

    func testGivenWrongExpression_WhenChecking_ThenExpressionShouldBeInvalidated() {
        // Given
        viewModel.elements = ["5", "*", "7", "+"]

        // When
        let result = viewModel.expressionIsCorrect

        // Then
        XCTAssert(result == false)
    }

    func testGivenGoodExpression_WhenChecking_ThenExpressionShouldBeValidated() {
        // Given
        viewModel.elements = ["5", "*", "7", "+", "14"]

        // When
        let result = viewModel.expressionIsCorrect

        // Then
        XCTAssert(result == true)
    }

    func testGivenTooShortExpression_WhenCheckingIfHaveEnoughElements_ThenExpressionShouldBeInvalidate() {
        // Given
        viewModel.elements = ["5", "*"]

        // When
        let result = viewModel.expressionHaveEnoughElement

        // Then
        XCTAssert(result == false)
    }

    func testGivenEnoughLongExpression_WhenCheckingIfHaveEnoughElements_ThenExpressionShouldBeValidate() {
        // Given
        viewModel.elements = ["5", "*", "3"]

        // When
        let result = viewModel.expressionHaveEnoughElement

        // Then
        XCTAssert(result == true)
    }

    func testGivenExpressionWithOperatorInLast_WhenTryToAddOperator_ThenExpressionShouldBeInvalidate() {
        // Given
        viewModel.elements = ["4", "-", "2", "+"]

        // When
        let result = viewModel.canAddOperator

        // Then
        XCTAssert(result == false)
    }

    func testGivenExpressionWithOperandeInLast_WhenTryToAddOperator_ThenExpressionShouldBeValidate() {
        // Given
        viewModel.elements = ["4", "-", "2", "+", "9"]

        // When
        let result = viewModel.canAddOperator

        // Then
        XCTAssert(result == true)
    }

    func testGivenWellFormedExpression_WhenCheckIfResult_ThenExpressionShouldBeValidate() {
        // Given
        viewModel.elements = ["4", "-", "2", "+", "9", "=", "11"]

        // When
        let result = viewModel.expressionHaveResult

        // Then
        XCTAssert(result == true)
    }

    func testGivenWellMalFormedExpression_WhenCheckIfResult_ThenExpressionShouldBeInvalidate() {
        // Given
        viewModel.elements = ["4", "-", "2", "+", "9"]

        // When
        let result = viewModel.expressionHaveResult

        // Then
        XCTAssert(result == false)
    }

    func testGivenExpression_WhenPerformCalcul_ThenResultShouldBeReturnAsString() {
        // Given
        viewModel.elements = ["4", "-", "2", "+", "9"]

        // When
        let result = viewModel.calculating()!

        // Then
        XCTAssertEqual(result, " = 11.0")
    }

    func testGivenComplexeExpression_WhenPerformCalcul_ThenResultShouldBeReturnAsString() {
        // Given
        viewModel.elements = ["4", "-", "2", "/", "5", "+", "9", "*", "4"]

        // When
        let result = viewModel.calculating()!

        // Then
        XCTAssertEqual(result, " = 39.6")
    }

    func testGivenExpressionContainInvalid_WhenPerformCalcul_ThenResultShouldReturnNil() {
        // Given
        viewModel.elements = ["4", "-", "2", "/", "5", "+", "9", "*", "4", "Invalid"]

        // When
        let result = viewModel.calculating()

        // Then
        XCTAssertNil(result)
    }

    func testGivenExpressionContainZeroAsDiviser_WhenPerformCalcul_ThenResultShouldReturnInvalid() {
        // Given
        viewModel.elements = ["4", "/", "0"]

        // When
        let result = viewModel.calculating()!

        // Then
        XCTAssertEqual(result, " = Invalid")
    }
}
