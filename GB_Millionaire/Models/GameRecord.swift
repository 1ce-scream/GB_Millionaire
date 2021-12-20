//
//  GameResult.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 20.12.2021.
//

import Foundation

struct GameRecord: Codable {
    var rightAnswersCount: Int
    var answersCount: Int
    var rightPercent: Double {
        ((Double(self.rightAnswersCount) * 100) / Double(self.answersCount)).rounded()
    }
}
