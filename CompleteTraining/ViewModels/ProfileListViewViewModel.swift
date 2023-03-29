//
//  ProfileListViewViewModel.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import Foundation
import UIKit

protocol ProfileListViewViewModelDelegate: AnyObject {
    
    func didSelectCell()
    func didSelectCell1()
    func didSelectCell2()
    func didSelectCell3()
    func didSelectCell4()
    func didSelectCell5()
}

/// View Model to handle character list view logic
final class ProfileListViewViewModel: NSObject{
    
    
    public weak var delegate: ProfileListViewViewModelDelegate?
    
    let viewModel = ProfileCollectionModel()
    
}

// MARK: - CollectionView

extension ProfileListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.cellIdentifier, for: indexPath) as! ProfileCollectionViewCell
        let cellViewModel = viewModel.cellViewModels[indexPath.row]
                cell.configure(with: cellViewModel)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width*1.5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            delegate?.didSelectCell()
        } else if indexPath.row == 1 {
            delegate?.didSelectCell1()
        } else if indexPath.row == 2 {
            delegate?.didSelectCell2()
        } else if indexPath.row == 3 {
            delegate?.didSelectCell3()
        } else if indexPath.row == 4 {
            delegate?.didSelectCell4()
        } else if indexPath.row == 5 {
            delegate?.didSelectCell5()
        }
    }
}

