//
//  AppSettings.swift
//  praca_magisterska_swift
//
//  Created by Damian Szczygielski on 04/06/2020.
//  Copyright © 2020 Damian Szczygielski. All rights reserved.
//

import Foundation

struct AppSettings {
    static var GameSupervisedMode = GameSupervisedModeType.Supervised
    static var GameMode =  GameModeType.Images
    static var MaxPoints = 10

    enum GameSupervisedModeType: Int {
        case Supervised
        case Unsupervised
    }
    
    enum GameModeType: Int {
         case Images
         case Photos
    }
    
    enum GameEmotionsItemsMode: Int {
        case Items
        case Emotions
    }
    
    static var itemsArray: [String] = ["jabłko", "kalkulator", "zeszyt", "piłka", "książka", "samochód", "długopis", "łyżka", "wieszak", "plecak", "skarpetka", "but", "gumka", "linijka", "grzechotka", "klocek", "pluszak" , "piórnik", "kartka", "ołówek" , "cymbałki", "miotła", "balon", "banan", "ogórek", "skakanka", "klucz", "czapka", "samolot", "pędzel"]

}
