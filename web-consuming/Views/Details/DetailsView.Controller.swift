//
//  DetailsViewController.swift
//  web-consuming
//
//  Created by Artur Luis on 02/07/21.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet var detailsTableView: UITableView!
    
    var movie: Movie?
    
    func reload() {
        self.detailsTableView.reloadData()
        
    }
    
    func build(movie: Movie) {
        self.movie = movie
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.detailsTableView.dataSource = self
        self.reload()
    }
}


extension DetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = detailsTableView.dequeueReusableCell(withIdentifier: "Header", for: indexPath) as! DetailsHeaderTableViewCell
            if let movie = movie {
                cell.build(movie: movie)
            }
            return cell
        } else {
            let cell = detailsTableView.dequeueReusableCell(withIdentifier: "Description", for: indexPath) as! DetailsDescriptionTableViewCell
            if let movie = movie {
                cell.build(movie: movie)
            }
            return cell
        }
    }
}
