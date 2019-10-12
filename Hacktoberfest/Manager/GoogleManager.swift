//
//  GoogleManager.swift
//  Hacktoberfest
//
//  Created by Luybckyk Drevych on 12.10.2019.
//  Copyright © 2019 Luybckyk Drevych. All rights reserved.
//

import Firebase
import Foundation
import GoogleSignIn

typealias ReturnableClosure<ParameterType, ReturnType> = ((ParameterType) -> ReturnType)?

final class GoogleManager: NSObject {
    
    private var vc: UIViewController?
    var signInCompletionHandler: ReturnableClosure<Bool, Void> = nil
    
    //MARK: Public Function
    public func googleLogin(viewController: UIViewController) {
        self.vc = viewController
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    private func firebaseAuth(credential: AuthCredential) {
        DispatchQueue.main.async {
            Auth.auth().signInAndRetrieveData(with: credential) { (user, error) in
                if let err = error {
                    print(err.localizedDescription)
                } else {
                    guard let currentUser = user else { return }
                    let userMdoel = UserModel(displayName: currentUser.user.displayName, image: currentUser.user.photoURL?.path, email: currentUser.user.email)
                    print(userMdoel)
                }
            }
        }
    }
}

//MARK: - GIDSignInDelegate
extension GoogleManager: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard let usr = user, let authentication = usr.authentication else {
            return
        }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        self.firebaseAuth(credential: credential)
        self.signInCompletionHandler?(true)
    }
}

//MARK: - GIDSignInUIDelegate
extension GoogleManager: GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        viewController.modalTransitionStyle = .coverVertical
        viewController.modalPresentationStyle = .overCurrentContext
        self.vc?.present(viewController, animated: true, completion: nil)
    }
}
