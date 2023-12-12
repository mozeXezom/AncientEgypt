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
    
    var competitionBoard: UIStoryboard {
        return UIStoryboard(name: "Competition", bundle: nil)
    }
    
    var backgroundMain: UIImage {
        return UIImage(named: MainMenuSupport.Images.mainBackgroundImage)!
    }
    
    var egyptMan: UIImage {
        return UIImage(named: MainMenuSupport.Images.egyptsMIcon)!
    }
    
    var egyptWoman: UIImage {
        return UIImage(named: MainMenuSupport.Images.egyptsWIcon)!
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
    
    var inviteMenuUrlString: String {
        return "https://www.apple.com/app-store/"
    }
    
    var inviteMenuMsg: String {
        return "I invite you to play a wonderful game called AncientEgypt!"
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
    
    func configureNavigationToMode(_ view: UIViewController) {
        if let modeView = competitionBoard.instantiateViewController(withIdentifier: "modeView") as? ModeView {
            modeView.modalPresentationStyle = .fullScreen
            modeView.modalTransitionStyle = .crossDissolve
            appNavigationService.makeViewPresentation(view, modeView)
        }
    }
    
    func configureNavigationToMenuSettings(_ view: UIViewController) {
        if let menuSettingsView = board.instantiateViewController(withIdentifier: "settingsView") as? SettingsView {
            menuSettingsView.modalPresentationStyle = .fullScreen
            menuSettingsView.modalTransitionStyle = .crossDissolve
            appNavigationService.makeViewPresentation(view, menuSettingsView)
        }
    }
    
    func configureNavigationToPrivacy(_ view: UIViewController) {
        if let privacyView = board.instantiateViewController(withIdentifier: "privacyView") as? PrivacyView {
            privacyView.modalPresentationStyle = .fullScreen
            privacyView.modalTransitionStyle = .crossDissolve
            appNavigationService.makeViewPresentation(view, privacyView)
        }
    }
    
    func iteractInviteEvent(_ view: UIViewController) {
        if let eventInviteUrl = URL(string: inviteMenuUrlString) {
            let menuActivityView = UIActivityViewController(activityItems: [inviteMenuMsg, eventInviteUrl], applicationActivities: nil)
            view.present(menuActivityView, animated: true, completion: nil)
        }
    }
}
