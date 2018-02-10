//
//  ViewController.swift
//  NWSSDebate
//
//  Created by Selena Liu on 2018-01-06.
//  Copyright © 2018 Selena Liu. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
        
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var resetButton: UIButton!
    
//    let timerLabel: UITextView = {
//        let textView = UITextView()
//        textView.text = "6:00"
//        textView.font = UIFont.systemFont(ofSize: 19)
//        textView.textAlignment = .center
//        textView.contentMode = .scaleAspectFit
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        return textView
//    }()
    
    var timer = Timer()
    var minutes = 6
    var seconds = 0
    var timerIsRunning = false
    var resumeTapped = false
    
    
    @IBAction func slider(_ sender: UISlider) {
        self.minutes = Int(sender.value)
        seconds = Int((sender.value - Float(minutes)) * 60)
        print("\(sender.value)")
        timerLabel.text = String(format: "%02i:%02i", minutes, seconds)
    }
    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    
    @objc func updateTimer() {
        if seconds == 0 && minutes == 0 || -10 < seconds && seconds < 0 {
            seconds -= 1
            timerLabel.text = String(seconds)
            timerLabel.textColor = UIColor.red
        } else if seconds <= -10 {
            timer.invalidate()
            timerLabel.text = "Times Up!"
            pauseButton.isEnabled = false
            resetButton.isEnabled = true
        } else if seconds == 0 {
            minutes -= 1
            seconds = 59
            timerLabel.text = String(format: "%02i:%02i", minutes, seconds)
        } else {
            seconds = seconds - 1
            timerLabel.text = String(format: "%02i:%02i", minutes, seconds)
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.updateTimer), userInfo: nil, repeats: true)
    }
    @IBAction func startButtonTapped(_ sender: Any) {
        if timerIsRunning == false {
            runTimer()
        }
        pauseButton.isEnabled = true
        startButton.isEnabled = false
        slider.isHidden = true
    }
    @IBAction func pauseButtonTapped(_ sender: Any) {
        if resumeTapped == false {
            timer.invalidate()
            resumeTapped = true
            pauseButton.setTitle("Resume", for: .normal)
            resetButton.isEnabled = true
        } else {
            runTimer()
            resumeTapped = false
            pauseButton.setTitle("Pause", for: .normal)
            resetButton.isEnabled = false
        }
    }
    @IBAction func stopButtonTapped(_ sender: Any) {
        timer.invalidate()
        timerLabel.textColor = UIColor.white
        minutes = 6
        seconds = 0
        timerLabel.text = String(format: "%02i:%02i", minutes, seconds)
        
        resumeTapped = false
        pauseButton.setTitle("Pause", for: .normal)
        timerIsRunning = false
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        resetButton.isEnabled = false
        slider.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timerLabel)
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        resetButton.setTitleColor(UIColor.lightGray, for: .disabled)
        pauseButton.setTitleColor(UIColor.lightGray, for: .disabled)
        startButton.setTitleColor(UIColor.lightGray, for: .disabled)
        
        setUpDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setUpDidLoad() {
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

