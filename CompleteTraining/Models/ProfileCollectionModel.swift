//
//  ProfileCollectionModel.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import Foundation

class ProfileCollectionModel {
    let cellViewModels: [ProfileCollectionViewCellViewModel] = [
        ProfileCollectionViewCellViewModel(profileImageName: "trainingPrograms", profileBottomTitle: "Training Programs"),
        ProfileCollectionViewCellViewModel(profileImageName: "transformations", profileBottomTitle: "Transformations"),
        ProfileCollectionViewCellViewModel(profileImageName: "liftingProgress", profileBottomTitle: "Lifting Progress"),
        ProfileCollectionViewCellViewModel(profileImageName: "challanges", profileBottomTitle: "Challanges"),
        ProfileCollectionViewCellViewModel(profileImageName: "notes", profileBottomTitle: "Notes"),
        ProfileCollectionViewCellViewModel(profileImageName: "settings", profileBottomTitle: "Settings")
    ]
}

