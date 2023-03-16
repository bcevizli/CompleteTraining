//
//  HomeCollectionModel.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 16.03.2023.
//

import Foundation

class HomeCollectionModel {
    let cellViewModels: [HomeCollectionViewCellViewModel] = [
        HomeCollectionViewCellViewModel(imageName: "todaysProgram", bottomTitle: "Today's Program"),
        HomeCollectionViewCellViewModel(imageName: "todaysChallange", bottomTitle: "Daily Challange"),
        HomeCollectionViewCellViewModel(imageName: "lastNote", bottomTitle: "Last Note"),
        HomeCollectionViewCellViewModel(imageName: "currentLifts", bottomTitle: "Current Lifts")
    ]
}
