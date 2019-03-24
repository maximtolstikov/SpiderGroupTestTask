//
//  GallerysItem.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 22/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

struct GallerysItem: Decodable {
    
    let id: String
    let title: String
    let images: [Image]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case images
    }
}
