//
//  LeadersView.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 04.12.2023.
//

import UIKit

class LeadersView: UIViewController {

    @IBOutlet weak var leadersTableView: UITableView!
    @IBOutlet weak var leadersImgView: UIImageView!
    @IBOutlet weak var coinsImgView: UIImageView!
    @IBOutlet weak var coinImgView: UIImageView!
    @IBOutlet weak var leadersCoinsLbl: UILabel!
    @IBOutlet weak var leadersMenuBtn: UIButton!
    @IBOutlet weak var leadersBgImgView: UIImageView!
    
    private let iteractor: LeadersIteractor = LeadersIteractor()
    private var leadersDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iteractLeaders()
    }
    
    private func iteractLeaders() {
        iteractLeadersImages()
        interactLeadersCoins()
        iteractLeadersTableView()
    }
    
    private func iteractLeadersImages() {
        leadersImgView.image = iteractor.leaders
        coinsImgView.image = iteractor.coinsAmount
        coinImgView.image = iteractor.leadersCoin
        leadersMenuBtn.setImage(iteractor.menuLeaders, for: .normal)
        leadersBgImgView.image = iteractor.backgroundLeaders
    }
    
    private func interactLeadersCoins() {
        leadersCoinsLbl.text = "\(leadersDefaults.value(forKey: "receivedCoins") ?? "10")"
    }
    
    private func iteractLeadersTableView() {
        leadersTableView.delegate = self
        leadersTableView.backgroundColor = .clear
        leadersTableView.dataSource = self
        leadersTableView.register(UINib(nibName: iteractor.leadersTableCell, bundle: nil), forCellReuseIdentifier: iteractor.leadersTableCellReuse)
    }
    
    @IBAction func leadersMenuSender(_ sender: UIButton) {
        iteractor.configureNavigationToMainMenu(self)
    }
}

extension LeadersView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leadersCell = tableView.dequeueReusableCell(withIdentifier: iteractor.leadersTableCellReuse, for: indexPath) as! LeadersTableCell
        let cellData = cellModelData[indexPath.row]
        leadersCell.selectionStyle = .none
        leadersCell.backgroundColor = .clear
        leadersCell.userLbl.text = cellData.userTitle
        leadersCell.coinsLbl.text = cellData.userCoins
        leadersCell.coinImgView.image = iteractor.leadersCoin
        return leadersCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
