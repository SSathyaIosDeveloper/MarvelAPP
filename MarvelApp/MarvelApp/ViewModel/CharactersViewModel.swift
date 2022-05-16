//
//  CharactersViewModel.swift
//  MarvelApp
//
//  Created by admin on 4/28/22.
//

import UIKit

class CharactersViewModel {
    
    var charactersData: [Results] = [Results]()
    var reloadTableView: (()->())?
    var showError: (()->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?
    var networkManager: NetworkManager?
    
    init(networkManager: NetworkManager?) {
        self.networkManager = networkManager
    }
    
    private var charactersCellViewModels: [Results] = [Results]() {
        didSet {
            self.reloadTableView?()
        }
    }
    
    func getCharactersFromMarvel(){
        self.showLoading?()
        self.networkManager?.getDataFromMarvelAPI(forID: nil, completion: { [weak self] (results: [Results]?, errors: Error?) in
            self?.hideLoading?()
            if errors != nil {
                #if DEBUG
                print(errors ?? Error.self)
                #endif
                self?.showError?()
            } else {
                self?.charactersCellViewModels = results ?? []
            }
        })
    }
    
    var numberOfCells: Int {
        return charactersCellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> Results {
        return charactersCellViewModels[indexPath.row]
    }
    
}
