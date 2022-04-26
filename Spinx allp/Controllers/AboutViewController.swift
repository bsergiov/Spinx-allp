//
//  AboutViewController.swift
//  Spinx allp
//
//  Created by SV on 20.04.2022.
//

import UIKit

class AboutViewController: UIViewController {

    // MARK: - UI Elements
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "About use"
        label.font = .robotoBold30()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var textLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "textSpinx")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var bodyAboutLable: UILabel = {
        let label = UILabel()
        label.text = DataManager.aboutBody
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .robotoMedium18()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var pinImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "mappin.and.ellipse")
        image.tintColor = .specialLightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var textMapLabel: UILabel = {
        let label = UILabel()
        label.text = DataManager.adrees
        label.numberOfLines = 0
        label.textColor = .specialLightGray
        label.font = .robotoMedium18()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var workSheduleImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "clock")
        image.tintColor = .specialLightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var textworkSheduleLabel: UILabel = {
        let label = UILabel()
        label.text = DataManager.workShedule
        label.numberOfLines = 0
        label.font = .robotoMedium18()
        label.textColor = .specialLightGray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var facebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Our Facebook", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .specialYeloow
        button.tintColor = .specialDarkGrey
        button.titleLabel?.font = .robotoMedium12()
        button.addTarget(self, action: #selector(socialTapped), for: .touchUpInside)
        button.tag = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy private var instButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Our Instagram", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .specialYeloow
        button.tintColor = .specialDarkGrey
        button.titleLabel?.font = .robotoMedium12()
        button.addTarget(self, action: #selector(socialTapped), for: .touchUpInside)
        button.tag = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy private var policyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Privacy policy", for: .normal)
        
        button.tintColor = .specialDarkGrey
        button.titleLabel?.font = .robotoMedium12()
        button.addTarget(self, action: #selector(policyAndTerms), for: .touchUpInside)
        button.tag = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy private var termsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Terms & Conditions", for: .normal)
        
        button.tintColor = .specialDarkGrey
        button.titleLabel?.font = .robotoMedium12()
        button.addTarget(self, action: #selector(policyAndTerms), for: .touchUpInside)
        button.tag = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    @objc private func socialTapped(_ sender: UIButton) {
        print("socialTapped")
    }
    
    @objc private func policyAndTerms(_ sender: UIButton) {
        print("policyAndTerms")
    }
}

// MARK: - Setup View
extension AboutViewController {
    private func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(textLogo)
        view.addSubview(bodyAboutLable)
        view.addSubview(pinImage)
        view.addSubview(textMapLabel)
        view.addSubview(workSheduleImage)
        view.addSubview(textworkSheduleLabel)
        view.addSubview(facebookButton)
        view.addSubview(instButton)
        view.addSubview(policyButton)
        view.addSubview(termsButton)
    }
}

// MARK: - Setup Constraints
extension AboutViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 36),
            titleLabel.widthAnchor.constraint(equalToConstant: 155),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            textLogo.heightAnchor.constraint(equalToConstant: 86),
            textLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textLogo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14)
        ])
        
        NSLayoutConstraint.activate([
            bodyAboutLable.heightAnchor.constraint(equalToConstant: 213),
            bodyAboutLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bodyAboutLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bodyAboutLable.topAnchor.constraint(equalTo: textLogo.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            pinImage.heightAnchor.constraint(equalToConstant: 43),
            pinImage.widthAnchor.constraint(equalToConstant: 37),
            pinImage.topAnchor.constraint(equalTo: bodyAboutLable.bottomAnchor, constant: 16),
            pinImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        ])
        
        NSLayoutConstraint.activate([
            textMapLabel.heightAnchor.constraint(equalToConstant: 43),
            textMapLabel.leadingAnchor.constraint(equalTo: pinImage.trailingAnchor, constant: 17),
            textMapLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textMapLabel.centerYAnchor.constraint(equalTo: pinImage.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            workSheduleImage.heightAnchor.constraint(equalToConstant: 40),
            workSheduleImage.widthAnchor.constraint(equalToConstant: 40),
            workSheduleImage.topAnchor.constraint(equalTo: pinImage.bottomAnchor, constant: 30),
            workSheduleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        ])
        
        NSLayoutConstraint.activate([
            textworkSheduleLabel.heightAnchor.constraint(equalTo: workSheduleImage.heightAnchor),
            textworkSheduleLabel.leadingAnchor.constraint(equalTo: workSheduleImage.trailingAnchor, constant: 17),
            textworkSheduleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textworkSheduleLabel.centerYAnchor.constraint(equalTo: workSheduleImage.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            facebookButton.heightAnchor.constraint(equalToConstant: 34),
            facebookButton.widthAnchor.constraint(equalToConstant: 113),
            facebookButton.topAnchor.constraint(equalTo: workSheduleImage.bottomAnchor, constant: 6),
            facebookButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        ])
        
        NSLayoutConstraint.activate([
            instButton.heightAnchor.constraint(equalTo: facebookButton.heightAnchor),
            instButton.widthAnchor.constraint(equalTo: facebookButton.widthAnchor),
            instButton.centerYAnchor.constraint(equalTo: facebookButton.centerYAnchor),
            instButton.leadingAnchor.constraint(equalTo: facebookButton.trailingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            policyButton.heightAnchor.constraint(equalToConstant: 14),
            policyButton.widthAnchor.constraint(equalToConstant: 90),
            policyButton.topAnchor.constraint(equalTo: instButton.bottomAnchor, constant: 31),
            policyButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            termsButton.heightAnchor.constraint(equalToConstant: 14),
            termsButton.widthAnchor.constraint(equalToConstant: 125),
            termsButton.centerYAnchor.constraint(equalTo: policyButton.centerYAnchor),
            termsButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 30)
        ])
    }
}
