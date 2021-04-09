//
//  UsersCell.swift
//  SaadiCode
//
//  Created by Mahendra Vishwakarma on 09/04/21.
//

import UIKit

class UsersCell: UITableViewCell {

    //All properties
    @IBOutlet weak var userNemaLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static let identifier = "UsersCell"

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(user:UserStructure?) {
        userNemaLabel.text = "👤: " + (user?.name ?? "")
        mobileLabel.text = "📱: " + (user?.phone ?? "")
        websiteLabel.text = "🌐: " + (user?.website ?? "")
        companyLabel.text = "🏭: " + (user?.company?.name ?? "")
    }
}
