//
//  PlayIteractor.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 04.12.2023.
//

import UIKit

final class PlayIteractor {
    private let appNavigationService = AppNavigationService()
    private let playLocalDefaults = UserDefaults.standard
    
    var correctSelected: UIImage {
        return UIImage(named: "correctSelected")!
    }
    
    var wrongSelected: UIImage {
        return UIImage(named: "wrongSelected")!
    }
    
    var defaultSelected: UIImage {
        return UIImage(named: "defaultAnswer")!
    }
    
    var menuBoard: UIStoryboard {
        return UIStoryboard(name: "MainMenu", bundle: nil)
    }
    
    var modeBoard: UIStoryboard {
        return UIStoryboard(name: "Competition", bundle: nil)
    }
    
    var ancientQuestion: UIImage {
        return UIImage(named: "questionView")!
    }
    
    var ancientCounter: UIImage {
        return UIImage(named: "counterView")!
    }
    
    var ancientAnimated: UIImage {
        return UIImage(named: "timeCounter")!
    }
    
    var playMenu: UIImage {
        return UIImage(named: MainMenuSupport.Images.settingsIcon)!
    }
    
    var playCoinsAmount: UIImage {
        return UIImage(named: MainMenuSupport.Images.Tutorial.pointsAmountImage)!
    }
    
    var coinPlay: UIImage {
        return UIImage(named: MainMenuSupport.Images.Tutorial.ancientCoinIcon)!
    }
    
    func iteractReceivedCoins() {
        let existingCoins = playLocalDefaults.integer(forKey: "receivedCoins")
        let newCoins = arc4random_uniform(991) + 10
        let totalCoins = existingCoins + Int(newCoins)

        playLocalDefaults.set(totalCoins, forKey: "receivedCoins")
    }

    
    func configureNavigationToCompetitionResult(_ view: UIViewController, _ endGameState: Bool) {
        if let competitionResultView = modeBoard.instantiateViewController(withIdentifier: "competitionResultView") as? CompetitionResultView {
            competitionResultView.modalPresentationStyle = .fullScreen
            competitionResultView.modalTransitionStyle = .crossDissolve
            competitionResultView.endGameState = endGameState
            appNavigationService.makeViewPresentation(view, competitionResultView)
        }
    }
    
    func configureNavigationToMainMenu(_ view: UIViewController) {
        if let mainMenuView = menuBoard.instantiateViewController(withIdentifier: "mainMenuView") as? MainMenuView {
            mainMenuView.modalPresentationStyle = .fullScreen
            mainMenuView.modalTransitionStyle = .crossDissolve
            appNavigationService.makeViewPresentation(view, mainMenuView)
        }
    }
}
