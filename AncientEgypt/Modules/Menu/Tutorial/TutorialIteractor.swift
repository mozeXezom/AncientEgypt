//
//  TutorialIteractor.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 04.12.2023.
//

import UIKit

final class TutorialIteractor {
    var backgroundTutorial: UIImage {
        return UIImage(named: MainMenuSupport.Images.mainBackgroundImage)!
    }
    
    var ancientCoin: UIImage {
        return UIImage(named: MainMenuSupport.Images.Tutorial.ancientCoinIcon)!
    }
    
    var ancientSkip: UIImage {
        return UIImage(named: MainMenuSupport.Images.Tutorial.ancientSkipButton)!
    }
    
    var anubis: UIImage {
        return UIImage(named: MainMenuSupport.Images.Tutorial.anubisImage)!
    }
    
    var pointsAmount: UIImage {
        return UIImage(named: MainMenuSupport.Images.Tutorial.pointsAmountImage)!
    }
    
    var tutorial: UIImage {
        return UIImage(named: MainMenuSupport.Images.Tutorial.tutorialImage)!
    }
    
    var menu: UIImage {
        return UIImage(named: MainMenuSupport.Images.settingsIcon)!
    }
}
