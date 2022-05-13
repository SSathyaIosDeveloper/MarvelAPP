//
//  CharactersCoordinator.swift
//  MarvelApp
//
//  Created by admin on 5/5/22.
//

import Foundation
import UIKit

class CharactersCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var charactersViewController: CharactersViewController
    
    init(with navigationController:UINavigationController) {
        self.navigationController = navigationController
        self.charactersViewController = CharactersViewController()
    }
    
    func start() {
        showCharactersViewController()
    }
    
    func showCharactersViewController() {
        self.navigationController.show(charactersViewController, sender: self)
    }
}
