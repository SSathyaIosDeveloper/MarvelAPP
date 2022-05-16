//
//  SpyNavigationController.swift
//  MarvelAppTests
//
//  Created by admin on 5/16/22.
//

import UIKit

class SpyNavigationController: UINavigationController {

    var pushedViewController: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: true)
    }
}
