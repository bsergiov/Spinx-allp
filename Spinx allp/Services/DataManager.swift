//
//  DataManager.swift
//  Spinx allp
//
//  Created by SV on 25.04.2022.
//

import Foundation

struct DataManager {
    static let aboutBody = "In Sphinx Restaurants we serve oriental and international cuisine. It is the largest casual dining restaurant chain in Poland. The first restaurant was opened in 1995, today there are almost 100 of them. Friendly, informal atmosphere and uniform standards make Sphinx restaurants a perfect place for different occasions and meetings with family, friends or business."
    
    static let adrees = "05-540 Zalesie Górne ul. Młodych Wilcząt 36"
    
    static let workShedule = "Monday - Sunday"
    
    static let urlPolicyString = "https://yandex.ru"
    static let urlTermsString = "https://google.com"
    
    static let products = [
        CategoryProduct(name: "APPETIZERS", products: [
            ProductModel(name: "CRISPY CALAMARI", price: 140),
            ProductModel(name: "LUKE RINGS", price: 190),
            ProductModel(name: "CHEAN BREAD", price: 180),
            ProductModel(name: "CRUNCHY CHEESE", price: 170),
            ProductModel(name: "BARBECKY WINGS", price: 165),
            ProductModel(name: "FALAFEL", price: 160),
        ]),
        CategoryProduct(name: "SOUPS", products: [
            ProductModel(name: "BOROVIKOV", price: 140),
            ProductModel(name: "TOMATO SOUP", price: 130),
            ProductModel(name: "CHICKEN SOUP", price: 120),
        ]),
        CategoryProduct(name: "SALADS", products: [
            ProductModel(name: "A TERRIFIC VEGGIE SHASHKA WITH CHICKEN", price: 100),
            ProductModel(name: "FABULOUS VEGGIE BOWL", price: 110),
            ProductModel(name: "CEZAR SALAD", price: 150),
            ProductModel(name: "LIBAAN BOWL", price: 180),
            ProductModel(name: "GREEK SALAD", price: 120),
            ProductModel(name: "SALAD WITH LIVER IN CURRANTS", price: 115)
        ]),
        CategoryProduct(name: "BURGERS", products: [
            ProductModel(name: "BURGER CLASSIC", price: 240),
            ProductModel(name: "BURGER MASTER", price: 230),
            ProductModel(name: "BURGER DOUBLE CLASSIC", price: 290),
            ProductModel(name: "BURGER TENNESSEE", price: 230),
            ProductModel(name: "BURGER Z FALAFELEM", price: 210),
        ]),
        CategoryProduct(name: "GRILLS", products: [
            ProductModel(name: "lamb shank with mushrooms", price: 340),
            ProductModel(name: "CRISPY CHICKEN", price: 280),
            ProductModel(name: "CHICKEN BREAST DELICACY", price: 310),
            ProductModel(name: "LIBAAN COFTA", price: 305),
            ProductModel(name: "HONEY-MUSTARD PORK NECK", price: 295),
        ]),
        CategoryProduct(name: "DESSERTS", products: [
            ProductModel(name: "PAVLOVA BEZA", price: 215),
            ProductModel(name: "COOKED PANNA", price: 190),
            ProductModel(name: "ICE CREAM WITH FRUIT", price: 170),
            ProductModel(name: "HOT APPLE PIE WITH ICE CREAM", price: 190),
            ProductModel(name: "HOT BROWNIE WITH FRUIT", price: 155),
            ProductModel(name: "BURNED CREAM", price: 140),
            ProductModel(name: "WHITE CHOCOLATE WITH ICE CREAM", price: 180),
            ProductModel(name: "ICE CREAM SCOOP", price: 160),
        ])
    ]
}
