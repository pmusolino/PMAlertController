//
//  PMAlertController.swift
//  PMAlertController
//
//  Created by Paolo Musolino on 07/05/16.
//  Copyright © 2016 Codeido. All rights reserved.
//

import UIKit

public enum PMAlertControllerStyle : Int {
    
    case Alert // with this style, the alert has the width of 270, like the UIAlertController of Apple
    case Walkthrough //with walkthrough, the alert has the width of the screen minus 18 from the left and the right bounds. This mode is designed to suggest to the user actions for accept localization, push notifications and more.
}

public class PMAlertController: UIViewController {
    
    
    @IBOutlet weak var alertMaskBackground: UIImageView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var alertImage: UIImageView!
    @IBOutlet weak var alertImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var alertDescription: UILabel!
    @IBOutlet weak var alertActionStackView: UIStackView!
    @IBOutlet weak var alertStackViewHeightConstraint: NSLayoutConstraint!
    var ALERT_STACK_VIEW_HEIGHT : CGFloat = UIScreen.mainScreen().bounds.height < 568.0 ? 40 : 62 //if iphone 4 the stack_view_height is 40, else 62
    
    
    public convenience init(title: String, description: String, image: UIImage?, style: PMAlertControllerStyle) {
        self.init()
        
        let nib = loadNibAlertController()
        if nib != nil{
            self.view = nib![0] as! UIView
        }
        
        self.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        
        alertView.layer.cornerRadius = 5
        (image != nil) ? (alertImage.image = image) : (alertImageHeightConstraint.constant = 0)
        alertTitle.text = title
        alertDescription.text = description
        
        
        //if alert width = 270, else width = screen width - 36
        style == .Alert ? (alertViewWidthConstraint.constant = 270) : (alertViewWidthConstraint.constant = UIScreen.mainScreen().bounds.width - 36)
        
        
        setShadowAlertView()
    }
    
    public func addAction(alertAction: PMAlertAction){
        alertActionStackView.addArrangedSubview(alertAction)
        
        if alertActionStackView.arrangedSubviews.count > 2{
            alertStackViewHeightConstraint.constant = ALERT_STACK_VIEW_HEIGHT * CGFloat(alertActionStackView.arrangedSubviews.count)
            alertActionStackView.axis = .Vertical
        }
        else{
            alertStackViewHeightConstraint.constant = ALERT_STACK_VIEW_HEIGHT
            alertActionStackView.axis = .Horizontal
        }
        
        alertAction.addTarget(self, action: #selector(PMAlertController.dismissAlertController(_:)), forControlEvents: .TouchUpInside)
        
    }
    
    func dismissAlertController(sender: PMAlertAction){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func setShadowAlertView(){
        alertView.layer.masksToBounds = false
        alertView.layer.shadowOffset = CGSizeMake(0, 0)
        alertView.layer.shadowRadius = 8
        alertView.layer.shadowOpacity = 0.3
    }
    
    private func loadNibAlertController() -> [AnyObject]?{
        let podBundle = NSBundle(forClass: self.classForCoder)
        
        if let bundleURL = podBundle.URLForResource("PMAlertController", withExtension: "bundle") {
            
            if let bundle = NSBundle(URL: bundleURL) {
                return bundle.loadNibNamed("PMAlertController", owner: self, options: nil)
            }
            else {
                assertionFailure("Could not load the bundle")
            }
            
        }
        else if let nib = NSBundle.mainBundle().loadNibNamed("PMAlertController", owner: self, options: nil) {
                return nib
        }
        else{
            assertionFailure("Could not create a path to the bundle")
        }
        return nil
    }
}
