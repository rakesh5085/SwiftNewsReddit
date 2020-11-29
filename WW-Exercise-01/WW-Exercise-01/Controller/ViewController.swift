//
//  ViewController.swift
//
//

// Consume  https://www.reddit.com/r/swift/.json

import UIKit

class ViewController: UIViewController {
    
    /// When an article get selected ..
    var select: ((Article) -> Void)?
    
    private var refreshControl = UIRefreshControl()
    
    private let swiftArticleService: SwiftArticleService
    private let newsListViewController = SwiftNewsListViewController()
    
    // MARK: - Init
    
    required init(newsService: SwiftArticleService) {
        self.swiftArticleService = newsService
        super.init(nibName: nil, bundle: nil)
        self.title = "Swift News"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
                
        setup()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Setup
    
    private func setup() {
        newsListViewController.adapter.select = select
        add(childViewController: newsListViewController)
        newsListViewController.collectionView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    // MARK: - Action

    @objc private func refresh() {
      loadData()
    }
    
    // MARK: - Data
    
    private func loadData() {
        swiftArticleService.fetchSwiftNewsArticles(completion: { [weak self] articles in
            
            self?.newsListViewController.handle(allArticles: articles)
            self?.refreshControl.endRefreshing()
        })
    }
}
