//
//  ViewController.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 01.12.2023.
//

import UIKit

class MainMenuView: UIViewController {

    @IBOutlet weak var mainBgImageView: UIImageView!
    @IBOutlet weak var tutorialBtn: UIButton!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var mainMenuLogo: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var leadersBtn: UIButton!
    @IBOutlet weak var exitBtn: UIButton!
    @IBOutlet weak var egyptManImgView: UIImageView!
    @IBOutlet weak var egyptWomanImgView: UIImageView!
    @IBOutlet weak var privacyPolicyBtn: UIButton!
    @IBOutlet weak var addFriendBtn: UIButton!
    
    private let iteractor: MainMenuIteractor = MainMenuIteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iteractMainMenu()
    }
    
    private func iteractMainMenu() {
        iteractMainMenuText()
        iteractMainMenuImages()
    }
    
    private func iteractMainMenuImages() {
        mainBgImageView.image = iteractor.backgroundMain
        mainMenuLogo.image = iteractor.mainLogo
        egyptManImgView.image = iteractor.egyptMan
        egyptWomanImgView.image = iteractor.egyptWoman
        tutorialBtn.setImage(iteractor.tutorial, for: .normal)
        settingsBtn.setImage(iteractor.settings, for: .normal)
        playBtn.setImage(iteractor.play, for: .normal)
        leadersBtn.setImage(iteractor.leaders, for: .normal)
        exitBtn.setImage(iteractor.exit, for: .normal)
        privacyPolicyBtn.setImage(iteractor.privacy, for: .normal)
        addFriendBtn.setImage(iteractor.friend, for: .normal)
    }
    
    private func iteractMainMenuText() {
        privacyPolicyBtn.setTitle(iteractor.privacyDescription, for: .normal)
        addFriendBtn.setTitle(iteractor.friendDescription, for: .normal)
    }
    
    @IBAction func playSender(_ sender: UIButton) {
        iteractor.configureNavigationToMode(self)
    }
    
    @IBAction func leadersSender(_ sender: UIButton) {
        iteractor.configureNavigationToLeaders(self)
    }
    
    @IBAction func tutorialSender(_ sender: UIButton) {
        iteractor.configureNavigationToTutorial(self)
    }
    
    @IBAction func menuSettingsSender(_ sender: UIButton) {
        iteractor.configureNavigationToMenuSettings(self)
    }
    
    @IBAction func addFriendSender(_ sender: UIButton) {
        iteractor.iteractInviteEvent(self)
    }
    
    @IBAction func exitSender(_ sender: UIButton) {
        iteractor.configureNavigationToTutorial(self)
    }
    
    @IBAction func privacySender(_ sender: UIButton) {
        iteractor.configureNavigationToPrivacy(self)
    }
}

