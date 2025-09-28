//
//  UIView+Ext.swift
//  todoApp
//
//  Created by Kerem Saltık on 18.09.2025.
//

import UIKit
/// An extension to provide convenient helper methods for `UIView`.
extension UIView {
    
    /// Sets up layout constraints for a view in a programmatic and concise way.
    ///
    /// This method simplifies the process of creating and activating Auto Layout constraints.
    /// It automatically sets `translatesAutoresizingMaskIntoConstraints` to `false`.
    ///
    /// - Parameters:
    ///   - top: The top anchor to constrain to.
    ///   - left: The left anchor to constrain to.
    ///   - bottom: The bottom anchor to constrain to.
    ///   - right: The right anchor to constrain to.
    ///   - paddingTop: The constant for the top constraint.
    ///   - paddingLeft: The constant for the left constraint.
    ///   - paddingBottom: The constant for the bottom constraint. Note: This value is negated internally.
    ///   - paddingRight: The constant for the right constraint. Note: This value is negated internally.
    ///   - width: The constant for the width constraint, if any.
    ///   - height: The constant for the height constraint, if any.
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil){
                
        // This must be set to false to use Auto Layout constraints programmatically.
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        // The bottom padding is negated because we are constraining from the bottom edge.
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width{
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    /// Adds multiple subviews to the view at once.
    /// - Parameter subviews: A variadic list of `UIView`s to be added.
    func addSubviewsFromExt(_ subviews: UIView...) {
        for view in subviews{
            addSubview(view)
        }
    }
    
    /// A convenience method to set both height and width constraints with a single call.
    /// - Parameters:
    ///   - height: The constant for the height constraint.
    ///   - width: The constant for the width constraint.
    func configSize(height: CGFloat, width: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}
