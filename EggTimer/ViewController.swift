//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player : AVAudioPlayer!
    
    @IBOutlet weak var titletext: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes:[String:Float] = ["Soft": 3 ,"Medium": 4 , "Hard": 7]
    
  
    var counter:(Float) = 0
    var totalTime:(Float) = 0
    
    var timer = Timer()
    
    @IBAction func eggButton(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        counter = 0.0
        titletext.text = hardness
       
        
       timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
       

        }
    @objc func updateCounter() {
        
        if counter < totalTime {
            
            counter += 1
            
            progressBar.progress = counter / totalTime
            
            
        }else{
            
            timer.invalidate()
            titletext.text = "DONE!"
            playSound()
            
        }
    }
       
    func playSound() {
        
        let url = Bundle.main.url(forResource: "alarm_sound" , withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
        
    }
    
}
