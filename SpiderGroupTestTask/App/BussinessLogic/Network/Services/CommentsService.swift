//
//  CommentsService.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 24/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

import Alamofire

/**
 Сервис для запроса на получение изображений из галлереи.
 */

protocol CommentsService {
    
    typealias CompletionGetComments = ([Comment]?, Error?) -> Void
    func fetch(imageId: String, completion: @escaping CompletionGetComments)
}


class CommentsServiceImpl: CommentsService {
    
    let baseUrl: URL
    let networkService: NetworkService
    
    init(
        baseUrl: URL,
        networkService: NetworkService) {
        
        self.baseUrl = baseUrl
        self.networkService = networkService
    }
    
    
    /// Запрашиваеет комментариеи к изображению
    ///
    /// - Parameters:
    ///   - comments: id изображения
    func fetch(imageId: String, completion: @escaping CompletionGetComments) {
        
        let request = CommentsRequest(
            baseUrl: baseUrl,
            imageId: imageId,
            parameters: nil)
        
        networkService.request(request) {
            (response: CommentsResponse?, error: Error?) in
            let comments = response?.data
            completion(comments, error)            
        }
    }
    
}
