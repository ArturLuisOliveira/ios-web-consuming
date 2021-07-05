//
//  MoviesViewController.swift
//  web-consuming
//
//  Created by Artur Luis on 01/07/21.
//

import UIKit

class MoviesViewController: UIViewController {
    @IBOutlet var moviesTableView: UITableView!
    
    var popularMovies: [Movie] = []
    var moviesPlayingNow: [Movie] = []
    var controller: MoviesController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        controller = MoviesController(view: self)
        controller?.fetchMovies(type: .POPULAR)
        controller?.fetchMovies(type: .NOW_PLAYING)
    }
    
    func reload() {
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
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

extension MoviesViewController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailsSegue", let movie = sender as? Movie {
            let destination = segue.destination as! DetailsViewController
            destination.build(movie: movie)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = indexPath.section == 0
            ? popularMovies[indexPath.item]
            : moviesPlayingNow[indexPath.item]
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "ShowDetailsSegue", sender: movie)
    }
}

extension MoviesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { 2 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 &&  popularMovies.count >= 2 {
            return 2
        }
        if section == 1 {
            return moviesPlayingNow.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 { return "Popular Movies" }
        if section == 1 { return "Now Playing" }
        return ""
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "Movie", for: indexPath) as! MovieTableViewCell
        if indexPath.section == 0 {
            cell.build(movie: popularMovies[indexPath.item])
        }
        if indexPath.section == 1 {
            cell.build(movie: moviesPlayingNow[indexPath.item])
        }
        return cell
    }
    
}
