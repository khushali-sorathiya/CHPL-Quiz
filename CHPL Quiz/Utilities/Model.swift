//
//  Model.swift
//  CHPL Quiz
//
//  Created by Krupesh Savaliya on 08/04/24.
//

import Foundation




class Question {
    
    var id : String
    var question : String
    var ans1 : String
    var ans2 : String
    var ans3 : String
    var ans4 : String
    var ans5 : String
    var answer : String
    var status : String
    var selectAnswer : String
   
    /*
     {
     "id": "99",
     "question": "What should a diabetic do to track his/her health?",
     "ans1": "Keep a daily log of blood pressure and blood sugar",
     "ans2": "Keep a consistent meal schedule",
     "ans3": "Consult your pharmacist for some herbal or OTC supplements for good
     health",
     "ans4": "All of the above",
     "ans5": "",
     "correct": "ans4",
     "added_date": "2017-04-08 18:45:47",
     "modified_date": "0000-00-00 00:00:00",
     "status": "Active"
     }

     */
    
    init(dict: [String:Any]) {
        id = dict["id"] as? String ?? ""
        question = dict["question"] as? String ?? ""
        ans1 = dict["ans1"] as? String ?? ""
        ans2 = dict["ans2"] as? String ?? ""
        ans3 = dict["ans3"] as? String ?? ""
        ans4 = dict["ans4"] as? String ?? ""
        ans5 = dict["ans5"] as? String ?? ""
        answer = dict["correct"] as? String ?? ""
        status = dict["status"] as? String ?? ""
        selectAnswer = dict["selectAnswer"] as? String ?? ""
    }
}
