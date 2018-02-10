//
//  SingleTimerViewController.swift
//  NWSSDebate
//
//  Created by Selena Liu on 2018-01-15.
//  Copyright © 2018 Selena Liu. All rights reserved.
//

import UIKit

class SingleTimerViewController: UIViewController {
    
    var timer = Timer()
    var minutes = 6
    var seconds = 0
    var timerIsRunning = false
    var resumeTapped = false
    
    @objc func dismissModal() {
        let selfController : UIViewController! = self.presentingViewController;
        self.dismiss(animated: true, completion: {
            selfController.viewDidLoad()
        })
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
    
    @objc func startButtonTapped(_ sender: Any) {
        if timerIsRunning == false {
            runTimer()
        }
        pauseButton.isEnabled = true
        startButton.isEnabled = false
        slider.isHidden = true
    }
    
    @objc func pauseButtonTapped(_ sender: Any) {
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
    
    @objc func stopButtonTapped(_ sender: Any) {
        timer.invalidate()
        timerLabel.textColor = UIColor.white
        minutes = 6
        seconds = 0
        timerLabel.text = String(format: "%02i:%02i", minutes, seconds)
        slider.setValue(6, animated: false)
        
        resumeTapped = false
        pauseButton.setTitle("Pause", for: .normal)
        timerIsRunning = false
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        resetButton.isEnabled = false
        slider.isHidden = false
    }
    
    @objc func slider(_ sender: UISlider) {
        self.minutes = Int(sender.value)
        seconds = 0//Int((sender.value - Float(minutes)) * 60)
        print("\(sender.value)")
        timerLabel.text = String(format: "%02i:%02i", minutes, seconds)
    }
    
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
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        button.setTitleColor(.orange, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(SingleTimerViewController.startButtonTapped(_:)), for: .touchDown)
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
        button.addTarget(self, action: #selector(SingleTimerViewController.pauseButtonTapped(_:)), for: .touchDown)
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
        button.addTarget(self, action: #selector(SingleTimerViewController.stopButtonTapped(_:)), for: .touchDown)
        return button
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 8
        slider.isContinuous = true
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.tintColor = UIColor.orange
        slider.setValue(6.0, animated: false)
        slider.addTarget(self, action: #selector(SingleTimerViewController.slider(_:)), for: .valueChanged)
        return slider
    }()
    
    let navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        let title = UINavigationItem(title: "Individual Timer")
        let button = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(SingleTimerViewController.dismissModal))
        title.leftBarButtonItem = button
        navBar.setItems([title], animated: false)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        timerLabel.font = UIFont.systemFont(ofSize: view.frame.height * 0.1)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.03)
        pauseButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.03)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.03)
        
        pauseButton.isEnabled = false
        resetButton.isEnabled = false

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
        bottomContainerView.addSubview(slider)
        
        startButton.widthAnchor.constraint(equalToConstant: (view.bounds.width - 40)/3).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: view.bounds.height/15).isActive = true
        startButton.centerYAnchor.constraint(equalTo: bottomContainerView.centerYAnchor).isActive = true
        startButton.trailingAnchor.constraint(equalTo: pauseButton.leadingAnchor, constant: -10).isActive = true
        
        pauseButton.widthAnchor.constraint(equalToConstant: (view.bounds.width - 40)/3).isActive = true
        pauseButton.heightAnchor.constraint(equalToConstant: view.bounds.height/15).isActive = true
        pauseButton.centerYAnchor.constraint(equalTo: bottomContainerView.centerYAnchor).isActive = true
        pauseButton.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor).isActive = true
        
        print("SetUp widthAnchor: \(view.bounds.width), \((bottomContainerView.bounds.width - 20)/3)")
        resetButton.widthAnchor.constraint(equalToConstant: (view.bounds.width - 40)/3).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: view.bounds.height/15).isActive = true
        resetButton.centerYAnchor.constraint(equalTo: bottomContainerView.centerYAnchor).isActive = true
        resetButton.leadingAnchor.constraint(equalTo: pauseButton.trailingAnchor, constant: 10).isActive = true
        
        slider.widthAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 20).isActive = true
        slider.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor).isActive = true
        slider.topAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: 30).isActive = true

        
        timerLabel.centerXAnchor.constraint(equalTo: topTextContatinerView.centerXAnchor).isActive = true
        timerLabel.bottomAnchor.constraint(equalTo: topTextContatinerView.bottomAnchor, constant: -80).isActive = true
        timerLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
        timerLabel.heightAnchor.constraint(equalToConstant: view.bounds.height/10).isActive = true
    }

}
