//
//  NetworkService.swift
//  ClientFB
//
//  Created by Maxim Tolstikov on 18/01/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//
import Alamofire

/// Сервис работы с сетью.

protocol NetworkService {
    func request<T: Decodable>(_ request: URLRequestConvertible,
                               completion: @escaping (T?, Error?) -> Void)
}
