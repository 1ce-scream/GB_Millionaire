//
//  RecordsVC.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 20.12.2021.
//

import UIKit

class RecordsVC: UIViewController {
    
    @IBOutlet weak var recordsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recordsTable.delegate = self
        recordsTable.dataSource = self
        
        // Do any additional setup after loading the view.
    }
}

extension RecordsVC: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            
            Game.shared.gameRecords.count
        }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "recordsCell",
                    for: indexPath) as? RecordsTVCell
            else { return UITableViewCell() }
            
            let record = Game.shared.gameRecords[indexPath.row]
            cell.configure(
                rightAnswers: record.rightAnswersCount,
                percent: record.rightPercent,
                answersAmount: record.answersCount)
            return cell
        }
    
}

extension RecordsVC: UITableViewDelegate {
    
}
