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
    var gameRecords: [GameRecord]
    var gameSession: GameSession?
    
    private init() {
        self.gameRecords = self.recordsCaretaker.loadRecord()
    }
    
    func saveRecord(_ record: GameRecord) {
        self.gameRecords.append(record)
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
