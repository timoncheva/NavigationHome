//
//  PostTableViewCell.swift
//  NavigationHome
//
//  Created by Ella on 09.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    struct ViewModel {
        let author: String
        let image: String
        let description: String
        var likes: Int
        var views: Int
    }
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var postStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var likesViewsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = NSTextAlignment.left
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        image.setContentCompressionResistancePriority(UILayoutPriority(100), for: .vertical)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "", size: 14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont(name: "", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont(name: "", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setBackViewConstraints()
        setPostStackViewConstraints()
        setImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = .white
        contentView.addSubview(backView)
        backView.addSubview(postStackView)
        postStackView.addArrangedSubview(authorLabel)
        postStackView.addArrangedSubview(imageImageView)
        postStackView.addArrangedSubview(descriptionLabel)
        postStackView.addArrangedSubview(likesViewsStackView)
        likesViewsStackView.addArrangedSubview(likesLabel)
        likesViewsStackView.addArrangedSubview(viewsLabel)
    }
    
    func setup(viewModel: ViewModel) {
        likesLabel.text = "Likes: " + String(viewModel.likes)
        viewsLabel.text = "Views: " + String(viewModel.views)
        authorLabel.text = viewModel.author
        imageImageView.image = UIImage(named: viewModel.image)
        descriptionLabel.text = viewModel.description
    }
}

extension PostTableViewCell {
    
    private func setBackViewConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setPostStackViewConstraints() {
        NSLayoutConstraint.activate([
            postStackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            postStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            postStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
            postStackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16)
        ])
    }
    
    private func setImageConstraints() {
        NSLayoutConstraint.activate([
            imageImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
        ])
    }
}
