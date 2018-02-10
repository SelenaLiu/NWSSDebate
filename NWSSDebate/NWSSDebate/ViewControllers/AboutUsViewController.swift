//
//  AboutUsViewController.swift
//  NWSSDebate
//
//  Created by Selena Liu on 2018-01-26.
//  Copyright © 2018 Selena Liu. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController, UITextViewDelegate {
    
    @objc func dismissModal() {
        let selfController : UIViewController! = self.presentingViewController;
        self.dismiss(animated: true, completion: {
            selfController.viewDidLoad()
        })
    }
    
    let navbar: UINavigationBar = {
        let navbar = UINavigationBar()
        let navbarItem = UINavigationItem(title: "")
        let button = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(AboutUsViewController.dismissModal))
        navbarItem.leftBarButtonItem = button
        navbar.backgroundColor = .darkGray
        navbar.setItems([navbarItem], animated: false)
        navbar.translatesAutoresizingMaskIntoConstraints = false
        return navbar
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "About NWSS Debate App"
        label.backgroundColor = .darkGray
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let DesignAndCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Created by Selena Liu"
        label.backgroundColor = .darkGray
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let versionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Version: 1.0"
        label.backgroundColor = .darkGray
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UITextView = {
        let textView = UITextView()
        textView.text = """
        Hello! My goal with this app is to help new debaters learn and become accustomed to the rules and format of high school debate. As this app is just starting out, I am currently in the process of incorporating more features that can be used during tournaments, or simply during club practices! You can let me know of any feedback you may have by rating this app on the Apple Store.
        
        Thanks!
        """
        textView.backgroundColor = .darkGray
        textView.textColor = .white
        textView.isUserInteractionEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    
//
//    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
//        return true
//    }
//
//    let links: UITextView = {
//        let textView = UITextView()
//        let text = "For more of my background information, check out my Git"
//        let attributedString = NSMutableAttributedString(string: text)
//        let linkAttributes = [
//            NSAttributedStringKey.link.rawValue: NSURL(string: "https://www.apple.com")!,
//            NSAttributedStringKey.foregroundColor: UIColor.orange
//            ] as? [NSAttributedStringKey : Any]
//
//        attributedString.setAttributes(linkAttributes, range: NSMakeRange(5, 10))
//
//        textView.attributedText = attributedString
//
//        textView.backgroundColor = .darkGray
//        textView.textColor = .white
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        return textView
//    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(navbar)
        view.addSubview(titleLabel)
        view.addSubview(DesignAndCodeLabel)
        view.addSubview(versionLabel)
        view.addSubview(descriptionLabel)
//        view.addSubview(links)
        titleLabel.font = UIFont.boldSystemFont(ofSize: view.bounds.height * 0.031)
        DesignAndCodeLabel.font = UIFont.systemFont(ofSize: view.bounds.height * 0.024)
        versionLabel.font = UIFont.systemFont(ofSize: view.bounds.height * 0.024)
        descriptionLabel.font = UIFont.systemFont(ofSize: view.bounds.height * 0.024)
//        links.delegate = self

        setUpLoaded()
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpLoaded() {
        let margins = view.layoutMarginsGuide
        
        navbar.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        navbar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navbar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: navbar.bottomAnchor, constant: view.bounds.height * 0.03).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
        
        DesignAndCodeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: view.bounds.height * 0.023).isActive = true
        DesignAndCodeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        DesignAndCodeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        DesignAndCodeLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
        
        versionLabel.topAnchor.constraint(equalTo: DesignAndCodeLabel.bottomAnchor, constant: view.bounds.height * 0.015).isActive = true
        versionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        versionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        versionLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: view.bounds.height * 0.015).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: view.bounds.height/2).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
        
//        links.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
//        links.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        links.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        links.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
    }
    


}
