//
//  FormViewController.swift
//  Login&Registration
//
//  Created by BridgeLabz on 16/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class FormViewController: UIViewController
{
    var controllerObj = Controller()
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var surnameTextField: UITextField!
    
    
    @IBOutlet weak var mobileNoTextField: UITextField!
    
    
    @IBAction func submitButtonPressed(sender: UIButton) {
        
        
        if (nameTextField.text!.isEmpty || surnameTextField.text!.isEmpty || mobileNoTextField.text!.isEmpty)
        {
            
            //displaying alert message
            self.displayMyAlertMessage("All fields are required")
            
        }
        else
        {
            controllerObj.savePlistData("Name", userPassword: nameTextField.text!)
            controllerObj.savePlistData("Surname", userPassword: surnameTextField.text!)
            controllerObj.savePlistData("MobileNo", userPassword: mobileNoTextField.text!)
        }
        
        
        
    }
    
    
    func displayMyAlertMessage(userMessage : String)
    {
        //making alert controller with specific message
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        //making OK action
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        //adding action to alert
        myAlert.addAction(okAction)
        
        //adding alert to register view
        self.presentViewController(myAlert, animated: true, completion: nil)
        
        return
        
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
