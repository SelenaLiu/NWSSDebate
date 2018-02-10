//
//  File.swift
//  NWSSDebate
//
//  Created by Selena Liu on 2018-01-08.
//  Copyright © 2018 Selena Liu. All rights reserved.
//

import UIKit

class SwipingViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionViewOutlet: UICollectionView!
    let pageTitles = ["CNDF", "British Parliament"]
    let pageTexts = [globalVars.CNDFText, globalVars.BritshParliamentText]
    @objc func backButtonPressed() {
        performSegue(withIdentifier: "backToMenu", sender: self)
    }
    
    @objc func dismissModal() {
        let selfController : UIViewController! = self.presentingViewController;
        self.dismiss(animated: true, completion: {
            selfController.viewDidLoad()
        })
    }
    
    let navbar: UINavigationBar = {
        let navbar = UINavigationBar()
        let navbarItem = UINavigationItem(title: "Format Information")
        let button = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(SwipingViewController.dismissModal))
        navbar.setItems([navbarItem], animated: false)
        navbarItem.leftBarButtonItem = button
        navbar.translatesAutoresizingMaskIntoConstraints = false
        return navbar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let margins = view.layoutMarginsGuide
        view.backgroundColor = .darkGray
        view.addSubview(navbar)
        collectionView?.backgroundColor = .darkGray
        collectionView?.register(FormatCollectionViewCell.self, forCellWithReuseIdentifier: "page")
        navbar.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        navbar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navbar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "page", for: indexPath) as? FormatCollectionViewCell
        cell?.titleTextView.text = pageTitles[indexPath.row]
        cell?.descriptionTextView.text = pageTexts[indexPath.row]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.layoutMarginsGuide.layoutFrame.height)
    }
    
}
