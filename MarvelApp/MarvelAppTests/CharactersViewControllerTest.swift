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
    let presenter = CharactersPresenterMock()
    
    func makeCharactersViewController() -> CharactersViewController {
        charactersViewController = CharactersViewController()
        charactersViewController.testPresenter = presenter
        charactersViewController.loadViewIfNeeded()
        return charactersViewController
    }
    
    func testViewDidLoadCallsPresenter() {
        let charactersViewController = makeCharactersViewController()
        charactersViewController.viewDidLoad()
        XCTAssertTrue(presenter.onViewLoadedCalled)
    }
}

class CharactersPresenterMock: testCharactersPresenter {
    
    private(set) var onViewLoadedCalled = false
    
    func onViewLoaded() {
        onViewLoadedCalled = true
    }
}
