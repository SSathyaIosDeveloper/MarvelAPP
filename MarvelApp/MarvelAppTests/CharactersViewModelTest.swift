//
//  CharactersViewModelTest.swift
//  MarvelAppTests
//
//  Created by admin on 5/12/22.
//

import XCTest
@testable import MarvelApp

class CharactersViewModelTest: XCTestCase {
    var charactersViewModel: CharactersViewModel!
    var networkManager: NetworkManager!

    func makeCharactersViewModel() -> CharactersViewModel {
        networkManager = NetworkManager()
        charactersViewModel = CharactersViewModel(networkManager: networkManager)
        return charactersViewModel
    }

    func testCharactersViewController() {
        let _ = makeCharactersViewModel()
        XCTAssertNotNil(charactersViewModel)
    }
}



