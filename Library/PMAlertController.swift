//
//  PMAlertController.swift
//  PMAlertController
//
//  Created by Paolo Musolino on 07/05/16.
//  Copyright © 2016 Codeido. All rights reserved.
//

import UIKit

@objc public enum PMAlertControllerStyle : Int {
    case Alert // The alert will adopt a width of 270 (like UIAlertController).
    case Walkthrough //The alert will adopt a width of the screen size minus 18 (from the left and right side). This style is designed to accommodate localization, push notifications and more.
}

@objc public class PMAlertController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak public var alertMaskBackground: UIImageView!
    @IBOutlet weak public var alertView: UIView!
    @IBOutlet weak public var alertViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak public var alertImage: UIImageView!
    @IBOutlet weak public var alertImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak public var alertTitle: UILabel!
    @IBOutlet weak public var alertDescription: UILabel!
    @IBOutlet weak public var alertActionStackView: UIStackView!
    @IBOutlet weak private var alertStackViewHeightConstraint: NSLayoutConstraint!
    public var ALERT_STACK_VIEW_HEIGHT : CGFloat = UIScreen.mainScreen().bounds.height < 568.0 ? 40 : 62 //if iphone 4 the stack_view_height is 40, else 62
    var animator : UIDynamicAnimator?
    
    public var gravityDismissAnimation = true
    
    
    //MARK: - Initialiser
    @objc public convenience init(title: String, description: String, image: UIImage?, style: PMAlertControllerStyle) {
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
    
    //MARK: - Actions
    @objc public func addAction(alertAction: PMAlertAction){
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
    
    @objc private func dismissAlertController(sender: PMAlertAction){
        self.animateDismissWithGravity(sender.actionStyle)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - Customizations
    @objc private func setShadowAlertView(){
        alertView.layer.masksToBounds = false
        alertView.layer.shadowOffset = CGSizeMake(0, 0)
        alertView.layer.shadowRadius = 8
        alertView.layer.shadowOpacity = 0.3
    }
    
    @objc private func loadNibAlertController() -> [AnyObject]?{
        let podBundle = NSBundle(forClass: self.classForCoder)
        
        if let bundleURL = podBundle.URLForResource("PMAlertController", withExtension: "bundle") {
            
            if let bundle = NSBundle(URL: bundleURL) {
                return bundle.loadNibNamed("PMAlertController", owner: self, options: nil)
            }
            else {
                assertionFailure("Could not load the bundle")
            }
            
        }
        else if let nib = podBundle.loadNibNamed("PMAlertController", owner: self, options: nil) {
            return nib
        }
        else{
            assertionFailure("Could not create a path to the bundle")
        }
        return nil
    }
    
    //MARK: - Animations
    
    @objc private func animateDismissWithGravity(style: PMAlertActionStyle){
        if gravityDismissAnimation == true{
            var radian = M_PI
            if style == .Default {
                radian = 2 * M_PI
            }else{
                radian = -2 * M_PI
            }
            animator = UIDynamicAnimator(referenceView: self.view)
            
            let gravityBehavior = UIGravityBehavior(items: [alertView])
            gravityBehavior.gravityDirection = CGVectorMake(0, 10)
            
            animator?.addBehavior(gravityBehavior)
            
            let itemBehavior = UIDynamicItemBehavior(items: [alertView])
            itemBehavior.addAngularVelocity(CGFloat(radian), forItem: alertView)
            animator?.addBehavior(itemBehavior)
        }
    }
}
