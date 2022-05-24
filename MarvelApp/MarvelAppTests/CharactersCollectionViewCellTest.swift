//
//  CharactersTableViewCell.swift
//  MarvelAppTests
//
//  Created by admin on 5/16/22.
//

import XCTest
@testable import MarvelApp

class CharactersCollectionViewCellTest: XCTestCase {
    var charactersCollectionViewCell: CharactersCollectionViewCell!
    let tester = CharactersCollectionViewCellMock()
    
    func makeCharactersCollectionViewCell() -> CharactersCollectionViewCell {
        charactersCollectionViewCell = CharactersCollectionViewCell()
        charactersCollectionViewCell.charactersCollectionViewCellTester = tester
        charactersCollectionViewCell.layoutIfNeeded()
        return charactersCollectionViewCell
    }
    
    func testCharactersTableViewCell() {
        let _ = makeCharactersCollectionViewCell()
        XCTAssertNotNil(charactersCollectionViewCell)
    }
    
    func testCharactersTableViewCellDidLoadCalls() {
        let charactersTableViewCell = makeCharactersCollectionViewCell()
        charactersTableViewCell.layoutSubviews()
        XCTAssertTrue(tester.layoutSubviewsCalled)
    }
}

class CharactersCollectionViewCellMock: CharactersCollectionViewCellTester {
    
    private(set) var layoutSubviewsCalled = false
    
    func onlayoutSubviewsCalled() {
        layoutSubviewsCalled = true
    }
}

