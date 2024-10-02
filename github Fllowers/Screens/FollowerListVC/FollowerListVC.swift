//
//  FollowerListVC.swift
//  github Fllowers
//
//  Created by Zakaria Lachkar on 16/9/2024.
//

import UIKit

class FollowerListVC: UIViewController {
    var username: String!
    var followers: [Follower] = []
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    enum Section {
        case main
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureViewController()
        
//        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
//            guard let followers = followers else {
//                self.presentGFAlertOnMainThread(title: "Api Error", message: errorMessage!.rawValue, buttonTitle: "Ok")
//                return
//            }
//            
//            print("followers: \(followers)")
//        }
        
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.isNavigationBarHidden = false
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemRed
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    func createThreeColumnLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minSpacing: CGFloat = 12

        let availableWidth = width - (padding * 2) - (minSpacing * 2)
        let itemWidth = (availableWidth - (minSpacing * 2)) / 3 // Ajustement pour espacement

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        flowLayout.minimumLineSpacing = minSpacing
//        flowLayout.minimumInteritemSpacing = minSpacing

        return flowLayout
    }
    
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
                case .success(let followers):
                    print("followers: \(followers)")
                    self.followers = followers
                    self.updateData()
                case .failure(let error):
                    self.presentGFAlertOnMainThread(title: "Api Error", message: error.rawValue, buttonTitle: "Ok", action: self.dismissView)
            }
        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView) { collectionView, indexPath, follower in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.setup(with: follower)
            return cell
        }
    }
    
    func updateData() {
        var snapshat = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshat.appendSections([.main])
        snapshat.appendItems(followers)
        DispatchQueue.main.async {  self.dataSource.apply(snapshat, animatingDifferences: true) }
    }
    
    func dismissView() {
        self.dismiss(animated: true)
    }
}
