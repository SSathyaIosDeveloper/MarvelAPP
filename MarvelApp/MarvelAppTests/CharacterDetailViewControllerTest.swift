//
//  CharacterDetailViewControllerTest.swift
//  MarvelAppTests
//
//  Created by admin on 5/12/22.
//
import XCTest
@testable import MarvelApp

class CharacterDetailViewControllerTest: XCTestCase {
    
    var charactersDetailViewController: CharactersDetailViewController!
    let tester = CharacterDetailTesterMock()
    
    func makeCharactersViewController() -> CharactersDetailViewController {
        charactersDetailViewController = CharactersDetailViewController(with: nil)
        charactersDetailViewController.characterDetailTester = tester
        charactersDetailViewController.loadViewIfNeeded()
        return charactersDetailViewController
    }
    
    func testCharactersDetailViewController() {
        let _ = makeCharactersViewController()
        XCTAssertNotNil(charactersDetailViewController)
    }
    
    func testViewDidLoadCallsTester() {
        let charactersViewController = makeCharactersViewController()
        charactersViewController.viewDidLoad()
        XCTAssertTrue(tester.onViewLoadedCalled)
    }
}

class CharacterDetailTesterMock: CharacterDetailTester {
    private(set) var onViewLoadedCalled = false
    func onViewLoaded() {
        onViewLoadedCalled = true
    }
}
