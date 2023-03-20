//
//  SettingsViewModel.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 20.03.2023.
//

import UIKit

struct SettingsCellViewModel: Identifiable {
    let id = UUID()
    
    public var image: UIImage? {
        return type.iconImage
    }
    public var title: String {
        return type.displayTitle
    }
    
    public let type: SettingsOption
    public let onTapHandler: (SettingsOption) -> Void
    
    init(type: SettingsOption, onTapHandler: @escaping (SettingsOption) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
    }
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
}
