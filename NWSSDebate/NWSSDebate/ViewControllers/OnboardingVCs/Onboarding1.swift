//
//  Onboarding1.swift
//  NWSSDebate
//
//  Created by Selena Liu on 2018-01-06.
//  Copyright © 2018 Selena Liu. All rights reserved.
//

import UIKit

class Onboarding1: UIViewController {
    
    let titleTextView: UILabel = {
        let textView = UILabel()
        textView.numberOfLines = 2
        textView.text = "Welcome to the NWSS Debate App!"
        textView.textAlignment = .center
        textView.contentMode = .scaleAspectFit
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    @objc func nextButtonTapped() {
        performSegue(withIdentifier: "finishOnboarding", sender: self)
        UserDefaults.standard.set("yes", forKey: "OnboardingDone")
    }
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start!", for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(Onboarding1.nextButtonTapped), for: .touchDown)
        return button
    }()
    
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "NWflag")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5.0
        return imageView
    }()
    
    
//    let startButton: UIButton = {
//        let button = UIButton()
//        button.frame = CGRect(x: 100, y: 300, width: 30, height: 15)
//        //button.setTitleColor(UIColor.lighb, for: .normal)
//        button.setTitle("Next", for: .normal)
//        button.contentMode = .scaleAspectFit
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextView.font = UIFont.boldSystemFont(ofSize: view.bounds.height * 0.045)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.height * 0.03)
        
        view.addSubview(titleTextView)
        view.addSubview(logoImageView)
        view.addSubview(startButton)
        
        setUpDidLoad()
    }
    override open var shouldAutorotate: Bool {
        return false
    }
    private func setUpDidLoad() {
//        let topTextContatinerView = UIView()
//        view.addSubview(topTextContatinerView)
//        topTextContatinerView.translatesAutoresizingMaskIntoConstraints = false
//        topTextContatinerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        topTextContatinerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        topTextContatinerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        topTextContatinerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
//
//        topTextContatinerView.addSubview(titleTextView)
//        topTextContatinerView.addSubview(logoImageView)
        
        titleTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.20).isActive = true
        titleTextView.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
        titleTextView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: view.bounds.height * 0.04).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.4).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.125).isActive = true
        
       
        
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: view.bounds.width/4.5).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.05).isActive = true
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
