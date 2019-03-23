//
//  RequestRouterEncoding.swift
//  ClientFB
//
//  Created by Maxim Tolstikov on 18/01/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

import Alamofire

/// Подготавливает URLRequest. Можно задать конфикурацию url или json.

protocol RequestRouter: URLRequestConvertible {
    var baseUrl: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var fullUrl: URL { get }
    var encoding: RequestRouterEncoding { get }
}

extension RequestRouter {
    
    var fullUrl: URL {
        return baseUrl.appendingPathComponent(path)
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: fullUrl)
        urlRequest.httpMethod = method.rawValue
        
        switch self.encoding {
        case .url:
            return try URLEncoding.default.encode(urlRequest, with: parameters)
        case .json:
            return try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
    
}
