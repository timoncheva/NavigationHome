//
//  ProfileHeaderView.swift
//  NavigationHome
//
//  Created by Ella on 06.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
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
    
    lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.font = .systemFont(ofSize: 14)
        statusLabel.text = "I'm designer and developer"
        statusLabel.textColor = .gray
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    lazy var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.layer.cornerRadius = 12
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4.0)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.backgroundColor = .systemBlue
        return statusButton
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(statusLabel)
        addSubview(avatarView)
        addSubview(statusButton)
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarView.heightAnchor.constraint(equalToConstant: 100),
            avatarView.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 20),
            
            statusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            statusButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            statusButton.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed() {
        if let status = statusLabel.text {
            print(status)
        }
    }
}
