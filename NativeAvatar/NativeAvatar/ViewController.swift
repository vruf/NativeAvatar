//
//  ViewController.swift
//  NativeAvatar
//
//  Created by Vadim Rufov on 23.9.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    private lazy var sv: UIScrollView = {
        let sv = UIScrollView(frame: self.view.bounds)
        sv.contentSize.height = sv.frame.height*2
        return sv
    }()
    
    private lazy var iv: UIImageView = {
        let iv = UIImageView(image: .init(systemName: "person.crop.circle.fill"))
        iv.tintColor = .gray
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        title = "Avatar"
        view.addSubview(sv)
        
        guard let nb: UINavigationBar = navigationController?.navigationBar else { return }
        
        if let titleView = nb.subviews.first(where: { NSStringFromClass($0.classForCoder).contains("UINavigationBarLargeTitleView") }) {
            titleView.addSubview(iv)
            
            NSLayoutConstraint.activate([
                iv.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -12),
                iv.trailingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: -16),
                iv.widthAnchor.constraint(equalToConstant: 36),
                iv.heightAnchor.constraint(equalToConstant: 36),
            ])
        }
    }


}

