//
//  PlayView.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 04.12.2023.
//

import UIKit

class PlayView: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var counterImageView: UIImageView!
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var ancientQuestionImgView: UIImageView!
    @IBOutlet weak var ancientCounterView: UIImageView!
    @IBOutlet weak var ancientAnimatedImgView: UIImageView!
    
    @IBOutlet weak var playBackground: UIImageView!
    @IBOutlet weak var playCoinsView: UIImageView!
    @IBOutlet weak var coinPlayImgView: UIImageView!
    @IBOutlet weak var playCoinsLbl: UILabel!
    @IBOutlet weak var menuPlayBtn: UIButton!
    @IBOutlet var selectableBtns: [UIButton]!
    @IBOutlet weak var ancientQuestionLbl: UILabel!
    @IBOutlet weak var animatedWidth: NSLayoutConstraint!
    @IBOutlet weak var labelWidth: NSLayoutConstraint!
    
    private let iteractor: PlayIteractor = PlayIteractor()
    private var ancientIndex = 0
    private var ancientTimer: Timer?
    private var secondsRemaining = 30
    private var ancientValidAnswers: Int = 0
    var imageViewWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iteractPlayView()
        iteractGameStartState()
    }
    
    func startExpandingAnimation() {
        //counterImageView.frame.size.width = self.hiddenView.frame.width
        
        print("Initial Width: \(counterImageView.frame.size.width)")
        print("Target Width: \(self.timerLabel.frame.origin.x + self.timerLabel.frame.width)")
        
        UIView.animate(withDuration: 30.0, animations: {
            self.animatedWidth.constant = self.timerLabel.frame.width
            self.view.layoutIfNeeded()
            //self.counterImageView.frame.size.width = self.hiddenView.frame.width + self.timerLabel.frame.width
            print("Current Width: \(self.counterImageView.frame.size.width)")
        }) { (finished) in
            if finished {
                print("Animation completed")
            }
        }
    }
    
    private func iteractGameStartState() {
        iteractAncientGame()
    }
    
    private func iteractAncientGame() {
        let currentQuestion = ancientPlayModel[ancientIndex]
        ancientQuestionLbl.text = currentQuestion.ancientQuestion
        
        for (index, button) in selectableBtns.enumerated() {
            playBackground.image = currentQuestion.ancientImage
            button.setTitle(currentQuestion.ancientAnswers[index], for: .normal)
            button.setBackgroundImage(iteractor.defaultSelected, for: .normal)
            button.isEnabled = true
        }
        iteractTimer()
    }
    
    private func iteractTimer() {
        ancientTimer?.invalidate()
        secondsRemaining = 30
        startExpandingAnimation()
        ancientTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(pronkTimer), userInfo: nil, repeats: true)
    }
    
    @objc func pronkTimer() {
        timerLabel.text = "\(secondsRemaining) sec"
        
        if secondsRemaining > 0 {
            secondsRemaining -= 1
        } else {
            handleAncientSelection(false)
        }
    }
    
    func handleAncientSelection(_ isCorrect: Bool) {
        let currentQuestion = ancientPlayModel[ancientIndex]
        
        for (index, button) in selectableBtns.enumerated() {
            //button.isEnabled = false  // Disable buttons after an answer is selected
            
            if index == currentQuestion.ancientValidAnswer {
                if isCorrect {
                    button.setBackgroundImage(iteractor.correctSelected, for: .normal)
                } else {
                    button.setBackgroundImage(iteractor.wrongSelected, for: .normal)
                }
            } else {
                button.setBackgroundImage(iteractor.wrongSelected, for: .normal)
            }
        }
        
        // Move to the next question after a delay (2 seconds in this example)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.moveToNextQuestion()
        }
    }
    
    private func iteractEndState() {
        iteractor.iteractReceivedCoins()
        if ancientValidAnswers < 2 {
            iteractor.configureNavigationToCompetitionResult(self, false)
        } else {
            iteractor.configureNavigationToCompetitionResult(self, true)
        }
    }
    
    private func moveToNextQuestion() {
        ancientIndex += 1
        
        if ancientIndex < ancientPlayModel.count {
            iteractAncientGame()
        } else {
            iteractEndState()
            print("Game completed")
        }
    }
    
    private func iteractPlayView() {
        iteractPlayImages()
    }
    
    private func iteractPlayImages() {
        playCoinsView.image = iteractor.playCoinsAmount
        coinPlayImgView.image = iteractor.coinPlay
        menuPlayBtn.setImage(iteractor.playMenu, for: .normal)
        ancientQuestionImgView.image = iteractor.ancientQuestion
        ancientCounterView.image = iteractor.ancientCounter
        ancientAnimatedImgView.image = iteractor.ancientAnimated
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        ancientTimer?.invalidate()  // Stop the timer when an answer is selected
        let currentQuestion = ancientPlayModel[ancientIndex]
        for (index, button) in selectableBtns.enumerated() {
            //button.isEnabled = false  // Disable buttons after an answer is selected
            
            if index == currentQuestion.ancientValidAnswer {
                if sender.tag == currentQuestion.ancientValidAnswer {
                    button.setBackgroundImage(iteractor.correctSelected, for: .normal)
                } else {
                    button.setBackgroundImage(iteractor.correctSelected, for: .normal)
                    sender.setBackgroundImage(iteractor.wrongSelected, for: .normal)
                }
            } else {
                button.setBackgroundImage(iteractor.defaultSelected, for: .normal)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.moveToNextQuestion()
        }
    }
    
    @IBAction func menuPlaySender(_ sender: UIButton) {
        iteractor.configureNavigationToMainMenu(self)
    }
}
