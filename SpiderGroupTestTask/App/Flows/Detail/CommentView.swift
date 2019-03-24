//
//  CommentView.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 24/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//

import UIKit

/// Ячейка комментариев
class CommentView: UIView {
   
    // MARK: - Lazy properties
    
    lazy var author: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var commentText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    convenience init(comment: Comment) {
        self.init(frame: .zero)
        author.text = comment.author
        commentText.text = comment.comment
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Cell lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 5
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        clipsToBounds = false
    }
    
    // MARK: - Private methods

    private func setupView() {
        backgroundColor = .white
        addSubview(author)
        addSubview(commentText)
        setupLayout()
    }
    
    private func setupLayout() {
        // author
        author.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        author.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        author.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        // commentText
        commentText.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        commentText.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        commentText.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 8).isActive = true
        commentText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }

}
