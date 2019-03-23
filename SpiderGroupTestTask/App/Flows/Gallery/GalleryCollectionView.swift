//
//  GalleryCollectionView.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 23/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

import UIKit

class GalleryCollectionView: UICollectionView {
    
    // MARK: - Custom types
    // MARK: - Identifiers
    // MARK: - Constants
    // MARK: - Dependency
    // MARK: - IBOutlets
    // MARK: - Public properties
    
    var cells = [GallerysItem]() {
        didSet {
            self.reloadData()
        }
    }
    
    // MARK: - Private properties
    
    // MARK: - Init
    
    init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: frame, collectionViewLayout: layout)
        
        backgroundColor = .white
        delegate = self
        dataSource = self
        let nib = UINib(nibName: "GalleryCollectionViewCell", bundle: nil)
        register(nib, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewController lifecycle
    // MARK: - Configure controller
    // MARK: - Public methods
    // MARK: - Public IBAction
    
    // MARK: - Private methods
    
    fileprivate func sizeForCollectionViewItem() -> CGSize {
        let viewWidth = self.bounds.size.width
        let cellWidth = (viewWidth - 3 * 8) / 2.0
        let cellHeight = cellWidth * 1.5
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    // MARK: - Private IBAction
    // MARK: - Navigation


}

// MARK: - UICollectionViewDataSource

extension GalleryCollectionView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = dequeueReusableCell(
            withReuseIdentifier: GalleryCollectionViewCell.reuseId,
            for: indexPath) as! GalleryCollectionViewCell
        cell.confiruge(item: cells[indexPath.row])
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension GalleryCollectionView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension GalleryCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeForCollectionViewItem()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
}

