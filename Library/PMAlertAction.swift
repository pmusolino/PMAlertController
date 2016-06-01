//
//  PMAlertAction.swift
//  PMAlertController
//
//  Created by Paolo Musolino on 07/05/16.
//  Copyright © 2016 Codeido. All rights reserved.
//

import UIKit

@objc public enum PMAlertActionStyle : Int {
    
    case Default
    case Cancel
}

@objc public class PMAlertAction: UIButton {
    
    private var action: (() -> Void)?
    
    public var actionStyle : PMAlertActionStyle
    
    var separator = UIImageView()
    
    init(){
        self.actionStyle = .Cancel
        super.init(frame: CGRectZero)
    }
    
    @objc public convenience init(title: String?, style: PMAlertActionStyle, action: (() -> Void)? = nil){
        self.init()
        
        self.action = action
        self.addTarget(self, action: #selector(PMAlertAction.tapped(_:)), forControlEvents: .TouchUpInside)
        
        self.setTitle(title, forState: UIControlState.Normal)
        self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 17)
        
        self.actionStyle = style
        style == .Default ? (self.setTitleColor(UIColor(red: 191.0/255.0, green: 51.0/255.0, blue: 98.0/255.0, alpha: 1.0), forState: UIControlState.Normal)) : (self.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal))
        
        self.addSeparator()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapped(sender: PMAlertAction) {
        self.action?()
    }
    
    @objc private func addSeparator(){
        separator.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.2)
        self.addSubview(separator)
        
        // Autolayout separator
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        separator.leadingAnchor.constraintEqualToAnchor(self.layoutMarginsGuide.leadingAnchor, constant: 8).active = true
        separator.trailingAnchor.constraintEqualToAnchor(self.layoutMarginsGuide.trailingAnchor, constant: -8).active = true
        separator.heightAnchor.constraintEqualToConstant(1).active = true
    }
    
}