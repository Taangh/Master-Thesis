//
//  Constants.swift
//  praca_magisterska_swift
//
//  Created by Damian Szczygielski on 19/06/2020.
//  Copyright © 2020 Damian Szczygielski. All rights reserved.
//

import Foundation

class Constants {
    //GAME TYPES ADDED TO IMAGE NAME
    static let image = "_image"
    static let photo = "_photo"
    
    //GAME TYPES LABELS
    static let imageLabel = "Obrazki"
    static let photoLabel = "Zdjęcia"
    
    //WIN CORRECT/INCORRECT LABELS
    static let correctItemActionLabel = "Dobrze! Teraz przynieś "
    static let correctEmotionActionLabel = "Dobrze! Teraz pokaż "
    static let correct = "Dobrze!"
    static let incorrect = "Niestety źle!"
    
    //FINISH GAME ALERT
    static let finishGameAlertTitle = "Zakończ"
    static let finishGameAlertMessage = "Czy na pewno chcesz zakończyć?"
    static let finishGameCancelButtonText = "Anuluj"
    static let finishGameConfirmButtonText = "Ok"
    
    //DEFAULTS
    static let defaultsMaxPoints = "MaxPoints"
    static let defaultsGameMode = "GameMode"
    static let defaultsGameSupervisedMode = "GameSupervisedMode"
    static let defaultsScoreBoard = "ScoreBoard"
    
    //SEGUES
    static let ItemGameSegue = "ItemGameSegue"
    static let ResultSupervisorSegue = "ResultSupervisorSegue"
    static let ResultNoSupervisorSegue = "ResultNoSupervisorSegue"
    static let SupervisorWinSegue = "SupervisorWinSegue"
    static let NoSupervisorWinSegue = "NoSupervisorWinSegue"
    
    //NIBS
    static let ScoreboardCellTableViewCell = "ScoreboardCellTableViewCell"

}
