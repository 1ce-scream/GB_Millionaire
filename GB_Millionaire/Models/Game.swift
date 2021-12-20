//
//  Game.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 19.12.2021.
//

import Foundation

class Game {
    static var shared = Game()
    private let recordsCaretaker = RecordCaretaker()
    private var gameRecords: [GameRecord]
    var gameSession: GameSession?
    
    
    private init() {
        self.gameRecords = recordsCaretaker.loadRecord()
    }
    
    func gameEnd() {
        guard let gameSession = gameSession else { return }
        gameRecords.append(
            GameRecord(rightAnswersCount: gameSession.rightAnswers,
                       answersCount: gameSession.allQuestions))
        self.gameSession = nil
        recordsCaretaker.saveRecord(gameRecord: Game.shared.gameRecords)
    }
}
