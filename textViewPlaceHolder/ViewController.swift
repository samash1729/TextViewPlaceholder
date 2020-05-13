//
//  ViewController.swift
//  textViewplaceHolderBool
//
//  Created by Ashish Samanta on 25/04/20.
//  Copyright © 2020 Nuclei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var placeHolderBool:Bool = true
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        placeHolderBool = true
        textView.delegate = self
        textView.attributedText = NSAttributedString.init(string: "Tell us why you want to cancel" , attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0),NSAttributedString.Key.foregroundColor : UIColor.gray])
        textView.becomeFirstResponder()
    }


}


extension ViewController : UITextViewDelegate{
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if placeHolderBool == true{
            textView.selectedRange = NSMakeRange(0,0)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if placeHolderBool == true{
            textView.selectedRange = NSMakeRange(0, 0)
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        if placeHolderBool == true{
             placeHolderBool = false
            let completeText = textView.text!
            if completeText.count > 0{
                let selectedText = Array(completeText)
                textView.attributedText = NSAttributedString.init(string: String(selectedText[0]), attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0),NSAttributedString.Key.foregroundColor : UIColor.black])
            }
        }
        
        if textView.text == ""{
            placeHolderBool = true
            textView.attributedText = NSAttributedString.init(string: "Tell us why you want to cancel" , attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0),NSAttributedString.Key.foregroundColor : UIColor.gray])
        }
    }
}
