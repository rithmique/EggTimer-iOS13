//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft" : 300, "Medium" : 420, "Hard" : 720]
    var count = 60
    
    @IBAction func hardnessSelected(_ sender: UIButton){
        let hardness = sender.currentTitle!
        
        count = eggTimes[hardness]!
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @IBOutlet weak var timerHere: UIView!
    @objc func update() {
        if count > 0{
            print(count)
            count-=1
        }
    }
}
