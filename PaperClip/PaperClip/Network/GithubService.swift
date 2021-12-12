//
//  GithubService.swift
//  PaperClip
//
//  Created by xavier bohin on 09/12/2021.
//

import Foundation


/// A service that knows how to perform requests for GitHub data.
class GithubService {
    
    var classifiedAdds: [ClassifiedAdd] = []
    var categories = Dictionary<Int, String>()
    let host = "raw.githubusercontent.com"
    let basePath = "/leboncoin/paperclip/master"
    let schemes = "https"
    let pathListing = "/listing.json"
    let pathCategories = "/categories.json"
    
    
    func getClassifiedAds(completionBlock: @escaping ([ClassifiedAdd]) -> Void) -> Void {
        
        let request = NSMutableURLRequest(url: URL(string: schemes+"://"+host+basePath+pathListing)!)
        request.httpMethod = "GET"
        
        let requestApi = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            
            if (error != nil) {
                print(error!.localizedDescription) // On indique dans la console ou est le problème dans la requête
            }
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {
                print("statusCode devrait être de 200, mais il est de \(httpStatus.statusCode)")
                print("réponse = \(String(describing: response))") // On affiche dans la console si le serveur ne nous renvoit pas un code de 200 qui est le code normal
            } else {
                //get all the adds
                let allAdds = try? JSONSerialization.jsonObject(with: data!,options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                allAdds?.forEach({ element in
                    if let newAdd = ClassifiedAdd(from: element as! [String : Any]) {
                        self.classifiedAdds.append(newAdd)
                    }
                })
                completionBlock(self.classifiedAdds)
             }
            
        }
        
        requestApi.resume()
    }
    
    
    func getCategories(completionBlock: @escaping (Dictionary<Int, String>) -> Void) -> Void {
        
        let request = NSMutableURLRequest(url: URL(string: schemes+"://"+host+basePath+pathCategories)!)
        request.httpMethod = "GET"
        
        let requestApi = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            
            if (error != nil) {
                print(error!.localizedDescription) // On indique dans la console ou est le problème dans la requête
            }
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {
                print("statusCode devrait être de 200, mais il est de \(httpStatus.statusCode)")
                print("réponse = \(String(describing: response))") // On affiche dans la console si le serveur ne nous renvoit pas un code de 200 qui est le code normal
            } else {
                //get all the categories
                let allCategories = try? JSONSerialization.jsonObject(with: data!,options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                allCategories?.forEach({ element in
                    if let element = element as? NSDictionary {
                        if let myKey = element.value(forKey: "id") as? Int,
                           let myValue = element.value(forKey: "name") as? String {
                            self.categories[myKey] = myValue
                        }
                    }
                })
                completionBlock(self.categories)
             }
            
        }
        
        requestApi.resume()
    }
        
    
}
