//
//  MainMenuIteractor.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 01.12.2023.
//

import UIKit

final class MainMenuIteractor {
    private let appNavigationService = AppNavigationService()
    
    var board: UIStoryboard {
        return UIStoryboard(name: "MainMenu", bundle: nil)
    }
    
    var backgroundMain: UIImage {
        return UIImage(named: MainMenuSupport.Images.mainBackgroundImage)!
    }
    
    var egypts: UIImage {
        return UIImage(named: MainMenuSupport.Images.egyptsIcon)!
    }
    
    var exit: UIImage {
        return UIImage(named: MainMenuSupport.Images.exitIcon)!
    }
    
    var leaders: UIImage {
        return UIImage(named: MainMenuSupport.Images.leadersIcon)!
    }
    
    var mainLogo: UIImage {
        return UIImage(named: MainMenuSupport.Images.mainLogo)!
    }
    
    var play: UIImage {
        return UIImage(named: MainMenuSupport.Images.playIcon)!
    }
    
    var settings: UIImage {
        return UIImage(named: MainMenuSupport.Images.settingsIcon)!
    }
    
    var tutorial: UIImage {
        return UIImage(named: MainMenuSupport.Images.tutorialIcon)!
    }
    
    var privacy: UIImage {
        return UIImage(named: MainMenuSupport.Images.privacyIcon)!
    }
    
    var friend: UIImage {
        return UIImage(named: MainMenuSupport.Images.friendIcon)!
    }
    
    var privacyDescription: String {
        return MainMenuSupport.Text.privacyText
    }
    
    var friendDescription: String {
        return MainMenuSupport.Text.friendText
    }
    
    func configureNavigationToTutorial(_ view: UIViewController) {
        if let tutorialView = board.instantiateViewController(withIdentifier: "tutorialView") as? TutorialView {
            tutorialView.modalPresentationStyle = .fullScreen
            tutorialView.modalTransitionStyle = .crossDissolve
            appNavigationService.makeViewPresentation(view, tutorialView)
        }
    }
    
    func configureNavigationToLeaders(_ view: UIViewController) {
        if let leadersView = board.instantiateViewController(withIdentifier: "leadersView") as? LeadersView {
            leadersView.modalPresentationStyle = .fullScreen
            leadersView.modalTransitionStyle = .crossDissolve
            appNavigationService.makeViewPresentation(view, leadersView)
        }
    }
}
