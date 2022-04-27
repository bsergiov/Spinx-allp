//
//  ProductModel.swift
//  Spinx allp
//
//  Created by BSergio on 16.04.2022.
//

import Foundation

struct ProductModel {
    let name: String
    let price: Int
    let category: String
}

struct CategoryProduct {
    let name: String
    let products: [ProductModel]
}
