//
//  HomeViewViewModel.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import Foundation
import UIKit

protocol HomeViewViewModelDelegate: AnyObject {
   
    
    func didSelectCell()
}

/// View Model to handle character list view logic
final class HomeViewViewModel: NSObject {
    
    
    let viewModel = HomeCollectionModel()

    
    public weak var delegate: HomeViewViewModelDelegate?
    
    
//    private var cellViewModels: [ProfileCollectionViewCellViewModel] = []
    
    
}
    
    
    // MARK: - CollectionView
    
    extension HomeViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.cellIdentifier, for: indexPath) as! HomeCollectionViewCell
            let cellViewModel = viewModel.cellViewModels[indexPath.row]
                    cell.configure(with: cellViewModel)
            
            
            return cell
        }
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {

            return CGSize(width: 0, height: 0)
        }



        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let bounds = UIScreen.main.bounds
            let width = (bounds.width-40)
            return CGSize(width: width-100, height: width-70)
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            collectionView.deselectItem(at: indexPath, animated: true)
            
            print("did select")
        }
        
        
    }
   
