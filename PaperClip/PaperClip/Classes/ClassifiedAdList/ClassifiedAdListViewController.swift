//
//  ClassifiedAdListViewController.swift
//  PaperClip
//
//  Created by xavier bohin on 08/12/2021.
//

import UIKit
import Combine

class ClassifiedAdListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // MARK: - Properties
    private lazy var classifiedAddTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var categoryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Toutes catégories ⌄", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(categoriesButtonAction), for: .touchUpInside)
        return button
    }()
    
    var viewModel = ClassifiedAdListViewModel()
    var cancellables: Set<AnyCancellable> = []
    
    var categoriesDic = Dictionary<Int, String>()
    
    var classifiedAdds: [ClassifiedAdd] = [] {
        didSet{
            DispatchQueue.main.async {
                self.classifiedAddTableView.reloadData()
            }
        }
    }
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "classifiedAddsTableViewCell"
    

    // MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // add ui elements
        view.addSubview(categoryButton)
        view.addSubview(classifiedAddTableView)
        
        NSLayoutConstraint.activate([
            
            categoryButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            categoryButton.rightAnchor.constraint(equalTo: view.rightAnchor),

            classifiedAddTableView.topAnchor.constraint(equalTo: categoryButton.bottomAnchor),
            classifiedAddTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            classifiedAddTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            classifiedAddTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        // Register the table view cell class and its reuse id
        self.classifiedAddTableView.register(ClassifiedAddTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        classifiedAddTableView.delegate = self
        classifiedAddTableView.dataSource = self
        // Along with auto layout, these are the keys for enabling variable cell height
        classifiedAddTableView.estimatedRowHeight = 200.0
        classifiedAddTableView.rowHeight = UITableView.automaticDimension
        
        bindViewModel()
    }
    
    func bindViewModel(){
        viewModel.$classifiedAdds.sink { [weak self] adds in
            self?.classifiedAdds = adds
        }.store(in: &cancellables)
        
        viewModel.$categories.sink { [weak self] categories in
            self?.categoriesDic = categories
        }.store(in: &cancellables)
    }
    
    func getAdds(forCategory category: Int) {
        categoryButton.setTitle(String(from: category, with: categoriesDic)+" ⌄", for: .normal)
        viewModel.getAdds(forCategory: category)
    }

    // MARK: - Protocols - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.classifiedAdds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell = self.classifiedAddTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! ClassifiedAddTableViewCell
        // set the cell from the data model
        cell.setContent(classifiedAdd: classifiedAdds[indexPath.row], categories: categoriesDic)
        
        return cell
    }
    
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailAdd = DetailAddViewController(classifiedAdd: classifiedAdds[indexPath.row], categories: categoriesDic)
        detailAdd.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        detailAdd.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(detailAdd, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // MARK: - User interaction
    @objc func categoriesButtonAction() {
        let categoriesVc = CategoriesViewController(categories: categoriesDic)
        self.present(categoriesVc, animated: true, completion: nil)
    }
    
}

