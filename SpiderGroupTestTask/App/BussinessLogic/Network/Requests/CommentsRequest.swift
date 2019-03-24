//
//  CommentsRequest.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 24/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

import Alamofire

/// Стуктура get запроса комментарий к изображению.
struct CommentsRequest: RequestRouter {
    
    let baseUrl: URL
    let imageId: String
    
    let encoding: RequestRouterEncoding = .url
    let method: HTTPMethod = .get
    var path: String {
        return "gallery/" + "\(imageId)" + "/comments/"
    }
    var parameters: Parameters?
}
