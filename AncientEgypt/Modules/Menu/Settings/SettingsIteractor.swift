//
//  SettingsIteractor.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 05.12.2023.
//

import UIKit

final class SettingsIteractor {
    private let appNavigationService = AppNavigationService()
    
    var settingsBackground: UIImage {
        return UIImage(named: MainMenuSupport.Images.mainBackgroundImage)!
    }
    
    var menuBoard: UIStoryboard {
        return UIStoryboard(name: "MainMenu", bundle: nil)
    }
    
    var exitSettings: UIImage {
        return UIImage(named: "exitSettings")!
    }
    
    var menuSettings: UIImage {
        return UIImage(named: "menuSettings")!
    }
    
    var settingsMusic: String {
        return "Music"
    }
    
    var settingsEffects: String {
        return "Effects"
    }
    
    func iteractEffectsSwitch(_ effectsSwitch: UISwitch) {
        if effectsSwitch.isOn {
            UserDefaults.standard.set(true, forKey: "effectsSwitch")
        } else {
            UserDefaults.standard.set(false, forKey: "effectsSwitch")
        }
    }
    
    func iteractAudioServiceObserve(_ switch: UISwitch) {
        if AudioService.audioSharedInstance.audioService?.isPlaying == true {
            AudioService.audioSharedInstance.audioServiceOff()
        } else {
            AudioService.audioSharedInstance.audioServiceOn()
        }
    }
    
    func configureNavigationToMenu(_ view: UIViewController) {
        if let menuView = menuBoard.instantiateViewController(withIdentifier: "mainMenuView") as? MainMenuView {
            menuView.modalPresentationStyle = .fullScreen
            menuView.modalTransitionStyle = .crossDissolve
            appNavigationService.makeViewPresentation(view, menuView)
        }
    }
    
    func verifyAudioServiceSongStatus(_ switcher: UISwitch) {
        if AudioService.audioSharedInstance.audioService?.isPlaying == true {
            switcher.setOn(true, animated: false)
        } else {
            switcher.setOn(false, animated: false)
        }
    }
    
    func verifyEffectsStatus(_ effectsSwitcher: UISwitch) {
        if UserDefaults.standard.bool(forKey: "effectsSwitch") {
            effectsSwitcher.setOn(true, animated: false)
        } else {
            effectsSwitcher.setOn(false, animated: false)
        }
    }
}
