//
//  SettingsView.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 05.12.2023.
//

import UIKit

class SettingsView: UIViewController {
    
    @IBOutlet weak var menuSettingsBackground: UIImageView!
    @IBOutlet weak var exitSettingsBtn: UIButton!
    @IBOutlet weak var settingsMenuImgView: UIImageView!
    @IBOutlet weak var musicLbl: UILabel!
    @IBOutlet weak var musicSwitch: UISwitch!
    @IBOutlet weak var effectsLbl: UILabel!
    @IBOutlet weak var effectsSwitch: UISwitch!
    
    private let iteractor: SettingsIteractor =  SettingsIteractor()

    override func viewDidLoad() {
        super.viewDidLoad()
        iteractSettingsView()
    }
    
    private func iteractSettingsView() {
        iteractSettingsImages()
        iteractor.verifyAudioServiceSongStatus(musicSwitch)
        iteractor.verifyEffectsStatus(effectsSwitch)
    }
    
    private func iteractSettingsImages() {
        menuSettingsBackground.image = iteractor.settingsBackground
        exitSettingsBtn.setImage(iteractor.exitSettings, for: .normal)
        settingsMenuImgView.image = iteractor.menuSettings
        musicLbl.text = iteractor.settingsMusic
        effectsLbl.text = iteractor.settingsEffects
    }
    
    @IBAction func exitSettingsSender(_ sender: UIButton) {
        iteractor.configureNavigationToMenu(self)
    }
    
    @IBAction func musicSwitchSender(_ sender: UISwitch) {
        iteractor.iteractAudioServiceObserve(sender)
    }
    
    @IBAction func effectsSwitchSender(_ sender: UISwitch) {
        iteractor.iteractEffectsSwitch(sender)
    }
}
