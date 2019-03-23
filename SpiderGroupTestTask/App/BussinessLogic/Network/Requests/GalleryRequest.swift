//
//  GetGalleryRequest.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 21/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

import Alamofire

/// Стуктура get запроса топовых изображений.
struct GalleryRequest: RequestRouter {
    
    let baseUrl: URL
    let page: Int
    
    let encoding: RequestRouterEncoding = .url
    let method: HTTPMethod = .get
    var path: String {
        return "gallery/top/" + "\(page)"
    }
    var parameters: Parameters?
    
}
