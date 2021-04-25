//
//  FavortieTableViewCell.swift
//  sports news
//
//  Created by AbdElRahman Nabil on 4/25/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import UIKit

class FavortieTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueImage: UIImageView!
    @IBOutlet weak var leagueTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func youtubeBtn(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
