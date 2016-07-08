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
        print(animatedImage.center.x)
        print(animatedImage.center.y)
        
    }
    
    //This method is called upon button clicked
    func doAnimation() {
        
        //To determine what the counter's value should be on every iteration of the timer
        if counter == 5 {
            counter = 1
        }else {
            counter += 1
        }
        
        //Update the image based on the counter's value
        animatedImage.image = UIImage(named: "frame\(counter).png")
        
        if animatedImage.center.x < 250 && animatedImage.center.y == 105 {
            animatedImage.center.x += 2
        }else if animatedImage.center.x == 250 && animatedImage.center.y < 500 {
            animatedImage.center.y += 5
        }else if animatedImage.center.y == 500 && animatedImage.center.x > 60 {
            animatedImage.center.x -= 2
        }else {
            animatedImage.center.y -= 5
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //To set the titel and color of the button's text
        animateButton.setTitleColor(UIColor.greenColor(), forState: .Normal)
        
    }
    
    //This method is called right before the view is displayed
    override func viewDidLayoutSubviews() {
        
        //Change the position of the image and make its height and width invisible
        animatedImage.frame = CGRectMake(10, 30, 100, 150)
        
    }

    override func viewDidAppear(animated: Bool) {
        
        //Bring back the image in 1 second when view appears and place it back in its original position
        UIView.animateWithDuration(1) {
            
            //Reset the x and y coordinates along with the height and width of the image to its original frame(size & position)
            self.animatedImage.frame = CGRectMake(40, 74, 240, 240)

        }
        print(animatedImage)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

