//
//  CharactersCollectionViewCell.swift
//  MarvelApp
//
//  Created by admin on 4/28/22.
//

import UIKit

protocol CharactersCollectionViewCellTester{
    func onlayoutSubviewsCalled()
}

class CharactersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var characterImageView: UIImageView!
    @IBOutlet weak private var headerLabel: UILabel!
    
    var charactersCollectionViewCellTester: CharactersCollectionViewCellTester?
    var onReuse: () -> Void = {}
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.charactersCollectionViewCellTester?.onlayoutSubviewsCalled()
    }
    
    func configureInfo(result: Results) {
        let urlPath = result.thumbnail?.path ?? EMPTY_STRING
        let urlExtention = result.thumbnail?.extension ?? EMPTY_STRING
        let urlString = urlPath + DOT_STR + urlExtention
        self.loadImage(UrlStr: urlString)
        self.headerLabel.text = result.name
    }
    
    func loadImage(UrlStr: String) {
        let loader = ImageLoader()
        let token = loader.loadImage(UrlStr) { result in
            do {
                let image = try result.get()
                DispatchQueue.main.async {
                    self.characterImageView.image = image
                }
            } catch {
                #if DEBUG
                print(error)
                #endif
            }
        }
        self.onReuse = {
            if let token = token {
                loader.cancelLoad(token)
            }
        }
    }
}
