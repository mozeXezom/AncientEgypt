//
//  AudioService.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 05.12.2023.
//

import AVFoundation

final class AudioService {
    static let audioSharedInstance = AudioService()
    
    var audioService: AVAudioPlayer?

    private init() {
        iteractAudioService()
    }
    
    private func iteractAudioService() {
        if let servicePath = Bundle.main.path(forResource: "ancientEgyptSong", ofType: "mp3") {
            let url = URL(fileURLWithPath: servicePath)
            do {
                audioService = try AVAudioPlayer(contentsOf: url)
                audioService?.numberOfLoops = -1
                audioService?.prepareToPlay()
                let defaultVol = 0.4
                audioService?.volume = Float(defaultVol)
            } catch {
                print("\(error.localizedDescription)")
            }
        }
    }

    func audioServiceOn() {
        audioService?.play()
    }

    func audioServiceOff() {
        audioService?.pause()
    }
}
