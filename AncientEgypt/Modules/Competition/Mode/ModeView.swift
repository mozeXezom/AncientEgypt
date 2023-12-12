//
//  ModeView.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 04.12.2023.
//

import UIKit

class ModeView: UIViewController {
    
    @IBOutlet weak var modeBackground: UIImageView!
    @IBOutlet weak var modeCoinsView: UIImageView!
    @IBOutlet weak var modeCoinImgView: UIImageView!
    @IBOutlet weak var modeCoinsLbl: UILabel!
    @IBOutlet weak var choosemodeImgView: UIImageView!
    @IBOutlet weak var hardModeBtn: UIButton!
    @IBOutlet weak var mediumModeBtn: UIButton!
    @IBOutlet weak var easyModeBtn: UIButton!
    @IBOutlet weak var modeMenuBtn: UIButton!
    
    private let iteractor: ModeIteractor = ModeIteractor()
    private var modeDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        iteractModeView()
    }
    
    private func iteractModeView() {
        iteractModeImages()
        interactModeCoins()
    }
    
    private func interactModeCoins() {
        modeCoinsLbl.text = "\(modeDefaults.value(forKey: "receivedCoins") ?? "10")"
    }
    
    private func iteractModeImages() {
        modeBackground.image = iteractor.backgroundMode
        modeCoinsView.image = iteractor.coinsModeAmount
        modeCoinImgView.image = iteractor.modeCoin
        choosemodeImgView.image = iteractor.chooseMode
        hardModeBtn.setImage(iteractor.hardMode, for: .normal)
        mediumModeBtn.setImage(iteractor.mediumMode, for: .normal)
        easyModeBtn.setImage(iteractor.easyMode, for: .normal)
        modeMenuBtn.setImage(iteractor.modeMenu, for: .normal)
    }
    
    @IBAction func modeMenuSender(_ sender: UIButton) {
        iteractor.configureNavigationToMainMenu(self)
    }
    
    @IBAction func hardModeSender(_ sender: UIButton) {
        iteractor.configureNavigationToPlay(self)
    }
    
    @IBAction func mediumModeSender(_ sender: UIButton) {
        iteractor.configureNavigationToPlay(self)
    }
    
    @IBAction func easyModeSender(_ sender: UIButton) {
        iteractor.configureNavigationToPlay(self)
    }
}
