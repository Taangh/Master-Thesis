//
//  SettingsVC.swift
//  praca_magisterska_swift
//
//  Created by Damian Szczygielski on 07/06/2020.
//  Copyright © 2020 Damian Szczygielski. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var supervisorSwicht: UISwitch!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var pointsMinutsButton: UIButton!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        supervisorSwicht.transform = CGAffineTransform(scaleX: 1.75, y: 1.75)
        
        if AppSettings.GameSupervisedMode == AppSettings.GameSupervisedModeType.Supervised {
            supervisorSwicht.isOn = true
        } else {
            supervisorSwicht.isOn = false
        }
        
        pointLabel.text = "\(AppSettings.MaxPoints) pkt"
        modeLabel.text = AppSettings.GameMode == AppSettings.GameModeType.Images ? "Obrazki" : "Zdjęcia"
    }
    
    @IBAction func switchButtonChanged (sender: UISwitch) {
        if sender.isOn {
            AppSettings.GameSupervisedMode = AppSettings.GameSupervisedModeType.Supervised
        } else {
            AppSettings.GameSupervisedMode = AppSettings.GameSupervisedModeType.Unsupervised
        }
        
        defaults.set(AppSettings.GameSupervisedMode.rawValue, forKey: "GameSupervisedMode")
    }
    
    @IBAction func pointsPlus(_ sender: UIButton) {
        AppSettings.MaxPoints+=1
        pointLabel.text = "\(AppSettings.MaxPoints) pkt"
        pointsMinutsButton.isEnabled = true
        
        defaults.set(AppSettings.MaxPoints, forKey: "MaxPoints")
    }
    
    @IBAction func pointsMinus(_ sender: UIButton) {
        AppSettings.MaxPoints-=1
        pointLabel.text = "\(AppSettings.MaxPoints) pkt"
        if AppSettings.MaxPoints == 1 {
            pointsMinutsButton.isEnabled = false
        }
        
        defaults.set(AppSettings.MaxPoints, forKey: "MaxPoints")
    }
    
    @IBAction func changeGameMode(_ sender: UIButton) {
        if(AppSettings.GameMode == AppSettings.GameModeType.Images) {
            AppSettings.GameMode = AppSettings.GameModeType.Photos
        } else if(AppSettings.GameMode == AppSettings.GameModeType.Photos) {
            AppSettings.GameMode = AppSettings.GameModeType.Images
        }
        modeLabel.text = AppSettings.GameMode == AppSettings.GameModeType.Images ? "Obrazki" : "Zdjęcia"
        
        defaults.set(AppSettings.GameMode.rawValue, forKey: "GameMode")
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
