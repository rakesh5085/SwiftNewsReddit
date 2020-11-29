//
//  DetailViewController.swift

import UIKit

/// Show detail information for a article..
final class DetailViewController: BaseController<DetailView> {
    private let article: Article
    private let articleService: SwiftArticleService
    
    var selectInstruction: ((URL) -> Void)?
    var selectOriginal: ((URL) -> Void)?
    
    // MARK: - Init
    
    required init(article: Article, articleService: SwiftArticleService) {
        self.article = article
        self.articleService = articleService
        super.init(nibName: nil, bundle: nil)
        self.title = article.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.background
        setup()
        update(article: article)
    }
    
    private func setup() {
        // any aditional setup for article detail view can be done here ..
    }
    
    private func update(article: Article) {
        
        if let url = article.imageUrl, let imgUrl = URL(string: url) {
            root.imageView.setImage(url: imgUrl, placeholder: UIImage(named:Constants.placeHolderimageName))
        }
        
        //    root.infoView.leftLabel.text = article.title
        
        if let title = article.title {
            UIView.transition(
                with: root,
                duration: 0.25,
                options: .transitionCrossDissolve,
                animations: {
                    self.root.articleTitleLabel.text = title
            },
                completion: nil
            )
        }
        
    }
}
