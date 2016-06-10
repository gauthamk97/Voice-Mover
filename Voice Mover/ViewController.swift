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
    @IBOutlet var MainView: UIView!
    @IBOutlet weak var ResultLabel: UILabel!
    
    var MidX:CGFloat = 0
    var MidY:CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        MidX = CGRectGetMidX(MainView.frame)
        MidY = CGRectGetMidY(MainView.frame)
        
        //For debugging purposes
        print(MidX)
        print(MidY)
        
        self.BlackSquare.center = CGPoint(x: MidX, y: MidY)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnClickDirectionButton(sender: AnyObject) {
        
        if sender.currentTitle == "Up" {
            self.MidY -= 10
        }
        
        else if sender.currentTitle == "Right" {
            self.MidX += 10
        }
        
        else if sender.currentTitle == "Down" {
            self.MidY += 10
        }
        
        else if sender.currentTitle == "Left" {
            self.MidX -= 10
        }
        
        self.BlackSquare.center = CGPoint(x: self.MidX, y: self.MidY)
        
        //For debugging purposes
        print (self.BlackSquare.frame.midX)
        
    }

    @IBAction func OnClickRecord(sender: AnyObject) {
        
        self.RecordButton.setTitle("Listening", forState: UIControlState.Normal)
        
        //For Debugging
        self.BlackSquare.center = CGPoint(x: self.MidX, y: self.MidY)
        
        let session = SKSession(URL: NSURL(string: "nmsps://NMDPTRIAL_tajy_many_gmail_com20160421150722@sslsandbox.nmdp.nuancemobility.net:443"), appToken: "25758f3a7d733d7c677a3b52fa0126199a329054d5e92f823bdf44aedf413904b6c83f343b7cb0a2f6ebf5f1ec1b0a874d9adb23840aa5bfe9e96dc92aa7cde0")
        
        //On Debugging, it was found that the screen resets itself when it undergoes the following command.
        session.recognizeWithType(SKTransactionSpeechTypeDictation,
                                  detection: .Short,
                                  language: "eng-USA",
                                  delegate: self)
        
    }
    
    func transaction(transaction: SKTransaction!, didReceiveRecognition recognition: SKRecognition!) {
        
        self.ResultLabel.text = recognition.text
        
        //For Debugging purposes
        print(self.MidX)
        
        if recognition.text == "Up" {
            self.MidY -= 10
        }
            
        else if ResultLabel.text! == "Right" {
            //For Debugging purposes
            print("I'm in")
            self.MidX += 100
        }
            
        else if recognition.text == "Down" {
            self.MidY += 10
        }
            
        else if recognition.text == "Left" {
            self.MidX -= 10
        }
        
        self.BlackSquare.center = CGPoint(x: MidX, y: MidY)
        
        //More Debugging attempts
        print(self.MidX)
        
        self.RecordButton.setTitle("Start Listening", forState: UIControlState.Normal)
        
        //To check what the system recorded
        print(self.ResultLabel.text!)
        
        
    }
}

