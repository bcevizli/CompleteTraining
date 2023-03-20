//
//  SettingsOption.swift
//  CompleteTraining
//
//  Created by Adem Burak Cevizli on 20.03.2023.
//

import UIKit

enum SettingsOption: CaseIterable {
    case rateApp
    case contactUs
    case terms
    case privacy
    case apiReference
    case socialMedia
    case viewCode
    
    var targerUrl: URL? {
        switch self {
        case .rateApp:
            return nil
        case .contactUs:
            return URL(string: "https://www.instagram.com/juicetrainings/")
        case .terms:
            return URL(string: "https://www.instagram.com/juicetrainings/")
        case .privacy:
            return URL(string: "https://www.instagram.com/juicetrainings/")
        case .apiReference:
            return URL(string: "https://www.instagram.com/juicetrainings/")
        case .socialMedia:
            return URL(string: "https://www.instagram.com/juicetrainings/")
        case .viewCode:
            return URL(string: "https://github.com/bcevizli/CompleteTraining")
        }
    }
    
    var displayTitle: String {
        switch self {
        case .rateApp:
            return "Rate App"
        case .contactUs:
            return "Contact Us"
        case .terms:
            return "Terms of Service"
        case .privacy:
            return "Privacy Policy"
        case .apiReference:
            return "API Reference"
        case .socialMedia:
            return "View Video Series"
        case .viewCode:
            return "View App Code"
        }
    }
    var iconContainerColor: UIColor {
        switch self {
        case .rateApp:
            return .systemGreen
        case .contactUs:
            return .systemBlue
        case .terms:
            return .systemRed
        case .privacy:
            return .systemIndigo
        case .apiReference:
            return .systemBrown
        case .socialMedia:
            return .systemPurple
        case .viewCode:
            return .systemOrange
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .rateApp:
            return UIImage(systemName: "star.fill")
        case .contactUs:
            return UIImage(systemName: "paperplane")
        case .terms:
            return UIImage(systemName: "doc")
        case .privacy:
            return UIImage(systemName: "lock")
        case .apiReference:
            return UIImage(systemName: "list.clipboard")
        case .socialMedia:
            return UIImage(systemName: "iphone.gen1.circle")
        case .viewCode:
            return UIImage(systemName: "hammer.fill")
        }
    }
}
