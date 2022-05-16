//
//  ViewController.swift
//  MarvelApp
//
//  Created by admin on 5/16/22.
//

import UIKit

protocol ViewPresenter {
    func onViewLoaded()
}

class ViewController: UIViewController {
    
    var viewPresenter: ViewPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewPresenter?.onViewLoaded()
    }
    
}
