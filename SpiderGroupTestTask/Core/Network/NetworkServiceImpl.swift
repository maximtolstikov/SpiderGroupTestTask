//
//  NetworkServiceImpl.swift
//  ClientFB
//
//  Created by Maxim Tolstikov on 18/01/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

import Alamofire

// Реализует работу с сетью используя Alamofire с методом валидации. 
class NetworkServiceImpl: NetworkService {
    
    let errorParser: ErrorParser
    let sessionManager: SessionManager
    
    init(errorParcer: ErrorParser, sessionManager: SessionManager) {
        self.errorParser = errorParcer
        self.sessionManager = sessionManager
    }
    
    func request<T: Decodable>(_ request: URLRequestConvertible,
                               completion: @escaping (T?, Error?) -> Void) {        
        sessionManager
            .request(request)
            .validate(errorParser.parse)
            .responseData { [weak self] (response) in
                
                if let responseError = response.error {
                    let error = self?.errorParser.parse(responseError)
                    completion(nil, error)
                    return
                }
                
                do {
                    let value = try JSONDecoder()
                        .decode(T.self, from: response.result.value!)
                    completion(value, nil)
                } catch {
                    print(error)
                    completion(nil, error)
                }            
        }
    }
    
}
