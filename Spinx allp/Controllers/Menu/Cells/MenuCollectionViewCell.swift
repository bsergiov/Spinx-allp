//
//  MenuCollectionViewCell.swift
//  Spinx allp
//
//  Created by BSergio on 19.04.2022.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    static let id = "MenuCollectionViewCell"
    
    lazy private var imageIcon: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "person")
        image.contentMode = .scaleAspectFit
        
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func setupCell(imagName: String) {
        selectedCell()
        imageIcon.image = UIImage(named: imagName)
        
        layer.cornerRadius = frame.height / 2
        imageIcon.bounds = contentView.bounds
        layer.masksToBounds = true
        setupView()
        setupConstraints()
    }
    
    override var isSelected: Bool {
        didSet {
            selectedCell()
        }
    }
    
    // MARK: - Setup View
    private func setupView() {
        contentView.addSubview(imageIcon)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageIcon.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            imageIcon.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageIcon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    // MARK: - Private Methodes
    private func selectedCell() {
//        backgroundColor = isSelected ? .green : .blue
        layer.borderColor = isSelected ? UIColor.white.cgColor : UIColor.black.cgColor
        layer.borderWidth = 4
    }
}
