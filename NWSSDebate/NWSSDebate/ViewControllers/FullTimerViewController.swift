//
//  FullTimerViewController.swift
//  NWSSDebate
//
//  Created by Selena Liu on 2018-01-11.
//  Copyright © 2018 Selena Liu. All rights reserved.
//

import UIKit

class FullTimerViewController: UIViewController {
    
    
    
    var timer = Timer()
    var seconds = 0
    var minutes = globalVars.fullDebateTimes[globalVars.timesIndex]
    var timerIsRunning = false
    var resumeTapped = false
    
    @objc func updateTimer() {
        if seconds == 0 && minutes == 0 || -10 < seconds && seconds < 0 {
            seconds -= 1
            timerLabel.text = String(seconds)
            timerLabel.textColor = UIColor.red
        } else if seconds <= -10 {
            timer.invalidate()
            timerLabel.text = "Times Up!"
            globalVars.timesIndex += 1
            globalVars.speakerIndex += 1
            pauseButton.isEnabled = false
            resetButton.isEnabled = true
            resetButton.setTitle("Next", for: .normal)
        } else if seconds == 0 {
            minutes -= 1
            seconds = 59
            timerLabel.text = String(format: "%02i:%02i", minutes, seconds)
        } else {
            seconds = seconds - 1
            timerLabel.text = String(format: "%02i:%02i", minutes, seconds)
        }
    }
    
    
    
    @objc func startButtonTapped(_ sender: Any) {
        if timerIsRunning == false {
            runTimer()
        }
        pauseButton.isEnabled = true
        startButton.isEnabled = false
    }
    @objc func pauseButtonTapped(_ sender: Any) {
        if resumeTapped == false {
            timer.invalidate()
            resumeTapped = true
            pauseButton.setTitle("Resume", for: .normal)
            resetButton.isEnabled = true
            resetButton.setTitle("Reset", for: .normal)
            if globalVars.timesIndex < globalVars.fullDebateTimes.count - 1 {
                altNextButton.isHidden = false
            } else {
                altNextButton.isHidden = true
            }
        } else {
            runTimer()
            resumeTapped = false
            pauseButton.setTitle("Pause", for: .normal)
            resetButton.isEnabled = false
        }
    }
    @objc func stopButtonTapped(_ sender: Any) {
        timer.invalidate()
        timerLabel.textColor = UIColor.white
        minutes = globalVars.fullDebateTimes[globalVars.timesIndex]
        seconds = 0
        timerLabel.text = String(format: "%02i:%02i", minutes, seconds)
        
        resumeTapped = false
        pauseButton.setTitle("Pause", for: .normal)
        timerIsRunning = false
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        resetButton.isEnabled = false
        altNextButton.isHidden = true
        
    }
    
    @objc func altNextButtonPressed(_ sender: Any) {
        timer.invalidate()
        globalVars.timesIndex += 1
        globalVars.speakerIndex += 1
        minutes = globalVars.fullDebateTimes[globalVars.timesIndex]
        seconds = 0
        speakerLabel.text = globalVars.speakerLabels[globalVars.speakerIndex]
        pauseButton.setTitle("Pause", for: .normal)
        resumeTapped = false
        pauseButton.isEnabled = false
        resetButton.isEnabled = false
        startButton.isEnabled = true
        timerLabel.text = String(format: "%02i:%02i", minutes, seconds)
        altNextButton.isHidden = true
        altNextButton.isHidden = true
        pauseButton.setTitle("Pause", for: .normal)
        resumeTapped = false
        pauseButton.isEnabled = false
        resetButton.isEnabled = false
        startButton.isEnabled = true
        
    }
    
    @objc func exitButtonPressed() {
        performSegue(withIdentifier: "backToMenu", sender: self)
        globalVars.speakerIndex = 0
        globalVars.timesIndex = 0
        globalVars.fullDebateTimes = [6, 6, 6, 6, 3, 3]
        globalVars.speakerLabels = ["First Proposition",
                                    "First Opposition",
                                    "Second Proposition",
                                    "Second Opposition",
                                    "First Opposition",
                                    "First Proposition"]
    }
    
    let navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        let title = UINavigationItem(title: "Full Debate Timer")
        let button = UIBarButtonItem(title: "Exit", style: .plain, target: self, action: #selector(FullTimerViewController.exitButtonPressed))
        title.rightBarButtonItem = button
        navBar.setItems([title], animated: false)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    
    let speakerLabel: UILabel = {
        let label = UILabel()
        label.text = "asdf"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.backgroundColor = .darkGray//UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        label.textAlignment = .center
        //        label.contentMode = .scaleAspectFit
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "6:00"
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = .white
        label.backgroundColor = .darkGray//UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        label.textAlignment = .center
        //        label.contentMode = .scaleAspectFit
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let promptLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = .white
        label.backgroundColor = .darkGray//UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        label.textAlignment = .center
        //        label.contentMode = .scaleAspectFit
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        button.setTitleColor(.orange, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(FullTimerViewController.startButtonTapped(_:)), for: .touchDown)
        return button
    }()
    
    let pauseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Pause", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        button.setTitleColor(.orange, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(FullTimerViewController.pauseButtonTapped(_:)), for: .touchDown)
        return button
    }()
    let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        button.setTitleColor(.orange, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(FullTimerViewController.stopButtonTapped(_:)), for: .touchDown)
        return button
    }()
    
    let altNextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        button.setTitleColor(.orange, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(FullTimerViewController.altNextButtonPressed(_:)), for: .touchDown)
        return button
    }()
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(FullTimerViewController.updateTimer), userInfo: nil, repeats: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        timerLabel.font = UIFont.systemFont(ofSize: view.frame.height * 0.09)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.03)
        pauseButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.03)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.03)
        altNextButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.03)
        speakerLabel.font = UIFont.systemFont(ofSize: view.frame.height * 0.04)

        
        altNextButton.isHidden = true
        promptLabel.isHidden = true
        speakerLabel.text = globalVars.speakerLabels[globalVars.speakerIndex]
        timerLabel.text = "0\(minutes):00"
        pauseButton.isEnabled = false
        resetButton.isEnabled = false
        
        startButton.setTitleColor(UIColor.lightGray, for: .disabled)
        pauseButton.setTitleColor(UIColor.lightGray, for: .disabled)
        resetButton.setTitleColor(UIColor.lightGray, for: .disabled)
        
        setUpLoaded()
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    func setUpLoaded() {
        let margins = view.layoutMarginsGuide
        let topTextContatinerView = UIView()
        topTextContatinerView.backgroundColor = .darkGray
        view.addSubview(topTextContatinerView)
        topTextContatinerView.translatesAutoresizingMaskIntoConstraints = false
        topTextContatinerView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        topTextContatinerView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        topTextContatinerView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        topTextContatinerView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.5).isActive = true
        topTextContatinerView.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
        
        topTextContatinerView.addSubview(timerLabel)
        topTextContatinerView.addSubview(navBar)
        topTextContatinerView.addSubview(speakerLabel)
        
        
        
        navBar.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        let bottomContainerView = UIView()
        bottomContainerView.backgroundColor = .darkGray
        view.addSubview(bottomContainerView)
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        bottomContainerView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        bottomContainerView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        bottomContainerView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        bottomContainerView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.5).isActive = true
        bottomContainerView.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
        
        bottomContainerView.addSubview(startButton)
        bottomContainerView.addSubview(pauseButton)
        bottomContainerView.addSubview(resetButton)
        bottomContainerView.addSubview(altNextButton)
        
        timerLabel.centerXAnchor.constraint(equalTo: topTextContatinerView.centerXAnchor).isActive = true
        timerLabel.bottomAnchor.constraint(equalTo: topTextContatinerView.bottomAnchor, constant: -40).isActive = true
        timerLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
        timerLabel.heightAnchor.constraint(equalToConstant: view.bounds.height/5).isActive = true
        
        speakerLabel.bottomAnchor.constraint(equalTo: timerLabel.topAnchor, constant: 30).isActive = true
        speakerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        speakerLabel.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
        speakerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        startButton.widthAnchor.constraint(equalToConstant: (view.bounds.width - 40)/3).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: view.bounds.height/15).isActive = true
        startButton.centerYAnchor.constraint(equalTo: bottomContainerView.centerYAnchor).isActive = true
        startButton.trailingAnchor.constraint(equalTo: pauseButton.leadingAnchor, constant: -10).isActive = true
        
        pauseButton.widthAnchor.constraint(equalToConstant: (view.bounds.width - 40)/3).isActive = true
        pauseButton.heightAnchor.constraint(equalToConstant: view.bounds.height/15).isActive = true
        pauseButton.centerYAnchor.constraint(equalTo: bottomContainerView.centerYAnchor).isActive = true
        pauseButton.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor).isActive = true
        
        resetButton.widthAnchor.constraint(equalToConstant: (view.bounds.width - 40)/3).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: view.bounds.height/15).isActive = true
        resetButton.centerYAnchor.constraint(equalTo: bottomContainerView.centerYAnchor).isActive = true
        resetButton.leadingAnchor.constraint(equalTo: pauseButton.trailingAnchor, constant: 10).isActive = true
        
        altNextButton.widthAnchor.constraint(equalToConstant: (view.bounds.width - 40)/3).isActive = true
        altNextButton.heightAnchor.constraint(equalToConstant: view.bounds.height/15).isActive = true
        altNextButton.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 10).isActive = true
        altNextButton.leadingAnchor.constraint(equalTo: pauseButton.trailingAnchor, constant: 10).isActive = true
    }
}
