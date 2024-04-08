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
    
    var arrQuestion = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    static var storyboardInstance: HomeVC {
        return StoryBoard.main.instantiateViewController(withIdentifier: HomeVC.identifier) as! HomeVC
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
    
            } else {
              
            }
          }
        }

        task.resume()
    }

    @IBAction func btnStartQuizAction(_ sender: UIButton) {
        if arrQuestion.count > 0 {
            let vc = QuizVC.storyboardInstance
            vc.arrQuestion = arrQuestion
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
