//
//  ClassifiedAdd.swift
//  PaperClip
//
//  Created by xavier bohin on 09/12/2021.
//

import Foundation

struct ClassifiedAdd {
    let smallImgUrl: String
    let thumbImgUrl: String
    let categoryId: Int
    let title: String
    let description: String
    let price: Double
    let creationDate: String
    let isUrgent: Bool
}

extension ClassifiedAdd {
    init?(from json: [String: Any]) {
        guard
            let imgUrls = json["images_url"] as? [String: Any],
            let smallImgUrl = imgUrls["small"] as? String,
            let thumbImgUrl = imgUrls["thumb"] as? String,
            let categoryId = json["category_id"] as? Int,
            let title = json["title"] as? String,
            let description = json["description"] as? String,
            let price = json["price"] as? Double,
            let creationDate = json["creation_date"] as? String,
            let isUrgent = json["is_urgent"] as? Bool
        else {
            return nil
        }

        self.init(smallImgUrl: smallImgUrl, thumbImgUrl: thumbImgUrl, categoryId: categoryId, title: title, description: description, price: price, creationDate: creationDate, isUrgent: isUrgent)
    }
}
