//
//  ViewController.swift
//  MarvelApp
//
//  Created by admin on 5/16/22.
//

import UIKit

protocol ViewTester: AnyObject {
    func onViewLoaded()
}

class ViewController: UIViewController {
    
    weak var viewTester: ViewTester?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewTester?.onViewLoaded()
    }
    
}
