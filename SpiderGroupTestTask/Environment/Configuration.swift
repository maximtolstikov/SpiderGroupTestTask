//
//  Configuration.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 21/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

import Foundation

/// Конфигурация приложения.
struct Configuration {
    
    /// Базовый url
    let baseUrl = URL(string: "https://api.imgur.com/3/")!
    /// Client-ID полученный при регистрации приложения в Imgur
    let clientId = "9724ac76a72ff9d"    
    /// Тип для загрузки
    let imageType = "image/jpeg"
    
    /// Строковые константы
    let galleryViewControllerTitle = "Gallery"
}
