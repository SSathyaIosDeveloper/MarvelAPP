//
//  CharactersTableViewCell.swift
//  MarvelAppTests
//
//  Created by admin on 5/16/22.
//

import XCTest
@testable import MarvelApp

class CharactersTableViewCellTest: XCTestCase {
    var charactersTableViewCell: CharactersTableViewCell!
    let tester = CharactersTableViewCellMock()
    
    func makeCharactersTableViewCell() -> CharactersTableViewCell {
        charactersTableViewCell = CharactersTableViewCell()
        charactersTableViewCell.charactersTableViewCellTester = tester
        charactersTableViewCell.layoutIfNeeded()
        return charactersTableViewCell
    }
    
    func testCharactersTableViewCell() {
        let _ = makeCharactersTableViewCell()
        XCTAssertNotNil(charactersTableViewCell)
    }
    
    func testCharactersTableViewCellDidLoadCalls() {
        let charactersTableViewCell = makeCharactersTableViewCell()
        charactersTableViewCell.layoutSubviews()
        XCTAssertTrue(tester.layoutSubviewsCalled)
    }
}

class CharactersTableViewCellMock: CharactersTableViewCellTester {
    
    private(set) var layoutSubviewsCalled = false
    
    func onlayoutSubviewsCalled() {
        layoutSubviewsCalled = true
    }
}

