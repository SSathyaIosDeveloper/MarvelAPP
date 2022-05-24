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
    let tester = TesterMock()
    
    func makeCharactersViewController() -> ViewController {
        viewController = ViewController()
        viewController.viewTester = tester
        viewController.loadViewIfNeeded()
        return viewController
    }
    
    func testCharactersViewController() {
        let _ = makeCharactersViewController()
        XCTAssertNotNil(viewController)
    }
}

class TesterMock: ViewTester {
    
    private(set) var onViewLoadedCalled = false
    
    func onViewLoaded() {
        onViewLoadedCalled = true
    }
}
