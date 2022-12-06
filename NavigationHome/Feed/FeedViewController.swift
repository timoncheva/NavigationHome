//
//  FeedViewController.swift
//  Navigation
//
//  Created by Ella on 22.11.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.setTitle("Open post details", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(didTapOpenPost), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    private func makeUI() {
        view.backgroundColor = .white
        
        view.addSubview(self.postButton)
        
        NSLayoutConstraint.activate([postButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -110),
                                     postButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
                                     postButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
                                     postButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    @objc private func didTapOpenPost() {
        let post = Post(title: "Best Post")
        let postViewController = PostViewController(with: post)
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
}
