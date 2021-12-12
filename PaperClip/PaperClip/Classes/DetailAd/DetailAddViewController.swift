//
//  DetailAddViewController.swift
//  PaperClip
//
//  Created by xavier bohin on 08/12/2021.
//

import UIKit

class DetailAddViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var img = PaperClipImageView()
    
    private lazy var category = PaperClipLabel()
    
    private lazy var addTitle = PaperClipLabel()
    
    private lazy var creationDate = PaperClipLabel()
    
    private lazy var addDescription = PaperClipLabel()
    
    private lazy var price = PaperClipLabel()
    
    private lazy var icon = PaperClipImageView()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        var image = UIImage(systemName: "xmark.circle.fill")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        return button
    }()
    

    // MARK: - LyfeCycle
    init(classifiedAdd: ClassifiedAdd) {
        super.init(nibName: nil, bundle: nil)
        
        img.downloaded(from: classifiedAdd.thumbImgUrl)
        category.text = String(classifiedAdd.categoryId)
        addTitle.text = classifiedAdd.title
        creationDate.text = classifiedAdd.creationDate
        addDescription.text = classifiedAdd.description
        price.text = String(classifiedAdd.price)
        if classifiedAdd.isUrgent {
            icon.image = UIImage(systemName: "exclamationmark.circle.fill")
        }
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(img)
        view.addSubview(category)
        view.addSubview(addTitle)
        view.addSubview(creationDate)
        view.addSubview(addDescription)
        view.addSubview(price)
        view.addSubview(icon)
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: view.topAnchor),
            img.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            img.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            icon.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            icon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
            
            
        ])
    }
    
    // MARK: - Dismissing the view controller - User interaction
    @objc func closeButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }

}
