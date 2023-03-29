//
//  ProfileListView.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import UIKit

protocol ProfileListViewDelegate: AnyObject {
    func listView()
    func listView1()
    func listView2()
    func listView3()
    func listView4()
    func listView5()
    
}
/// View that handles showing list of cells
final class ProfileListView: UIView {
    
    public weak var delegate: ProfileListViewDelegate?
    private let viewModel = ProfileListViewViewModel()
    
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.alpha = 1
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: ProfileCollectionViewCell.cellIdentifier)
        
        
        return collectionView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        addConstraints()
        viewModel.delegate = self
        setUpCollectionView()
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
      ])
       
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
       
       
    }
}
extension ProfileListView: ProfileListViewViewModelDelegate {
    func didSelectCell4() {
        delegate?.listView4()
    }
    
    func didSelectCell5() {
        delegate?.listView5()
    }
    
    func didSelectCell1() {
        delegate?.listView1()
    }
    
    func didSelectCell2() {
        delegate?.listView2()
    }
    
    func didSelectCell3() {
        delegate?.listView3()
    }
    
    func didSelectCell() {
        delegate?.listView()
    }
    
}
   
