//
//  ScoreboardCellTableViewCell.swift
//  praca_magisterska_swift
//
//  Created by Damian Szczygielski on 14/06/2020.
//  Copyright © 2020 Damian Szczygielski. All rights reserved.
//

import UIKit

class ScoreboardCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    static let ID = "ScoreboardCellTableViewCell"
    
    func updateCell(_date: Date, _score: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        dateLabel.text = dateFormatter.string(from: _date)
        scoreLabel.text = "\(_score) pkt"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
