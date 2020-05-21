//
//  NutritFont.swift
//  NutritionistView
//
//  Created by Gerardo Mendoza Avas on 20/05/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import UIKit

extension UIFont {
    
    /// Bold font for texts
    /// - Parameter size: The size of the font, by default is 17
    /// * By default the type is Roboto-Bold
    class func bold(ofSize size: CGFloat = 17) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: size) ?? boldSystemFont(ofSize: size)
    }
    
    /// Regular font for texts
    /// - Parameter size: The size of the font, by default is 17
    /// * By default the type is Roboto-Regular
    class func regular(ofSize size: CGFloat = 17) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: size) ?? systemFont(ofSize: size)
    }
    
    /// Medium font for texts
    /// - Parameter size: The size of the font, by default is 176
    /// * By default the type is Roboto-Medium
    class func medium(ofSize size: CGFloat = 16) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: size) ?? systemFont(ofSize: size)
    }
    
    /// Light font for texts
    /// - Parameter size: The size of the font, by default is 8
    /// * By default the type is Roboto-Light
    class func light(ofSize size: CGFloat = 8) -> UIFont {
        return UIFont(name: "Roboto-Light", size: size) ?? systemFont(ofSize: size)
    }
}

