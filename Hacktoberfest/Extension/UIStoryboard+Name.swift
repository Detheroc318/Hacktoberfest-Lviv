//
//  UIStoryboard+Name.swift
//  Zupa
//
//  Created by binariksuser1111 on 9/27/19.
//  Copyright © 2019 binariksuser1111. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    public enum Names {
        static let Main = UIStoryboard(name: "Main", bundle: nil)
    }
    
    enum Main {
        static var welcomeVC: WelcomeViewController  {
            return Names.Main.initialViewController(with: WelcomeViewController.self)
        }
    }
    
 
    
}
