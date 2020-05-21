//
//  TitleHeaderView.swift
//  NutritionistView
//
//  Created by Gerardo Mendoza Avas on 19/05/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import UIKit

final class TitleHeaderView: UIView {

    //MARK: - Variables and Constants
    private let contactLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .bold(ofSize: 25)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    //MARK: - Funcitons
    private func setUpView() {
        addSubview(contactLabel)
        
        NSLayoutConstraint.activate([
           contactLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
           contactLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
           contactLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
           contactLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            ])
    }
    func configureHeaderView(headerView: ProfilePropertyValues) {
        contactLabel.text = headerView.contact
    }
}
