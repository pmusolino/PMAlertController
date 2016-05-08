//
//  ViewController.swift
//  PMAlertController
//
//  Created by Paolo Musolino on 07/05/16.
//  Copyright © 2016 Codeido. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        let alertController =  UIAlertController(title: "IBI16", message: "Ciao", preferredStyle: UIAlertControllerStyle.Alert)
//        
//        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action) -> Void in
//            //completion()
//        }
//        let okAction2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action) -> Void in
//            //completion()
//        }
//        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
//            //cancel()
//        }
//        
//        let cancelAction2 = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Destructive) { (action) -> Void in
//            //cancel()
//        }
//        
//        alertController.addAction(okAction)
//        alertController.addAction(okAction2)
//        alertController.addAction(cancelAction)
//        alertController.addAction(cancelAction2)
        
      //  self.presentViewController(alertController, animated: true, completion: nil)
        
        let alertVC = PMAlertController(title: "Locate your device", description: "Enables access to your location: discover what you can do when you're traveling and what is available near you.", image: UIImage(named: "flag.png")) //Image by freepik.com, taken on flaticon.com
        
        
        alertVC.addAction(PMAlertAction(title: "Cancel", style: PMAlertActionStyle.Cancel, handler: { (alert) in
            
        }))
        
        
        alertVC.addAction(PMAlertAction(title: "Allow", style: PMAlertActionStyle.Default, handler: { (alert) in
            
        }))
        
//        alertVC.addAction(PMAlertAction(title: "No Thanks", style: PMAlertActionStyle.Default, handler: { (alert) in
//            
//        }))
        
        
        
        self.presentViewController(alertVC, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

