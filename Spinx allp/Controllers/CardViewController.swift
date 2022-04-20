//
//  CardViewController.swift
//  Spinx allp
//
//  Created by SV on 15.04.2022.
//

import UIKit

class CardViewController: UIViewController {

    // MARK: - UI Elements
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        button.tintColor = .specialYeloow
        button.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .specialYeloow
        button.tintColor = .specialDarkGrey
        button.titleLabel?.font = .robotoBold16()
        button.addTarget(self, action: #selector(getTapped), for: .touchUpInside)
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
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoBold20()
        label.textColor = .specialLightGray
        label.text = "200"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var coinImage: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "coinCard")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var priceStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
}

// MARK: - Private Methodes
extension CardViewController {
    @objc private func getTapped() {
        let vc = UIViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func closeTapped() {
        print("close tap")
    }
}

// MARK: - Setup Views
extension CardViewController {
    private func setupViews() {
        title = "Card"
        view.backgroundColor = .specialLightGray
        view.addSubview(getButton)
        view.addSubview(backgroundForOffer)
        view.addSubview(closeButton)
        backgroundForOffer.addSubview(titleForProduct)
        priceStackView = UIStackView(arrangedSubviews: [priceLabel, coinImage], axis: .horizontal, spacing: 10)
        backgroundForOffer.addSubview(priceStackView)
    }
}

// MARK: - Setup Constraints
extension CardViewController {
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 22),
            closeButton.widthAnchor.constraint(equalToConstant: 22),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
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
        
        NSLayoutConstraint.activate([
            coinImage.heightAnchor.constraint(equalToConstant: 25),
            coinImage.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            priceStackView.leadingAnchor.constraint(equalTo: backgroundForOffer.leadingAnchor, constant: 20),
            priceStackView.bottomAnchor.constraint(equalTo: backgroundForOffer.bottomAnchor, constant: -20)
        ])
    }
}
