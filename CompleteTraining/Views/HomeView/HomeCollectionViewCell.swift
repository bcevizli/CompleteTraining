//
//  HomeCollectionViewCellView.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "HomeCollectionViewCell"
    
    
    private let imageView = UIImageView()
    private let bottomTitleLabel = UILabel()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        setUpLayer()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
    private func setUpLayer() {
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2
        
        // Set up image view
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.alpha = 1
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 248),
        ])
        
        // Set up bottom title label
        bottomTitleLabel.font = UIFont.systemFont(ofSize: 18)
        bottomTitleLabel.textAlignment = .center
        bottomTitleLabel.numberOfLines = 1
        contentView.addSubview(bottomTitleLabel)
        bottomTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomTitleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            bottomTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            bottomTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            bottomTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    func configure(with viewModel: HomeCollectionViewCellViewModel) {
        imageView.image = UIImage(named: viewModel.imageName)
        bottomTitleLabel.text = viewModel.bottomTitle
    }
}









