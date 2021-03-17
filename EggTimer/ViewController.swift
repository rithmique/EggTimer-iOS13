//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    let eggTimes: [String:Float] = ["Soft" : 300, "Medium" : 420, "Hard" : 720]
    var secondsRemaining: Float = 0
    var secondsTotal: Float = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    
    @IBOutlet weak var eggLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton){
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        secondsRemaining = eggTimes[hardness]!
        secondsTotal = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    // 1.0 = count.start
    // 0.0 = count = 0
    @objc func update() {
        if secondsRemaining > 0{
            progressBar.progress = secondsRemaining / secondsTotal
            secondsRemaining-=1
        }else{
            timer.invalidate()
            eggLabel.text = "Done"
            playSound()
        }
    }
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
}
