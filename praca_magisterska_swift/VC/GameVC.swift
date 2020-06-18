//
//  ItemGameVC.swift
//  praca_magisterska_swift
//
//  Created by Damian Szczygielski on 27/05/2020.
//  Copyright © 2020 Damian Szczygielski. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    @IBOutlet weak var button_1: UIButton!
    @IBOutlet weak var button_2: UIButton!
    @IBOutlet weak var button_3: UIButton!
    @IBOutlet weak var button_4: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    var emotionsArray: [String] = ["radość", "zdziwienie", "smutek", "strach"]
    var emotionsItemsMode = AppSettings.GameEmotionsItemsMode.Items
    var correctAnswer: String!
    var success: Bool!
    var points: Int!
    var score: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        points = 0 //EACH CHOICE GIVES POINT
        score = 0 //EACH CORRECT ANSWER GIVES SCORE
    }

    override func viewWillAppear(_ animated: Bool) {
        if emotionsItemsMode == AppSettings.GameEmotionsItemsMode.Items {
            prepareItems()
        } else if emotionsItemsMode == AppSettings.GameEmotionsItemsMode.Emotions {
            prepareEmotions()
        }
    }
    
    func prepareItems() {
        backgroundView.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.7725490196, blue: 0.1725490196, alpha: 1)
        nameLabel.textColor = #colorLiteral(red: 0, green: 0.4431372549, blue: 0.003921568627, alpha: 1)
        
        AppSettings.itemsArray.shuffle()
        
        var chosenItems: [String] = []
        chosenItems = AppSettings.itemsArray.pickUniqueInValue(4)
        
        nameLabel.text = chosenItems[0].capitalized
        correctAnswer = chosenItems[0]
        
        chosenItems.shuffle()
        
        var correctAnswerToCheck = ""
        
        if(AppSettings.GameMode == AppSettings.GameModeType.Images) {
            for i in 0...3 {
                chosenItems[i] += "_image"
            }
            correctAnswerToCheck = correctAnswer + "_image"
        } else if(AppSettings.GameMode == AppSettings.GameModeType.Photos) {
            for i in 0...3 {
                chosenItems[i] += "_photo"
            }
            correctAnswerToCheck = correctAnswer + "_photo"
        }
        
        button_1.setBackgroundImage(UIImage(named: chosenItems[0]), for: .normal)
        button_1.tag = chosenItems[0] == correctAnswerToCheck ? 0 : Int.random(in: 1..<3)
        button_2.setBackgroundImage(UIImage(named: chosenItems[1]), for: .normal)
        button_2.tag = chosenItems[1] == correctAnswerToCheck ? 0 : Int.random(in: 1..<3)
        button_3.setBackgroundImage(UIImage(named: chosenItems[2]), for: .normal)
        button_3.tag = chosenItems[2] == correctAnswerToCheck ? 0 : Int.random(in: 1..<3)
        button_4.setBackgroundImage(UIImage(named: chosenItems[3]), for: .normal)
        button_4.tag = chosenItems[3] == correctAnswerToCheck ? 0 : Int.random(in: 1..<3)
    }
    
    func prepareEmotions() {
        backgroundView.backgroundColor = #colorLiteral(red: 0, green: 0.4431372549, blue: 0.003921568627, alpha: 1)
        nameLabel.textColor = #colorLiteral(red: 0.4352941176, green: 0.7725490196, blue: 0.1725490196, alpha: 1)
        
        var chosenEmotions: [String] = []
        chosenEmotions = emotionsArray.pickUniqueInValue(4)
        
        nameLabel.text = chosenEmotions[0].capitalized
        correctAnswer = chosenEmotions[0]
        
        chosenEmotions.shuffle()

        button_1.setImage(UIImage(named: chosenEmotions[0]), for: .normal)
        button_1.tag = chosenEmotions[0] == correctAnswer ? 0 : Int.random(in: 1..<3)
        button_2.setImage(UIImage(named: chosenEmotions[1]), for: .normal)
        button_2.tag = chosenEmotions[1] == correctAnswer ? 0 : Int.random(in: 1..<3)
        button_3.setImage(UIImage(named: chosenEmotions[2]), for: .normal)
        button_3.tag = chosenEmotions[2] == correctAnswer ? 0 : Int.random(in: 1..<3)
        button_4.setImage(UIImage(named: chosenEmotions[3]), for: .normal)
        button_4.tag = chosenEmotions[3] == correctAnswer ? 0 : Int.random(in: 1..<3)

    }
    
    @IBAction func firstItemClick(_ sender: UIButton) {
        success = button_1.tag == 0 ? true : false
        goToNextSegue()
    }

    @IBAction func secondItemClick(_ sender: UIButton) {
        success = button_2.tag == 0 ? true : false
        goToNextSegue()
    }

    @IBAction func thirdItemClick(_ sender: UIButton) {
        success = button_3.tag == 0 ? true : false
        goToNextSegue()
    }

    @IBAction func fourthItemClick(_ sender: UIButton) {
        success = button_4.tag == 0 ? true : false
        goToNextSegue()
    }

    @IBAction func close(_ sender: UIButton) {
        let closeAlert = UIAlertController(title: "Zakończ", message: "Czy na pewno chcesz zakończyć?", preferredStyle: UIAlertController.Style.alert)

        closeAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
        }))

        closeAlert.addAction(UIAlertAction(title: "Anuluj", style: .cancel, handler: { (action: UIAlertAction!) in
        }))

        present(closeAlert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        points += 1
        if let target = segue.destination as? ResultNoSupervisorVC {
            score = success ? score + 1 : score
            target.chosenItem = correctAnswer
            target.score = score
            target.success = success
            target.points = points
            target.emotionsItemsMode = emotionsItemsMode
        } else if let target = segue.destination as? ResultSupervisorVC{
            target.chosenItem = correctAnswer
            target.success = success
            target.points = points
            target.score = score
            target.emotionsItemsMode = emotionsItemsMode
        }
    }
    
    func goToNextSegue() {
        if AppSettings.GameSupervisedMode == AppSettings.GameSupervisedModeType.Supervised && success {
            self.performSegue(withIdentifier: "ResultSupervisorSegue", sender: nil)
        } else if AppSettings.GameSupervisedMode == AppSettings.GameSupervisedModeType.Unsupervised || !success {
            self.performSegue(withIdentifier: "ResultNoSupervisorSegue", sender: nil)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension Array where Element: Hashable {
    func pickUniqueInValue(_ n: Int) -> [Element] {
        let set: Set<Element> = Set(self)
        guard set.count >= n else {
            fatalError("The array has to have at least \(n) unique values")
        }
        guard n >= 0 else {
            fatalError("The number of elements to be picked must be positive")
        }

        return Array(set.prefix(upTo: set.index(set.startIndex, offsetBy: n)))
    }
}
