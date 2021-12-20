//
//  RecordsCaretaker.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 19.12.2021.
//

import Foundation

final class RecordCaretaker{
    private let key = "records"
    
    func saveRecord(gameRecord: [GameRecord]){
        do {
            let data = try JSONEncoder().encode(gameRecord)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Ошибка сохранения")
        }
    }
    
    func loadRecord() -> [GameRecord] {
        let emptyArray: [GameRecord] = []
        guard
            let data = UserDefaults.standard.data(forKey: key)
        else {
            print("Ошибка загрузки")
            return emptyArray
        }
        do {
            return try JSONDecoder().decode([GameRecord].self, from: data)
        }
        catch {
            print("Ошибка декодера при загрузке")
            return emptyArray
        }
    }
}
