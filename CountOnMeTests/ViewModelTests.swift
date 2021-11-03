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
}
