//
//  CompetitionResultIteractor.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 05.12.2023.
//

import UIKit

final class CompetitionResultIteractor {
    private let appNavigationService = AppNavigationService()
    
    var returnMenuBoard: UIStoryboard {
        return UIStoryboard(name: "MainMenu", bundle: nil)
    }
    
    var playAgainBoard: UIStoryboard {
        return UIStoryboard(name: "Competition", bundle: nil)
    }
    
    var returnNext: UIImage {
        return UIImage(named: "endNext")!
    }
    
    var winGame: UIImage {
        return UIImage(named: "gameWin")!
    }
    
    var menuReturn: UIImage {
        return UIImage(named: "goToMenu")!
    }
    
    var loseBackground: UIImage {
        return UIImage(named: "loose_background")!
    }
    
    var loseGame: UIImage {
        return UIImage(named: "gameLost")!
    }
    
    var startAgain: UIImage {
        return UIImage(named: "playAgain")!
    }
    
    var winBackground: UIImage {
        return UIImage(named: "win_background")!
    }
    
    var resultAmount: UIImage {
        return UIImage(named: MainMenuSupport.Images.Tutorial.pointsAmountImage)!
    }
    
    var resultCoin: UIImage {
        return UIImage(named: MainMenuSupport.Images.Tutorial.ancientCoinIcon)!
    }
    
    func configureNavigationToStartAgain(_ view: UIViewController) {
        if let startAgainView = playAgainBoard.instantiateViewController(withIdentifier: "playView") as? PlayView {
            startAgainView.modalPresentationStyle = .fullScreen
            startAgainView.modalTransitionStyle = .crossDissolve
            appNavigationService.makeViewPresentation(view, startAgainView)
        }
    }
    
    func configureNavigationToReturn(_ view: UIViewController) {
        if let returnView = returnMenuBoard.instantiateViewController(withIdentifier: "mainMenuView") as? MainMenuView {
            returnView.modalPresentationStyle = .fullScreen
            returnView.modalTransitionStyle = .crossDissolve
            appNavigationService.makeViewPresentation(view, returnView)
        }
    }
}
