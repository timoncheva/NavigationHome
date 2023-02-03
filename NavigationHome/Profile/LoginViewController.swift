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
    
    private lazy var logoImageView: UIImageView = {
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
    
    private lazy var validLabel: UILabel = {
        let label = UILabel()
        label.text = "dfdf"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        label.contentMode = .scaleToFill
        label.textAlignment = .center
        label.numberOfLines = 10
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var verificationData = Verification()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
        setConstraints()
        
        registerForKeyboardNotifications()
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logButton)
        contentView.addSubview(logoImageView)
        contentView.addSubview(stackView)
        contentView.addSubview(validLabel)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passTextField)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapKeyboardOff(_:)))
        view.addGestureRecognizer(tap)
    }
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height - logButton.frame.height)
    }
    
    @objc private func kbWillHide() {
        scrollView.contentOffset = CGPoint.zero
    }
    
    @objc private func tapKeyboardOff(_ sender: Any) {
        loginTextField.resignFirstResponder()
        passTextField.resignFirstResponder()
    }
    
    @objc func didTapButton() {
        let profileViewController = ProfileViewController()
        
        guard let email = loginTextField.text else {return}
        guard let password = passTextField.text else {return}
        
        let enteredEmail = validEmail(email: email)
        let enteredPassword = validPassword(password: password)

        validLabel.isHidden = true
        
        if email.isEmpty && password.isEmpty {
            loginTextField.shakeField()
            passTextField.shakeField()
        } else if email.isEmpty {
            loginTextField.shakeField()
        } else if password.isEmpty {
            passTextField.shakeField()
        } else {
            if !enteredPassword && !enteredEmail {
                validLabel.text = verificationData.invalidEmailAndPassword
                validLabel.isHidden = false
                passTextField.shakeField()
                loginTextField.shakeField()
            } else if !enteredPassword {
                validLabel.text = verificationData.invalidPassword
                validLabel.isHidden = false
                passTextField.shakeField()
            } else if !enteredEmail {
                validLabel.text = verificationData.invalidEmail
                validLabel.isHidden = false
                loginTextField.shakeField()
            } else {
                if (enteredEmail && enteredPassword) && (loginTextField.text != verificationData.defaultLogin || passTextField.text != verificationData.defaultPassword) {
                    let alert = UIAlertController(title: Verification().invalidEmailAndPassword, message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                } else {
                    navigationController?.pushViewController(profileViewController, animated: true)
                    validLabel.isHidden = true
                }
            }
        }
    }
}

//MARK: - ValidEmail, ValidPassword
extension LogInViewController {
    
    private func validEmail(email: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validEmail = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return validEmail.evaluate(with: email)
    }
    
    private func validPassword(password: String) -> Bool {
        let passwordReg = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        let passwordTesting = NSPredicate(format: "SELF MATCHES %@", passwordReg)
        return passwordTesting.evaluate(with: password)
    }
}

//MARK: - SetConstraints
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
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
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
        
        NSLayoutConstraint.activate([
            validLabel.topAnchor.constraint(equalTo: logButton.bottomAnchor, constant: 6),
            validLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            validLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
