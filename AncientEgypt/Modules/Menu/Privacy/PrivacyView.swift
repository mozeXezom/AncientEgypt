//
//  PrivacyView.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 05.12.2023.
//

import UIKit

class PrivacyView: UIViewController {
    
    private let iteractor: PrivacyIteractor = PrivacyIteractor()

    @IBOutlet weak var backgroundPrivacy: UIImageView!
    @IBOutlet weak var allowBtn: UIButton!
    @IBOutlet weak var privacyImgView: UIImageView!
    @IBOutlet weak var privacyTxtView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iteractPrivacy()
    }
    
    private func iteractPrivacy() {
        privacyTxtView.text = iteractor.privacyDescription
        backgroundPrivacy.image = iteractor.backgroundPrivacy
        privacyImgView.image = iteractor.policy
        allowBtn.setImage(iteractor.allow, for: .normal)
    }
    
    @IBAction func allowSender(_ sender: UIButton) {
        iteractor.configureNavigationToEntireMenu(self)
    }
}
