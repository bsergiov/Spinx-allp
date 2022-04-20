//
//  ViewController.swift
//  Spinx allp
//
//  Created by SV on 15.04.2022.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - UI Elements
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
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    @objc private func leftBarButtonTaped() {
        print("tap Leftbbi")
    }
    
    @objc private func rightBarButtonTaped() {
        print("tap Rightbbi")
    }
}

// MARK: - Setup View
extension MainViewController {
    private func setupViews() {
        view.backgroundColor = .white
        
        navigationItem.setLeftBarButton(profileBarButtonItem, animated: true)
        navigationItem.setRightBarButton(balanseBarButtonItem, animated: true)
    }
}

// MARK: - Setup Constraints
extension MainViewController {
    private func setConstraints() {
    }
}
