//
//  ScoreboardVC.swift
//  praca_magisterska_swift
//
//  Created by Damian Szczygielski on 07/06/2020.
//  Copyright © 2020 Damian Szczygielski. All rights reserved.
//

import UIKit

class ScoreboardVC: UIViewController {
    
    @IBOutlet weak var scoreboardTable: UITableView!
    
    var Scores: [Score]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreboardTable.delegate = self
        scoreboardTable.dataSource = self
        scoreboardTable.register(UINib(nibName: "ScoreboardCellTableViewCell", bundle: nil), forCellReuseIdentifier: ScoreboardCellTableViewCell.ID)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            let defaults = UserDefaults.standard
            if let scoresData = defaults.object(forKey: "ScoreTable") as? NSData {
                Scores = try (NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(scoresData as Data) as? [Score])
            }
        } catch {}
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
