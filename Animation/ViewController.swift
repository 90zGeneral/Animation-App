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
        
        //Execute only if animationStopped is true
        if animationStopped {

            //Timer will continuously repeat the process of calling the doAnimation method every 0.2 seconds
            timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(self.doAnimation), userInfo: nil, repeats: true)
            
            //Update the title and color of the button's text
            self.animateButton.setTitle("Stop", forState: .Normal)
            self.animateButton.setTitleColor(UIColor.redColor(), forState: .Normal)
            
            animationStopped = false
         
        }else {
            
            //Stop the timer
            timer.invalidate()
            
            self.animateButton.setTitle("Animate", forState: .Normal)
            self.animateButton.setTitleColor(UIColor.greenColor(), forState: .Normal)
            
            animationStopped = true
            
        }
        
    }
    
    //This method corresponds to the timer
    func doAnimation() {
        
        //To determine what the counter's value should be on every iteration of the timer
        if counter == 5 {
            counter = 1
        }else {
            counter += 1
        }

        //Update the image based on the counter's value
        animatedImage.image = UIImage(named: "frame\(counter).png")

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //To set the titel and color of the button's text
        animateButton.setTitleColor(UIColor.greenColor(), forState: .Normal)
        
    }

    override func viewDidAppear(animated: Bool) {
        
        //Change the position of the image and make its height and width invisible
        animatedImage.frame = CGRectMake(10, 30, 0, 0)
        
        //Fade in the image from top left corner in 1 second when view appears and place it back in its original position
        UIView.animateWithDuration(1) {
            
            //Reset the x and y coordinates along with the height and width of the image to its original frame(size & position)
            self.animatedImage.frame = CGRectMake(40, 74, 240, 240)

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

