//
//  Router.swift
//  Hacktoberfest
//
//  Created by Luybckyk Drevych on 12.10.2019.
//  Copyright © 2019 Luybckyk Drevych. All rights reserved.
//

import UIKit

public protocol RouterType: AnyObject {
    var navigationController: UINavigationController { get }
    
    func push(_ vc: UIViewController, animated: Bool)
    func pop(_ animation: Bool)
    func popToViewController(_ vc: UIViewController, animated: Bool)
    func popToRootViewController(_ animated: Bool)
    func dismiss(_ animated: Bool, complition: (() -> Void)?)
}

open class Router: RouterType {
    
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController)  {
        self.navigationController = navigationController
    }
    
    public func push(_ vc: UIViewController, animated: Bool) {
        navigationController.pushViewController(vc, animated: animated)
    }
    
    public func pop(_ animation: Bool) {
        navigationController.popViewController(animated: animation)
    }
    
    public func popToRootViewController(_ animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    public func popToViewController(_ vc: UIViewController, animated: Bool) {
        navigationController.popToViewController(vc, animated: animated)
    }
    
    public func dismiss(_ animated: Bool, complition: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: complition)
    }
}
