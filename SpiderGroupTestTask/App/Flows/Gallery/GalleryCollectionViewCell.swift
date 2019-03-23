//
//  GalleryCollectionViewCell.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 23/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//
import Alamofire
import AlamofireImage
import UIKit

/// Ячейка галлереи
class GalleryCollectionViewCell: UICollectionViewCell {

    // MARK: - Identifiers
    
    static let reuseId = "GalleryCollectionViewCell"
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!

    // MARK: - Cell lifecycle
    
    /// Настраивает внешний вид ячейки
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.clipsToBounds = false
    }
    
    // MARK: - Configure cell
    
    /// Конфигурирует ячейку
    ///
    /// - Parameter item: изображение из галлереи
    public func confiruge(item: GallerysItem) {
        title.text = ""
        image.image = nil
        title.text = item.title
        
        if let gallerysImage = item.images?.first,
            let url = URL(string: gallerysImage.link),
            let placeholderImage = UIImage(named: "placeholder") {
            image.af_setImage(withURL: url, placeholderImage: placeholderImage)
        }
    }

}
