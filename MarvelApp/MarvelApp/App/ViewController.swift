//
//  ViewController.swift
//  MarvelApp
//
//  Created by admin on 5/16/22.
//

import UIKit

protocol ViewTester {
    func onViewLoaded()
}

class ViewController: UIViewController {
    
    var viewTester: ViewTester?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewTester?.onViewLoaded()
    }
    
}
