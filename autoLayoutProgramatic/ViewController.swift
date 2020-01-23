//
//  ViewController.swift
//  autoLayoutProgramatic
//
//  Created by Arnold Tjiawi on 23/01/20.
//  Copyright © 2020 ArnoldTjiawi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.75, height: 400)
     }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath)
        let imageView = UIImageView(image: UIImage(named: items[indexPath.row]))
        cell.addSubview(imageView)
        cell.layer.cornerRadius = 12.0
        cell.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0).isActive = true
        
        
        return cell
        
    }
    
    var items = [
    "smileman",
    "redgirl",
    "sitboy",
    "sitgirl",
    "smiledog",
    "smilegirl"
    ]

    var collection:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        
    }
    fileprivate func setupUI(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.contentInset = UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)
        view.addSubview(collection)
        
        collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collection.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CELL")
        collection.dataSource = self
        collection.delegate = self
        
        let titles = UILabel()
        titles.translatesAutoresizingMaskIntoConstraints = false
        titles.text = "Learn Collection Views"
        titles.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titles.textColor = .purple
        
        let description = UILabel()
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = "Today i'm learn to make collectionView and using autoLayout, all in programatically a.k.a. without storyBoard. I think this is good for me and i'll keep doing this. Goodluck guys !"
        description.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        description.textColor = .darkGray
        
        let stack = UIStackView(arrangedSubviews: [titles, description])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 10
        view.addSubview(stack)
        stack.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 10).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +12).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
    }

}

