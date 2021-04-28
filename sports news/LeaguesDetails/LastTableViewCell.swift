//
//  LastTableViewCell.swift
//  sports news
//
//  Created by AbdElRahman Nabil on 4/21/21.
//  Copyright © 2021 AbdElRahman Nabil. All rights reserved.
//

import UIKit

class LastTableViewCell: UITableViewCell {

    @IBOutlet weak var secTeamName: UILabel!
    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var secTeamScore: UILabel!
    @IBOutlet weak var firstTeamScore: UILabel!
    @IBOutlet weak var lTeamFirst: UIImageView!
    @IBOutlet weak var lTeamSec: UIImageView!
    @IBOutlet weak var dateTV: UILabel!
    var pastEvents = Array<EventEntity>()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
