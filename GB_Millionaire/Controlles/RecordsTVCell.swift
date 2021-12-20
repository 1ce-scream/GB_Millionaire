//
//  RecordsTVCell.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 20.12.2021.
//

import UIKit

class RecordsTVCell: UITableViewCell {

    @IBOutlet weak var rightAnswersCountLabel: UILabel!
    @IBOutlet weak var percentOfRightAnswersLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(rightAnswers: Int, percent: Double, answersAmount: Int) {
        rightAnswersCountLabel?.text = "Всего вопросов: \(answersAmount). Верных ответов: \(rightAnswers)."
        percentOfRightAnswersLabel?.text = "Процент верных ответов: \(percent)%"
    }
}
