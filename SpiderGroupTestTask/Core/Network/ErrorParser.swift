//
//  NetworkService.swift
//  ClientFB
//
//  Created by Maxim Tolstikov on 18/01/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//
import Alamofire
import Foundation

/**
 Парсер сетевых ошибок в приложении. Различает ошибки по сигнатуре параметров.
 Умеет обрабатывать сетевые ошибки валидации Alamofire и ошибки requestData.
 */

protocol ErrorParser {
    /// Обрабатывает ошибку requestData и возвращает NetworkError.
    func parse(_ result: Error) -> Error
    /// Обрабатывает ошибку метода валидации Alamofire, возвращает NetworkError.
    func parse(_ reauest: URLRequest?,
               _ response: HTTPURLResponse,
               _ data: Data?) -> Request.ValidationResult
}
