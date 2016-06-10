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
    
    @IBOutlet weak var BlackSquare: UIImageView!
    @IBOutlet weak var RecordButton: UIButton!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var YConstraint: NSLayoutConstraint!
    @IBOutlet weak var XConstraint: NSLayoutConstraint!

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
            self.YConstraint.constant -= 10
        }
            
        else if ResultLabel.text! == "Right" {
            self.XConstraint.constant += 10
        }
            
        else if recognition.text == "Down" {
            self.YConstraint.constant += 10
        }
            
        else if recognition.text == "Left" {
            self.XConstraint.constant -= 10
        }
        
        self.RecordButton.setTitle("Start Listening", forState: UIControlState.Normal)
    
    }
        
    
}

