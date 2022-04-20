//
//  MenuTableViewCell.swift
//  Spinx allp
//
//  Created by BSergio on 18.04.2022.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    static let id = "MenuTableViewCell"
    
    lazy private var contenBackView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell() {
        backgroundColor = .clear
        
        setupView()
        setupConstraints()
        
    }
    
    private func setupView() {
        contentView.addSubview(contenBackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contenBackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            contenBackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            contenBackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            contenBackView.heightAnchor.constraint(equalToConstant: 100),
            contenBackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2)
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
