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
    let presenter = CharactersTableViewCellMock()
    
    func makeCharactersTableViewCell() -> CharactersTableViewCell {
        charactersTableViewCell = CharactersTableViewCell()
        charactersTableViewCell.charactersTableViewCellPresenter = presenter
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
        XCTAssertTrue(presenter.layoutSubviewsCalled)
    }
}

class CharactersTableViewCellMock: CharactersTableViewCellPresenter {
    
    private(set) var layoutSubviewsCalled = false
    
    func onlayoutSubviewsCalled() {
        layoutSubviewsCalled = true
    }
}

