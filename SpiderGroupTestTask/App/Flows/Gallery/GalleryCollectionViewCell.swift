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

class GalleryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Custom types
    // MARK: - Identifiers
    
    static let reuseId = "GalleryCollectionViewCell"
    
    // MARK: - Constants
    // MARK: - Dependency
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    // MARK: - Public properties
    // MARK: - Private properties
    
    // MARK: - Init
    // MARK: - Cell lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.clipsToBounds = false
    }
    
    // MARK: - Configure cell
    
    public func confiruge(item: GallerysItem) {
        title.text = item.title
        
        if let gallerysImage = item.images?.first,
            let url = URL(string: gallerysImage.link) {
            image.af_setImage(withURL: url)
        }
    }
    
    
    // MARK: - Public IBAction
    
    // MARK: - Private methods

    
//    private func initWithXib() {
//        Bundle.main.loadNibNamed("GalleryCollectionViewCell", owner: self, options: nil)
//        contentView.addSubview(xib)
//        xib.frame = self.bounds
//        xib.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//    }
    
    // MARK: - Private IBAction
    // MARK: - Navigation
    // MARK: - UITableViewDataSource
    // MARK: - UITableViewDelegate

    
}
