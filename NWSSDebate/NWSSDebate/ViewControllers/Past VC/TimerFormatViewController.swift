//
//  TimerFormatViewController.swift
//  NWSSDebate
//
//  Created by Selena Liu on 2018-01-09.
//  Copyright © 2018 Selena Liu. All rights reserved.
//

import UIKit

class TimerFormatViewController: UIViewController {
    
    @IBOutlet weak var StyleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var levelSegmentedControl: UISegmentedControl!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    
    @IBOutlet weak var time1: UILabel!
    @IBOutlet weak var time2: UILabel!
    @IBOutlet weak var time3: UILabel!
    @IBOutlet weak var time4: UILabel!
    @IBOutlet weak var time5: UILabel!
    @IBOutlet weak var time6: UILabel!
    @IBOutlet weak var time7: UILabel!
    @IBOutlet weak var time8: UILabel!
    
    
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
    
    @objc internal func levelSegmentChanged(segmentController: UISegmentedControl) {
        if StyleSegmentedControl.selectedSegmentIndex == 0 {
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label7.isHidden = true
        label8.isHidden = true
        time7.isHidden = true
        time8.isHidden = true
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        StyleSegmentedControl.addTarget(self, action: #selector(self.styleSegmentChanged(segmentController:)), for: UIControlEvents.valueChanged)
        levelSegmentedControl.addTarget(self, action: #selector(self.levelSegmentChanged(segmentController:)), for: UIControlEvents.valueChanged)

        // Do any additional setup after loading the view.
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
