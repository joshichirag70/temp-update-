//
//  TextFieldVC.swift
//  TempButton
//
//  Created by Kaira Support on 31/05/17.
//  Copyright © 2017 Kaira Software Pvt Ltd. All rights reserved.
//

import UIKit

class TextFieldVC: UIViewController {

    @IBOutlet weak var txtCount: UITextField!
    @IBOutlet weak var lblCountRequired: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblCountRequired.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClickedSubmit(_ sender: Any) {
        if self.txtCount.text != "" {
            
            let objViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            objViewController.intCountButtons = Int(self.txtCount.text!)!
            self.navigationController?.pushViewController(objViewController, animated: true)
            
        } else {
            self.lblCountRequired.isHidden = false
        }
    }
}

extension TextFieldVC : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = txtCount.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= 2 // Bool
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
