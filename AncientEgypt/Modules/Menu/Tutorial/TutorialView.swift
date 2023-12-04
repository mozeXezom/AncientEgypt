//
//  TutorialView.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 04.12.2023.
//

import UIKit

class TutorialView: UIViewController {

    @IBOutlet weak var tutorialBackground: UIImageView!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var coinsImageView: UIImageView!
    @IBOutlet weak var ancientCoinImageView: UIImageView!
    @IBOutlet weak var allCoinsLabel: UILabel!
    @IBOutlet weak var tutorialImageView: UIImageView!
    @IBOutlet weak var bottomLeftImageView: UIImageView!
    @IBOutlet weak var skipTutorialBtn: UIButton!
    
    private let iteractor: TutorialIteractor = TutorialIteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iteractTutorial()
    }
    
    private func iteractTutorial() {
        iteractTutorialImages()
    }
    
    private func iteractTutorialImages() {
        tutorialBackground.image = iteractor.backgroundTutorial
        menuBtn.setImage(iteractor.menu, for: .normal)
        coinsImageView.image = iteractor.pointsAmount
        ancientCoinImageView.image = iteractor.ancientCoin
        tutorialImageView.image = iteractor.tutorial
        bottomLeftImageView.image = iteractor.anubis
        skipTutorialBtn.setImage(iteractor.ancientSkip, for: .normal)
    }
    
    @IBAction func skipTutorialSender(_ sender: UIButton) {
        iteractor.configureNavigationToMainMenu(self)
    }
    
    @IBAction func menuSender(_ sender: UIButton) {
        iteractor.configureNavigationToMainMenu(self)
    }
}
