//
//  SwiftArticleService.swift
//

//The 'main' view should implement a tableView or collectionView that displays a list of the articles.
//If the article contains a thumbnail image, we should display that image in the cell with the article title on top of the image. If the article doesn't contain an image, just display the article title. The cells should size to accommodate for the image, preserving aspect ratio. If the cell is just text, make sure to shrink the cell to the size of the title. This 'main' view should be presented inside of a navigation controller, with the title "Swift News".
// https://www.reddit.com/r/swift/.json
import Foundation

final class SwiftArticleService {
    
    private let baseUrl = URL(string: "https://www.reddit.com/")
    private let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    /// Fetch articles from reddit service ..
    /// - Parameter completion: Called when operation finishes..
    func fetchSwiftNewsArticles(completion: @escaping ([Article]) -> Void) {
        
        let resource = Resource(url: baseUrl ?? nil!, path: "/r/swift/.json")
        
        _ = networking.fetch(resource: resource, completion: { data in
            DispatchQueue.main.async {
                
                //
                guard let dataResponse = data else {
                    print( "Response Error, problem with the data received : \(String(describing: data))")
                    return
                }
                do {
                    // dataResponse received from a network request ..
                    let jsonResponse = try JSONSerialization.jsonObject(with:
                        dataResponse, options: [])
                    print(jsonResponse) //Response result
                    
                    // create model..
                    guard let jsonDict = jsonResponse as? [String : Any] else {
                        print("Error with data received : \(jsonResponse)")
                        return
                    }
                    
                    guard let childArray = (jsonDict["data"] as? [String: Any] )?["children"] as? [[String: Any]] else {
                        print("children array is not correct  : \(jsonDict)")
                        return
                    }
                   
                    var articleModelArray = [Article]() // initialize model ..
                    
                    for item in childArray {
                        print("item in child array is : \(item)")
                        if let dataDict = item["data"] as? [String: Any] {
                            // only using a couple of items from the large json dictionary. In case of we need to use all of the items in json then creating a model and mapping it to the response
                            // is the best way to do it..
                            if let title = dataDict["title"] as? String, let imageURL = dataDict["thumbnail"] as? String {
                                print("title of item in child array is : \(title) and URL - \(imageURL)")
                                
                                let article = Article(["title" : title, "thumbnail" : imageURL])
                                 articleModelArray.append(article)
                            }
                        }
                        
                    }
                    completion(articleModelArray)
                    
                } catch let parsingError {
                    print("Error", parsingError)
                }
                
            }
        })
    }
    
}
