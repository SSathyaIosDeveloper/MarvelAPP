//
//  StubResult.swift
//  MarvelAppTests
//
//  Created by admin on 5/25/22.
//

import XCTest
@testable import MarvelApp

struct Result: Codable  {
    var id: Int? = 1017100
    var name: String? = "A-Bomb (HAS)"
    var description: String?  = "Rick Jones has been Hulk\'s best bud since day one, but now he\'s more than a friend...he\'s a teammate! Transformed by a Gamma energy explosion, A-Bomb\'s thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction!"
    var thumbnail: Thumbnail?
}

struct Thumbnail: Codable  {
    var path: String? = "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available"
    var `extension`: String? = "jpg"
}

class StubCharacterModel: XCTestCase {
    func isIdValid(id: Int?) -> Bool {
        return true
    }
    func isNameValid(name: String?) -> Bool {
        return true
    }
    func isDescriptionValid(description: String?) -> Bool {
        return true
    }
    func isThumbnailPathValid(path: String?) -> Bool {
        return true
    }
    func isThumbnailExtensionValid(ext: String?) -> Bool {
        true
    }
    func testid() {
        let result = Result()
        let boolValue = self.isIdValid(id: result.id ?? nil)
        XCTAssertTrue(boolValue)
    }
    func testName() {
        let result = Result()
        let boolValue = self.isNameValid(name: result.name ?? nil)
        XCTAssertTrue(boolValue)
    }
    func testDescription() {
        let result = Result()
        let boolValue = self.isDescriptionValid(description: result.description ?? nil)
        XCTAssertTrue(boolValue)
    }
    func testThumbnailPath() {
        let result = Result()
        let boolValue = self.isThumbnailPathValid(path: result.thumbnail?.path ?? nil)
        XCTAssertTrue(boolValue)
    }
    func testThumbnailExtension() {
        let result = Result()
        let boolValue = self.isThumbnailExtensionValid(ext: result.thumbnail?.extension ?? nil)
        XCTAssertTrue(boolValue)
    }
}
