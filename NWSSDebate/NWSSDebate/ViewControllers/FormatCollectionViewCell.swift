//
//  FormatCollectionViewCell.swift
//  NWSSDebate
//
//  Created by Selena Liu on 2018-01-12.
//  Copyright © 2018 Selena Liu. All rights reserved.
//

import UIKit

class FormatCollectionViewCell: UICollectionViewCell {
    
    let titleTextView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.textAlignment = .left
        label.contentMode = .scaleAspectFit
        label.sizeToFit()
//        label.numberOfLines = 0
        return label
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        descriptionTextView.font = UIFont.systemFont(ofSize: bounds.height * 0.023)
        descriptionTextView.textColor = .white
        descriptionTextView.backgroundColor = .darkGray
        titleTextView.textColor = .white
        titleTextView.font = UIFont.systemFont(ofSize: bounds.height * 0.027)
        addSubview(scrollView)
        
        backgroundColor = .darkGray
        setUpLoaded()
        
    }
    
    func setUpLoaded() {
        let margins = layoutMarginsGuide
        scrollView.heightAnchor.constraint(equalToConstant: bounds.height).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: bounds.width).isActive = true
        scrollView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        let topView = UIView()
        scrollView.addSubview(topView)
        topView.backgroundColor = .darkGray
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        topView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: (bounds.height * 2)).isActive = true
        topView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        topView.addSubview(titleTextView)
        topView.addSubview(descriptionTextView)

        titleTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleTextView.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
        titleTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleTextView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 50).isActive = true
        
        descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionTextView.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: (bounds.height * 2)-70).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor).isActive = true
        

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
