//
//  FullTimerFormatViewController.swift
//  NWSSDebate
//
//  Created by Selena Liu on 2018-01-17.
//  Copyright © 2018 Selena Liu. All rights reserved.
//

import UIKit

class FullTimerFormatViewController: UIViewController {
    
    @objc internal func styleSegmentChanged(segmentController: UISegmentedControl) {
        switch segmentController.selectedSegmentIndex {
        case 0:
            label1.text = "First Proposition"
            label2.text = "First Opposition"
            label3.text = "Second Proposition"
            label4.text = "Second Opposition"
            label5.text = "First Opposition"
            label6.text = "First Proposition"
            label7.isHidden = true
            label8.isHidden = true
            
            
            if levelSegmentedControl.selectedSegmentIndex == 0 {
                globalVars.fullDebateTimes = [6, 6, 6, 6, 3, 3]
                globalVars.speakerLabels = ["First Proposition",
                                            "First Opposition",
                                            "Second Proposition",
                                            "Second Opposition",
                                            "First Opposition",
                                            "First Proposition"]
                time1.text = "6:00"
                time2.text = "6:00"
                time3.text = "6:00"
                time4.text = "6:00"
                time5.text = "3:00"
                time6.text = "3:00"
                time7.isHidden = true
                time8.isHidden = true
            } else {
                globalVars.fullDebateTimes = [8, 8, 8, 8, 4, 4]
                globalVars.speakerLabels = ["First Proposition",
                                            "First Opposition",
                                            "Second Proposition",
                                            "Second Opposition",
                                            "First Opposition",
                                            "First Proposition"]
                time1.text = "8:00"
                time2.text = "8:00"
                time3.text = "8:00"
                time4.text = "8:00"
                time5.text = "4:00"
                time6.text = "4:00"
                time7.isHidden = true
                time8.isHidden = true
            }
        case 1:
            label1.text = "Prime Minister"
            label2.text = "Leader of Opposition"
            label3.text = "Deputy Prime Minister"
            label4.text = "Deputy Leader of Opposition"
            label5.text = "Member of Government"
            label6.text = "Member of Opposition"
            label7.text = "Government Whip"
            label8.text = "Opposition Whip"
            label7.isHidden = false
            label8.isHidden = false
            
            globalVars.speakerLabels = ["Prime Minister",
                                        "Leader of Opposition",
                                        "Deputy Prime Minister",
                                        "Deputy Leader of Opp",
                                        "Member of Government",
                                        "Member of Opposition",
                                        "Government Whip",
                                        "Opposition Whip"]
            globalVars.fullDebateTimes = [7, 7, 7, 7, 7, 7, 7, 7]
            time1.text = "7:00"
            time2.text = "7:00"
            time3.text = "7:00"
            time4.text = "7:00"
            time5.text = "7:00"
            time6.text = "7:00"
            time7.text = "7:00"
            time8.text = "7:00"
            time7.isHidden = false
            time8.isHidden = false
        default:
            print("Error")
        }
    }
    
    @objc func dismissModal() {
        let selfController : UIViewController! = self.presentingViewController;
        self.dismiss(animated: true, completion: {
            selfController.viewDidLoad()
        })
    }
    
    @objc internal func levelSegmentChanged(segmentController: UISegmentedControl) {
        if formatSegmentedControl.selectedSegmentIndex == 0 {
            switch segmentController.selectedSegmentIndex {
            case 0:
                globalVars.fullDebateTimes = [6, 6, 6, 6, 3, 3]
                time1.text = "6:00"
                time2.text = "6:00"
                time3.text = "6:00"
                time4.text = "6:00"
                time5.text = "3:00"
                time6.text = "3:00"
                time7.isHidden = true
                time8.isHidden = true
            case 1:
                globalVars.fullDebateTimes = [8, 8, 8, 8, 4, 4]
                time1.text = "8:00"
                time2.text = "8:00"
                time3.text = "8:00"
                time4.text = "8:00"
                time5.text = "4:00"
                time6.text = "4:00"
                time7.isHidden = true
                time8.isHidden = true
            default:
                print("Error")
            }
        } else {
            switch segmentController.selectedSegmentIndex {
            default:
                globalVars.fullDebateTimes = [7, 7, 7, 7, 7, 7, 7, 7]
                time1.text = "7:00"
                time2.text = "7:00"
                time3.text = "7:00"
                time4.text = "7:00"
                time5.text = "7:00"
                time6.text = "7:00"
                time7.text = "7:00"
                time8.text = "7:00"
                time7.isHidden = false
                time8.isHidden = false
            }
        }
    }
    
    
    let navbar: UINavigationBar = {
        let navbar = UINavigationBar()
        let navbarItem = UINavigationItem(title: "Select Format")
        let button = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(FullTimerFormatViewController.dismissModal))
        navbarItem.leftBarButtonItem = button
        navbar.setItems([navbarItem], animated: false)
        navbar.translatesAutoresizingMaskIntoConstraints = false
        return navbar
    }()
    
    let formatSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["CNDF", "British Parliament"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = .orange
        segmentedControl.layer.cornerRadius = 10
        segmentedControl.addTarget(self, action: #selector(FullTimerFormatViewController.styleSegmentChanged(segmentController:)), for: .valueChanged)
        return segmentedControl
    }()
    
    let levelSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Junior", "Senior"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = .orange
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.cornerRadius = 10
        segmentedControl.addTarget(self, action: #selector(FullTimerFormatViewController.levelSegmentChanged(segmentController:)), for: .valueChanged)
        return segmentedControl
    }()
    
    let speakerTimeslabel: UILabel = {
        let label = UILabel()
        label.text = "Speaker Times"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.textColor = .white
        label.contentMode = .scaleAspectFit
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Speaker Labels
    let label1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    let label3: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        return label
    }()
    let label4: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    let label5: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    let label6: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    let label7: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    let label8: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    
    // Timer Labels
    let time1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let time2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let time3: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let time4: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let time5: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let time6: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let time7: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let time8: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func continueButtonTapped() {
        print("code run")
        performSegue(withIdentifier: "toFullDebateTimer", sender: self)
    }
    
    let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.orange, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(FullTimerFormatViewController.continueButtonTapped), for: .touchDown)
        return button
    }()
    
//    let stackView: UIStackView = {
//        let stack = UIStackView()
//        stack.distribution = .fillEqually
//        stack.alignment = .fill
//        stack.spacing = 10
//        stack.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        stack.addArrangedSubview(FullTimerViewController.label1)
//        stack.addArrangedSubview(self.label2)
//        stack.addArrangedSubview(self.label3)
//        stack.addArrangedSubview(label4)
//        stack.addArrangedSubview(label5)
//        stack.addArrangedSubview(label6)
//        stack.addArrangedSubview(label7)
//        stack.addArrangedSubview(label8)
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        speakerTimeslabel.font = UIFont.systemFont(ofSize: view.frame.height * 0.027)

        label1.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        label2.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        label3.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        label4.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        label5.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        label6.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        label7.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        label8.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        time1.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        time2.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        time3.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        time4.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        time5.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        time6.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        time7.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        time8.font = UIFont.systemFont(ofSize: view.frame.height * 0.023)
        
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.027)

        
        label1.text = "First Proposition"
        label2.text = "First Opposition"
        label3.text = "Second Proposition"
        label4.text = "Second Opposition"
        label5.text = "First Opposition"
        label6.text = "First Proposition"
        label7.isHidden = true
        label8.isHidden = true

        time1.text = "6:00"
        time2.text = "6:00"
        time3.text = "6:00"
        time4.text = "6:00"
        time5.text = "3:00"
        time6.text = "3:00"
        time7.isHidden = true
        time8.isHidden = true
        
        view.backgroundColor = .darkGray
        setUpLoaded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    func setUpLoaded() {
        let margins = view.layoutMarginsGuide
        let topView = UIView()
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: margins.heightAnchor).isActive = true
        topView.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
        
        topView.addSubview(navbar)
        topView.addSubview(formatSegmentedControl)
        topView.addSubview(levelSegmentedControl)
        topView.addSubview(speakerTimeslabel)
        let speakerStackView: UIStackView = {
            let stack = UIStackView()
            stack.distribution = .fillEqually
            stack.alignment = .fill
            stack.spacing = 10
            stack.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            stack.axis = .vertical
            stack.translatesAutoresizingMaskIntoConstraints = false
            
            stack.addArrangedSubview(label1)
            stack.addArrangedSubview(label2)
            stack.addArrangedSubview(label3)
            stack.addArrangedSubview(label4)
            stack.addArrangedSubview(label5)
            stack.addArrangedSubview(label6)
            stack.addArrangedSubview(label7)
            stack.addArrangedSubview(label8)
            
            return stack
        }()
        
        let timeStackView: UIStackView = {
            let stack = UIStackView()
            stack.distribution = .fillEqually
            stack.alignment = .fill
            stack.spacing = 10
            stack.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            stack.axis = .vertical
            stack.translatesAutoresizingMaskIntoConstraints = false
            
            stack.addArrangedSubview(time1)
            stack.addArrangedSubview(time2)
            stack.addArrangedSubview(time3)
            stack.addArrangedSubview(time4)
            stack.addArrangedSubview(time5)
            stack.addArrangedSubview(time6)
            stack.addArrangedSubview(time7)
            stack.addArrangedSubview(time8)
            
            return stack
        }()
        topView.backgroundColor = .darkGray
        topView.addSubview(speakerStackView)
        topView.addSubview(timeStackView)
        topView.addSubview(continueButton)
        
        navbar.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        navbar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navbar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        formatSegmentedControl.topAnchor.constraint(equalTo: navbar.bottomAnchor, constant: 30).isActive = true
        formatSegmentedControl.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        formatSegmentedControl.widthAnchor.constraint(equalToConstant: view.bounds.width - 30).isActive = true
        formatSegmentedControl.heightAnchor.constraint(equalToConstant: view.bounds.height/25).isActive = true
        formatSegmentedControl.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: view.bounds.height * 0.023)], for: .normal)

        
        levelSegmentedControl.topAnchor.constraint(equalTo: formatSegmentedControl.bottomAnchor, constant: 10).isActive = true
        levelSegmentedControl.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        levelSegmentedControl.widthAnchor.constraint(equalToConstant: view.bounds.width - 30).isActive = true
        levelSegmentedControl.heightAnchor.constraint(equalToConstant: view.bounds.height/25).isActive = true
        levelSegmentedControl.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: view.bounds.height * 0.023)], for: .normal)
        
        speakerTimeslabel.heightAnchor.constraint(equalToConstant: view.bounds.height/24).isActive = true
        speakerTimeslabel.topAnchor.constraint(equalTo: levelSegmentedControl.bottomAnchor, constant: 20).isActive = true
        speakerTimeslabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 30).isActive = true
        speakerTimeslabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        
        
        speakerStackView.topAnchor.constraint(equalTo: speakerTimeslabel.bottomAnchor, constant: 20).isActive = true
        speakerStackView.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        speakerStackView.widthAnchor.constraint(equalToConstant: (view.bounds.width * 2) / 3).isActive = true
        speakerStackView.heightAnchor.constraint(equalToConstant: (view.bounds.height/2)).isActive = true
        
        timeStackView.topAnchor.constraint(equalTo: speakerTimeslabel.bottomAnchor, constant: 20).isActive = true
        timeStackView.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
        timeStackView.widthAnchor.constraint(equalToConstant: (view.bounds.width/7)).isActive = true
        timeStackView.heightAnchor.constraint(equalToConstant: (view.bounds.height)/2).isActive = true
        
        continueButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 30).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: view.bounds.height/15).isActive = true
        continueButton.topAnchor.constraint(equalTo: speakerStackView.bottomAnchor, constant: 20).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        
        
    }
 

}
