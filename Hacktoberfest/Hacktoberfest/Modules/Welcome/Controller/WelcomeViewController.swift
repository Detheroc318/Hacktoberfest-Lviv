//
//  ViewController.swift
//  Hacktoberfest
//
//  Created by Luybckyk Drevych on 12.10.2019.
//  Copyright © 2019 Luybckyk Drevych. All rights reserved.
//

import UIKit

final class WelcomeViewController: UIViewController {

    var presenter: WelcomePresenter!
    
    //MARK: - View
    @IBOutlet private weak var bicycleImage: UIImageView!
    @IBOutlet private weak var backgroundImage: UIImageView!
    @IBOutlet private weak var googleImage: UIImageView!
    @IBOutlet private weak var singInButton: UIButton!
    @IBOutlet private weak var welcomeLabel: UILabel!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupUI()
    }
    
    //MARK: - Private
    @IBAction func didTapOnGoogleSingIn(_ sender: UIButton) {
        presenter.authWithGoogle(viewController: self)
    }
    
    private func setupUI() {
        bicycleImage.image = DefaultImage.bicycle.image
        backgroundImage.image = DefaultImage.background.image
        googleImage.image = DefaultImage.google.image
        singInButton.setTitle(WelcomeScreenConst.singinWithGoogle, for: .normal)
        welcomeLabel.text = WelcomeScreenConst.welcomeLabel
        welcomeLabel.textColor = AppColor.mainGreen
    }
    
}

