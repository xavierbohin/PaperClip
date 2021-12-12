//
//  PaperClipLabel.swift
//  PaperClip
//
//  Created by xavier bohin on 12/12/2021.
//

import UIKit

class PaperClipLabel: UILabel {
    
    init() {
        super.init(frame: CGRect())
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}

class PaperClipCategoryLabel: PaperClipLabel {
    
    override init() {
        super.init()
        self.textColor = .gray
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}

class PaperClipTitleLabel: PaperClipLabel {
    
    override init() {
        super.init()
        self.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}

class PaperClipPriceLabel: PaperClipLabel {
    
    override init() {
        super.init()
        self.textColor = .orange
        self.backgroundColor = .orange.withAlphaComponent(0.2)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}

class PaperClipDateLabel: PaperClipLabel {
    
    override init() {
        super.init()
        self.font = UIFont.systemFont(ofSize: 12)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}
