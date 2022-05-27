//
//  MarvelAppTests.swift
//  MarvelAppTests
//
//  Created by admin on 4/27/22.
//

import XCTest
@testable import MarvelApp

enum ApiError: String, Error {
    case unknownError = "Something went wrong. Please try again later"
}

class mockNetworkManager: XCTestCase {
    
    var mockNetworkManager: NetworkManagerTest?
    var charactersViewModel: CharactersViewModel?
    var characterDetailViewModel: CharacterDetailViewModel?
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = NetworkManagerTest()
        charactersViewModel = CharactersViewModel(networkManager: mockNetworkManager)
        characterDetailViewModel = CharacterDetailViewModel(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        charactersViewModel = nil
        mockNetworkManager = nil
        super.tearDown()
    }
    
    func testAPICalls() {
        self.charactersViewModel?.getCharactersFromMarvel()
        XCTAssert(mockNetworkManager!.isCharacterFromMarvelAPICalled)
        self.characterDetailViewModel?.getCharacterDetailFromMarvel(resultId: 1017100)
        XCTAssert(mockNetworkManager!.isCharacterFromMarvelAPICalled)
    }
    
    func testCharacterAPICallFail() {
        self.charactersViewModel?.getCharactersFromMarvel()
        mockNetworkManager!.fetchFail(error: ApiError.unknownError)
        XCTAssert(mockNetworkManager!.isApiCallfail)
    }
    
    func testCharacterAPICallSuccess() {
        self.charactersViewModel?.getCharactersFromMarvel()
        mockNetworkManager!.fetchSuccess()
        XCTAssert(mockNetworkManager!.isApiCallSuccess)
    }
    
    func testCharacterDetailAPICallFail() {
        self.characterDetailViewModel?.getCharacterDetailFromMarvel(resultId: 1017100)
        mockNetworkManager!.fetchFail(error: ApiError.unknownError)
        XCTAssert(mockNetworkManager!.isApiCallfail)
    }
    
    func testCharacterDetailAPICallSuccess() {
        self.characterDetailViewModel?.getCharacterDetailFromMarvel(resultId: 1017100)
        mockNetworkManager!.fetchSuccess()
        XCTAssert(mockNetworkManager!.isApiCallSuccess)
    }
    
}
