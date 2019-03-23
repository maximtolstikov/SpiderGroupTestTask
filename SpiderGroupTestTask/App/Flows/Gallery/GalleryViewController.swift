//
//  GalleryViewController.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 23/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//
import UIKit

/// Контроллер Галлереи изображений
class GalleryViewController: UIViewController {
    
    // MARK: - Custom types
    
    var galleryCollectionView: GalleryCollectionView!

    // MARK: - Dependency
    
    var service: GalleryService?
    
    // MARK: - Private properties
    
    private var page = Page()
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureController()
        loadImages()
    }
    
    // MARK: - Configure controller
    
    private func configureController() {
        title = Configuration().galleryViewControllerTitle
        addCollectionView()
    }
    
    private func addCollectionView() {
        galleryCollectionView = GalleryCollectionView(
            frame: view.bounds,
            controller: self)
        galleryCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(galleryCollectionView)
    }
    
    // MARK: - Public methods
    
    public func loadImages() {
        service?.fetch(page: page.next(), completion: { [weak self] (items, error) in
            
            guard error == nil, let items = items else {
                let networkError = error as! NetworkError
                print(networkError.description)
                return
            }
            self?.galleryCollectionView.cells.append(contentsOf: items)
        })
    }

}
