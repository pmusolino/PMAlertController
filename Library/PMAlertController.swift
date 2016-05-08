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
    @IBOutlet weak var alertActionStackView: UIStackView!
    @IBOutlet weak var alertStackViewHeightConstraint: NSLayoutConstraint!
    var ALERT_STACK_VIEW_HEIGHT : CGFloat = 62
    
   // private var actions : [PMAlertAction] = []
    
    public convenience init(title: String, description: String, image: UIImage?) {
        self.init()
        
        let nib = NSBundle.mainBundle().loadNibNamed("PMAlertController", owner: self, options: nil)
        self.view = nib[0] as! UIView
        
        self.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        
    
        (image != nil) ? (self.alertImage.image = image) : (alertImageHeightConstraint.constant = 0)
        self.alertTitle.text = title
        self.alertDescription.text = description
    }
    
    public func addAction(action: PMAlertAction){
        alertActionStackView.addArrangedSubview(action)
        
        if alertActionStackView.arrangedSubviews.count > 2{
            alertStackViewHeightConstraint.constant = ALERT_STACK_VIEW_HEIGHT * CGFloat(alertActionStackView.arrangedSubviews.count)
            alertActionStackView.axis = .Vertical
        }
        else{
            alertActionStackView.axis = .Horizontal
        }
    }
    
}
