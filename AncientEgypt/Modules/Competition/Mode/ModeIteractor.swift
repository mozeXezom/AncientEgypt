//
//  ModeIteractor.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 04.12.2023.
//

import UIKit

final class ModeIteractor {
    private let appNavigationService = AppNavigationService()
    
    var mainMenuBoard: UIStoryboard {
        return UIStoryboard(name: "MainMenu", bundle: nil)
    }
    
    var competitionBoard: UIStoryboard {
        return UIStoryboard(name: "Competition", bundle: nil)
    }
    
    var backgroundMode: UIImage {
        return UIImage(named: MainMenuSupport.Images.mainBackgroundImage)!
    }
    
    var modeMenu: UIImage {
        return UIImage(named: MainMenuSupport.Images.settingsIcon)!
    }
    
    var coinsModeAmount: UIImage {
        return UIImage(named: MainMenuSupport.Images.Tutorial.pointsAmountImage)!
    }
    
    var modeCoin: UIImage {
        return UIImage(named: MainMenuSupport.Images.Tutorial.ancientCoinIcon)!
    }
    
    var chooseMode: UIImage {
        return UIImage(named: MainMenuSupport.Images.Mode.chooseModeImage)!
    }
    
    var hardMode: UIImage {
        return UIImage(named: MainMenuSupport.Images.Mode.hardModeImage)!
    }
    
    var mediumMode: UIImage {
        return UIImage(named: MainMenuSupport.Images.Mode.mediumModeImage)!
    }
    
    var easyMode: UIImage {
        return UIImage(named: MainMenuSupport.Images.Mode.easyModeImage)!
    }
    
    func configureNavigationToPlay(_ view: UIViewController) {
        if let playView = competitionBoard.instantiateViewController(withIdentifier: "playView") as? PlayView {
            playView.modalPresentationStyle = .fullScreen
            playView.modalTransitionStyle = .crossDissolve
            appNavigationService.makeViewPresentation(view, playView)
        }
    }
    
    func configureNavigationToMainMenu(_ view: UIViewController) {
        if let mainMenuView = mainMenuBoard.instantiateViewController(withIdentifier: "mainMenuView") as? MainMenuView {
            mainMenuView.modalPresentationStyle = .fullScreen
            mainMenuView.modalTransitionStyle = .crossDissolve
            appNavigationService.makeViewPresentation(view, mainMenuView)
        }
    }
}
