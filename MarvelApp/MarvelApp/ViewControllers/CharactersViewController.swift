//
//  CharactersViewController.swift
//  MarvelApp
//
//  Created by admin on 4/28/22.
//

import Foundation
import UIKit

protocol CharactersTester {
    func onViewLoaded()
}

class CharactersViewController: UIViewController {
    
    private var characterTableView: UITableView
    private var activityIndicatorView: UIActivityIndicatorView
    private var charactersViewModel: CharactersViewModel
    var charactersTester: CharactersTester?
    
    init() {
        self.charactersViewModel = CharactersViewModel(networkManager: NetworkManager())
        self.characterTableView = UITableView()
        self.activityIndicatorView = UIActivityIndicatorView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(INIT_CODER_ERROR)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.charactersTester?.onViewLoaded()
        self.setUpViewController()
    }
    
    func setUpViewController() {
        self.setUpNavigationController()
        self.configureTableView()
        self.setUpActivityIndicator()
        self.initViewModel()
    }
    
    func setUpNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        title = CHARACTERS_TITLE
    }
    
    func setUpActivityIndicator() {
        let activityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicatorView.center = self.view.center
        self.activityIndicatorView = activityIndicatorView
        self.view.addSubview(self.activityIndicatorView)
        self.view.bringSubviewToFront(self.activityIndicatorView)
    }
    
    func configureTableView() {
        let barHeight = self.view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        self.characterTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        self.view.addSubview(self.characterTableView)
        self.characterTableView.dataSource = self
        self.characterTableView.delegate = self
        self.characterTableView.register(UINib(nibName: CHARACTERS_TABLEVIEW_CELL, bundle: nil), forCellReuseIdentifier: CHARACTERS_TABLEVIEW_CELL)
        self.characterTableView.allowsSelection = false
        self.characterTableView.separatorStyle = .none
    }
    
    func initViewModel(){
        charactersViewModel.getCharactersFromMarvel()
        charactersViewModel.reloadTableView = {
            DispatchQueue.main.async { self.characterTableView.reloadData() }
        }
        charactersViewModel.showError = {
            DispatchQueue.main.async { self.showAlert(ERROR_MSG) }
        }
        charactersViewModel.showLoading = {
            DispatchQueue.main.async { self.activityIndicatorView.startAnimating() }
        }
        charactersViewModel.hideLoading = {
            DispatchQueue.main.async { self.activityIndicatorView.stopAnimating() }
        }
    }
    
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: EMPTY_STRING, message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: OK, style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension CharactersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersViewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt  indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CHARACTERS_TABLEVIEW_CELL, for: indexPath) as? CharactersTableViewCell else {
            fatalError(CELL_NOT_EXISTS)
        }
        let character = charactersViewModel.getCellViewModel( at: indexPath )
        cell.characters = character
        cell.cellDelegate = self
        return cell
    }
}

extension CharactersViewController: CollectionViewCellDelegate {
    func collectionView(collectionviewcell: CharactersCollectionViewCell?, result: Results, didTappedInTableViewCell: CharactersTableViewCell) {
        let parentCoordinator = ParentCoordinator.init(with: self.navigationController ?? UINavigationController(), with: result)
        parentCoordinator.showCharacterDetailViewController()
    }
}
