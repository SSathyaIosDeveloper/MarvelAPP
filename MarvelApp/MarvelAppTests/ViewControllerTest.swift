//
//  ViewControllerTest.swift
//  MarvelAppTests
//
//  Created by admin on 5/16/22.
//

import XCTest
@testable import MarvelApp

class ViewControllerTest: XCTestCase {
    
    var viewController: ViewController!
    let presenter = PresenterMock()
    
    func makeCharactersViewController() -> ViewController {
        viewController = ViewController()
        viewController.viewPresenter = presenter
        viewController.loadViewIfNeeded()
        return viewController
    }
    
    func testCharactersViewController() {
        let _ = makeCharactersViewController()
        XCTAssertNotNil(viewController)
    }
}

class PresenterMock: ViewPresenter {
    
    private(set) var onViewLoadedCalled = false
    
    func onViewLoaded() {
        onViewLoadedCalled = true
    }
}
