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
        charactersViewController.charactersPresenter = presenter
        charactersViewController.loadViewIfNeeded()
        return charactersViewController
    }
    
    func testCharactersViewController() {
        let _ = makeCharactersViewController()
        XCTAssertNotNil(charactersViewController)
    }
    
    func testViewDidLoadCallsPresenter() {
        let charactersViewController = makeCharactersViewController()
        charactersViewController.viewDidLoad()
        XCTAssertTrue(presenter.onViewLoadedCalled)
    }
}

class CharactersPresenterMock: CharactersPresenter {
    
    private(set) var onViewLoadedCalled = false
    
    func onViewLoaded() {
        onViewLoadedCalled = true
    }
}
