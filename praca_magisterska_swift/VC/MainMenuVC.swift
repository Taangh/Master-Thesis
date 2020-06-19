//
//  ViewController.swift
//  praca_magisterska_swift
//
//  Created by Damian Szczygielski on 25/05/2020.
//  Copyright © 2020 Damian Szczygielski. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController {
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSettings()
    }
    
    func setUpSettings() {
        if(defaults.integer(forKey: Constants.defaultsMaxPoints) != 0) {
            AppSettings.MaxPoints = defaults.integer(forKey: Constants.defaultsMaxPoints)
        }

        if defaults.object(forKey: Constants.defaultsGameMode) != nil {
            let rawValue = defaults.integer(forKey: Constants.defaultsGameMode)
            AppSettings.GameMode = AppSettings.GameModeType(rawValue: rawValue) ?? AppSettings.GameModeType.Images
        }

        if defaults.object(forKey: Constants.defaultsGameSupervisedMode) != nil {
            let rawValue = defaults.integer(forKey: Constants.defaultsGameSupervisedMode)
            AppSettings.GameSupervisedMode = AppSettings.GameSupervisedModeType(rawValue: rawValue) ?? AppSettings.GameSupervisedModeType.Supervised
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
