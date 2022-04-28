//
//  ProfileViewController.swift
//  Spinx allp
//
//  Created by SV on 28.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy private var closeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "x.circle.fill")
        button.setImage(image, for: .normal)
        button.tintColor = .specialYeloow
        button.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "if necesery, information about you will help us restore your points or transfer them to your new device."
        label.numberOfLines = 0
        label.font = .robotoMedium14()
        label.textColor = .specialLightGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var avaImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = image.frame.height / 2
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 10
        image.backgroundColor = .specialYeloow
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var backInfo: UIView = {
        let view = UIView()
        view.backgroundColor = .specialYeloow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var separateOne: UIView = {
        let view = UIView()
        view.backgroundColor = .specialDarkGrey
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var separateTwo: UIView = {
        let view = UIView()
        view.backgroundColor = .specialDarkGrey
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var separateThree: UIView = {
        let view = UIView()
        view.backgroundColor = .specialDarkGrey
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var footLabel: UILabel = {
        let label = UILabel()
        label.text = "invite friends and get extra points"
        label.textAlignment = .center
        label.font = .robotoMedium14()
        label.textColor = .specialDarkGrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var titleIdLable: UILabel = {
        let label = UILabel()
        label.text = "You id"
        label.font = .robotoMedium14()
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var valueIdlable: UILabel = {
        let label = UILabel()
        //todo при загрузке генерить ид и закивать в стораж
        label.text = "123134213"
        label.font = .robotoMedium18()
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var titleNameLable: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = .robotoMedium14()
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var valueNameLable: UILabel = {
        let label = UILabel()
        // todo реализовать подгрузку имени из стораж манаджера
        label.text = "Your Name"
        label.font = .robotoMedium18()
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var titlePhoneLable: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.font = .robotoMedium14()
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var valuePhoneLable: UILabel = {
        let label = UILabel()
        // todo реализовать подгрузку имени из стораж манаджера
        label.text = "Add phone"
        label.font = .robotoMedium18()
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var addPhoneButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "plus.circle.fill")
        
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.tag = 0
        button.addTarget(self, action: #selector(addPlusTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy private var titleMailLable: UILabel = {
        let label = UILabel()
        label.text = "Mail"
        label.font = .robotoMedium14()
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var valueMailLable: UILabel = {
        let label = UILabel()
        // todo реализовать подгрузку имени из стораж манаджера
        label.text = "Add Mail"
        label.font = .robotoMedium18()
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var addMailButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "plus.circle.fill")
        
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.tag = 1
        button.addTarget(self, action: #selector(addPlusTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        avaImageView.layer.cornerRadius = avaImageView.frame.height / 2
        backInfo.layer.cornerRadius = 10
    }
}

// MARK: - Private Methodes
extension ProfileViewController {
    @objc private func closeTapped() {
        dismiss(animated: true)
    }
    
    @objc private func addPlusTapped(_ sender: UIButton) {
        let message = sender.tag == 0 ? "phone" : "mail"
        print("tapped \(message) tag \(sender.tag)")
        showAllert(title: "add Phone", message: "phone")
    }
    
    private func showAllert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actioOk = UIAlertAction(title: "OK", style: .default) { [weak alert] _ in
            guard let textFields = alert?.textFields else { return }
            if let tf = textFields[0].text {
                print(tf)
            }
            
        }
        alert.addAction(actioOk)
        alert.addTextField { texfield in
            print(texfield.text ?? "non text")
        }
        
        present(alert, animated: true)
    }
}

extension ProfileViewController {
    private func setupView() {
        view.addSubview(closeButton)
        view.addSubview(descriptionLabel)
        view.addSubview(avaImageView)
        view.addSubview(backInfo)
        backInfo.addSubview(titleIdLable)
        backInfo.addSubview(valueIdlable)
        backInfo.addSubview(separateOne)
        backInfo.addSubview(titleNameLable)
        backInfo.addSubview(valueNameLable)
        backInfo.addSubview(separateTwo)
        backInfo.addSubview(titlePhoneLable)
        backInfo.addSubview(valuePhoneLable)
        backInfo.addSubview(addPhoneButton)
        backInfo.addSubview(separateThree)
        backInfo.addSubview(titleMailLable)
        backInfo.addSubview(valueMailLable)
        backInfo.addSubview(addMailButton)
        
        view.addSubview(footLabel)
        
        view.backgroundColor = .speceiaBackground
    }
}

extension ProfileViewController {
    private func setupConstraints() {
        //closeButton
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        //descriptionLabel
        NSLayoutConstraint.activate([
            descriptionLabel.heightAnchor.constraint(equalToConstant: 66),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            descriptionLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 0)
        ])
        //avaImageView
        NSLayoutConstraint.activate([
            avaImageView.heightAnchor.constraint(equalToConstant: 208),
            avaImageView.widthAnchor.constraint(equalToConstant: 208),
            avaImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avaImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 0)
        ])
        //backInfo
        NSLayoutConstraint.activate([
            backInfo.heightAnchor.constraint(equalToConstant: 257),
            backInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            backInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            backInfo.topAnchor.constraint(equalTo: avaImageView.bottomAnchor, constant: 10)
        ])
        //titleIdLable
        NSLayoutConstraint.activate([
            titleIdLable.heightAnchor.constraint(equalToConstant: 22),
            titleIdLable.widthAnchor.constraint(equalToConstant: 50),
            titleIdLable.leadingAnchor.constraint(equalTo: backInfo.leadingAnchor, constant: 15),
            titleIdLable.topAnchor.constraint(equalTo: backInfo.topAnchor, constant: 5)
        ])
        //valueIdlable
        NSLayoutConstraint.activate([
            valueIdlable.heightAnchor.constraint(equalToConstant: 15),
            valueIdlable.widthAnchor.constraint(equalToConstant: 150),
            valueIdlable.leadingAnchor.constraint(equalTo: backInfo.leadingAnchor, constant: 15),
            valueIdlable.topAnchor.constraint(equalTo: titleIdLable.bottomAnchor, constant: 5)
        ])
        //separateOne
        NSLayoutConstraint.activate([
            separateOne.heightAnchor.constraint(equalToConstant: 1),
            separateOne.leadingAnchor.constraint(equalTo: backInfo.leadingAnchor, constant: 5),
            separateOne.trailingAnchor.constraint(equalTo: backInfo.trailingAnchor, constant: -5),
            separateOne.topAnchor.constraint(equalTo: backInfo.topAnchor, constant: 55)
        ])
        //titleNameLable
        NSLayoutConstraint.activate([
            titleNameLable.heightAnchor.constraint(equalToConstant: 15),
            titleNameLable.widthAnchor.constraint(equalToConstant: 60),
            titleNameLable.leadingAnchor.constraint(equalTo: backInfo.leadingAnchor, constant: 15),
            titleNameLable.topAnchor.constraint(equalTo: separateOne.bottomAnchor, constant: 5)
        ])
        //valueNameLable
        NSLayoutConstraint.activate([
            valueNameLable.heightAnchor.constraint(equalToConstant: 15),
            valueNameLable.widthAnchor.constraint(equalToConstant: 200),
            valueNameLable.leadingAnchor.constraint(equalTo: backInfo.leadingAnchor, constant: 15),
            valueNameLable.topAnchor.constraint(equalTo: titleNameLable.bottomAnchor, constant: 15)
        ])
        //separateTwo
        NSLayoutConstraint.activate([
            separateTwo.heightAnchor.constraint(equalToConstant: 1),
            separateTwo.leadingAnchor.constraint(equalTo: backInfo.leadingAnchor, constant: 5),
            separateTwo.trailingAnchor.constraint(equalTo: backInfo.trailingAnchor, constant: -5),
            separateTwo.topAnchor.constraint(equalTo: separateOne.bottomAnchor, constant: 74)
        ])
        //titlePhoneLable
        NSLayoutConstraint.activate([
            titlePhoneLable.heightAnchor.constraint(equalToConstant: 15),
            titlePhoneLable.widthAnchor.constraint(equalToConstant: 60),
            titlePhoneLable.leadingAnchor.constraint(equalTo: backInfo.leadingAnchor, constant: 15),
            titlePhoneLable.topAnchor.constraint(equalTo: separateTwo.bottomAnchor, constant: 5)
        ])
        //valuePhoneLable
        NSLayoutConstraint.activate([
            valuePhoneLable.heightAnchor.constraint(equalToConstant: 15),
            valuePhoneLable.widthAnchor.constraint(equalToConstant: 200),
            valuePhoneLable.leadingAnchor.constraint(equalTo: backInfo.leadingAnchor, constant: 15),
            valuePhoneLable.topAnchor.constraint(equalTo: titlePhoneLable.bottomAnchor, constant: 15)
        ])
        //addPhoneButton
        NSLayoutConstraint.activate([
            addPhoneButton.heightAnchor.constraint(equalToConstant: 35),
            addPhoneButton.widthAnchor.constraint(equalToConstant: 35),
            addPhoneButton.trailingAnchor.constraint(equalTo: backInfo.trailingAnchor, constant: -15),
            addPhoneButton.topAnchor.constraint(equalTo: separateTwo.bottomAnchor, constant: 12)
        ])
        //separateThree
        NSLayoutConstraint.activate([
            separateThree.heightAnchor.constraint(equalToConstant: 1),
            separateThree.leadingAnchor.constraint(equalTo: backInfo.leadingAnchor, constant: 5),
            separateThree.trailingAnchor.constraint(equalTo: backInfo.trailingAnchor, constant: -5),
            separateThree.topAnchor.constraint(equalTo: separateTwo.bottomAnchor, constant: 60)
        ])
        //titleMailLable
        NSLayoutConstraint.activate([
            titleMailLable.heightAnchor.constraint(equalToConstant: 15),
            titleMailLable.widthAnchor.constraint(equalToConstant: 60),
            titleMailLable.leadingAnchor.constraint(equalTo: backInfo.leadingAnchor, constant: 15),
            titleMailLable.topAnchor.constraint(equalTo: separateThree.bottomAnchor, constant: 5)
        ])
        //valueMailLable
        NSLayoutConstraint.activate([
            valueMailLable.heightAnchor.constraint(equalToConstant: 15),
            valueMailLable.widthAnchor.constraint(equalToConstant: 200),
            valueMailLable.leadingAnchor.constraint(equalTo: backInfo.leadingAnchor, constant: 15),
            valueMailLable.topAnchor.constraint(equalTo: titleMailLable.bottomAnchor, constant: 15)
        ])
        //addMailButton
        NSLayoutConstraint.activate([
            addMailButton.heightAnchor.constraint(equalToConstant: 35),
            addMailButton.widthAnchor.constraint(equalToConstant: 35),
            addMailButton.trailingAnchor.constraint(equalTo: backInfo.trailingAnchor, constant: -15),
            addMailButton.topAnchor.constraint(equalTo: separateThree.bottomAnchor, constant: 12)
        ])
        //footLabel
        NSLayoutConstraint.activate([
            footLabel.heightAnchor.constraint(equalToConstant: 22),
            footLabel.widthAnchor.constraint(equalToConstant: 270),
            footLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footLabel.topAnchor.constraint(equalTo: backInfo.bottomAnchor, constant: 25)
        ])
    }
}
