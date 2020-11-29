//  Article.swift
//
//
import Foundation

/*
 The 'main' view should implement a tableView or collectionView that displays a list of the articles. If the article contains a thumbnail image, we should display that image in the cell with the article title on top of the image. If the article doesn't contain an image, just display the article title. The cells should size to accommodate for the image, preserving aspect ratio. If the cell is just text, make sure to shrink the cell to the size of the title. This 'main' view should be presented inside of a navigation controller, with the title "Swift News".
 */
struct Article : Codable {
    var title : String?
    var imageUrl : String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case imageUrl = "thumbnail"
    }
    
    init(_ dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String //?? ""
        self.imageUrl = dictionary["thumbnail"] as? String //?? ""
    }
}
