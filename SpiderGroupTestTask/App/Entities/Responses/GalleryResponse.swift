//
//  DataListResponse.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 21/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

/// Ответ на сетевой запрос данных галлереи
struct GalleryResponse: Decodable {
    
    let data: [GallerysItem]
    
}
