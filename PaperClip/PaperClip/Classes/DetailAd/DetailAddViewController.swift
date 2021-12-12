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
    
    private lazy var category = PaperClipCategoryLabel()
    
    private lazy var addTitle = PaperClipTitleLabel()
    
    private lazy var creationDate = PaperClipDateLabel()
    
    private lazy var addDescription = PaperClipLabel()
    
    private lazy var price = PaperClipPriceLabel()
    
    private lazy var icon = PaperClipImageView()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        var image = UIImage(systemName: "xmark.circle.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .red
        button.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    // MARK: - LyfeCycle
    init(classifiedAdd: ClassifiedAdd) {
        super.init(nibName: nil, bundle: nil)
        
        img.downloaded(from: classifiedAdd.thumbImgUrl)
        category.text = String(classifiedAdd.categoryId)
        addTitle.text = classifiedAdd.title
        creationDate.text = String(classifiedAdd.creationDate.prefix(10))
        addDescription.text = classifiedAdd.description
        price.text = String(from: classifiedAdd.price)
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
        view.addSubview(scrollView)
        
        scrollView.backgroundColor = .white
        
        scrollView.addSubview(img)
        scrollView.addSubview(category)
        scrollView.addSubview(addTitle)
        scrollView.addSubview(creationDate)
        scrollView.addSubview(addDescription)
        scrollView.addSubview(price)
        scrollView.addSubview(icon)
        scrollView.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            img.topAnchor.constraint(equalTo: scrollView.topAnchor),
            img.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            img.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            img.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            icon.topAnchor.constraint(equalTo: img.topAnchor, constant: 5),
            icon.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -5),
            
            closeButton.topAnchor.constraint(equalTo: img.topAnchor, constant: 5),
            closeButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            
            category.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 5),
            category.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            category.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            creationDate.topAnchor.constraint(equalTo: category.bottomAnchor, constant: 5),
            creationDate.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            creationDate.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            addTitle.topAnchor.constraint(equalTo: creationDate.bottomAnchor, constant: 5),
            addTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            addTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            price.topAnchor.constraint(equalTo: addTitle.bottomAnchor, constant: 5),
            price.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            
            addDescription.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 5),
            addDescription.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            addDescription.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            addDescription.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 5),
            addDescription.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
        ])
    }
    
    // MARK: - Dismissing the view controller - User interaction
    @objc func closeButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }

}
