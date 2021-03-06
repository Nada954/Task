//
//  CharacterGatewayTests.swift
//  MarvelTests
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation
@testable import Marvel
@testable import Promises
import XCTest

final class CharacterGatewayTests: XCTestCase {
    var apiClientSpy: APIClientSpy<MarvelCharacter>!
    var characterGateway: CharacterGateway!

    override func setUp() {
        apiClientSpy = .init()
        characterGateway = APICharacterGateway(apiClient: apiClientSpy)
    }

    override func tearDown() {
        apiClientSpy = nil
        characterGateway = nil
        super.tearDown()
    }

    func testLoadCharactersWithSuccess() {
        // Given
        let results = MarvelCharacter.items()
        let paginator = Paginator.value(results: results)
        let parameter = MarvelParameter(CharacterParameter(query: "any"))
        apiClientSpy.promise = .init { MarvelResponse(data: paginator) }

        // When
        let promise = characterGateway.loadCharacters(with: parameter)

        // Then

        XCTAssert(waitForPromises(timeout: 10.0))
        XCTAssertEqual(apiClientSpy.request.path, "characters")
        XCTAssertEqual(apiClientSpy.request.method, .get)
        XCTAssertEqual(
            apiClientSpy.request.urlParameters,
            try? MarvelParameter(parameter).encoded()
        )
        XCTAssertEqual(promise.value, paginator)
        XCTAssertNil(promise.error)
    }

    func testLoadCharactersWithFailure() {
        // Given
        let error = MarvelError.general
        let parameter = MarvelParameter(CharacterParameter(query: "any"))
        apiClientSpy.promise = .init { MarvelResponse<MarvelCharacter>(message: error.message) }

        // When
        let promise = characterGateway.loadCharacters(with: parameter)

        // Then

        XCTAssert(waitForPromises(timeout: 10.0))

        XCTAssertNil(promise.value)
        XCTAssertEqual(promise.error as? MarvelError, error)
    }
}
