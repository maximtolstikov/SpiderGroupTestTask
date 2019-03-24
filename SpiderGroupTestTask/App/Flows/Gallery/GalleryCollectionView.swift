//
//  GalleryCollectionView.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 23/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

import UIKit

class GalleryCollectionView: UICollectionView {

    // MARK: - Public properties
    
    var cells = [GallerysItem]() {
        didSet {
            self.reloadData()
        }
    }
    
    // MARK: - Private properties
    
    private let controller: GalleryViewController
    private var fetchingMore = false
    
    // MARK: - Init
    
    init(frame: CGRect, controller: GalleryViewController) {
        self.controller = controller
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
    
    // MARK: - Private methods
    
    /// Расчитывает размер ячейки
    ///
    /// - Returns: размер
    private func sizeForCollectionViewItem() -> CGSize {
        let viewWidth = self.bounds.size.width
        let cellWidth = (viewWidth - 3 * 8) / 2.0
        let cellHeight = cellWidth * 1.5
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    /// Загружает новую порцию изображений
    private func beginBatchFetch() {
        fetchingMore = true
        print("begin fetching!")
        controller.loadImages()
        fetchingMore = false
    }

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
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
        let item = cells[indexPath.row]
        controller.openDetailViewController(for: item)
    }
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

// MARK: - UIScrollViewDelegate

extension GalleryCollectionView {
    
    /// Сигнализирует об окончании контента в скроллвью
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height {
            if !fetchingMore {
                beginBatchFetch()
            }
        }
    }
}

