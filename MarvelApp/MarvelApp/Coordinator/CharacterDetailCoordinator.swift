//
//  CharactersDetailCoordinator.swift
//  MarvelApp
//
//  Created by admin on 5/5/22.
//

import Foundation
import UIKit

class CharacterDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var characterDetailViewController: CharactersDetailViewController
    var result: Results? = Results()
    
    init(with navigationController:UINavigationController, with result: Results?) {
        self.navigationController = navigationController
        self.result = result
        self.characterDetailViewController = CharactersDetailViewController(with: self.result)
    }
    
    func start() {
        showCharactersDetailVC()
    }
    
    func showCharactersDetailVC() {
        self.navigationController.show(characterDetailViewController, sender: self)
    }
}
