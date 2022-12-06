//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Ella on 22.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    var headerView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    private func makeUI() {
        view.addSubview(headerView)
        view.backgroundColor = .lightGray
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerView.frame = self.view.frame
        
    }

}
