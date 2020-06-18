//
//  ResultSupervisor.swift
//  praca_magisterska_swift
//
//  Created by Damian Szczygielski on 31/05/2020.
//  Copyright © 2020 Damian Szczygielski. All rights reserved.
//

import UIKit

class ResultSupervisorVC: UIViewController {

    @IBOutlet weak var chosenItemImage: UIImageView!
    @IBOutlet weak var chosenItemLabel: UILabel!
    @IBOutlet weak var successOrFailLabel: UILabel!
    var chosenItem: String!
    var success: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        chosenItemLabel.text = chosenItem.capitalized
        chosenItemImage.image = UIImage(named: chosenItem)
        
        var wordInProperForm = chosenItem
        if chosenItem.last == "a" {
            wordInProperForm?.removeLast()
            wordInProperForm?.append("ę")
        }
        
        successOrFailLabel.text = "Dobrze! Teraz przynieś \(wordInProperForm!)"
    }
    
    @IBAction func close(_ : UIButton) {
        let closeAlert = UIAlertController(title: "Zakończ", message: "Czy na pewno chcesz zakończyć?", preferredStyle: UIAlertController.Style.alert)

        closeAlert.addAction(UIAlertAction(title: "Tak", style: .default, handler: { (action: UIAlertAction!) in
              self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
        }))

        closeAlert.addAction(UIAlertAction(title: "Anuluj", style: .cancel, handler: { (action: UIAlertAction!) in
        }))

        present(closeAlert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
}
