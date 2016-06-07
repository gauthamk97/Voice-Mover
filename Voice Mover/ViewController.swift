//
//  ViewController.swift
//  Voice Mover
//
//  Created by Gautham Kumar on 07/06/16.
//  Copyright © 2016 Gautham Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BlackSquare: UIImageView!
    
    @IBOutlet var MainView: UIView!
    
    var MinX:CGFloat = 0
    var MinY:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        MinX = CGRectGetMidX(MainView.frame) - 40
        MinY = CGRectGetMidY(MainView.frame) - 40
        
        BlackSquare.frame = CGRect(x: self.MinX, y: self.MinY, width: 80, height: 80)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnClickDirectionButton(sender: AnyObject) {
        
        if sender.currentTitle == "Up" {
            MinY -= 10
        }
        
        else if sender.currentTitle == "Right" {
            MinX += 10
        }
        
        else if sender.currentTitle == "Down" {
            MinY += 10
        }
        
        else if sender.currentTitle == "Left" {
            MinX -= 10
        }
        
        BlackSquare.frame = CGRect(x: self.MinX, y: self.MinY, width: 80, height: 80)
        
    }

}

