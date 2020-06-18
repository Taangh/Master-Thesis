//
//  WinVC.swift
//  praca_magisterska_swift
//
//  Created by Damian Szczygielski on 04/06/2020.
//  Copyright © 2020 Damian Szczygielski. All rights reserved.
//

import UIKit

class WinVC: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var emotionsItemsMode = AppSettings.GameEmotionsItemsMode.Items
    var score: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "\(score!) pkt"

        if emotionsItemsMode == AppSettings.GameEmotionsItemsMode.Items {
            prepareItems()
        } else if emotionsItemsMode == AppSettings.GameEmotionsItemsMode.Emotions {
            prepareEmotions()
        }
    }
        
    override func viewDidAppear(_ animated: Bool) {
        do {
            scoreLabel.text = "\(score!) pkt"
            
            let defaults = UserDefaults.standard
            var scoreTable = [Score]()
            if let scoresData = defaults.object(forKey: "ScoreTable") as? NSData {
                scoreTable = try (NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(scoresData as Data) as? [Score] ?? [
                    Score]())
            }

            scoreTable.append(Score(_date: Date(), _score: score))
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: scoreTable, requiringSecureCoding: false)
            defaults.set(encodedData, forKey: "ScoreTable")
        } catch {}

    }
    
    func prepareItems() {
        backgroundView.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.7725490196, blue: 0.1725490196, alpha: 1)
        winLabel.textColor = #colorLiteral(red: 0, green: 0.5054124594, blue: 0, alpha: 1)
    }
    
    func prepareEmotions() {
        backgroundView.backgroundColor = #colorLiteral(red: 0, green: 0.5054124594, blue: 0, alpha: 1)
        winLabel.textColor = #colorLiteral(red: 0.4352941176, green: 0.7725490196, blue: 0.1725490196, alpha: 1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
