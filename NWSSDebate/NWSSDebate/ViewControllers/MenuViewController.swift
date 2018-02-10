//
//  MenuViewController.swift
//  NWSSDebate
//
//  Created by Selena Liu on 2018-01-06.
//  Copyright © 2018 Selena Liu. All rights reserved.
//

import UIKit


class MenuViewController: UIViewController {
    
    @objc func toSingleTimer() {
        performSegue(withIdentifier: "toIndividualTimer", sender: self)
    }
    
    @objc func toFullDebateTimer() {
        performSegue(withIdentifier: "toFullDebateTimer", sender: self)
    }
    
    @objc func toFormatInformation() {
        performSegue(withIdentifier: "toFormatInformation", sender: self)
    }
    
    let singleTimerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Individual Timer", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.orange.cgColor
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(MenuViewController.toSingleTimer), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let fullTimerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Full Debate Timer", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.orange.cgColor
        button.addTarget(self, action: #selector(MenuViewController.toFullDebateTimer), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let formatInfoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Format Information", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.orange.cgColor
        button.addTarget(self, action: #selector(MenuViewController.toFormatInformation), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func aboutUsTapped() {
        performSegue(withIdentifier: "toAboutUsPage", sender: self)
    }
    
    @objc let aboutUsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "Information"), for: .normal)
        button.addTarget(self, action: #selector(MenuViewController.aboutUsTapped), for: .touchDown)
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let navbar: UINavigationBar = {
        let navbar = UINavigationBar()
        let navbarItem = UINavigationItem(title: "NWSS Debate")
        navbar.backgroundColor = .darkGray
        navbar.setItems([navbarItem], animated: false)
        navbar.translatesAutoresizingMaskIntoConstraints = false
        return navbar
    }()

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        singleTimerButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.03)
        fullTimerButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.03)
        formatInfoButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.03)
        view.backgroundColor = UIColor.darkGray
        view.addSubview(singleTimerButton)
        view.addSubview(fullTimerButton)
        view.addSubview(formatInfoButton)
        view.addSubview(navbar)
        view.addSubview(aboutUsButton)
        
        setUpDidLoad()
        
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    private func setUpDidLoad() {
        
        let margins = view.layoutMarginsGuide
        
        singleTimerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        singleTimerButton.bottomAnchor.constraint(equalTo: fullTimerButton.topAnchor, constant: -30).isActive = true
        singleTimerButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
        singleTimerButton.heightAnchor.constraint(equalToConstant: view.bounds.height/10).isActive = true
        
        fullTimerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fullTimerButton.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        fullTimerButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
        fullTimerButton.heightAnchor.constraint(equalToConstant: view.bounds.height/10).isActive = true
        
        formatInfoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        formatInfoButton.topAnchor.constraint(equalTo: fullTimerButton.bottomAnchor, constant: 30).isActive = true
        formatInfoButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
        formatInfoButton.heightAnchor.constraint(equalToConstant: view.bounds.height/10).isActive = true
        
        navbar.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        navbar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navbar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        aboutUsButton.topAnchor.constraint(equalTo: formatInfoButton.bottomAnchor, constant: 20).isActive = true
        aboutUsButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        aboutUsButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.1).isActive = true
        aboutUsButton.widthAnchor.constraint(equalToConstant: view.frame.height * 0.1).isActive = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
