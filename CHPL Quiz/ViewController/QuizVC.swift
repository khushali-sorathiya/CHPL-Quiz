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
        
        getData()
    }
    

    static var storyboardInstance: QuizVC {
        return StoryBoard.main.instantiateViewController(withIdentifier: QuizVC.identifier) as! QuizVC
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnPreviousAction(_ sender: Any) {
        print("call.....")
        if currentQuestion > 1 {
            currentQuestion -= 1
            lblquestionNumber.text = "Question \(currentQuestion) of 10"
            clvQuestion.scrollToItem(at: IndexPath(row: currentQuestion - 1, section: 0), at: .left, animated: false)
            self.clvQuestion.reloadData()
        }
        if currentQuestion == 10 {
            btnSubmit.isHidden = false
        }else {
            btnSubmit.isHidden = true
        }
    }
    
    
    @IBAction func btnNextAction(_ sender: Any) {
        print("call...")
        if currentQuestion < 10 {
            currentQuestion += 1
            lblquestionNumber.text = "Question \(currentQuestion) of 10"
            if currentQuestion == 10 {
                btnSubmit.isHidden = false
            }else {
                btnSubmit.isHidden = true
            }
            clvQuestion.scrollToItem(at: IndexPath(row: currentQuestion - 1, section: 0), at: .right, animated: false)
        }
    }
    
    @IBAction func btnSubmitAction(_ sender: Any) {
        self.navigationController?.pushViewController(ResultVC.storyboardInstance, animated: true)
    }
    
    func getData() {
        let url = URL(string: "https://dev.my-company.app/demo.json")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
          if let error = error {
            // handle the error
          } else if let data = data, let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                let responce = String(data:data, encoding: .utf8)!
               
                do {

                    let parsedData = try JSONSerialization.jsonObject(with: data) as! [[String:Any]]
                    for i in parsedData {
                        
                            self.arrQuestion.append(Question(dict: i))
                            if self.arrQuestion.count == 10 {
                                
                                print(self.arrQuestion)
                                break
                            }
                       
                                            
                                        }
                    
                    } catch let error as NSError {
                      print(error)
                    }
    
                self.clvQuestion.reloadData()
            } else {
              
            }
          }
        }

        task.resume()
    }
    
    
}


extension QuizVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvQuestion.dequeueReusableCell(withReuseIdentifier: "QuizQuestionCC", for: indexPath) as! QuizQuestionCC
        cell.cellData = arrQuestion[indexPath.row]
        return cell
    }
    
    
    //MARK: UICollectionViewDelegateFlowLayout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: clvQuestion.frame.size.width, height: clvQuestion.frame.size.height)
       // return CGSize(width:UIScreen.screenWidth , height: (UIScreen.screenHeight * 0.7))
    }
    
    
}
