//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes: [String:Float] = ["Soft" : 300, "Medium" : 420, "Hard" : 720]
    var secondsRemaining: Float = 60.0
    var secondsTotal: Float?
    var timer = Timer()
    

    @IBOutlet weak var eggLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton){
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        secondsRemaining = eggTimes[hardness]!
        secondsTotal = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    // 1.0 = count.start
    // 0.0 = count = 0
    @objc func update() {
        if secondsRemaining > 0{
            progressBar.progress = secondsRemaining / secondsTotal!
            print(secondsRemaining)
            secondsRemaining-=1
        }
        if secondsRemaining == 0 {
            timer.invalidate()
            eggLabel.text = "Done"
        }
    }
}
