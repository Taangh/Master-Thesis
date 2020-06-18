//
//  Score.swift
//  praca_magisterska_swift
//
//  Created by Damian Szczygielski on 14/06/2020.
//  Copyright © 2020 Damian Szczygielski. All rights reserved.
//

import Foundation

class Score: NSObject, NSCoding {
    private(set) var date: Date!
    private(set) var score: Int!
    
    func encode(with coder: NSCoder) {
        coder.encode(date, forKey: "date")
        coder.encode(score, forKey: "score")
    }
    
    required convenience init?(coder: NSCoder) {
        let date = coder.decodeObject(forKey: "date") as! Date
        let score = coder.decodeObject(forKey: "score") as! Int
        self.init(_date: date, _score: score)
    }
    
    init(_date: Date, _score: Int) {
        self.date = _date
        self.score = _score
    }
}
