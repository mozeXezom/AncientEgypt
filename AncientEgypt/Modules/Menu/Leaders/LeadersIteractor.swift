//
//  LeadersIteractor.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 04.12.2023.
//

import UIKit

final class LeadersIteractor {
    private let appNavigationService = AppNavigationService()
    
    var leadersTableCell: String {
        return "LeadersTableCell"
    }
    
    var leadersTableCellReuse: String {
        return "leadersTableCell"
    }
    
    var board: UIStoryboard {
        return UIStoryboard(name: "MainMenu", bundle: nil)
    }
    
    var backgroundLeaders: UIImage {
        return UIImage(named: MainMenuSupport.Images.mainBackgroundImage)!
    }
    
    var leadersCoin: UIImage {
        return UIImage(named: MainMenuSupport.Images.Tutorial.ancientCoinIcon)!
    }
    
    var leaders: UIImage {
        return UIImage(named: MainMenuSupport.Images.Leaders.leadersImage)!
    }
    
    var menuLeaders: UIImage {
        return UIImage(named: MainMenuSupport.Images.settingsIcon)!
    }
    
    var coinsAmount: UIImage {
        return UIImage(named: MainMenuSupport.Images.Tutorial.pointsAmountImage)!
    }
    
    func configureNavigationToMainMenu(_ view: UIViewController) {
        if let mainMenuView = board.instantiateViewController(withIdentifier: "mainMenuView") as? MainMenuView {
            mainMenuView.modalPresentationStyle = .fullScreen
            mainMenuView.modalTransitionStyle = .crossDissolve
            appNavigationService.makeViewPresentation(view, mainMenuView)
        }
    }
}
