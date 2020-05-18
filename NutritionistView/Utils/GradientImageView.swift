//
//  GradientImageView.swift
//  NutritionistView
//
//  Created by Gerardo Mendoza Avas on 17/05/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import UIKit

final class GradientImageView: UIImageView {
    
    private var baseGradient: CAGradientLayer = {
        let gradient: CAGradientLayer = CAGradientLayer()
        guard let firstColor = UIColor(hex: "#a3a3a300")?.cgColor,
            let secondColor = UIColor(hex: "#25252526")?.cgColor,
            let thirdColor = UIColor(hex: "#000000b3")?.cgColor else {
                return gradient
        }
        gradient.colors = [firstColor, secondColor, thirdColor]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        return gradient
    }()
    
    init(image: UIImage? = nil, customGradient: CAGradientLayer? = nil) {
        super.init(image: image)
        
        contentMode = .scaleAspectFill
        clipsToBounds = true
        baseGradient = customGradient ?? baseGradient
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.sublayers?.removeAll()
        baseGradient.frame = bounds
        layer.insertSublayer(baseGradient, at: 0)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
