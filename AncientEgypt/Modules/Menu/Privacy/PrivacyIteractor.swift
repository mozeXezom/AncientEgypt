//
//  PrivacyIteractor.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 05.12.2023.
//

import UIKit

final class PrivacyIteractor {
    private let appNavigationService = AppNavigationService()
    
    var menuBoard: UIStoryboard {
        return UIStoryboard(name: "MainMenu", bundle: nil)
    }
    
    var privacyDescription: String {
        return MainMenuSupport.Text.privacyDescriptionText
    }
    
    var policy: UIImage {
        return UIImage(named: "privacyView")!
    }
    
    var allow: UIImage {
        return UIImage(named: "allowImage")!
    }
    
    var backgroundPrivacy: UIImage {
        return UIImage(named: MainMenuSupport.Images.mainBackgroundImage)!
    }
    
    func configureNavigationToEntireMenu(_ view: UIViewController) {
        if let entireMenuView = menuBoard.instantiateViewController(withIdentifier: "mainMenuView") as? MainMenuView {
            entireMenuView.modalPresentationStyle = .fullScreen
            entireMenuView.modalTransitionStyle = .crossDissolve
            appNavigationService.makeViewPresentation(view, entireMenuView)
        }
    }
}
