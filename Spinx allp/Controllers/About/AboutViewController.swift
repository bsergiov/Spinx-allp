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
        
//        let attributedString =  NSMutableAttributedString()
//        let paragraphStyle =  NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 1
//        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range:NSMakeRange(0, attributedString.length))
//        label.attributedText = attributedString
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var mapPoint: ImageToTextView = {
        let view = ImageToTextView()
        let image = UIImage(systemName: "mappin.and.ellipse")
        view.image = image
        view.text = DataManager.adrees
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var workShedule: ImageToTextView = {
        let workShedule = ImageToTextView()
        let image = UIImage(systemName: "clock")
        workShedule.image = image
        workShedule.text = DataManager.workShedule
        workShedule.translatesAutoresizingMaskIntoConstraints = false
        return workShedule
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
}

// MARK: - Setup View
extension AboutViewController {
    private func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(textLogo)
        view.addSubview(bodyAboutLable)
        view.addSubview(mapPoint)
//        view.addSubview(workShedule)
    }
}

// MARK: - Setup Constraints
extension AboutViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 36),
            titleLabel.widthAnchor.constraint(equalToConstant: 155),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
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
            bodyAboutLable.topAnchor.constraint(equalTo: textLogo.bottomAnchor, constant: 30)
        ])
        
        
        NSLayoutConstraint.activate([
            mapPoint.heightAnchor.constraint(equalToConstant: 43),
            mapPoint.widthAnchor.constraint(equalToConstant: 217),
//            mapPoint.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mapPoint.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mapPoint.topAnchor.constraint(equalTo: bodyAboutLable.bottomAnchor, constant: 16)
        ])
        
//        NSLayoutConstraint.activate([
//            mapPoint.heightAnchor.constraint(equalToConstant: 43),
//            mapPoint.widthAnchor.constraint(equalToConstant: 220),
//            mapPoint.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            mapPoint.topAnchor.constraint(equalTo: mapPoint.bottomAnchor, constant: 30)
//        ])
    }
}
