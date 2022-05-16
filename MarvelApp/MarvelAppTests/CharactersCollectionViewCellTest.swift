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
    let presenter = CharactersCollectionViewCellMock()
    
    func makeCharactersCollectionViewCell() -> CharactersCollectionViewCell {
        charactersCollectionViewCell = CharactersCollectionViewCell()
        charactersCollectionViewCell.charactersCollectionViewCellPresenter = presenter
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
        XCTAssertTrue(presenter.layoutSubviewsCalled)
    }
}

class CharactersCollectionViewCellMock: CharactersCollectionViewCellPresenter {
    
    private(set) var layoutSubviewsCalled = false
    
    func onlayoutSubviewsCalled() {
        layoutSubviewsCalled = true
    }
}

