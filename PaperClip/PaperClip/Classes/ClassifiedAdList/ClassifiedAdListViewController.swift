//
//  ClassifiedAdListViewController.swift
//  PaperClip
//
//  Created by xavier bohin on 08/12/2021.
//

import UIKit

class ClassifiedAdListViewController: UIViewController {

    // MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.present(DetailAdViewController(), animated: true, completion: nil)
    }


}

