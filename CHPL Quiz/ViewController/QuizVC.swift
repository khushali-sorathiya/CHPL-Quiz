//
//  QuizVC.swift
//  CHPL Quiz
//
//  Created by Krupesh Savaliya on 08/04/24.
//

import UIKit

class QuizVC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!{
        didSet {
            btnBack.setTitle("", for: .normal)
        }
    }
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblquestionNumber: UILabel!
    @IBOutlet weak var clvQuestion: UICollectionView!{
        didSet {
            clvQuestion.delegate = self
            clvQuestion.dataSource = self
        }
    }
    @IBOutlet weak var btnPrevious: UIButton!{
        didSet {
            btnPrevious.setTitle("", for: .normal)
            btnPrevious.isHidden = true
        }
    }
    @IBOutlet weak var btnNext: UIButton!{
        didSet {
            btnNext.setTitle("", for: .normal)
        }
    }
    @IBOutlet weak var btnSubmit: UIButton!{
        didSet {
            btnSubmit.isHidden = true
        }
    }
    
    
    var currentQuestion = 1
    var arrQuestion = [Question]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clvQuestion.register(UINib(nibName: "QuizQuestionCC", bundle: nil), forCellWithReuseIdentifier: "QuizQuestionCC")
        // Do any additional setup after loading the view.
        
      
        NotificationCenter.default.addObserver(self, selector: #selector(self.receiveNotification(_:)), name: NSNotification.Name("answerSelect"), object: nil)
        
        clvQuestion.reloadData()
    }
    

    static var storyboardInstance: QuizVC {
        return StoryBoard.main.instantiateViewController(withIdentifier: QuizVC.identifier) as! QuizVC
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnPreviousAction(_ sender: Any) {
        if currentQuestion > 1 {
            currentQuestion -= 1
            btnNext.isHidden = false
            lblquestionNumber.text = "Question \(currentQuestion) of 10"
            clvQuestion.scrollToItem(at: IndexPath(row: currentQuestion - 1, section: 0), at: .right, animated: true)
        }
        if currentQuestion == 1 {
            btnPrevious.isHidden = true
        }else {
            btnPrevious.isHidden = false
        }
        
        if currentQuestion == 10 {
            btnSubmit.isHidden = false
        }else {
            btnSubmit.isHidden = true
        }
    }
    
    
    @IBAction func btnNextAction(_ sender: Any) {
        if currentQuestion < 10 {
            currentQuestion += 1
            btnPrevious.isHidden = false
            lblquestionNumber.text = "Question \(currentQuestion) of 10"
            if currentQuestion == 10 {
                btnSubmit.isHidden = false
            }else {
                btnSubmit.isHidden = true
            }
            clvQuestion.scrollToItem(at: IndexPath(row: currentQuestion - 1, section: 0), at: .left, animated: true)
        }
        if currentQuestion == 10 {
            btnNext.isHidden = true
        }else {
            btnNext.isHidden = false
        }
    }
    
    @IBAction func btnSubmitAction(_ sender: Any) {
        let vc = ResultVC.storyboardInstance
        vc.arrQuestion = arrQuestion
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func receiveNotification(_ notification: Notification?) {
        if let dict = notification?.userInfo as? [String:Any] {
            if let answer = dict["answer"] as? String {
                self.arrQuestion[currentQuestion - 1].selectAnswer = answer
            }
         }
    }
    
    
    
    
}


extension QuizVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrQuestion.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath)
        let cell = clvQuestion.dequeueReusableCell(withReuseIdentifier: "QuizQuestionCC", for: indexPath) as! QuizQuestionCC
        cell.cellData = arrQuestion[indexPath.row]
        print(cell.cellData?.question)
        return cell
    }
    
    
    //MARK: UICollectionViewDelegateFlowLayout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: clvQuestion.frame.size.width, height: clvQuestion.frame.size.height)
       // return CGSize(width:UIScreen.screenWidth , height: (UIScreen.screenHeight * 0.7))
    }
    
    
}
