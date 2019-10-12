//
//  WelcomeVCRouter.swift
//  Hacktoberfest
//
//  Created by Luybckyk Drevych on 12.10.2019.
//  Copyright © 2019 Luybckyk Drevych. All rights reserved.
//

import UIKit

final class WelcomeRouter: Router {
    
    public func createSingInModule() -> UIViewController {
        let welcomeVC = UIStoryboard.Main.welcomeVC
        
        return welcomeVC
    }
    

}
