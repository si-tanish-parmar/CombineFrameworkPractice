//
//  ProductModel.swift
//  CombineFrameworkPractice
//
//  Created by Tanish Parmar on 27/06/24.
//

import Foundation

import Foundation

struct ProductModel: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
    struct Rating: Codable {
        let rate: Double
        let count: Int
    }
}
