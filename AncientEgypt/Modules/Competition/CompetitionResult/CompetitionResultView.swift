//
//  CompetitionResultView.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 05.12.2023.
//

import UIKit

class CompetitionResultView: UIViewController {
    
    @IBOutlet weak var winView: UIView!
    @IBOutlet weak var winImgView: UIImageView!
    @IBOutlet weak var winCoinsLbl: UILabel!
    @IBOutlet weak var resultBackground: UIImageView!
    
    @IBOutlet weak var loseView: UIView!
    @IBOutlet weak var loseImgView: UIImageView!
    @IBOutlet weak var returnBtn: UIButton!
    @IBOutlet weak var playAgainBtn: UIButton!
    
    @IBOutlet weak var resultCoinsView: UIImageView!
    @IBOutlet weak var resultCoinImgView: UIImageView!
    @IBOutlet weak var resultCoinsLbl: UILabel!
    
    private let resultDefaults = UserDefaults.standard
    private let iteractor: CompetitionResultIteractor = CompetitionResultIteractor()
    var endGameState: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        iteractCompetitionResultView()
    }
    
    private func iteractCompetitionResultView() {
        iteractResultState()
        iteractCompetitionResultImages()
    }
    
    private func iteractCompetitionResultImages() {
        winImgView.image = iteractor.winGame
        loseImgView.image = iteractor.loseGame
        resultCoinsView.image = iteractor.resultAmount
        resultCoinImgView.image = iteractor.resultCoin
        returnBtn.setImage(iteractor.menuReturn, for: .normal)
        playAgainBtn.setImage(iteractor.startAgain, for: .normal)
    }
    
    private func iteractResultState() {
        if endGameState {
            winCoinsLbl.text = "\(resultDefaults.value(forKey: "receivedCoins") ?? "10")"
            resultBackground.image = iteractor.winBackground
            loseView.isHidden = true
        } else {
            resultBackground.image = iteractor.loseBackground
            loseView.isHidden = false
            winView.isHidden = true
        }
    }
    
    @IBAction func playAgainSender(_ sender: UIButton) {
        iteractor.configureNavigationToStartAgain(self)
    }
    
    @IBAction func returnSender(_ sender: UIButton) {
        iteractor.configureNavigationToReturn(self)
    }
}
