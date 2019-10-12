//
//  DefaultImage.swift
//  Hacktoberfest
//
//  Created by Luybckyk Drevych on 12.10.2019.
//  Copyright © 2019 Luybckyk Drevych. All rights reserved.
//

import UIKit

enum DefaultImage: String {
    
    case bicycle
    case background
    case google
    
    private var name: String {
        switch self {
        case .bicycle:
            return "bicycle"
        case .background:
            return "background"
        case .google:
            return "google"
        }
    }
    
    var image: UIImage? {
        return UIImage(named: name)
    }
}

