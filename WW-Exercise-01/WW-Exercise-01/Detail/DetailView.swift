//
//  DetailView.swift
//

import UIKit

final class DetailView: UIView {
    
    private let scrollableView = ScrollableView()
    private(set) lazy var imageView: UIImageView = self.makeImageView()
    private(set) lazy var infoView: InfoView = InfoView()
    private(set) lazy var articleTitleLabel: UILabel = self.makearticleTitleLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func setupConstraints() {
        let articleHeaderView = HeaderView(text: "Article Title & Details:")
        
        addSubview(scrollableView)
        NSLayoutConstraint.pin(view: scrollableView, toEdgesOf: self)
        
        scrollableView.setup(pairs: [
            ScrollableView.Pair(view: imageView, inset: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)),
            ScrollableView.Pair(view: articleHeaderView, inset: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)),
            ScrollableView.Pair(view: articleTitleLabel, inset: UIEdgeInsets(top: 4, left: 8, bottom: 0, right: 0)),
            ScrollableView.Pair(view: infoView, inset: UIEdgeInsets(top: 16, left: 0, bottom: 20, right: 0))
        ])
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 9.0/16),
            articleHeaderView.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
    
    // MARK: - Make
    
    private func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }
    private func makearticleTitleLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }
}

private final class HeaderView: UIView {
    private(set) lazy var label: UILabel = self.makeLabel()
    
    required init(text: String) {
        super.init(frame: .zero)
        label.text = text
        addSubview(label)
        backgroundColor = Color.main.withAlphaComponent(0.8)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        round(corners: .topRight)
    }
    
    // MARK: - Make
    
    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 8)
        ])
    }
}

// for some extra details about article ..
final class InfoView: UIView {
    private(set) lazy var leftLabel: UILabel = self.makeLabel()
    private(set) lazy var rightLabel: UILabel = self.makeLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews([leftLabel, rightLabel])
        rightLabel.textAlignment = .right
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Make
    
    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.numberOfLines = 0
        
        return label
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            leftLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            rightLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            
            leftLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
