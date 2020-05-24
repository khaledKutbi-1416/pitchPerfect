
//  Design UI Kit.swift
//  pitchPerfect
//
//  Created by Khaled Kutbi on 06/09/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.

import UIKit

@IBDesignable


//MARK: - design template to usit for multiple  component

class RecordLabel: UILabel{
    @IBInspectable var cornerRedius: CGFloat = 0.0 {
                         
     didSet{
        self.backgroundColor = .clear
        self.font = self.font.withSize(14)
        self.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.textAlignment = .center
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
       
        }
    }
}
class navigationMode: UINavigationController {
     @IBInspectable var cornerRedius: CGFloat = 0.0 {
                      
                      didSet{
                        self.navigationBar.barStyle = .black
                        self.navigationItem.backBarButtonItem?.tintColor = .orange
                        if  self.navigationBar.tag == 0{
                            
                            self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) ]
                            self.title = "Record"
                        }
                        
                       
                        UINavigationBar.appearance().tintColor = UIColor.white
                        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
                        
        }
    }
}
class BackGRaoundAppViewColor : UIView{
    @IBInspectable var cornerRedius: CGFloat = 0.0 {
                   
                   didSet{
                    
                    self.backgroundColor = .darkGray
                
                    
        }
    }
    
}

