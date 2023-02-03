//
//  ProfileHeaderView.swift
//  NavigationHome
//
//  Created by Ella on 06.12.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    lazy var avatarView: UIImageView = {
        let avatarView = UIImageView()
        avatarView.image = UIImage(named: "cat")
        avatarView.layer.borderWidth = 3
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.layer.cornerRadius = 50
        avatarView.layer.masksToBounds = true
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        return avatarView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.text = "Ella Timoncheva"
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Status"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter status"
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.font = .systemFont(ofSize: 15)
        textField.textColor = .systemGray2
        textField.backgroundColor = .systemGray4
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var statusButton: UIButton = {
         let statusButton = UIButton()
         statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
         statusButton.setTitle("Set status", for: .normal)
         statusButton.setTitleColor(.white, for: .normal)
         statusButton.layer.cornerRadius = 12
         statusButton.layer.shadowOffset = CGSize(width: 4, height: 4.0)
         statusButton.clipsToBounds = true
         statusButton.layer.shadowRadius = 4
         statusButton.layer.shadowColor = UIColor.black.cgColor
         statusButton.layer.shadowOpacity = 0.7
         statusButton.layer.shadowPath = UIBezierPath(rect: statusButton.bounds).cgPath
         statusButton.translatesAutoresizingMaskIntoConstraints = false
         statusButton.backgroundColor = .systemBlue
         return statusButton
     }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(avatarView)
        addSubview(statusButton)
        addSubview(nameLabel)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapKeyboardOff(_:)))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapKeyboardOff(_ sender: Any) {
        statusTextField.resignFirstResponder()
    }
    
    @objc func buttonPressed() {
        guard let status = statusTextField.text else { return }
        if !status.isEmpty {
            UIView.animate(withDuration: 0.5) {
                self.statusLabel.text = status
                
            } completion: { _ in
                self.statusTextField.text = nil
            }
        } else {
            statusTextField.shakeField()
        }
        endEditing(true)
    }
}

extension ProfileHeaderView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarView.heightAnchor.constraint(equalToConstant: 100),
            avatarView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            statusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            statusButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            statusButton.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 30),
            statusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: statusButton.trailingAnchor),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            statusTextField.heightAnchor.constraint(equalToConstant: 34)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
    }
    
}
