//
//  HomeView.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import UIKit

protocol PopUpDidSelectDelegate: AnyObject {
    
    func didSelectTodaysProgram()
    func didSelectTodaysChallange()
    func didSelectLastNote()
    func didSelectCurrentLifts()
}

final class HomeView: UIView {
    
    public weak var delegate: PopUpDidSelectDelegate?
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
        addConstraint()
        viewModel.delegate = self
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
extension HomeView: PopupViewModelDelegate {
    
    func didSelectHomeCell() {
        delegate?.didSelectTodaysProgram()
    }
    
    func didSelectHomeCell1() {
        delegate?.didSelectTodaysChallange()
    }
    
    func didSelectHomeCell2() {
        delegate?.didSelectLastNote()
    }
    
    func didSelectHomeCell3() {
        delegate?.didSelectCurrentLifts()
    }
        
}


