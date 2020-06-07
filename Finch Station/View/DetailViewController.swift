//
//  DetailViewController.swift
//  Finch Station
//
//  Created by Jeniean on 06/06/2020.
//  Copyright © 2020 Jens Las Pobres. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var headerView: DetailHeaderView!
    var route: RouteViewModel?
    var stopTimes = [StopTimeViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        tableView.reloadData()
    }
    
    func setupHeader() {
        headerView = DetailHeaderView.loadNib()
        headerView.routeLabel.attributedText = route?.routeName
        headerView.routeURILabel.attributedText = route?.routeURI
        headerView.routeGroupIDLabel.attributedText = route?.routeGroupID
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

extension DetailViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stopTimes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StopTimeTableViewCell", for: indexPath) as? StopTimeTableViewCell else {
            return UITableViewCell()
        }
        if let stop = stopTimes[indexPath.row] as StopTimeViewModel? {
            cell.shapeLabel.attributedText = stop.shape
            cell.timeLabel.attributedText = stop.departimeTime
            cell.timestampLabel.attributedText = stop.departimeTimestamp
            cell.serviceIDLabel.attributedText = stop.serviceID
        }
        return cell
    }

}

extension DetailViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerView.frame.height
    }
}
