//
//  chooseCategoryVC.swift
//  praca_magisterska_swift
//
//  Created by Damian Szczygielski on 25/05/2020.
//  Copyright © 2020 Damian Szczygielski. All rights reserved.
//

import UIKit

class ChooseCategoryVC: UIViewController {
    
    var emotionsItemsMode = AppSettings.GameEmotionsItemsMode.Items

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
        
    @IBAction func itemGameClick(_ sender: UIButton) {
        emotionsItemsMode = AppSettings.GameEmotionsItemsMode.Items
        performSegue(withIdentifier: Constants.ItemGameSegue, sender: nil)
    }
    
    @IBAction func emotionsGameClick(_ sender: UIButton) {
        emotionsItemsMode = AppSettings.GameEmotionsItemsMode.Emotions
        performSegue(withIdentifier: Constants.ItemGameSegue, sender: nil)
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? GameVC {
            target.emotionsItemsMode = emotionsItemsMode
        }
    }
}
