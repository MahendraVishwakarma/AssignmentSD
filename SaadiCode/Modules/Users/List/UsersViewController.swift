//
//  UsersViewController.swift
//  SaadiCode
//
//  Created by Mahendra Vishwakarma on 09/04/21.
//

import UIKit

class UsersViewController: BaseViewController {
    
    var viewModel:UserViewModel?
    @IBOutlet weak var userListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        basicSetup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userListTableView.reloadData()
    }
    internal override func basicSetup() {
        
        viewModel = UserViewModel()
        //providing reference of this class to delegate object.
        viewModel?.delegate = self
        //calling method to fetch data
        self.activityLoader?.startAnimating()
        _ = try? viewModel?.fetchUsersData()
        
        //register cell to tableView
        userListTableView.register(UINib(nibName: String(describing: UsersCell.self), bundle: .main), forCellReuseIdentifier: UsersCell.identifier)
        userListTableView.dataSource = self
        userListTableView.delegate = self
    }
    
    // deinitialization the class
    deinit {
        //print('user class deinit called')
    }
    
}
//MARK:- UserListUpdate protocol method's definition
extension UsersViewController: UserListUpdate {
    func updateList(status: Bool) {
        DispatchQueue.main.async {
            self.activityLoader.stopAnimating()
            if status {
                // update tableview
                self.userListTableView.reloadData()
                
            } else {
                
                //show error alert
            }
        }
        
    }
}
//MARK:- TableView DataSource methods
extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.userList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UsersCell.identifier, for: indexPath) as? UsersCell else {
            return UITableViewCell()
        }
        if let user = self.viewModel?.userList?[indexPath.row] {
            cell.setupData(user: user)
        }
        
        return cell
    }
}
//MARK:- TableView delegate methods
extension UsersViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objectDetails = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as? UserDetailsViewController {
            let userInfo = self.viewModel?.userList?[indexPath.row]
            objectDetails.userInfo = userInfo
            self.navigationController?.pushViewController(objectDetails, animated: true)
        }
        
    }
}
