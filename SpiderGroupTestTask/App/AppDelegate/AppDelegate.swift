//
//  AppDelegate.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 20/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        let galleryController = UINavigationController(
            rootViewController: GalleryViewControllerFactory().controler())
        self.window?.rootViewController = galleryController
        self.window?.makeKeyAndVisible()      
        
        return true
    }

}

