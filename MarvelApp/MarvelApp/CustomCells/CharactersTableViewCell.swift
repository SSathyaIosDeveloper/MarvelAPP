//
//  CharactersTableViewCell.swift
//  MarvelApp
//
//  Created by admin on 4/29/22.
//

import Foundation
import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    func collectionView(collectionviewcell: CharactersCollectionViewCell?, result: Results, didTappedInTableViewCell: CharactersTableViewCell)
}

protocol CharactersTableViewCellTester {
    func onlayoutSubviewsCalled()
}

class CharactersTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var  charctersCollectionView: UICollectionView!
    weak var cellDelegate: CollectionViewCellDelegate?
    var charactersTableViewCellTester: CharactersTableViewCellTester?
    
    override func awakeFromNib() {
        self.charctersCollectionView.register(UINib(nibName: CHARACTERS_COLLECTIONVIEW_CELL, bundle: nil),forCellWithReuseIdentifier: CHARACTERS_COLLECTIONVIEW_CELL)
        self.charctersCollectionView.delegate = self
        self.charctersCollectionView.dataSource = self
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.charactersTableViewCellTester?.onlayoutSubviewsCalled()
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    var characters: Results = Results() {
        didSet {
            self.charctersCollectionView.reloadData()
        }
    }
}

extension CharactersTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CHARACTERS_COLLECTIONVIEW_CELL, for: indexPath) as? CharactersCollectionViewCell else {
            fatalError(CELL_NOT_EXISTS)
        }
        
        cell.configureInfo(result: characters)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CharactersCollectionViewCell
        self.cellDelegate?.collectionView(collectionviewcell: cell, result: characters, didTappedInTableViewCell: self)
    }
}
