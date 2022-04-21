//
//  MenuViewController.swift
//  Spinx allp
//
//  Created by BSergio on 18.04.2022.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - UI Elements
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        return collectionView
    }()
    
    lazy var titleChaper: UILabel = {
       let title = UILabel()
        title.text = "Title Section"
        title.font = .robotoMedium24()
        title.textColor = UIColor.specialLightGray
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .none
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupView()
        setupConstraints()
        registrationCell()
    }
    
    // MARK: - Private methodes
    private func setupDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registrationCell() {
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.id)
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.id)
    }
}

// MARK: - Setup Views
extension MenuViewController {
    private func setupView() {
        title = "Menu"
        view.backgroundColor = .speceiaBackground
        view.addSubview(tableView)
        view.addSubview(collectionView)
        view.addSubview(titleChaper)
    }
}

// MARK: - Setup Constraints
extension MenuViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),

            collectionView.heightAnchor.constraint(equalToConstant: 105)
        ])
        
        NSLayoutConstraint.activate([
            titleChaper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleChaper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleChaper.heightAnchor.constraint(equalToConstant: 50),
            titleChaper.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: titleChaper.bottomAnchor, constant: 0)
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.id, for: indexPath) as! MenuTableViewCell
        cell.setupCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CardViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Protocols CollectionView
extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.id, for: indexPath) as! MenuCollectionViewCell
        cell.setupCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // TODO update table view for actual part
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 100)
    }
}
