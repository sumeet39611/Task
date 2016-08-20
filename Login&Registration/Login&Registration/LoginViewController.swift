//
//  LoginViewController.swift
//  Login&Registration
//
//  Created by BridgeLabz on 16/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate{
    
    //object of Controller
    var controllerObj = Controller()

    //outlet of username textfield
    @IBOutlet weak var userNameTextField: UITextField!
    
    //outlet of password textefield
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //action on click of SignIn button
    @IBAction func signInPressed(sender: UIButton)
    {
        
        
        //getting password
       // let pswd : String = controllerObj.readPlistData(userNameTextField.text!)
        
        //getting dictionary
        let data = controllerObj.readPlistData()
        
       // print(data)
        
        if (data.objectForKey(userNameTextField.text!) as? String != nil)
        {
            //getting password
            let pswd : String = data.objectForKey(userNameTextField.text!) as! String
            
            // print(pswd)
           // let keys = (data as NSMutableDictionary).allKeysForObject(pswd) as? String
            
            // print(keys)
        
            if passwordTextField.text != pswd
            {
                //displaying alert message
                self.displayMyAlertMessage("Entered password is wrong")
                
            }
            else
            {
                performSegueWithIdentifier("gotoInfoView", sender: nil)
            }


        }
        
        else
        {
            self.displayMyAlertMessage("please enter valid username or password")
        }
        
    }
    
    //function for alert messaging
    func displayMyAlertMessage(userMessage : String)
    {
        //making alert controller with specific message
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        //making OK action
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        //adding action to alert
        myAlert.addAction(okAction)
        
        //adding alert to Login view
        self.presentViewController(myAlert, animated: true, completion: nil)
        
        return
        
    }
    
    //hiding keypad on return
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.userNameTextField.delegate = self
        self.passwordTextField.delegate = self
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
