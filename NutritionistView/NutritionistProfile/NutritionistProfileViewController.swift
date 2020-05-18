//
//  NutritionistProfileViewController.swift
//  NutritionistView
//
//  Created by Gerardo Mendoza Avas on 17/05/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import UIKit

struct TitleValue {
    let title: String
    let value: String
}

struct ProfilePropertyValues {
    let Email: String?
    let Phone: String?
    let Schdule: String?
    let Adress: String?
    let Country: String?
    let City: String?
    
}

class NutritionistProfileViewController: UIViewController {
    
    //MARK: - Variables and Constants
    private lazy var profileView = NutritionistView(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: 300)))
    
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
    }
    
    //MARK: - Functions
    private func setUpView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let title = UILabel()
        title.text = "Contact"
        title.font = title.font.withSize(25)
        view.tintColor = .clear
        title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            title.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            title.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
            ])
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfilePropertyNames.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NutritionistProfileViewCell
        let profilePropertyNames = ProfilePropertyNames.allCases[indexPath.row]
        let profilePropertyValues = ProfilePropertyValues(Email: "Gerardo@hotmail.com", Phone: "6221657342", Schdule: "9:00 AM - 3:00 PM", Adress: "Gerardo1095", Country: "Mexico", City: "Sonora")
        
        cell.configure(for: profilePropertyNames, valueType: profilePropertyValues)
        cell.delegate = self
        return cell
    }
}

//MARK: - NutritionistProfileViewDelegate
extension NutritionistProfileViewController: NutritionistProfileViewDelegate {
    func titleValueTableViewCell(_ tableViewCell: NutritionistProfileViewCell, pressed phoneButton: UIButton) {
        let number = "6221657342"
        guard let numberPhone = URL(string: "tel://\(number)") else { return }
        UIApplication.shared.open(numberPhone)
        print(numberPhone)
    }
}
