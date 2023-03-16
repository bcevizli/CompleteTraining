//
//  ProfileCollectionViewCellView.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import UIKit

/// Single cell for a character
final class ProfileCollectionViewCellView: UICollectionViewCell {
    
    static let cellIdentifier = "ProfileCollectionViewCell"
    
    private let imageView = UIImageView()
    private let bottomTitleLabel = UILabel()
    
    
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView, bottomTitleLabel)
        addConstraints()
        setUpLayer()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setUpLayer() {
        
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.cornerRadius = 4
        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
        
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
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
        ])
        
        // Set up bottom title label
        bottomTitleLabel.font = UIFont.systemFont(ofSize: 16)
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
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
         bottomTitleLabel.heightAnchor.constraint(equalToConstant: 30),
         bottomTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
         bottomTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
         bottomTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
         
         imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
         imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
         imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
         imageView.bottomAnchor.constraint(equalTo: bottomTitleLabel.topAnchor, constant: -3)
         
        ])
    }
    func configure(with viewModel: ProfileCollectionViewCellViewModel) {
        imageView.image = UIImage(named: viewModel.profileImageName)
        bottomTitleLabel.text = viewModel.profileBottomTitle
    }
    }
    
