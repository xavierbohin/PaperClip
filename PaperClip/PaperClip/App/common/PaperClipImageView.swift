//
//  PaperClipImageView.swift
//  PaperClip
//
//  Created by xavier bohin on 12/12/2021.
//

import UIKit

class PaperClipImageView: UIImageView {
    
    init() {
        super.init(image: nil)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}
