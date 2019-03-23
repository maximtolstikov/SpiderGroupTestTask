//
//  NetworkServiceFactory.swift
//  ClientFB
//
//  Created by Maxim Tolstikov on 18/01/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

import Alamofire

/**
 Фабрика сервисов сетевых запросов. Здесь настраивается SessionManager.
 */

class NetworkServiceFactory {
    
    let configuration = Configuration()
    let errorParser = ErrorParserImpl()
    
    lazy var commonSessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        let headers: HTTPHeaders = [
            "Authorization": "Client-ID \(Configuration().clientId)"
        ]
        configuration.httpAdditionalHeaders = headers
        let manager = SessionManager(configuration: configuration)        
        return manager
    }()
    
    lazy var networkService = NetworkServiceImpl(
            errorParcer: errorParser,
            sessionManager: commonSessionManager
        )
    
    func makeGalleryService() -> GalleryService {
        return GalleryServiceImpl(baseUrl: configuration.baseUrl,
                               networkService: networkService)
    }
    
}
