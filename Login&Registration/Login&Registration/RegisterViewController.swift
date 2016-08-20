//
//  RegisterViewController.swift
//  Login&Registration
//
//  Created by BridgeLabz on 16/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController,UITextFieldDelegate
{
    //object of Controller
    var controllerObj = Controller()
    
    //outlet of button
    @IBOutlet weak var mybutton: UIButton!
    
    //outlet of username textfield
    @IBOutlet weak var textUsername: UITextField!
    
    //outlet of password textfield
    @IBOutlet weak var textPassword: UITextField!

    //outlet of confirm password textfield
    @IBOutlet weak var textConfirmPassword: UITextField!
    
    
    //if textfields are filled then only button is enabled
    func textFieldDidEndEditing(textField: UITextField)
    {
        
        if (textUsername.text?.characters.count > 7) && (textPassword.text?.characters.count > 7) && (textConfirmPassword.text?.characters.count > 7)
        {
            //enabling button
            self.mybutton.enabled = true
        }
        else
        {
            //disabling button
            self.mybutton.enabled = false
        }
    }

    //action on click of submit button
    @IBAction func SubmitPressed(sender: UIButton)
    {
        //getting username
        let userName = textUsername.text
        
        //getting password
        let userPassword = textPassword.text
        
        //getting confirm password
        let userConfirmPassword = textConfirmPassword.text
    
        //Checking for empty fields
        if (userName!.isEmpty || userPassword!.isEmpty || userConfirmPassword!.isEmpty)
        {
            
            //displaying alert message
            self.displayMyAlertMessage("All fields are required")
            
        }
        
        //checking username length has to be minimum 8
        if (userName?.characters.count < 8)
        {
            //displaying alert message
            self.displayMyAlertMessage("Username has to be minimum length 8")
            
        }
        
        //checking for password match
        if (userPassword != userConfirmPassword)
        {
            //displaying alert message
            self.displayMyAlertMessage("Passwords do not match")
            
        }
        
        //checking password validation using regex
        if((userPassword) != nil)
        {
            //regex pattern implementation
            let regex = try! NSRegularExpression(pattern:"^(?=.*[A-Z])(?=.*?[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,}$" , options:[ ])
            
            //replacing string if regex pattern matched
            let str = regex.stringByReplacingMatchesInString(userPassword!, options:[ ], range: NSMakeRange(0, userPassword!.characters.count), withTemplate: "matched")
            
            if str == "matched"
            {
                //save data in plist
               controllerObj.savePlistData(userName!, userPassword: userPassword!)
                return
            }
            else
            {
                //displaying alert message
                self.displayMyAlertMessage("Password is not in expected format")
               
                /*print("ssssss")
                NSNotificationCenter.defaultCenter().addObserver(self,
                    selector: "didChangePreferredContentSize:",
                    name: UIContentSizeCategoryDidChangeNotification,
                    object :nil)

                let nc = NSNotificationCenter.defaultCenter()
                nc.postNotificationName("MyNotification",
                    object: nil,
                    userInfo: ["message":"Hello there!", "date":NSDate()])

                print("hhhhhh")
                */
            }

        }
    }
    
    
    /*
    func didChangePreferredContentSize(notification: NSNotification) {
        print("hi, wrong format")
        return
    }
    */
    
    //hiding keypad on return
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    //showing some alert message
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

        self.textUsername.delegate = self
        self.textPassword.delegate = self
        self.textConfirmPassword.delegate = self
        
        //disabling button
        mybutton.enabled = false
        
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
