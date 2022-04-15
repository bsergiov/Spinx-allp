//
//  CardViewController.swift
//  Spinx allp
//
//  Created by SV on 15.04.2022.
//

import UIKit

class CardViewController: UIViewController {

    
    // MARK: - UI Elements
    private lazy var getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .specialYeloow
        button.tintColor = .specialDarkGrey
        button.titleLabel?.font = .robotoBold16()
        button.addTarget(self, action: #selector(dkfjdsfjsdf), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var backgroundForOffer: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .specialDarkGrey
        bgView.layer.cornerRadius = 26
        bgView.layer.opacity = 0.8
        bgView.translatesAutoresizingMaskIntoConstraints = false
        return bgView
    }()
    
    private lazy var titleForProduct: UILabel = {
        let title = UILabel()
        title.font = .robotoMedium24()
        title.text = "Hot & Sour Chickent/veg"
        title.minimumScaleFactor = 0.5
        title.textColor = .specialLightGray
        
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
    }
    
}

// MARK: - Private Methodes
extension CardViewController {
    @objc private func dkfjdsfjsdf() {
        print("tap")
    }
}

// MARK: - Setup Views
extension CardViewController {
    private func setupViews() {
        view.backgroundColor = .specialLightGray
        view.addSubview(getButton)
        view.addSubview(backgroundForOffer)
        backgroundForOffer.addSubview(titleForProduct)
    }
}

// MARK: - Setup Constraints
extension CardViewController {
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            getButton.heightAnchor.constraint(equalToConstant: 50),
            getButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            getButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            getButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            getButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backgroundForOffer.heightAnchor.constraint(equalToConstant: 180),
            backgroundForOffer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backgroundForOffer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            backgroundForOffer.bottomAnchor.constraint(equalTo: getButton.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            titleForProduct.heightAnchor.constraint(equalToConstant: 36),
            titleForProduct.leadingAnchor.constraint(equalTo: backgroundForOffer.leadingAnchor, constant: 13),
            titleForProduct.trailingAnchor.constraint(equalTo: backgroundForOffer.trailingAnchor, constant: -13),
            titleForProduct.topAnchor.constraint(equalTo: backgroundForOffer.topAnchor, constant: 31)
        ])
    }
}
