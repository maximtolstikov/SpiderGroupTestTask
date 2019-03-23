//
//  GetGallerysImageService.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 22/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

import Alamofire

/**
 Сервис для запроса на получение изображений из галлереи.
 */

protocol GalleryService {
    
    typealias CompletionGetGallerysImage = ([GallerysItem]?, Error?) -> Void
    
    func fetch(page: Int, completion: @escaping CompletionGetGallerysImage)
}

class GalleryServiceImpl: GalleryService {
    
    let baseUrl: URL
    let networkService: NetworkService
    
    init(
        baseUrl: URL,
        networkService: NetworkService) {
        
        self.baseUrl = baseUrl
        self.networkService = networkService
    }
    
    
    /// Отправляет запрос на получение данных галлереи
    ///
    /// - Parameters:
    ///   - page: номер страницы
    func fetch(page: Int, completion: @escaping CompletionGetGallerysImage) {
        
        let request = GalleryRequest(
            baseUrl: baseUrl,
            page: page,
            parameters: nil)
        
        networkService.request(request) {
            (response: GalleryResponse?, error: Error?) in
            let galeryItems = response?.data
                .filter { $0.images?.first?.type == Configuration().imageType}
            completion(galeryItems, error)
            
        }
    }
    
}

