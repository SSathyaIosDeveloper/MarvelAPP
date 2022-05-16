//
//  CharacterDetailViewModel.swift
//  MarvelApp
//
//  Created by admin on 5/11/22.
//

import Foundation
import UIKit

class CharacterDetailViewModel {
    
    var reloadView: (()->())?
    var showError: (()->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?
    var networkManager: NetworkManager?
    
    init(networkManager: NetworkManager?) {
        self.networkManager = networkManager
    }
    
    private var characterDetailResults: [Results] = [Results]() {
        didSet {
            DispatchQueue.main.async {
                self.reloadView?()
            }
        }
    }
    
    func getCharacterDetailFromMarvel(resultId: Int?){
        self.showLoading?()
        self.networkManager?.getDataFromMarvelAPI(forID: resultId, completion: {[weak self] (results: [Results]?, errors: Error?) in
            self?.hideLoading?()
            if errors != nil {
                #if DEBUG
                print(errors ?? Error.self)
                #endif
                self?.showError?()
            } else {
                self?.characterDetailResults = results ?? []
            }
        })
    }
}
