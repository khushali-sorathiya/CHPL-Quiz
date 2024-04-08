//
//  Extension.swift
//  CHPL Quiz
//
//  Created by Krupesh Savaliya on 08/04/24.
//

import Foundation
import UIKit


extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    
}

extension UIScreen {
    
    class var screenWidth: CGFloat {
        get {
            if UIInterfaceOrientation.portrait.isPortrait {
                return UIScreen.main.bounds.size.width
            } else {
                return UIScreen.main.bounds.size.height
            }
        }
    }
    
    class var screenHeight: CGFloat {
        get {
            if UIInterfaceOrientation.portrait.isPortrait {
                return UIScreen.main.bounds.size.height
            } else {
                return UIScreen.main.bounds.size.width
            }
        }
    }
}
