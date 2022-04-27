//
//  MenuTableViewCell.swift
//  Spinx allp
//
//  Created by BSergio on 18.04.2022.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    // MARK: - Public Properties
    static let id = "MenuTableViewCell"
    
    // MARK: - UI Elements
    lazy private var contenBackView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.black.cgColor
        view.backgroundColor = .specialDarkGrey
        view.layer.borderWidth = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var titleLable: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .robotoBold16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var priceStackView = UIStackView()
    
    lazy private var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .robotoBold16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var coinImag: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "coinCard")
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(product: ProductModel) {
        backgroundColor = .clear
        selectionStyle = .none
        priceLabel.text = "\(product.price)"
        titleLable.text = product.name
        setupView()
        setupConstraints()
    }
    
    // MARK: - Setup View
    private func setupView() {
        contentView.addSubview(contenBackView)
        contenBackView.addSubview(titleLable)
        priceStackView = UIStackView(arrangedSubviews: [priceLabel, coinImag], axis: .horizontal, spacing: 10)
        contenBackView.addSubview(priceStackView)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contenBackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            contenBackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            contenBackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            contenBackView.heightAnchor.constraint(equalToConstant: 60),
            contenBackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2)
        ])
        
        NSLayoutConstraint.activate([
            titleLable.leadingAnchor.constraint(equalTo: contenBackView.leadingAnchor, constant: 10),
            titleLable.widthAnchor.constraint(equalToConstant: 200),
            titleLable.heightAnchor.constraint(equalToConstant: 40),
            titleLable.centerYAnchor.constraint(equalTo: contenBackView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            priceStackView.centerYAnchor.constraint(equalTo: contenBackView.centerYAnchor),
            priceStackView.trailingAnchor.constraint(equalTo: contenBackView.trailingAnchor, constant: -10),
            
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
