//
//  QuizQuestionCC.swift
//  CHPL Quiz
//
//  Created by Krupesh Savaliya on 08/04/24.
//

import UIKit

class QuizQuestionCC: UICollectionViewCell {
    
    
    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var stackAns1: UIStackView!

    @IBOutlet weak var btnAns1: UIButton!{
        didSet {
            
            btnAns1.setImage(UIImage(systemName:"checkmark.square" ), for: .normal)
            btnAns1.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        }
    }
    
    @IBOutlet weak var lblAns1: UILabel!
    
    @IBOutlet weak var stackAns2: UIStackView!
    @IBOutlet weak var btnAns2: UIButton!{
        didSet {
            
            btnAns2.setImage(UIImage(systemName:"checkmark.square" ), for: .normal)
            btnAns2.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        }
    }
    @IBOutlet weak var lblAns2: UILabel!
    @IBOutlet weak var stackAns3: UIStackView!
    @IBOutlet weak var btnAns3: UIButton!{
        didSet {
            
            btnAns3.setImage(UIImage(systemName:"checkmark.square" ), for: .normal)
            btnAns3.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        }
    }
    @IBOutlet weak var lblAns3: UILabel!
    @IBOutlet weak var stackAns4: UIStackView!
    @IBOutlet weak var btnAns4: UIButton!{
        didSet {
           
            btnAns4.setImage(UIImage(systemName:"checkmark.square" ), for: .normal)
            btnAns4.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        }
    }
    @IBOutlet weak var lblAns4: UILabel!
    @IBOutlet weak var stackAns5: UIStackView!
    @IBOutlet weak var btnAns5: UIButton!{
        didSet {
            
            btnAns5.setImage(UIImage(systemName:"checkmark.square" ), for: .normal)
            btnAns5.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        }
    }
    @IBOutlet weak var lblAns5: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var cellData : Question? {
        didSet {
            setupUI()
        }
    }
    
    
    func setupUI() {
        if let data = cellData {
            lblQuestion.text = data.question
            lblAns1.text = data.ans1
            lblAns2.text = data.ans2
            lblAns3.text = data.ans3
            lblAns4.text = data.ans4
            lblAns5.text = data.ans5
            
            btnAns1.isSelected = false
            btnAns2.isSelected = false
            btnAns3.isSelected = false
            btnAns4.isSelected = false
            btnAns5.isSelected = false
            if data.selectAnswer == "ans1" {
                btnAns1.isSelected = true
            }else if data.selectAnswer == "ans2" {
                btnAns2.isSelected = true
            }else if data.selectAnswer == "ans3" {
                btnAns3.isSelected = true
            }else if data.selectAnswer == "ans4" {
                btnAns4.isSelected = true
            }else if data.selectAnswer == "ans5" {
                btnAns5.isSelected = true
            }
            
            if data.ans5 == "" {
                stackAns5.isHidden = true
            }
            if data.ans4 == "" {
                stackAns4.isHidden = true
            }
            if data.ans3 == "" {
                stackAns3.isHidden = true
            }
        }
    }
    
    
    @IBAction func btnAns1Action(_ sender: Any) {
        btnAns1.isSelected = !btnAns1.isSelected
        btnAns2.isSelected = false
        btnAns3.isSelected = false
        btnAns4.isSelected = false
        btnAns5.isSelected = false
        
        let data = ["answer":"ans1"] as [String : Any]
        NotificationCenter.default.post(name: NSNotification.Name("answerSelect"), object: nil,userInfo: data)

    }
    
    
    @IBAction func btnAns2Action(_ sender: Any) {
        btnAns1.isSelected = false
        btnAns2.isSelected = !btnAns1.isSelected
        btnAns3.isSelected = false
        btnAns4.isSelected = false
        btnAns5.isSelected = false
        let data = ["answer":"ans2"] as [String : Any]
        NotificationCenter.default.post(name: NSNotification.Name("answerSelect"), object: nil,userInfo: data)
    }
    
    @IBAction func btnAns3Action(_ sender: Any) {
        btnAns1.isSelected = false
        btnAns2.isSelected = false
        btnAns3.isSelected = !btnAns1.isSelected
        btnAns4.isSelected = false
        btnAns5.isSelected = false
        let data = ["answer":"ans3"] as [String : Any]
        NotificationCenter.default.post(name: NSNotification.Name("answerSelect"), object: nil,userInfo: data)
    }
    
    @IBAction func btnAns4Action(_ sender: Any) {
        btnAns1.isSelected = false
        btnAns2.isSelected = false
        btnAns3.isSelected = false
        btnAns4.isSelected = !btnAns1.isSelected
        btnAns5.isSelected = false
        let data = ["answer":"ans4"] as [String : Any]
        NotificationCenter.default.post(name: NSNotification.Name("answerSelect"), object: nil,userInfo: data)
    }
    
    @IBAction func btnAns5Action(_ sender: Any) {
        btnAns1.isSelected = false
        btnAns2.isSelected = false
        btnAns3.isSelected = false
        btnAns4.isSelected = false
        btnAns5.isSelected = !btnAns1.isSelected
        let data = ["answer":"ans5"] as [String : Any]
        NotificationCenter.default.post(name: NSNotification.Name("answerSelect"), object: nil,userInfo: data)
    }
    

}
