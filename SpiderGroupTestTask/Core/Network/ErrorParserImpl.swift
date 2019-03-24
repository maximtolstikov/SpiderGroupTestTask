//
//  ErrorParserImpl.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 21/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//
import Alamofire
import Foundation

class ErrorParserImpl: ErrorParser {
    
    func parse(_ result: Error) -> Error {
        let error = result as NSError
        
        if [-1001, -1005, -1009].contains(error.code) {
            return NetworkError.timeoutRequest
        } else if [101, 121, -1011, -1008].contains(error.code) {
            return NetworkError.serverError
        } else {
            print(error)
            return NetworkError.uncertaintyError
        }
    }
    
    func parse(_ request: URLRequest?,
               _ response: HTTPURLResponse,
               _ data: Data?) -> Request.ValidationResult {
        
        if (200...299).contains(response.statusCode) {
            return .success
        } else if response.statusCode == 408 {
            return .failure(NetworkError.timeoutRequest)
        } else if (400...499).contains(response.statusCode) {
            return .failure(NetworkError.wrongRequest)
        } else if (500...599).contains(response.statusCode) {
            return .failure(NetworkError.serverError)
        } else {
            return .failure(NetworkError.uncertaintyError)
        }
    }
    
}

