//
//  BonusCardViewController.swift
//  Spinx allp
//
//  Created by SV on 27.04.2022.
//

import UIKit

class BonusCardViewController: UIViewController {
    
    // MARK: - UI Elements
    lazy private var closeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "x.circle.fill")
        button.setImage(image, for: .normal)
        button.tintColor = .specialLightGray
        button.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        button.layer.cornerRadius = button.frame.height / 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy private var backForQR: UIView = {
        let uiView = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    lazy private var imagQR: UIImageView = {
        let image = UIImageView()
        let balans = StorageManager.shared.getBalans(for: "balans")
        image.image = getQrCodeImage(myString: "Balans your bonus: \(balans)")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var descriptionForUserLabel: UILabel = {
        let label = UILabel()
        label.text = "Show your QR-code to our waiter"
        label.textAlignment = .center
        label.font = .robotoMedium12()
        label.numberOfLines = 0
        label.textColor = .specialLightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}

// MARK: - Private Methodes
extension BonusCardViewController {
    private func getQrCodeImage(myString: String) -> UIImage?  {
           let data = myString.data(using: String.Encoding.ascii)
           guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
           qrFilter.setValue(data, forKey: "inputMessage")
           
           let transform = CGAffineTransform(scaleX: 3, y: 3)
           
           guard let output = qrFilter.outputImage?.transformed(by: transform) else { return nil}
           
           return UIImage(ciImage: output)
       }
    
    @objc private func closeTapped() {
        dismiss(animated: true)
    }
}

// MARK: - Setup View
extension BonusCardViewController {
    private func setupView() {
        view.addSubview(closeButton)
        view.addSubview(backForQR)
        backForQR.addSubview(imagQR)
        view.addSubview(descriptionForUserLabel)
        view.backgroundColor = .speceiaBackground
    }
}

// MARK: - Setup Constraints
extension BonusCardViewController {
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            backForQR.heightAnchor.constraint(equalToConstant: 300),
            backForQR.widthAnchor.constraint(equalToConstant: 300),
            backForQR.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backForQR.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            imagQR.heightAnchor.constraint(equalToConstant: 250),
            imagQR.widthAnchor.constraint(equalToConstant: 250),
            imagQR.centerXAnchor.constraint(equalTo: backForQR.centerXAnchor),
            imagQR.centerYAnchor.constraint(equalTo: backForQR.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionForUserLabel.heightAnchor.constraint(equalToConstant: 50),
            descriptionForUserLabel.widthAnchor.constraint(equalToConstant: 150),
            descriptionForUserLabel.centerXAnchor.constraint(equalTo: imagQR.centerXAnchor),
            descriptionForUserLabel.topAnchor.constraint(equalTo: imagQR.bottomAnchor, constant: 10)
        ])
    }
}
