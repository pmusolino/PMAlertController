//
//  PMAlertController.swift
//  PMAlertController
//
//  Created by Paolo Musolino on 07/05/16.
//  Copyright © 2018 Codeido. All rights reserved.
//

import UIKit

@objc public enum PMAlertControllerStyle : Int {
    case alert // The alert will adopt a width of 270 (like UIAlertController).
    case walkthrough //The alert will adopt a width of the screen size minus 18 (from the left and right side). This style is designed to accommodate localization, push notifications and more.
}

@objc open class PMAlertController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak open var alertMaskBackground: UIImageView!
    @IBOutlet weak open var alertView: UIView!
    @IBOutlet weak open var alertViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak open var headerView: UIView!
    @IBOutlet weak open var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak open var headerViewTopSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak open var alertImage: UIImageView!
    @IBOutlet weak open var alertContentStackView: UIStackView!
    @IBOutlet weak open var alertTitle: UILabel!
    @IBOutlet weak open var alertDescription: UILabel!
    @IBOutlet weak open var alertContentStackViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak open var alertContentStackViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak open var alertContentStackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak open var alertActionStackView: UIStackView!
    @IBOutlet weak open var alertActionStackViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak open var alertActionStackViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak open var alertActionStackViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak open var alertActionStackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak open var alertActionStackViewBottomConstraint: NSLayoutConstraint!
    
    open var ALERT_STACK_VIEW_HEIGHT : CGFloat = UIScreen.main.bounds.height < 568.0 ? 40 : 62 //if iphone 4 the stack_view_height is 40, else 62
    var animator : UIDynamicAnimator?
    
    open var textFields: [UITextField] = []
    
    @objc open var gravityDismissAnimation = true
    @objc open var dismissWithBackgroudTouch = false // enable touch background to dismiss. Off by default.
    
    //MARK: - Lifecycle
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    //MARK: - Initialiser
    @objc public convenience init(title: String?, description: String?, image: UIImage?, style: PMAlertControllerStyle) {
        self.init()
        guard let nib = loadNibAlertController(), let unwrappedView = nib[0] as? UIView else { return }
        self.view = unwrappedView
        
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        alertView.layer.cornerRadius = 5
        (image != nil) ? (alertImage.image = image) : (headerViewHeightConstraint.constant = 0)
        
        if let title = title {
            alertTitle.text = title
        }else{
            alertTitle.isHidden = true
        }
        
        if let description = description {
            alertDescription.text = description
        }else{
            alertDescription.isHidden = true
        }
        
        //if alert width = 270, else width = screen width - 36
        alertViewWidthConstraint.constant = (style == .alert) ? 270 : UIScreen.main.bounds.width - 36
        
        //Gesture recognizer for background dismiss with background touch
        let tapRecognizer: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(dismissAlertControllerFromBackgroundTap))
        alertMaskBackground.addGestureRecognizer(tapRecognizer)
        
        setShadowAlertView()
    }
    
    //MARK: - Actions
    @objc open func addAction(_ alertAction: PMAlertAction){
        alertActionStackView.addArrangedSubview(alertAction)
        
        if alertActionStackView.arrangedSubviews.count > 2 || hasTextFieldAdded(){
            alertActionStackViewHeightConstraint.constant = ALERT_STACK_VIEW_HEIGHT * CGFloat(alertActionStackView.arrangedSubviews.count)
            alertActionStackView.axis = .vertical
        }
        else{
            alertActionStackViewHeightConstraint.constant = ALERT_STACK_VIEW_HEIGHT
            alertActionStackView.axis = .horizontal
        }
        
        alertAction.addTarget(self, action: #selector(PMAlertController.dismissAlertController(_:)), for: .touchUpInside)
    }
    
    @objc fileprivate func dismissAlertController(_ sender: PMAlertAction){
        self.animateDismissWithGravity(sender.actionStyle)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func dismissAlertControllerFromBackgroundTap() {
        if !dismissWithBackgroudTouch {
            return
        }
        
        self.animateDismissWithGravity(.cancel)
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Text Fields
    @objc open func addTextField(textField:UITextField? = nil, _ configuration: (_ textField: UITextField?) -> Void){
        let textField = textField ?? UITextField()
        textField.delegate = self
        textField.returnKeyType = .done
        textField.font = UIFont(name: "Avenir-Heavy", size: 17)
        textField.textAlignment = .center
        configuration (textField)
        _addTextField(textField)
    }
    func _addTextField(_ textField: UITextField){
        alertActionStackView.addArrangedSubview(textField)
        alertActionStackViewHeightConstraint.constant = ALERT_STACK_VIEW_HEIGHT * CGFloat(alertActionStackView.arrangedSubviews.count)
        alertActionStackView.axis = .vertical
        textFields.append(textField)
    }
    
    func hasTextFieldAdded () -> Bool{
        return textFields.count > 0
    }
    
    //MARK: - Customizations
    @objc fileprivate func setShadowAlertView(){
        alertView.layer.masksToBounds = false
        alertView.layer.shadowOffset = CGSize(width: 0, height: 0)
        alertView.layer.shadowRadius = 8
        alertView.layer.shadowOpacity = 0.3
    }
    
    @objc fileprivate func loadNibAlertController() -> [AnyObject]?{
        let podBundle = Bundle(for: self.classForCoder)
        
        if let bundleURL = podBundle.url(forResource: "PMAlertController", withExtension: "bundle"){
            
            if let bundle = Bundle(url: bundleURL) {
                return bundle.loadNibNamed("PMAlertController", owner: self, options: nil) as [AnyObject]?
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
    
    @objc fileprivate func animateDismissWithGravity(_ style: PMAlertActionStyle){
        if gravityDismissAnimation == true{
            var radian = Double.pi
            if style == .default {
                radian = 2 * Double.pi
            }else{
                radian = -2 * Double.pi
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
    
    //MARK: - Keyboard avoiding
    
    var tempFrameOrigin: CGPoint?
    var keyboardHasBeenShown:Bool = false
    
    @objc func keyboardWillShow(_ notification: Notification) {
        keyboardHasBeenShown = true
        
        guard let userInfo = (notification as NSNotification).userInfo else {return}
        guard let endKeyBoardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.minY else {return}
        
        if tempFrameOrigin == nil {
            tempFrameOrigin = alertView.frame.origin
        }
        
        var newContentViewFrameY = alertView.frame.maxY - endKeyBoardFrame
        if newContentViewFrameY < 0 {
            newContentViewFrameY = 0
        }
        alertView.frame.origin.y -= newContentViewFrameY
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        if (keyboardHasBeenShown) { // Only on the simulator (keyboard will be hidden)
            if (tempFrameOrigin != nil){
                alertView.frame.origin.y = tempFrameOrigin!.y
                tempFrameOrigin = nil
            }
            
            keyboardHasBeenShown = false
        }
    }
}

extension PMAlertController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
