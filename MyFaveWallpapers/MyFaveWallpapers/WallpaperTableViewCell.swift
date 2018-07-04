//
//  WallpaperTableViewCell.swift
//  MyFaveWallpapers
//
//  Created by Amee Thakkar on 7/3/18.
//  Copyright © 2018 Amee Thakkar. All rights reserved.
//

import UIKit

class WallpaperTableViewCell: UITableViewCell {

    @IBOutlet weak var wallpaperImgView: UIImageView!
    
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backLabel.layer.borderWidth = 3
        backLabel.layer.cornerRadius = 10
        backLabel.layer.borderColor = UIColor.darkGray.cgColor
        backLabel.clipsToBounds = true
        
        numberLabel.layer.borderWidth = 3
        numberLabel.layer.cornerRadius = 17
        numberLabel.layer.borderColor = UIColor.black.cgColor
        numberLabel.clipsToBounds = true
        
        wallpaperImgView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
