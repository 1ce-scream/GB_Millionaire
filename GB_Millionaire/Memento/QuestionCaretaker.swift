//
//  QuestionCaretaker.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 23.12.2021.
//

import Foundation

final class QuestionsCaretaker{

    let key = "userQuestion"
    
    func saveUserQuestions(userQuestions: [Question]){
        let actualQuestions = self.loadUserQuestions()
        let questionsToSave = userQuestions + actualQuestions
        do {
            let data = try JSONEncoder().encode(questionsToSave)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Ошибка сохранения")
        }
    }

    func saveUserQuestion(userQuestion: Question){
        var actualQuestions = self.loadUserQuestions()
        actualQuestions.append(userQuestion)
        do {
            let data = try JSONEncoder().encode(actualQuestions)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Ошибка сохранения")
        }
    }
    
    func loadUserQuestions() -> [Question] {
        guard
            let data = UserDefaults.standard.data(forKey: key)
        else {
            print("Ошибка загрузки")
            let empty: [Question] = []
            return empty
        }
        do {
            return try JSONDecoder().decode([Question].self, from: data)
        }
        catch {
            print("Ошибка декодера при загрузке")
            return []
        }
    }
    
}
