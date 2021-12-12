//
//  ClassifiedAddTableViewCell.swift
//  PaperClip
//
//  Created by xavier bohin on 11/12/2021.
//

import UIKit


class ClassifiedAddTableViewCell: UITableViewCell {
    
    
    // MARK: - Properties
    private lazy var img = PaperClipImageView()
    
    private lazy var category = PaperClipCategoryLabel()
    
    private lazy var title = PaperClipTitleLabel()
    
    private lazy var price = PaperClipPriceLabel()
    
    private lazy var icon = PaperClipImageView()
    
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
        
    func setup() {
        contentView.addSubview(img)
        contentView.addSubview(category)
        contentView.addSubview(title)
        contentView.addSubview(price)
        contentView.addSubview(icon)
        
        NSLayoutConstraint.activate([
            img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            img.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -5),
            img.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.33),
            
            category.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 5),
            category.topAnchor.constraint(equalTo: img.topAnchor),
            
            title.leadingAnchor.constraint(equalTo: category.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5),
            title.topAnchor.constraint(equalTo: category.bottomAnchor, constant: 5),
            
            price.leadingAnchor.constraint(equalTo: category.leadingAnchor),
            price.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            price.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
    
    func setContent(classifiedAdd: ClassifiedAdd) {
        img.downloaded(from: classifiedAdd.smallImgUrl)
        category.text = String(classifiedAdd.categoryId)
        title.text = classifiedAdd.title
        price.text = String(from: classifiedAdd.price)
        if (classifiedAdd.isUrgent) {
            icon.image = UIImage(systemName: "exclamationmark.circle.fill")
        } else {
            icon.image = nil
        }
    }
    

}
