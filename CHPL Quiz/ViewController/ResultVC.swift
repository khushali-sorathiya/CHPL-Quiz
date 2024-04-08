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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
