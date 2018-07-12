//
//  UIViewExt.swift
//  breakPointApp
//
//  Created by mohamed zead on 7/11/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit

extension UIView{
    
    func bindToKeyBoard(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keyboardWillChange(_ notification :NSNotification){
       
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curveAnimation = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let startFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey]as! NSValue).cgRectValue
        let deltaY = endFrame.origin.y - startFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue : curveAnimation), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
}
