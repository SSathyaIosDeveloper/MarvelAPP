//
//  CharactersCoordinator.swift
//  MarvelApp
//
//  Created by admin on 5/5/22.
//

import Foundation
import UIKit

class Coordinator { }

class ParentCoordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var result: Results? = Results()
    let charactersCoordinator: CharactersCoordinator
    let characterDetailCoordinator: CharacterDetailCoordinator
    
    init(with navigationController:UINavigationController, with result: Results?) {
        self.navigationController = navigationController
        self.result = result
        self.charactersCoordinator = CharactersCoordinator(with: navigationController)
        self.characterDetailCoordinator = CharacterDetailCoordinator(with: navigationController, with: result)
    }
    
    func start() {
        self.showCharactersViewController()
    }
    
    func showCharactersViewController() {
        childCoordinators.append(charactersCoordinator)
        self.coordinatorDidShowCharacters()
    }
    
    func showCharacterDetailViewController() {
        childCoordinators.append(characterDetailCoordinator)
        self.coordinatorDidShowCharacterDetail()
        
    }
    
    func removeCoordinator(coordinator:Coordinator?) {
        var idx:Int?
        for (index,value) in childCoordinators.enumerated() {
            if value === coordinator {
                idx = index
                break
            }
        }
        if let index = idx {
            childCoordinators.remove(at: index)
        }
    }
    
    func coordinatorDidShowCharacters() {
        removeCoordinator(coordinator: characterDetailCoordinator)
        charactersCoordinator.start()
    }
    
    func coordinatorDidShowCharacterDetail() {
        removeCoordinator(coordinator: charactersCoordinator)
        characterDetailCoordinator.start()
    }
}
