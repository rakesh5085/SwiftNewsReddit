//
//  List view controller
// https://www.reddit.com/r/swift/.json

import UIKit
/// Show a list of news articles 
final class SwiftNewsListViewController: UIViewController {
    
    private(set) var collectionView: UICollectionView!
    
    let adapter = Adapter<Article, ArticleCell>()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .blue
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = adapter
        collectionView.delegate = adapter
        collectionView.register(cellType: ArticleCell.self)
        collectionView.backgroundColor = Color.background
        collectionView.contentInset.top = 8
        collectionView.alwaysBounceVertical = true
        adapter.configure = { article, cell in
            
            if let img = article.imageUrl , let imgURL = URL(string:img) {
                cell.imageView.setImage(url: imgURL, placeholder: UIImage(named: Constants.placeHolderimageName) )
                cell.label.text = article.title
            }
        }
        
        view.addSubview(collectionView)
        NSLayoutConstraint.pin(view: collectionView, toEdgesOf: view)
        
    }
    
    func handle(allArticles: [Article]) {
        adapter.items = allArticles
        collectionView.reloadData()
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "WW ", message: "Image Tapped", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
