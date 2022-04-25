//
//  ImageToTextView.swift
//  Spinx allp
//
//  Created by SV on 25.04.2022.
//

import UIKit

class ImageToTextView: UIView {
    
    // MARK: - Public Properties
    var image: UIImage?
    var text: String?
    
    // MARK: - UI Elements
    lazy private var iconToText: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var textBodyLabel: UILabel = {
        let label = UILabel()
//        label.text =
        label.font = .robotoMedium14()
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initional
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(iconToText)
        addSubview(textBodyLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconToText.heightAnchor.constraint(equalToConstant: 43),
            iconToText.widthAnchor.constraint(equalToConstant: 37),
            iconToText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            iconToText.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            textBodyLabel.heightAnchor.constraint(equalToConstant: 43),
            textBodyLabel.widthAnchor.constraint(equalToConstant: 170),
            textBodyLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            textBodyLabel.leadingAnchor.constraint(equalTo: iconToText.trailingAnchor, constant: 10)
        ])
    }
}
