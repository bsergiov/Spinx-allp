//
//  StorageManager.swift
//  Spinx allp
//
//  Created by SV on 22.04.2022.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    private init() { }
    
    func save(for key: String, value: Bool) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func save(for key: String, value: String) {
        UserDefaults.standard.set(value, forKey: value)
    }
    
    func save(for key: String, value: Int) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
