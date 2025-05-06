//
//  SplashViewController.swift
//  InterViewPreparation_RxCheck
//
//  Created by 황동민 on 5/6/25.
//

import UIKit

class SplashViewController: UIViewController {

    var mainView = SplashView()
    override func viewDidLoad() {
        super.viewDidLoad()

        view = mainView
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.moveToMainScreen()
        }

    }
    
    private func moveToMainScreen() {
        let mainVC = MainViewController()
        guard let window = UIApplication.shared.windows.first else { return }
        window.rootViewController = mainVC
        window.makeKeyAndVisible()
    }

}
