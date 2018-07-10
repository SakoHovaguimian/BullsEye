//
//  ViewController.swift
//  BullsEye
//
//  Created by Sako Hovaguimian on 11/5/17.
//  Copyright © 2017 SakoHovaguimian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 1
    @IBOutlet weak var slider: UISlider!
    var targetValue: Int = 0
    @IBOutlet weak var targetLabel: UILabel!
    var score = 0
    @IBOutlet weak var scorekeeper: UILabel!
    @IBOutlet weak var roundsLabel: UILabel!
    var round = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewGame()
       
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
    
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackrightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackrightResizable, for: .normal)
    
    
    }
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scorekeeper.text = String(score)
        roundsLabel.text = String(round)
    }
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        print("The vaule of the slider is now \(slider.value)")
        currentValue = lroundf(slider.value)
       
    }
    
    
    
    
    @IBAction func showAlert() {
        
        
       let difference: Int = abs(targetValue - currentValue)
        var points = 100 - difference
        
      
        
        let title: String
        if difference == 0 {
            title = "Perfect"
            points += 100
        }else if difference < 5 {
            title = "You almost had it"
            if difference == 1 {
                points += 50
            }}else if difference < 10 {
            title = "Pretty Good"
        } else {
            title = "Not even close"
        }
        
        score += points
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message,
        preferredStyle: .alert)
        
      let action = UIAlertAction(title: "Awesome", style: .default, handler: {
        action in self.startNewRound()
        
      })
        
        alert.addAction(action)
        present(alert, animated: true,completion: nil)
        
      
        
    }
 
}


