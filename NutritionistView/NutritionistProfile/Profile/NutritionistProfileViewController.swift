//
//  NutritionistProfileViewController.swift
//  NutritionistView
//
//  Created by Gerardo Mendoza Avas on 17/05/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import UIKit

final class NutritionistProfileViewController: UIViewController {
    
    //MARK: - Variables and Constants
    private lazy var profileView = NutritionistHeaderView(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: 300)))
    
    private lazy var headerView = TitleHeaderView()
    
    private let profilePropertyValues = ProfilePropertyValues(name: "Gerardo Mendoza",
                                                              jobDescription: "iOS Developer",
                                                              email: "Gerardo@hotmail.com",
                                                              phone: "6221657342",
                                                              schdule: "9:00 AM - 3:00 PM",
                                                              adress: "Gerardo1095",
                                                              country: "Mexico",
                                                              city: "Sonora",
                                                              contact: "Contact")
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.sectionIndexColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView = profileView
        tableView.tableFooterView = footerView
        tableView.register(NutritionistProfileViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    private let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9669796824, green: 0.9807192683, blue: 0.9949454665, alpha: 1)
        view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 15)
        return view
    }()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        profileView.configure(nameAndJob: profilePropertyValues)
        headerView.configureHeaderView(headerView: profilePropertyValues)
        
    }
    
    //MARK: - Functions
    private func setUpView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - UITableView Delegate and DataSource
extension NutritionistProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfilePropertyName.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NutritionistProfileViewCell
        let profilePropertyNames = ProfilePropertyName.allCases[indexPath.row]
        cell.configure(for: profilePropertyNames, valueType: profilePropertyValues)
        cell.delegate = self
        return cell
    }
}

//MARK: - NutritionistProfileViewDelegate
extension NutritionistProfileViewController: NutritionistProfileViewDelegate {
    func titleValueTableViewCell(_ tableViewCell: NutritionistProfileViewCell, phone numberPhone: UILabel, pressed phoneButton: UIButton) {
        let number = numberPhone.text
        guard let numberPhone = URL(string: "tel://\(number!)") else { return }
        UIApplication.shared.open(numberPhone)
        print(numberPhone)
    }
}
