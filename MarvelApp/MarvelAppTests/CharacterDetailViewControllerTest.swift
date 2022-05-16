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
    let presenter = CharacterDetailPresenterMock()
    
    func makeCharactersViewController() -> CharactersDetailViewController {
        charactersDetailViewController = CharactersDetailViewController(with: nil)
        charactersDetailViewController.testPresenter = presenter
        charactersDetailViewController.loadViewIfNeeded()
        return charactersDetailViewController
    }
    
    func testCharactersDetailViewController() {
        let _ = makeCharactersViewController()
        XCTAssertNotNil(charactersDetailViewController)
    }
    
    func testViewDidLoadCallsPresenter() {
        let charactersViewController = makeCharactersViewController()
        charactersViewController.viewDidLoad()
        XCTAssertTrue(presenter.onViewLoadedCalled)
    }
}

class CharacterDetailPresenterMock: CharacterDetailPresenter {
    private(set) var onViewLoadedCalled = false
    func onViewLoaded() {
        onViewLoadedCalled = true
    }
}
