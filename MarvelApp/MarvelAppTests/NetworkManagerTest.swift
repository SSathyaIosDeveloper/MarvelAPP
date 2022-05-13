//
//  MockApiService.swift
//  MarvelAppTests
//
//  Created by admin on 5/12/22.
//

import XCTest
@testable import MarvelApp

class NetworkManagerTest: NetworkManager {
    
    var isCharacterFromMarvelAPICalled = false
    var isCharacterDetailsFromMarvelAPICalled = false
    var isApiCallSuccess = false
    var isApiCallfail = false
    var characterCompleteClosure: (([Results]?, Error?) -> Void)?
    var characterDetailCompleteClosure: (([Results]?, Error?) -> Void)?
    var results: Results = Results(id: 1017100, name: "A-Bomb (HAS)", description: "Rick Jones has been Hulk\'s best bud since day one, but now he\'s more than a friend...he\'s a teammate! Transformed by a Gamma energy explosion, A-Bomb\'s thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ", thumbnail: nil)
    
    func fetchCharacter(completion: @escaping ([Results]?, Error?) -> Void) {
        isCharacterFromMarvelAPICalled = true
        characterCompleteClosure = completion
    }
    
    func fetchCharacterDetail(completion: @escaping ([Results]?, Error?) -> Void) {
        isCharacterDetailsFromMarvelAPICalled = true
        characterCompleteClosure = completion
    }
    
    func fetchSuccess() {
        characterCompleteClosure?([results], nil ) ?? nil
        isApiCallSuccess = true
    }
    
    func fetchFail(error: Error?) {
        characterCompleteClosure?(nil, error) ?? nil
        isApiCallfail = true
    }
    
    override func getDataFromMarvelAPI(forID id: Int?, completion: @escaping (_ results: [Results]?,_ errors: Error?) -> Void) {
        isCharacterFromMarvelAPICalled = true
        isCharacterDetailsFromMarvelAPICalled = true
    }
}
