//
//  CommentsResponse.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 24/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

/// Ответ на сетевой запрос комментариев
struct CommentsResponse: Decodable {
    
    let data: [Comment]
    
}
