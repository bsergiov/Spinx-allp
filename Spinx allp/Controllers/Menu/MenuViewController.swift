//
//  MenuViewController.swift
//  Spinx allp
//
//  Created by BSergio on 18.04.2022.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - UI Elements
    lazy private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        return collectionView
    }()
    
    lazy private var titleChaper: UILabel = {
       let title = UILabel()
        title.text = "Title Section"
        title.font = .robotoMedium24()
        title.textColor = UIColor.specialLightGray
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy private var tableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .none
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    // MARK: - Private Properies
    private let menu = DataManager.products
    private var products: [ProductModel]!
   
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
        guard let category = menu.first else { return }
        products = category.products
        title = "Menu"
        titleChaper.text = category.name
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
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.id, for: indexPath) as! MenuTableViewCell
        cell.setupCell(product: products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CardProductViewController()
        vc.product = products[indexPath.row]
        present(vc, animated: true)
    }
}

// MARK: - Protocols CollectionView
extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.id, for: indexPath) as! MenuCollectionViewCell
        cell.setupCell(imagName: menu[indexPath.item].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        products = menu[indexPath.item].products
        titleChaper.text = menu[indexPath.item].name
        tableView.reloadData()
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 90, height: 90)
    }
}
