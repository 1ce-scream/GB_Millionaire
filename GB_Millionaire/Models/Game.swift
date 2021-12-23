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
    private let randomSettingCaretaker = RandomSettingCaretaker()
    var gameRecords: [GameRecord]
    var gameSession: GameSession?
    var questionsOrder: QuestionOrder = .random {
        didSet {
            randomSettingCaretaker.saveOrder(showQuestionsRandom: self.questionsOrder)
        }
    }
    
    private init() {
        self.gameRecords = self.recordsCaretaker.loadRecord()
        self.questionsOrder = randomSettingCaretaker.loadOrder()
    }
    
    func saveRecord(_ record: GameRecord) {
        self.gameRecords.append(record)
    }
    
    func gameEnd() {
        guard let gameSession = gameSession else { return }
        gameRecords.append(
            GameRecord(rightAnswersCount: gameSession.rightAnswers,
                       answersCount: gameSession.questionCount))
        self.gameSession = nil
        recordsCaretaker.saveRecord(gameRecord: Game.shared.gameRecords)
    }
}
