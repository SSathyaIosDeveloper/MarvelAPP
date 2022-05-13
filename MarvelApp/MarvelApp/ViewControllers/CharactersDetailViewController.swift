//
//  CharactersDetailViewController.swift
//  MarvelApp
//
//  Created by admin on 5/9/22.
//

import UIKit
import WebKit

protocol testCharacterDetailPresenter {
    func onViewLoaded()
}

class CharactersDetailViewController: UIViewController {
    
    @IBOutlet weak private var characterImageView: UIImageView!
    @IBOutlet weak private var headerLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    private var characterDetailViewModel = CharacterDetailViewModel(networkManager: NetworkManager())
    private var result: Results? = Results()
    private var activityIndicatorView = UIActivityIndicatorView()
    var testPresenter: testCharacterDetailPresenter?
    
    init(with result: Results?) {
        super.init(nibName: nil, bundle: nil)
        self.result = result
    }
    
    required init?(coder: NSCoder) {
        fatalError(INIT_CODER_ERROR)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testPresenter?.onViewLoaded()
        self.view.backgroundColor = UIColor.white
        self.setUpNavigationController()
        self.setUpActivityIndicator()
        self.initViewModel()
        self.setUpValues()
    }
    
    func setUpNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        title = CHARACTER_DETAIL_TITLE
    }
    
    func setUpActivityIndicator() {
        let activityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicatorView.center = self.view.center
        self.activityIndicatorView = activityIndicatorView
        self.view.addSubview(self.activityIndicatorView)
        self.view.bringSubviewToFront(self.activityIndicatorView)
    }
    
    func setUpValues() {
        self.headerLabel.text = result?.name
        if result?.description == EMPTY_STRING {
            self.descriptionLabel.text = DESCRIPTION_NOT_AVAILABLE
            self.descriptionLabel.textAlignment = .center
        } else {
            self.descriptionLabel.text = result?.description
        }
        let urlPath = result?.thumbnail?.path ?? EMPTY_STRING
        let urlExtention = result?.thumbnail?.extension ?? EMPTY_STRING
        let urlString = urlPath + DOT_STR + urlExtention
        self.loadImage(UrlStr: urlString)
    }
    
    func initViewModel(){
        characterDetailViewModel.getCharacterDetailFromMarvel(resultId: result?.id)
        characterDetailViewModel.reloadView = {
            self.view.setNeedsDisplay()
        }
        characterDetailViewModel.showError = {
            DispatchQueue.main.async { self.showAlert(ERROR_MSG) }
        }
        characterDetailViewModel.showLoading = {
            DispatchQueue.main.async { self.activityIndicatorView.startAnimating() }
        }
        characterDetailViewModel.hideLoading = {
            DispatchQueue.main.async { self.activityIndicatorView.stopAnimating() }
        }
    }
    
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: EMPTY_STRING, message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: OK, style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func loadImage(UrlStr: String) {
        _ = ImageLoader().loadImage(UrlStr) { result in
            do {
                let image = try result.get()
                DispatchQueue.main.async {
                    self.characterImageView.image = image
                }
            } catch {
                print(error)
            }
        }
    }
}
