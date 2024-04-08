//
//  ResultVC.swift
//  CHPL Quiz
//
//  Created by Krupesh Savaliya on 08/04/24.
//

import UIKit

class ResultVC: UIViewController {

    
    @IBOutlet weak var btnBack: UIButton!{
        didSet {
            btnBack.setTitle("", for: .normal)
        }
    }
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblOutof: UILabel!
    @IBOutlet weak var lblWelldone: UILabel!
    @IBOutlet weak var lblRightAns: UILabel!
    @IBOutlet weak var lblWrongAns: UILabel!
    @IBOutlet weak var lblSkipAns: UILabel!
    
    @IBOutlet weak var btnIncorrectResponce: UIButton!
    
    @IBOutlet weak var bntReplay: UIButton!
    
    @IBOutlet weak var btnHome: UIButton!
    
    var arrQuestion = [Question]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var right = 0
        var wrong = 0
        var skip = 0
        for i in arrQuestion {
            if i.selectAnswer == i.answer {
                right += 1
            }else if i.selectAnswer == "" {
                skip += 1
            }else {
                wrong += 1
            }
        }
        
        lblOutof.text = "\(right) out of 10"
        lblRightAns.text = "Your right answer is : \(right)"
        lblWrongAns.text  = "Your wrong answer is : \(wrong)"
        lblSkipAns.text = "Your skip answer is : \(skip)"
        
    }
    
    static var storyboardInstance: ResultVC {
        return StoryBoard.main.instantiateViewController(withIdentifier: ResultVC.identifier) as! ResultVC
    }

    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func btnIncorrectResponceAction(_ sender: Any) {
    }
    
    
    @IBAction func btnReplayAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    
    
    @IBAction func btnHomeAction(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
    }
    
}
