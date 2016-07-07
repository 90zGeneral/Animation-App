//
//  ViewController.swift
//  Animation
//
//  Created by Roydon Jeffrey on 7/5/16.
//  Copyright © 2016 Italyte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var counter = 1
    var animationStopped = true
    
    @IBOutlet var animatedImage: UIImageView!
    
    @IBOutlet var animateButton: UIButton!
    
    @IBAction func animate(sender: AnyObject) {
        
        if animationStopped {
        
            timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(self.doAnimation), userInfo: nil, repeats: true)
            
            self.animateButton.setTitle("Stop", forState: .Normal)
            self.animateButton.setTitleColor(UIColor.redColor(), forState: .Normal)
            
            animationStopped = false
         
        }else {
            
            timer.invalidate()
            
            self.animateButton.setTitle("Animate", forState: .Normal)
            self.animateButton.setTitleColor(UIColor.greenColor(), forState: .Normal)
            
            animationStopped = true
            
        }
        
    }
    
    func doAnimation() {
        
        if counter == 5 {
            counter = 1
        }else {
            counter += 1
        }
        
        animatedImage.image = UIImage(named: "frame\(counter).png")

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.animateButton.setTitleColor(UIColor.greenColor(), forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

