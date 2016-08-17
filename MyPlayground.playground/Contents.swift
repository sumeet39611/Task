//: Playground - noun: a place where people can play

// password validation using regex
import UIKit

let str = "sumeet11@S"


var regex = try NSRegularExpression(pattern:"^(?=.*[A-Z])(?=.*?[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,}$" , options: [ ])

let str1 = regex.stringByReplacingMatchesInString(str, options:[ ], range: NSMakeRange(0, str.characters.count), withTemplate: "-")

if str1 == "-"
{
    print("hi")
}
else
{
    print("wrg")
}


