//
//  SettingsViewModel.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 20.03.2023.
//

import UIKit

struct SettingsCellViewModel: Identifiable, Hashable {
    let id = UUID()
    
    public var image: UIImage? {
        return type.iconImage
    }
    public var title: String {
        return type.displayTitle
    }
    
    private let type: SettingsOption
    
    init(type: SettingsOption) {
        self.type = type
    }
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
}
