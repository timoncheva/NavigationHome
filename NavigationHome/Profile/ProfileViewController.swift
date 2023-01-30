//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Ella on 22.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    enum Sections {
        case posts
        case photos
    }
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "FeedItemCell")
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView")
        tableView.backgroundColor = .systemGray6
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 0.5
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var dataSource: [Post] = []
    
    private let sections: [Sections] = [.photos, .posts]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Profile"
        setupView()
        setConstraints()
        addDataSource()
    }
    
    private func setupView() {
        
        view.addSubview(profileHeaderView)
        view.addSubview(tableView)
    }
}

extension ProfileViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController {
    
    private func addDataSource() {
        dataSource.append(contentsOf: Post.dummyPosts)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .photos:
            return 1
        case .posts:
            return dataSource.count
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch sections[indexPath.section] {
        case .photos:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as? PhotosTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            return cell
        case .posts:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedItemCell", for: indexPath) as? PostTableViewCell else {
                return UITableViewCell()
            }
            
            cell.isLiked = { [weak self] in
                self?.dataSource[indexPath.row].likes += 1
                self?.tableView.reloadData()
            }
            
            let article = self.dataSource[indexPath.row]
            let viewModel = PostTableViewCell.ViewModel(author: article.author,
                                                        image: article.image,
                                                        description: article.description,
                                                        likes: article.likes,
                                                        views: article.views)
            cell.setup(viewModel: viewModel)
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch sections[section] {
        case .photos:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderView") as! ProfileHeaderView
            return headerView
            
        case .posts:
            return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch sections[section] {
        case .photos:
            return 220
        case .posts:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch sections[indexPath.section] {
        case .photos:
            self.navigationController?.pushViewController(PhotosVC(), animated: true)
        case .posts:
            dataSource[indexPath.row].views += 1
            self.tableView.reloadRows(at: [indexPath], with: .none)
            let vc = PostDetailsVC(post: dataSource[indexPath.row])
            vc.didTapLike = {[weak self] likedPost in
                self?.dataSource[indexPath.row].likes += 1
                tableView.reloadRows(at: [indexPath], with: .none)
            }
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
}
