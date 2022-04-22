//
//  OnBoardingViewController.swift
//  Spinx allp
//
//  Created by SV on 22.04.2022.
//

import UIKit

class OnBoardingViewController: UIViewController {

    // MARK: - UI Elements
    lazy private var congratulaitionsLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoBold30()
        label.textAlignment = .center
        label.textColor = .specialFontOnBoarding
        label.text = "CONGRATULATIONS!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "WELCOME"
        label.textAlignment = .center
        label.font = .robotoBlack45()
        label.textColor = .specialFontOnBoarding
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var bonusLabel: UILabel = {
        let label = UILabel()
        label.text = "BONUS"
        label.textAlignment = .center
        label.font = .robotoBlack45()
        label.textColor = .specialFontOnBoarding
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "100"
        label.textAlignment = .center
        label.font = .robotoBlack50()
        label.textColor = .specialFontOnBoarding
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.tintColor = .specialDarkGrey
        button.titleLabel?.font = .robotoMedium24()
        button.layer.cornerRadius = 15
        button.backgroundColor = .specialFontOnBoarding
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy private var mainStackView = UIStackView()
    lazy private var welcomeBonesStackView = UIStackView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}

// MARK: - Setup View
extension OnBoardingViewController {
    private func setupView() {
        view.backgroundColor = .speceiaBackground
        
        welcomeBonesStackView = UIStackView(arrangedSubviews: [welcomeLabel, bonusLabel], axis: .vertical, spacing: 0)
        mainStackView = UIStackView(arrangedSubviews: [congratulaitionsLabel, welcomeBonesStackView, numberLabel], axis: .vertical, spacing: 40)
        view.addSubview(mainStackView)
        view.addSubview(nextButton)
    }
}

// MARK: - Setup Constraints
extension OnBoardingViewController {
    private func setupConstraints() {
       
        NSLayoutConstraint.activate([
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 64),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
