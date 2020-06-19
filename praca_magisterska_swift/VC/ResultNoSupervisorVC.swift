//
//  SuccessNoSupervisor.swift
//  praca_magisterska_swift
//
//  Created by Damian Szczygielski on 31/05/2020.
//  Copyright © 2020 Damian Szczygielski. All rights reserved.
//

import UIKit

class ResultNoSupervisorVC: UIViewController {

    @IBOutlet weak var chosenItemImage: UIImageView!
    @IBOutlet weak var chosenItemLabel: UILabel!
    @IBOutlet weak var successOrFailLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    var emotionsItemsMode = AppSettings.GameEmotionsItemsMode.Items
    var chosenItem: String!
    var success: Bool!
    var points: Int!
    var score: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        chosenItemLabel.text = chosenItem.capitalized
        
        if(AppSettings.GameMode == AppSettings.GameModeType.Images) {
            chosenItemImage.image = UIImage(named: chosenItem + Constants.image)
        } else {
            chosenItemImage.image = UIImage(named: chosenItem + Constants.photo)
        }
        
        successOrFailLabel.text = success ? Constants.correct : Constants.incorrect
        
        if emotionsItemsMode == AppSettings.GameEmotionsItemsMode.Items {
            prepareItems()
        } else if emotionsItemsMode == AppSettings.GameEmotionsItemsMode.Emotions {
            prepareEmotions()
        }
    }
    
    func prepareItems() {
        backgroundView.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.7725490196, blue: 0.1725490196, alpha: 1)
        chosenItemLabel.textColor = #colorLiteral(red: 0, green: 0.5054124594, blue: 0, alpha: 1)
        successOrFailLabel.textColor = #colorLiteral(red: 0, green: 0.5054124594, blue: 0, alpha: 1)
    }
    
    func prepareEmotions() {
        backgroundView.backgroundColor = #colorLiteral(red: 0, green: 0.5054124594, blue: 0, alpha: 1)
        chosenItemLabel.textColor = #colorLiteral(red: 0.4352941176, green: 0.7725490196, blue: 0.1725490196, alpha: 1)
        successOrFailLabel.textColor = #colorLiteral(red: 0.4352941176, green: 0.7725490196, blue: 0.1725490196, alpha: 1)
    }
    
    @IBAction func close(_ sender: UIButton) {
               let closeAlert = UIAlertController(title: Constants.finishGameAlertTitle, message: Constants.finishGameAlertMessage, preferredStyle: UIAlertController.Style.alert)

        closeAlert.addAction(UIAlertAction(title: Constants.finishGameConfirmButtonText, style: .default, handler: { (action: UIAlertAction!) in
              self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
        }))

        closeAlert.addAction(UIAlertAction(title: Constants.finishGameCancelButtonText, style: .cancel, handler: { (action: UIAlertAction!) in
        }))

        present(closeAlert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? WinVC {
            target.emotionsItemsMode = emotionsItemsMode
            target.score = score
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if points >= AppSettings.MaxPoints {
            self.performSegue(withIdentifier: Constants.NoSupervisorWinSegue, sender: nil)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
