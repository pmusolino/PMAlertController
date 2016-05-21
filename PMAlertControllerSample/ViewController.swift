//
//  ViewController.swift
//  PMAlertController
//
//  Created by Paolo Musolino on 07/05/16.
//  Copyright © 2016 Codeido. All rights reserved.
//

import UIKit
import PMAlertController

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func showAlert(sender: AnyObject) {
        
        let alertVC = PMAlertController(title: "Locate your device", description: "Enables access to your location: discover what you can do when you're traveling and what is available near you.", image: UIImage(named: "flag.png"), style: .Alert) //Image by freepik.com, taken on flaticon.com

        alertVC.addAction(PMAlertAction(title: "Cancel", style: .Cancel, action: { () -> Void in
            print("Cancel")
        }))
        
        alertVC.addAction(PMAlertAction(title: "Allow", style: .Default, action: { () in
            print("Allow")
        }))
        
        self.presentViewController(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func showWalkthrough(sender: AnyObject) {
        
        let alertVC = PMAlertController(title: "Locate your device", description: "Enables access to your location: discover what you can do when you're traveling and what is available near you.", image: UIImage(named: "flag.png"), style: .Walkthrough) //Image by freepik.com, taken on flaticon.com
        
        alertVC.addAction(PMAlertAction(title: "Cancel", style: .Cancel, action: { () -> Void in
            print("Cancel")
        }))
        
        alertVC.addAction(PMAlertAction(title: "Allow", style: .Default, action: { () in
            print("Allow")
        }))
        
        self.presentViewController(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func showAlertWith3Buttons(sender: AnyObject) {
        
        let alertVC = PMAlertController(title: "Locate your device", description: "Enables access to your location: discover what you can do when you're traveling and what is available near you.", image: UIImage(named: "flag.png"), style: .Alert) //Image by freepik.com, taken on flaticon.com
        
        alertVC.addAction(PMAlertAction(title: "Cancel", style: .Cancel, action: { () -> Void in
            print("Cancel")
        }))
        
        alertVC.addAction(PMAlertAction(title: "No Thanks", style: .Cancel, action: { () in
            print("No thanks")
        }))
        
        alertVC.addAction(PMAlertAction(title: "Allow", style: .Default, action: { () in
            print("Allow")
        }))
        
        self.presentViewController(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func showWalkthroughWith3Buttons(sender: AnyObject) {
        let alertVC = PMAlertController(title: "Locate your device", description: "Enables access to your location: discover what you can do when you're traveling and what is available near you.", image: UIImage(named: "flag.png"), style: .Walkthrough) //Image by freepik.com, taken on flaticon.com
        
        alertVC.addAction(PMAlertAction(title: "Cancel", style: .Cancel, action: { () -> Void in
            print("Cancel")
        }))
        
        alertVC.addAction(PMAlertAction(title: "No Thanks", style: .Cancel, action: { () in
            print("No thanks")
        }))
        
        alertVC.addAction(PMAlertAction(title: "Allow", style: .Default, action: { () in
            print("Allow")
        }))
        
        self.presentViewController(alertVC, animated: true, completion: nil)
    }
}