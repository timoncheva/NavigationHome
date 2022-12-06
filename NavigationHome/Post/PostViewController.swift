//
//  PostViewController.swift
//  NavigationHome
//
//  Created by Ella Timoncheva on 25.11.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post?
    
    private lazy var bookmarkButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(didTapInfo))
        return button
    }()
    
    init(with post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = post?.title
        makeUI()
    }
    
    
    private func makeUI() {
        self.navigationItem.rightBarButtonItem = bookmarkButton
        view.backgroundColor = .lightGray
    }
    
    @objc private func didTapInfo() {
        let infoViewController = InfoViewController()
        self.present(infoViewController, animated: true)
    }
    
}
