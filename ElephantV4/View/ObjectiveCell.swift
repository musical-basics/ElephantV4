//
//  ObjectiveCell.swift
//  ElephantV4
//
//  Created by Lionel Yu on 1/10/23.
//

import UIKit

class ObjectiveCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var item1Label: UILabel!
    @IBOutlet weak var item2Label: UILabel!
    @IBOutlet weak var item3Label: UILabel!
    @IBOutlet weak var item4Label: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
//        
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
//            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
//            titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
//            titleLabel.bottomAnchor.constraint(equalTo: item1Label.topAnchor),
//            
//            item1Label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
//            item1Label.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
//            item1Label.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
//            item1Label.bottomAnchor.constraint(equalTo: item2Label.topAnchor),
//            
//            item2Label.topAnchor.constraint(equalTo: item1Label.bottomAnchor),
//            item2Label.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
//            item2Label.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
//            item2Label.bottomAnchor.constraint(equalTo: item3Label.topAnchor),
//            
//            item3Label.topAnchor.constraint(equalTo: item2Label.bottomAnchor),
//            item3Label.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
//            item3Label.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
//            item3Label.bottomAnchor.constraint(equalTo: item4Label.topAnchor),
//            
//            item4Label.topAnchor.constraint(equalTo: item3Label.bottomAnchor),
//            item4Label.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
//            item4Label.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
//            item4Label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

    }
    
}
