//
//  AppDelegate.swift
//  Hacktoberfest
//
//  Created by Luybckyk Drevych on 12.10.2019.
//  Copyright © 2019 Luybckyk Drevych. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setUp()
        setupFirebase()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        guard let scheme = url.scheme , let source = options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String else { return false }
        if scheme.contains("com.google") {
            return GIDSignIn.sharedInstance().handle(url, sourceApplication: source, annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        }
        return false
    }
    
    private func setUp() {
        let navigationController = UINavigationController()
        let router = WelcomeRouter(navigationController: navigationController)
        let root = router.createSingInModule()
        navigationController.viewControllers = [root]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func setupFirebase() {
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
    }
}

