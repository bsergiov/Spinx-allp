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
        image.clipsToBounds = true
        if let data = UserDefaults.standard.data(forKey: "avatarUser") {
            let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
            let imageAva = UIImage(data: decoded)
            image.image = imageAva
        } else { image.layer.borderColor = UIColor.white.cgColor }
        
        image.layer.borderWidth = 10
        image.backgroundColor = .specialYeloow
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var editButtonImage: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "pencil.circle")
        button.setImage(image, for: .normal)
        button.tintColor = .specialDarkGrey
        button.addTarget(self, action: #selector(editPhoto), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        //todo при загрузке генерить ид и закидывать в стораж
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
        label.text = StorageManager.shared.getName(for: "name") ?? "You Name"
        label.font = .robotoMedium18()
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var addnameButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "plus.circle.fill")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.tag = 0
        button.addTarget(self, action: #selector(addPlusTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        label.text = StorageManager.shared.getName(for: "phone") ?? "Add phone"
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
        button.tag = 1
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
        label.text = StorageManager.shared.getName(for: "mail") ?? "Add Mail"
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
        button.tag = 2
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

// MARK: - UI Actions
extension ProfileViewController {
    @objc private func closeTapped() {
        dismiss(animated: true)
    }
    
    @objc private func addPlusTapped(_ sender: UIButton) {
        let message = sender.tag == 0 ? "phone" : "mail"
        print("tapped \(message) tag \(sender.tag)")
        showAllert(title: "add Phone", message: "phone", tag: sender.tag)
    }
    
    @objc private func editPhoto() {
        alertTakeTypePhoto { [weak self] source in
            self?.chooseImagePicker(source: source)
        }
    }
}

// MARK: - Private Methodes
extension ProfileViewController {
   
    
    private func alertTakeTypePhoto(completionHandler: @escaping (UIImagePickerController.SourceType) -> Void) {
        let alert = UIAlertController(title: "Photo",
                                      message: "Select the source of the photos",
                                      preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
            let camera = UIImagePickerController.SourceType.camera
            completionHandler(camera)
        }
        let libraryAction = UIAlertAction(title: "Photo Library", style: .default) { _ in
            let photoLibrary = UIImagePickerController.SourceType.photoLibrary
            completionHandler(photoLibrary)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cameraAction)
        alert.addAction(libraryAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private func savePhotoToUserDefault(image: UIImage){
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        let encoded = try! PropertyListEncoder().encode(data)
        UserDefaults.standard.set(encoded, forKey: "avatarUser")
        print("tut save")
    }
    
    private func chooseImagePicker(source: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.sourceType = source
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    private func showAllert(title: String, message: String, tag: Int?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actioOk = UIAlertAction(title: "OK", style: .default) { [weak alert] _ in
            guard let textFields = alert?.textFields else { return }
            guard let firstFild = textFields[0].text else { return }
            switch tag {
            case 0: //name
                StorageManager.shared.save(for: "name", value: firstFild)
                self.valueNameLable.text = firstFild
            case 1: //phone
                StorageManager.shared.save(for: "phone", value: firstFild)
                self.valuePhoneLable.text = firstFild
            default: // mail
                StorageManager.shared.save(for: "mail", value: firstFild)
                self.valueMailLable.text = firstFild
            }
        }
        alert.addAction(actioOk)
        alert.addTextField { texfield in
            print(texfield.text ?? "non text")
        }
        
        present(alert, animated: true)
    }
}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        savePhotoToUserDefault(image: image)
        avaImageView.image = image
    }
}

// MARK: - Setup View
extension ProfileViewController {
    private func setupView() {
        view.addSubview(closeButton)
        view.addSubview(descriptionLabel)
        view.addSubview(avaImageView)
        view.addSubview(editButtonImage)
        view.addSubview(backInfo)
        backInfo.addSubview(titleIdLable)
        backInfo.addSubview(valueIdlable)
        backInfo.addSubview(separateOne)
        backInfo.addSubview(titleNameLable)
        backInfo.addSubview(valueNameLable)
        backInfo.addSubview(addnameButton)
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

// MARK: - Setup constraints
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
        //editButtonImage
        NSLayoutConstraint.activate([
            editButtonImage.heightAnchor.constraint(equalToConstant: 36),
            editButtonImage.widthAnchor.constraint(equalToConstant: 36),
            editButtonImage.trailingAnchor.constraint(equalTo: avaImageView.trailingAnchor, constant: -25),
            editButtonImage.bottomAnchor.constraint(equalTo: avaImageView.bottomAnchor, constant: -30)
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
        //addnameButton
        NSLayoutConstraint.activate([
            addnameButton.heightAnchor.constraint(equalToConstant: 35),
            addnameButton.widthAnchor.constraint(equalToConstant: 35),
            addnameButton.trailingAnchor.constraint(equalTo: backInfo.trailingAnchor, constant: -15),
            addnameButton.topAnchor.constraint(equalTo: separateOne.bottomAnchor, constant: 17)
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
