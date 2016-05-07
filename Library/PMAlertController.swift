//
//  PMAlertController.swift
//  PMAlertController
//
//  Created by Paolo Musolino on 07/05/16.
//  Copyright © 2016 Codeido. All rights reserved.
//

import UIKit

public class PMAlertController: UIViewController {
    
    
    @IBOutlet weak var alertMaskBackground: UIImageView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertImage: UIImageView!
    @IBOutlet weak var alertImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var alertDescription: UILabel!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public convenience init(title: String, description: String, image: UIImage?) {
        self.init()
        
        let nib = NSBundle.mainBundle().loadNibNamed("PMAlertController", owner: self, options: nil)
        self.view = nib[0] as! UIView
        
        self.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        
    
        (image != nil) ? (self.alertImage.image = image) : (alertImageHeightConstraint.constant = 0)
        self.alertTitle.text = title
        self.alertDescription.text = description
        
    }
    
    
}
