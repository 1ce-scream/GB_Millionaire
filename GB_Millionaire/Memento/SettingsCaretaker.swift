//
//  SettingsCaretaker.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 23.12.2021.
//

import UIKit

final class RandomSettingCaretaker{
    
    private let questionOrderKey = "randomQuestion"
    
    func saveOrder(showQuestionsRandom: QuestionOrder) {
        do {
            let data = try JSONEncoder().encode(showQuestionsRandom)
            UserDefaults.standard.set(data, forKey: questionOrderKey)
        } catch {
            print("Ошибка сохранения")
        }
    }
    
    func loadOrder() -> QuestionOrder {
        guard
            let data = UserDefaults.standard.data(forKey: questionOrderKey)
        else {
            print ("Ошибка загрузки")
            return .random
        }
        do {
            return try JSONDecoder().decode(QuestionOrder.self, from: data)
        }
        catch {
            print("Ошибка декодера при загрузке")
            return .random
        }
    }
}
