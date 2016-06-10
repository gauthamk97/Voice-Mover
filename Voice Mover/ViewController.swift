//
//  ViewController.swift
//  Voice Mover
//
//  Created by Gautham Kumar on 07/06/16.
//  Copyright © 2016 Gautham Kumar. All rights reserved.
//

import UIKit
import SpeechKit

class ViewController: UIViewController, SKTransactionDelegate {
    
    @IBOutlet weak var Drawable: UIImageView!
    @IBOutlet weak var RecordButton: UIButton!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var YConstraint: NSLayoutConstraint!
    @IBOutlet weak var XConstraint: NSLayoutConstraint!
    @IBOutlet weak var WidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var HeightConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnClickRecord(sender: AnyObject) {
        
        self.RecordButton.setTitle("Listening", forState: UIControlState.Normal)
        
        let session = SKSession(URL: NSURL(string: "nmsps://NMDPTRIAL_tajy_many_gmail_com20160421150722@sslsandbox.nmdp.nuancemobility.net:443"), appToken: "25758f3a7d733d7c677a3b52fa0126199a329054d5e92f823bdf44aedf413904b6c83f343b7cb0a2f6ebf5f1ec1b0a874d9adb23840aa5bfe9e96dc92aa7cde0")
        
        //On Debugging, it was found that the screen resets itself when it undergoes the following command.
        session.recognizeWithType(SKTransactionSpeechTypeDictation,
                                  detection: .Short,
                                  language: "eng-USA",
                                  delegate: self)
        
    }
    
    func transaction(transaction: SKTransaction!, didReceiveRecognition recognition: SKRecognition!) {
        
        //To Check what the system recorded
        self.ResultLabel.text = recognition.text
        
        if recognition.text == "Up" {
            if CGRectGetMinY(self.Drawable.frame) < 20 {
                self.ResultLabel.text = "Cannot move image any more up"
            }
            else {
                self.YConstraint.constant -= 20
            }
        }
            
        else if ResultLabel.text! == "Right" {
            if CGRectGetMaxX(self.Drawable.frame) > (CGRectGetMaxX(view.frame) - 20) {
                self.ResultLabel.text = "Cannot move image any more right"
            }
            else {
                self.XConstraint.constant += 20
            }
        }
            
        else if recognition.text == "Down" {
            if CGRectGetMaxY(self.Drawable.frame) > (CGRectGetMaxY(view.frame) - 20) {
                self.ResultLabel.text = "Cannot move image any more down"
            }
            else {
                self.YConstraint.constant += 20
            }
        }
            
        else if recognition.text == "Left" {
            if CGRectGetMinX(self.Drawable.frame) < 20 {
                self.ResultLabel.text = "Cannot move image any more left"
            }
            else {
                self.XConstraint.constant -= 20
            }
        }
        
        //Shape changing not working (View keeps setting to original view after recording)
        else if recognition.text == "Circle" {
            print("In Circle")
            self.Drawable.image = UIImage(named: "circle")
        }
        
        else if recognition.text == "Bigger" {
            self.WidthConstraint.constant += 30
            self.HeightConstraint.constant += 30
        }
        
        else if recognition.text == "Smaller" {
            self.WidthConstraint.constant -= 30
            self.HeightConstraint.constant -= 30
        }
        
        self.RecordButton.setTitle("Start Listening", forState: UIControlState.Normal)
    
    }
        
    
}

