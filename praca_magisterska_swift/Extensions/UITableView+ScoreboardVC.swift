//
//  UITableView+ScoreboardVC.swift
//  praca_magisterska_swift
//
//  Created by Damian Szczygielski on 14/06/2020.
//  Copyright © 2020 Damian Szczygielski. All rights reserved.
//

import Foundation
import UIKit

extension ScoreboardVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Scores != nil {
            return Scores.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = scoreboardTable.dequeueReusableCell(withIdentifier: ScoreboardCellTableViewCell.ID) as? ScoreboardCellTableViewCell else { return ScoreboardCellTableViewCell() }
        let score = Scores[indexPath.row]
        cell.updateCell(_date: score.date, _score: score.score)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
