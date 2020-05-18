//
//  NutritionistView.swift
//  NutritionistView
//
//  Created by Gerardo Mendoza Avas on 17/05/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import UIKit

class NutritionistView: UIView {
    
    //MARK: - Variables and Constants
    private let gradientColor: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors =
            [UIColor.white.cgColor,UIColor.red.withAlphaComponent(1).cgColor]
        return gradientLayer
    }()
    
    private let imageView: GradientImageView = {
        let imageView = GradientImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.2623361647, green: 0.6452710032, blue: 0.9622866511, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let returnButton: UIButton = {
        let button = UIButton()
        button.setTitle("Return", for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(returnButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Armando Casas"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let jobLabel: UILabel = {
        let label = UILabel()
        label.text = "\("I`ve been helping people to obtain ther dream body for 15 years. Lorem Ipsum.")"
        label.font = label.font.withSize(13)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Functions
    private func setUpLayout() {
        backgroundColor = #colorLiteral(red: 0.9669796824, green: 0.9807192683, blue: 0.9949454665, alpha: 1)
        addSubview(imageView)
        addSubview(returnButton)
        addSubview(nameLabel)
        addSubview(jobLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 285),
            
            returnButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            returnButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 15),
            returnButton.widthAnchor.constraint(equalToConstant: 80),
            returnButton.heightAnchor.constraint(equalToConstant: 40),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 225),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -50),
            
            jobLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            jobLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            jobLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10),
            jobLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0)
            ])
    }
    
    //MARK: Actions
    @objc private func returnButtonPressed() {
        print("estoy regresando a la pantalla anterior")
    }
}
