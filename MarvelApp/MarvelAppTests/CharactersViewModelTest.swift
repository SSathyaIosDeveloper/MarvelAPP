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
    
    override func setUpWithError() throws {
           try super.setUpWithError()
           networkManager = NetworkManager()
           charactersViewModel = CharactersViewModel(networkManager: networkManager)
       }
}

