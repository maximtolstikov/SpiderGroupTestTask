//
//  Comment.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 24/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

/// Комментарий к изображению
struct Comment: Codable {
    
    let id: Int
    let image_id: String
    let comment: String
    let author: String
    let children: [Comment]
}
