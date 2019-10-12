//
//  WelcomeModulePresenter.swift
//  Hacktoberfest
//
//  Created by Luybckyk Drevych on 12.10.2019.
//  Copyright © 2019 Luybckyk Drevych. All rights reserved.
//

import UIKit
import Foundation

protocol WelcomePresenter: class {
    var router: WelcomeRouter? { get }
    
    func authWithGoogle(viewController: UIViewController)
}

final class WelcomeVCPresenter: WelcomePresenter {
    
    var router: WelcomeRouter?

    private let authManager: GoogleManager

    init(manager: GoogleManager) {
        self.authManager = manager
    }
    
    public func showMapViewController() {
        
    }
    
    func authWithGoogle(viewController: UIViewController) {
        authManager.googleLogin(viewController: viewController)
    }
}


