//
//  QuestionOrder.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 23.12.2021.
//

import Foundation

enum QuestionOrder: Codable {
    case hard, random
    
    mutating func toggle(){
        if self == .random {
            self = .hard
        } else {
            self = .random
        }
    }
}
