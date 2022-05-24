//
//  CharactersViewControllerTest.swift
//  MarvelAppTests
//
//  Created by admin on 5/12/22.
//

import XCTest
@testable import MarvelApp

class CharactersViewControllerTest: XCTestCase {
    
    var charactersViewController: CharactersViewController!
    let tester = CharactersTesterMock()
    
    func makeCharactersViewController() -> CharactersViewController {
        charactersViewController = CharactersViewController()
        charactersViewController.charactersTester = tester
        charactersViewController.loadViewIfNeeded()
        return charactersViewController
    }
    
    func testCharactersViewController() {
        let _ = makeCharactersViewController()
        XCTAssertNotNil(charactersViewController)
    }
    
    func testViewDidLoadCallsTester() {
        let charactersViewController = makeCharactersViewController()
        charactersViewController.viewDidLoad()
        XCTAssertTrue(tester.onViewLoadedCalled)
    }
}

class CharactersTesterMock: CharactersTester {
    
    private(set) var onViewLoadedCalled = false
    
    func onViewLoaded() {
        onViewLoadedCalled = true
    }
}
