//
//  ViewController.swift
//  Spinx allp
//
//  Created by SV on 15.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UI Elements
    lazy private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var profileBarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.target = self
        button.action = #selector(leftBarButtonTaped)
        button.tintColor = .specialLightGray
        button.image = UIImage(systemName: "person.fill")
        return button
    }()
    
    lazy private var buttonRightBalans: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(rightBarButtonTaped), for: .touchUpInside)
        button.setImage(UIImage(named: "coinCard"), for: .normal)
        button.setTitle(" 200", for: .normal)
        button.setTitleColor(UIColor.specialLightGray, for: .normal)
        return button
    }()
    
    lazy private var balanseBarButtonItem: UIBarButtonItem = {
        let customItem = UIBarButtonItem(customView: buttonRightBalans)
        return customItem
    }()
    
    lazy private var leftItem: UIBarButtonItem = {
        let item = UIBarButtonItem()
        item.image = UIImage(systemName: "person.fill")
        return item
    }()
    
    lazy private var bustImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bust")
        image.contentMode = .scaleAspectFit
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var textLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "textSpinx")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var balanceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "BALANCE:"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = .robotoMedium35()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy private var valueBalanceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text  = "100"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = .robotoBold45()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy private var buttonShowCard: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(tappedShowCard), for: .touchUpInside)
        button.setTitle("Show Card", for: .normal)
        button.backgroundColor = .specialYeloow
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.specialDarkGrey, for: .normal)
        button.titleLabel?.font = .robotoBold20()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        checkOnBoarding()
        setupViews()
        setConstraints()
    }
    
    // MARK: - Action Methodes
    @objc private func leftBarButtonTaped() {
        print("tap Leftbbi")
    }
    
    @objc private func rightBarButtonTaped() {
        print("tap Rightbbi")
    }
    
    @objc private func tappedShowCard() {
        print("tap tappedShowCard")
    }
    
    // MARK: - Private Methodes
    private func checkOnBoarding() {
        if !StorageManager.shared.getStatus(for: "onBoarding") {
            
            StorageManager.shared.save(for: "onBoarding", value: true)
            let vc = OnBoardingViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
}

// MARK: - Setup Views
extension MainViewController {
    private func setupViews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(bustImage)
        contentView.addSubview(textLogo)
        contentView.addSubview(balanceLabel)
        contentView.addSubview(valueBalanceLabel)
        contentView.addSubview(buttonShowCard)
        
        view.backgroundColor = .speceiaBackground
        
        navigationItem.setLeftBarButton(profileBarButtonItem, animated: true)
        navigationItem.setRightBarButton(balanseBarButtonItem, animated: true)
    }
}

// MARK: - Setup Constraints
extension MainViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            bustImage.heightAnchor.constraint(equalToConstant: 348),
            bustImage.widthAnchor.constraint(equalToConstant: 235),
            bustImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bustImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            textLogo.heightAnchor.constraint(equalToConstant: 88),
            textLogo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textLogo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            textLogo.topAnchor.constraint(equalTo: bustImage.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            balanceLabel.heightAnchor.constraint(equalToConstant: 41),
            balanceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            balanceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            balanceLabel.topAnchor.constraint(equalTo: textLogo.bottomAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            valueBalanceLabel.heightAnchor.constraint(equalToConstant: 53),
            valueBalanceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            valueBalanceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            valueBalanceLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            buttonShowCard.heightAnchor.constraint(equalToConstant: 63),
            buttonShowCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            buttonShowCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            buttonShowCard.topAnchor.constraint(equalTo: valueBalanceLabel.bottomAnchor, constant: 29),
            buttonShowCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
