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
        if(defaults.integer(forKey: "MaxPoints") != 0) {
            AppSettings.MaxPoints = defaults.integer(forKey: "MaxPoints")
        }

        if defaults.object(forKey: "GameMode") != nil {
            let rawValue = defaults.integer(forKey: "GameMode")
            AppSettings.GameMode = AppSettings.GameModeType(rawValue: rawValue) ?? AppSettings.GameModeType.Images
        }

        if defaults.object(forKey: "GameSupervisedMode") != nil {
            let rawValue = defaults.integer(forKey: "GameSupervisedMode")
            AppSettings.GameSupervisedMode = AppSettings.GameSupervisedModeType(rawValue: rawValue) ?? AppSettings.GameSupervisedModeType.Supervised
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
