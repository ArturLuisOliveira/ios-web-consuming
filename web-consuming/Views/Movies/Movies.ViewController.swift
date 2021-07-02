//
//  MoviesViewController.swift
//  web-consuming
//
//  Created by Artur Luis on 01/07/21.
//

import UIKit

class MoviesViewController: UIViewController {
    @IBOutlet var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.dataSource = self
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension MoviesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "Movie", for: indexPath) as! MovieTableViewCell
        return cell
    }
    
    
}
