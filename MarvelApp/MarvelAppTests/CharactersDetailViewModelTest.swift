//
//  CharactersDetailViewModelTest.swift
//  MarvelAppTests
//
//  Created by admin on 5/16/22.
//

import XCTest
@testable import MarvelApp

class CharactersDetailViewModelTest: XCTestCase {
    var characterDetailViewModel: CharacterDetailViewModel!
    var networkManager: NetworkManager!

    func makeCharactersDetailViewModel() -> CharacterDetailViewModel {
        networkManager = NetworkManager()
        characterDetailViewModel = CharacterDetailViewModel(networkManager: networkManager)
        return characterDetailViewModel
    }

    func testCharactersViewController() {
        let _ = makeCharactersDetailViewModel()
        XCTAssertNotNil(characterDetailViewModel)
    }
}




