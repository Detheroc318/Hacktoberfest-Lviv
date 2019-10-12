//
//  UIStoryboard+InisiateViewController.swift
//  Zupa
//
//  Created by binariksuser1111 on 9/27/19.
//  Copyright © 2019 binariksuser1111. All rights reserved.
//

import UIKit

extension UIStoryboard {
    func initialViewController<T: UIViewController>(with type: T.Type) -> T {
        let identifier = String(describing: T.self)
        guard let controller = self.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError()
        }
        return controller
    }
}
