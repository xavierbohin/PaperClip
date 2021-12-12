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
