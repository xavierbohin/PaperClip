//
//  ClassifiedAdListViewModel.swift
//  PaperClip
//
//  Created by xavier bohin on 10/12/2021.
//

import Foundation
import Combine

class ClassifiedAdListViewModel {
    
    @Published var classifiedAdds: [ClassifiedAdd] = []
    
    init(){
        GithubService().getClassifiedAds(){ result in
            self.classifiedAdds = result
        }
    }
    
}
