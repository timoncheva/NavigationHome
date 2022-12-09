//
//  LoginViewController.swift
//  NavigationHome
//
//  Created by Ella on 09.12.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var VKLogoImageView: UIImageView = {
        let VKLogoImageView = UIImageView(image: UIImage(named: "logo"))
        VKLogoImageView.clipsToBounds = true
        VKLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        return VKLogoImageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemGray6
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var loginTextField: UITextField = {
        let logTextField = UITextField()
        logTextField.backgroundColor = .systemGray6
        logTextField.textColor = .black
        logTextField.font = .systemFont(ofSize: 16)
        logTextField.autocapitalizationType = .none
        logTextField.placeholder = "Email or phone"
        logTextField.layer.borderWidth = 0.5
        logTextField.leftView = UIView(frame: CGRect(x: 0,
                                                     y: 10,
                                                     width: 10,
                                                     height: logTextField.frame.height))
        logTextField.leftViewMode = .always
        logTextField.layer.borderColor = UIColor.lightGray.cgColor
        logTextField.translatesAutoresizingMaskIntoConstraints = false
        return logTextField
    }()
    
    private lazy var passTextField: UITextField = {
        let passTextField = UITextField()
        passTextField.backgroundColor = .systemGray6
        passTextField.isSecureTextEntry = true
        passTextField.textColor = .black
        passTextField.font = .systemFont(ofSize: 16)
        passTextField.autocapitalizationType = .none
        passTextField.placeholder = "Password"
        passTextField.layer.borderWidth = 0.5
        passTextField.leftView = UIView(frame: CGRect(x: 0,
                                                      y: 10,
                                                      width: 10,
                                                      height: passTextField.frame.height))
        passTextField.leftViewMode = .always
        passTextField.layer.borderColor = UIColor.lightGray.cgColor
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        return passTextField
    }()
    
    private lazy var logButton: UIButton = {
        let logButton = UIButton()
        logButton.backgroundColor = .systemBlue
        logButton.layer.cornerRadius = 10
        logButton.setTitle("Log in", for: .normal)
        logButton.clipsToBounds = true
        logButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        logButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        logButton.translatesAutoresizingMaskIntoConstraints = false
        return logButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        configure()
        setConstraints()
    }
    
    private func configure() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logButton)
        contentView.addSubview(VKLogoImageView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passTextField)
    }
    
    @objc func didTapButton() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
}

extension LogInViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            VKLogoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            VKLogoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            VKLogoImageView.widthAnchor.constraint(equalToConstant: 100),
            VKLogoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: VKLogoImageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            logButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            logButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
