//
//  PageCounter.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 23/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

import Foundation

/// Счетчик страниц
struct Page {
    
    private var currentPage = 0
    
    public mutating func next() -> Int {
        currentPage += 1
        return currentPage
    }
    
    public mutating func previous() -> Int {
        currentPage -= 1
        return currentPage > 0 ? currentPage : 1
    }
    
}
