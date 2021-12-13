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
            
            var urgentAdds: [ClassifiedAdd] = []
            var otherAdds: [ClassifiedAdd] = []
            
            result.forEach({ add in
                if add.isUrgent {
                    urgentAdds.append(add)
                } else {
                    otherAdds.append(add)
                }
            })
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss+SSSS"
            
            let sortedUrgentAdds = urgentAdds.sorted(by: {
                let dateA = dateFormatter.date(from: $0.creationDate) ?? Date()
                let dateB = dateFormatter.date(from: $1.creationDate) ?? Date()
                return dateA.compare(dateB) == .orderedDescending
            })
            
            let sortedOtherAdds = otherAdds.sorted(by: {
                let dateA = dateFormatter.date(from: $0.creationDate) ?? Date()
                let dateB = dateFormatter.date(from: $1.creationDate) ?? Date()
                return dateA.compare(dateB) == .orderedDescending
            })
            
            self.classifiedAdds = sortedUrgentAdds+sortedOtherAdds
        }
        GithubService().getCategories(){ result in
            self.categories = result
        }
    }
    
}
