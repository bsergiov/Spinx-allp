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
    
    static let urlPolicyString = "https://sphinxallp.web.app/policy/"
    static let urlTermsString = "https://sphinxallp.web.app/terms/"
    
    static let products = [
        CategoryProduct(name: "APPETIZERS", products: [
            ProductModel(name: "CRISPY CALAMARI", price: 140, category: "APPETIZERS"),
            ProductModel(name: "LUKE RINGS", price: 190, category: "APPETIZERS"),
            ProductModel(name: "CHEAN BREAD", price: 180, category: "APPETIZERS"),
            ProductModel(name: "CRUNCHY CHEESE", price: 170, category: "APPETIZERS"),
            ProductModel(name: "BARBECKY WINGS", price: 165, category: "APPETIZERS"),
            ProductModel(name: "FALAFEL", price: 160, category: "APPETIZERS"),
        ]),
        CategoryProduct(name: "SOUPS", products: [
            ProductModel(name: "BOROVIKOV", price: 140, category: "SOUPS"),
            ProductModel(name: "TOMATO SOUP", price: 130, category: "SOUPS"),
            ProductModel(name: "CHICKEN SOUP", price: 120, category: "SOUPS"),
        ]),
        CategoryProduct(name: "SALADS", products: [
            ProductModel(name: "A TERRIFIC VEGGIE SHASHKA WITH CHICKEN", price: 100, category: "SALADS"),
            ProductModel(name: "FABULOUS VEGGIE BOWL", price: 110, category: "SALADS"),
            ProductModel(name: "CEZAR SALAD", price: 150, category: "SALADS"),
            ProductModel(name: "LIBAAN BOWL", price: 180, category: "SALADS"),
            ProductModel(name: "GREEK SALAD", price: 120, category: "SALADS"),
            ProductModel(name: "SALAD WITH LIVER IN CURRANTS", price: 115, category: "SALADS")
        ]),
        CategoryProduct(name: "BURGERS", products: [
            ProductModel(name: "BURGER CLASSIC", price: 240, category: "BURGERS"),
            ProductModel(name: "BURGER MASTER", price: 230, category: "BURGERS"),
            ProductModel(name: "BURGER DOUBLE CLASSIC", price: 290, category: "BURGERS"),
            ProductModel(name: "BURGER TENNESSEE", price: 230, category: "BURGERS"),
            ProductModel(name: "BURGER Z FALAFELEM", price: 210, category: "BURGERS"),
        ]),
        CategoryProduct(name: "GRILLS", products: [
            ProductModel(name: "lamb shank with mushrooms", price: 340, category: "GRILLS"),
            ProductModel(name: "CRISPY CHICKEN", price: 280, category: "GRILLS"),
            ProductModel(name: "CHICKEN BREAST DELICACY", price: 310, category: "GRILLS"),
            ProductModel(name: "LIBAAN COFTA", price: 305, category: "GRILLS"),
            ProductModel(name: "HONEY-MUSTARD PORK NECK", price: 295, category: "GRILLS"),
        ]),
        CategoryProduct(name: "DESSERTS", products: [
            ProductModel(name: "PAVLOVA BEZA", price: 215, category: "DESSERTS"),
            ProductModel(name: "COOKED PANNA", price: 190, category: "DESSERTS"),
            ProductModel(name: "ICE CREAM WITH FRUIT", price: 170, category: "DESSERTS"),
            ProductModel(name: "HOT APPLE PIE WITH ICE CREAM", price: 190, category: "DESSERTS"),
            ProductModel(name: "HOT BROWNIE WITH FRUIT", price: 155, category: "DESSERTS"),
            ProductModel(name: "BURNED CREAM", price: 140, category: "DESSERTS"),
            ProductModel(name: "WHITE CHOCOLATE WITH ICE CREAM", price: 180, category: "DESSERTS"),
            ProductModel(name: "ICE CREAM SCOOP", price: 160, category: "DESSERTS"),
        ])
    ]
}
