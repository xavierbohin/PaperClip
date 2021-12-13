//
//  CategoriesViewController.swift
//  PaperClip
//
//  Created by xavier bohin on 13/12/2021.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    private lazy var categoriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var categories: Dictionary<Int,String> = [0:"Toutes catégories"]
    
    // MARK: - LyfeCycle
    init(categories: Dictionary<Int,String>){
        super.init(nibName: nil, bundle: nil)
        self.categories = self.categories.merging(categories){ (_, new) in new }
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // add ui elements
        view.addSubview(categoriesTableView)
        
        NSLayoutConstraint.activate([
            categoriesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            categoriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            categoriesTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            categoriesTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        }
    
    // MARK: - Protocols - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell = UITableViewCell()
        // set the cell from the data model
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let classifiedAddListVc = self.presentingViewController as? ClassifiedAdListViewController {
            classifiedAddListVc.getAdds(forCategory: indexPath.row)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
