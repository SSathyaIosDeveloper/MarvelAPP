//
//  NavigationControllerTest.swift
//  MarvelAppTests
//
//  Created by admin on 5/16/22.
//



import XCTest
@testable import MarvelApp

class NavigationControllerTest: XCTestCase  {
   
    var charactersViewController = CharactersViewController()
    
    func testNavigationControllerIsPushed() throws {
        let mockNavigationController = SpyNavigationController(rootViewController: charactersViewController)
        let characterDetailCoordinator = CharacterDetailCoordinator(with: mockNavigationController, with: nil)
        characterDetailCoordinator.start()
        guard let _ = mockNavigationController.pushedViewController as? CharactersDetailViewController else {
            XCTFail()
            return
        }
    }
}


