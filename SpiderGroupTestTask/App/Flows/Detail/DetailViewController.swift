//
//  DetailViewController.swift
//  SpiderGroupTestTask
//
//  Created by Maxim Tolstikov on 24/03/2019.
//  Copyright © 2019 Maxim Tolstikov. All rights reserved.
//
import Alamofire
import AlamofireImage
import UIKit

/// Контроллер изображения
class DetailViewController: UIViewController {
    
    // MARK: - Dependency
    
    var networkService: CommentsService?

    // MARK: - Private properties
    
    private let item: GallerysItem
    private var comments = [Comment]() {
        didSet {
            addComments()
        }
    }
    
    // MARK: - Lazy properties
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Init
    
    init(item: GallerysItem) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadComments()
    }
    
    // MARK: - Configure controller
    
    private func configureController() {
        view.backgroundColor = .white
        addScrollView()
        addStackView()
        addImageView()
    }
    
    private func addScrollView() {
        scrollView.frame = view.bounds
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(scrollView)
    }
    
    private func addStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            // Attaching the content's edges to the scroll view's edges
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            // Satisfying size constraints
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ])
    }
    
    private func addImageView() {
        stackView.addArrangedSubview(imageView)
        imageView.heightAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        loadImage()
    }

    // MARK: - Private methods
    
    private func loadImage() {
        guard let image = item.images?.first,
            let url = URL(string: image.link)
            else { return }
        imageView.af_setImage(withURL: url, placeholderImage: UIImage(named: "placeholder"))
    }
    
    private func loadComments() {
        networkService?.fetch(
            imageId: item.id,
            completion: { [weak self] (result, error) in
            
            guard error == nil, let comments = result else {
                print(error!.localizedDescription)
                return
            }
            self?.comments = comments
        })
    }
    
    private func addComments() {
        comments.forEach { (comment) in
            craftCommentView(comment: comment)
        }
    }
    
    private func craftCommentView(comment: Comment) {
        let commentView = CommentView(comment: comment)
        stackView.addArrangedSubview(commentView)
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentView.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 8).isActive = true
        commentView.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -8).isActive = true
    }

}
