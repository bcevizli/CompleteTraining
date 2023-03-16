//
//  HomeView.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func listView()
    
}

class HomeView: UIView {
    
    public weak var delegate: HomeViewDelegate?
    private let viewModel = HomeViewViewModel()
    
     let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.alpha = 1
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.cellIdentifier)
        
        
        return collectionView
    }()
        
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
        collectionView.showsHorizontalScrollIndicator = false
        addSubview(collectionView)
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.cellIdentifier)
        addConstraint()
    }
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    private func addConstraint() {
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
}



