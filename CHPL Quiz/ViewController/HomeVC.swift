//
//  HomeVC.swift
//  CHPL Quiz
//
//  Created by Krupesh Savaliya on 08/04/24.
//

import UIKit

class HomeVC: UIViewController {
    
    
    @IBOutlet weak var lblWlcome: UILabel!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var btnStartQuiz: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    static var storyboardInstance: HomeVC {
        return StoryBoard.main.instantiateViewController(withIdentifier: HomeVC.identifier) as! HomeVC
    }

    @IBAction func btnStartQuizAction(_ sender: UIButton) {
        self.navigationController?.pushViewController(QuizVC.storyboardInstance, animated: true)
    }
    
}
