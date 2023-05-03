//
//  AudioPlayer.swift
//  MC1
//
//  Created by Nuki Venoza on 02/05/23.
//

import AVFoundation

class AudioPlayer: ObservableObject {
    static let shared = AudioPlayer()
    var player: AVAudioPlayer?
    
    func firstPlay(audioName: String) {
        if let bundle = Bundle.main.path(forResource: audioName, ofType: "m4a") {
            let music = NSURL(fileURLWithPath: bundle)
            
            do {
                player = try AVAudioPlayer(contentsOf: music as URL)
                
                guard let player = player else {return}
                player.numberOfLoops = -1
                player.prepareToPlay()
            } catch {
                print(error)
            }
        }
    }
    
    func play() {
        guard let p = player else {return}
        p.play()
    }
    
    func pause() {
        guard let p = player else {return}
        p.pause()
    }
    
    func stop() {
        guard let p = player else {return}
        p.stop()
    }
    
}
