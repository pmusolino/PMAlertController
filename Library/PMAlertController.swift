//
//  PMAlertController.swift
//  PMAlertController
//
//  Created by Paolo Musolino on 07/05/16.
//  Copyright © 2016 Codeido. All rights reserved.
//

import UIKit

@objc public enum PMAlertControllerStyle : Int {
    case alert // The alert will adopt a width of 270 (like UIAlertController).
    case walkthrough //The alert will adopt a width of the screen size minus 18 (from the left and right side). This style is designed to accommodate localization, push notifications and more.
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
    @IBOutlet weak public var alertStackViewHeightConstraint: NSLayoutConstraint!
    public var ALERT_STACK_VIEW_HEIGHT : CGFloat = UIScreen.main().bounds.height < 568.0 ? 40 : 62 //if iphone 4 the stack_view_height is 40, else 62
    var animator : UIDynamicAnimator?
    
    public var gravityDismissAnimation = true
    
    
    //MARK: - Initialiser
    @objc public convenience init(title: String, description: String, image: UIImage?, style: PMAlertControllerStyle) {
        self.init()
        let nib = loadNibAlertController()
        if nib != nil{
            self.view = nib![0] as! UIView
        }
        
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        alertView.layer.cornerRadius = 5
        (image != nil) ? (alertImage.image = image) : (alertImageHeightConstraint.constant = 0)
        alertTitle.text = title
        alertDescription.text = description
        
        
        //if alert width = 270, else width = screen width - 36
        style == .alert ? (alertViewWidthConstraint.constant = 270) : (alertViewWidthConstraint.constant = UIScreen.main().bounds.width - 36)
        
        
        setShadowAlertView()
    }
    
    //MARK: - Actions
    @objc public func addAction(_ alertAction: PMAlertAction){
        alertActionStackView.addArrangedSubview(alertAction)
        
        if alertActionStackView.arrangedSubviews.count > 2{
            alertStackViewHeightConstraint.constant = ALERT_STACK_VIEW_HEIGHT * CGFloat(alertActionStackView.arrangedSubviews.count)
            alertActionStackView.axis = .vertical
        }
        else{
            alertStackViewHeightConstraint.constant = ALERT_STACK_VIEW_HEIGHT
            alertActionStackView.axis = .horizontal
        }
        
        alertAction.addTarget(self, action: #selector(PMAlertController.dismissAlertController(_:)), for: .touchUpInside)
        
    }
    
    @objc private func dismissAlertController(_ sender: PMAlertAction){
        self.animateDismissWithGravity(sender.actionStyle)
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Customizations
    @objc private func setShadowAlertView(){
        alertView.layer.masksToBounds = false
        alertView.layer.shadowOffset = CGSize(width: 0, height: 0)
        alertView.layer.shadowRadius = 8
        alertView.layer.shadowOpacity = 0.3
    }
    
    @objc private func loadNibAlertController() -> [AnyObject]?{
        let podBundle = Bundle(for: self.classForCoder)
        
        if let bundleURL = podBundle.urlForResource("PMAlertController", withExtension: "bundle") {
            
            if let bundle = Bundle(url: bundleURL) {
                return bundle.loadNibNamed("PMAlertController", owner: self, options: nil)
            }
            else {
                assertionFailure("Could not load the bundle")
            }
            
        }
        else if let nib = podBundle.loadNibNamed("PMAlertController", owner: self, options: nil) as [AnyObject]?{
            return nib
        }
        else{
            assertionFailure("Could not create a path to the bundle")
        }
        return nil
    }
    
    //MARK: - Animations
    
    @objc private func animateDismissWithGravity(_ style: PMAlertActionStyle){
        if gravityDismissAnimation == true{
            var radian = M_PI
            if style == .default {
                radian = 2 * M_PI
            }else{
                radian = -2 * M_PI
            }
            animator = UIDynamicAnimator(referenceView: self.view)
            
            let gravityBehavior = UIGravityBehavior(items: [alertView])
            gravityBehavior.gravityDirection = CGVector(dx: 0, dy: 10)
            
            animator?.addBehavior(gravityBehavior)
            
            let itemBehavior = UIDynamicItemBehavior(items: [alertView])
            itemBehavior.addAngularVelocity(CGFloat(radian), for: alertView)
            animator?.addBehavior(itemBehavior)
        }
    }
}
