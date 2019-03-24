//
//  GalleryViewControllerFactory.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 23/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

import UIKit

class GalleryViewControllerFactory {
    
    func controler() -> GalleryViewController {

        let controller = GalleryViewController()
        let galleryService = NetworkServiceFactory().makeGalleryService()
        controller.service = galleryService
        
        return controller
    }
}
