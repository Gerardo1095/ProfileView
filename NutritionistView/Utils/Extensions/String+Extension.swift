//
//  String+Extension.swift
//  NutritionistView
//
//  Created by Gerardo Mendoza Avas on 20/05/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    /// Capitalize first letter of the string
    /// * Example: `word` will be transformed to `Word`
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

