//
//  InfoViewController.swift
//  NavigationHome
//
//  Created by Ella Timoncheva on 25.11.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    
    private lazy var messageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 8
        button.setTitle("Present message", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(didTapMessage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    private func makeUI() {
        view.backgroundColor = .magenta
        
        view.addSubview(self.messageButton)
        
        NSLayoutConstraint.activate([messageButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200),
                                     messageButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
                                     messageButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
                                     messageButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    @objc private func didTapMessage() {
        
        let controller = UIAlertController(title: "Title message", message: "Body message", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default) { action in
            print("action: ok")
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .destructive) { action in
            print("action: cancel")
        }
        
        controller.addAction(actionOk)
        controller.addAction(actionCancel)
        present(controller, animated: true)
    }
    
}
