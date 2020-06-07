//
//  ViewController.swift
//  Finch Station
//
//  Created by Jeniean on 01/06/2020.
//  Copyright © 2020 Jens Las Pobres. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftPullToRefresh


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRoutes()
        tableView.spr_setIndicatorHeader { [weak self] in
            self?.getRoutes()
        }
    }
    
    func getRoutes() {
        Service.getRoutes { (_) in
            self.tableView.spr_endRefreshing()
            self.tableView.reloadData()
         }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewControllerSegue" {
            if let vc = segue.destination as? DetailViewController,
                let indexPath = self.tableView.indexPathForSelectedRow {
                vc.route = RouteViewModel(route: routes[indexPath.row])
                for stops in routes[indexPath.row].stopTimes {
                    vc.stopTimes.append(StopTimeViewModel.init(stopTime: stops))
                }
            }
        }
    }

}


extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RouteTableViewCell", for: indexPath) as? RouteTableViewCell else {
            return UITableViewCell()
        }
        cell.infoLabel.text = routes[indexPath.row].name
        return cell
    }

}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
