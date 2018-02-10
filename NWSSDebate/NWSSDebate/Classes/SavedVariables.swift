//
//  SavedVariables.swift
//  NWSSDebate
//
//  Created by Selena Liu on 2018-01-25.
//  Copyright © 2018 Selena Liu. All rights reserved.
//

import Foundation

class SavedVariables: NSObject, NSCoding {
    struct Keys {
        static let onboardingDone = "OnboardingDone"
    }
    
    private var _onboardingDone = ""
    
    init(onboardingDone: String) {
        _onboardingDone = onboardingDone
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let onboardingDoneObj = aDecoder.decodeObject(forKey: Keys.onboardingDone) as? String {
            _onboardingDone = onboardingDoneObj
        }
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(_onboardingDone, forKey: Keys.onboardingDone)
    }
    
    var OnboardingDone: String {
        get {
            return _onboardingDone
        }
        set {
            _onboardingDone = newValue
        }
    }
}
