//
//  PhotoDetailsVC.swift
//  NavigationHome
//
//  Created by Ella on 30.01.2023.
//

import UIKit

class PhotoDetailsVC: UIViewController {
    
    var selectedImage: String?
    
    private lazy var alphaView: UIView = {
        let view = UIView()
        view.alpha = 0.8
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var additionalPhotoImage: UIImageView = {
        let imageView = UIImageView()
        if let image = selectedImage {
            imageView.image = UIImage(named: image)
        }
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        view.addSubview(alphaView)
        view.addSubview(additionalPhotoImage)
        view.backgroundColor = .white
        
    }
    
    @objc private func didTapCloseButton() {
        dismiss(animated: true)
    }
}

extension PhotoDetailsVC {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            additionalPhotoImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            additionalPhotoImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            additionalPhotoImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            alphaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            alphaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            alphaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            alphaView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
