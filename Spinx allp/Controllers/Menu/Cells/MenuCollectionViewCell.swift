//
//  MenuCollectionViewCell.swift
//  Spinx allp
//
//  Created by BSergio on 19.04.2022.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    static let id = "MenuCollectionViewCell"
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .blue
            } else {
                backgroundColor = .green
            }
        }
    }
}
