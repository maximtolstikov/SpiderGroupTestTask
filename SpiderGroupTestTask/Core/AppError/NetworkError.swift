//
//  AppError.swift
//  ClientFB
//
//  Created by Maxim Tolstikov on 18/01/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

/// Описывает возможные сетевые ошибки.
///
/// - timeoutRequest: Вышло время ожидания соединения с сервером.
/// - serverError: Ошибка возникшая на сервере.
/// - uncertaintyError: Неизвестная ошибка.
/// - wrongRequest: Некорректный, либо прервавшийся запрос.

enum NetworkError: Error {
    
    case timeoutRequest
    case serverError
    case uncertaintyError
    case wrongRequest
}

extension NetworkError {
    
    var description: String {
        switch self {
        case .timeoutRequest:
            return "Вышло время ожидания! Проверте доступность подключения и попробуйте еще раз."
        case .serverError:
            return "Ошибка сервера!"
        case .uncertaintyError:
            return "Ой, произошла неизвестная ошибка!"
        case .wrongRequest:
            return "Ошибка обращения к серверу! Проверте соединение и попробуйте выполнить запрос еще раз."
        }
    }
}
