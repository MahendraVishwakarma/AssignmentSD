//
//  UserDetailsViewController.swift
//  SaadiCode
//
//  Created by Mahendra Vishwakarma on 09/04/21.
//

import UIKit

class UserDetailsViewController: BaseViewController {

    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var addStreetLabel: UILabel!
    @IBOutlet weak var addSuitLabel: UILabel!
    @IBOutlet weak var addCityLabel: UILabel!
    @IBOutlet weak var addZipCodeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyCatchPhraseLabel: UILabel!
    @IBOutlet weak var companyBsLabel: UILabel!
   
    weak var userInfo:UserStructure?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func makeFavourite(_ sender: UIButton) {
        if userInfo?.isMarkedFavourite ?? false {
            sender.isSelected = false
            userInfo?.isMarkedFavourite = false
        } else {
            sender.isSelected = true
            userInfo?.isMarkedFavourite = true
        }
    }
    private func setupData() {
        nameLabel.text = "Name: " + (userInfo?.name ?? "" )
        usernameLabel.text = "UserName: " + (userInfo?.username ?? "")
        addCityLabel.text = "City: " + (userInfo?.address?.city ?? "")
        addSuitLabel.text = "Suite: " + (userInfo?.address?.suite ?? "")
        addStreetLabel.text = "Street: " + (userInfo?.address?.street ?? "")
        addZipCodeLabel.text = "Zipcode: " + (userInfo?.address?.zipcode ?? "")
        phoneLabel.text = "Phone: " + (userInfo?.phone ?? "")
        websiteLabel.text = "Website: " + (userInfo?.website ?? "")
        companyNameLabel.text = "Company Name: " + (userInfo?.company?.name ?? "")
        companyCatchPhraseLabel.text = "Company CatchPhrase: " + (userInfo?.company?.catchPhrase ?? "")
        companyBsLabel.text = "Company BS: " + (userInfo?.company?.bs ?? "")
        
        starButton.isSelected = (userInfo?.isMarkedFavourite ?? false)
        
    }
    
    // deinitialization the class
    deinit {
        print("UserDetailsViewController class deinit called")
    }
}
