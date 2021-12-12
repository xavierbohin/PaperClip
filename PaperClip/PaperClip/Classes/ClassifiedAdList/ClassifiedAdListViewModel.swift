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
    @Published var categories = Dictionary<Int, String>()
    
    init(){
        GithubService().getClassifiedAds(){ result in
            self.classifiedAdds = result
        }
        GithubService().getCategories(){ result in
            self.categories = result
        }
    }
    
}
