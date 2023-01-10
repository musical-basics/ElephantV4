//
//  ItemCell.swift
//  ElephantV2
//
//  Created by Lionel Yu on 12/11/22.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var objectiveLabel: UILabel!
    @IBOutlet weak var projLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sendSubviewToBack(contentView)
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
//            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
//            titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
//            titleLabel.bottomAnchor.constraint(equalTo: projLabel.topAnchor),
//
//            projLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
//            projLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
//            projLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
//            projLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
        
        titleLabel?.numberOfLines = 0;
        titleLabel?.lineBreakMode = .byWordWrapping;
        objectiveLabel?.numberOfLines = 0;
        objectiveLabel?.lineBreakMode = .byWordWrapping;
        projLabel?.numberOfLines = 0;
        projLabel?.lineBreakMode = .byWordWrapping;

    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
}
