//
//  NutritionistProfilViewCell.swift
//  NutritionistView
//
//  Created by Gerardo Mendoza Avas on 17/05/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import UIKit

protocol NutritionistProfileViewDelegate: AnyObject {
    func titleValueTableViewCell(_ tableViewCell: NutritionistProfileViewCell, pressed phoneButton: UIButton)
}

enum ProfilePropertyNames: String, CaseIterable {
    case Email
    case Phone
    case Schdule
    case Adress
    case Country
    case City
}

class NutritionistProfileViewCell: UITableViewCell {
    
    //MARK: - Variables and Constants
    weak var delegate: NutritionistProfileViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = label.font.withSize(17)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = label.font.withSize(20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var phoneButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Call", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.1105268672, green: 0.4639024138, blue: 0.8267809749, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(callButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - View Life Cycle
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    private func setUpLayout() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            valueLabel.heightAnchor.constraint(equalToConstant: 25)
            ])
    }
    
    func configure(for titleType: ProfilePropertyNames, valueType: ProfilePropertyValues) {
        titleLabel.text = titleType.rawValue
        
        switch titleType {
        case .Email:
            valueLabel.text = valueType.Email
        case .Phone:
            valueLabel.text = valueType.Phone
            contentView.addSubview(phoneButton)
            
            NSLayoutConstraint.activate([
                phoneButton.topAnchor.constraint(equalTo: valueLabel.topAnchor),
                phoneButton.leadingAnchor.constraint(equalTo: valueLabel.trailingAnchor, constant: -120),
                phoneButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
                phoneButton.bottomAnchor.constraint(equalTo: valueLabel.bottomAnchor)
                ])
        case .Schdule:
            valueLabel.text = valueType.Schdule
        case .Adress:
            valueLabel.text = valueType.Adress
        case .Country:
            valueLabel.text = valueType.Country
        case .City:
            valueLabel.text = valueType.City
        }
    }
    
    //MARK: Actions
    @objc private func callButtonPressed() {
        delegate?.titleValueTableViewCell(self, pressed: phoneButton)
    }
}

