//
//  ViewController.swift
//  Spinx allp
//
//  Created by SV on 15.04.2022.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - View for controller
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .specialLightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
   
}

// MARK: - Setup View
extension MainViewController {
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(userPhotoImageView)
    }
}

// MARK: - Setup Constraints
extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 36),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 33)
        ])
    }
}


