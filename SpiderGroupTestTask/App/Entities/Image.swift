//
//  Image.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 21/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

/// Модель изображения
struct Image: Codable {
    
    let id: String
    let type: String
    let title: String?
    let link: String
}
