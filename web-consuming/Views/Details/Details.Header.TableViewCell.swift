//
//  DetailsHeaderTableViewCell.swift
//  web-consuming
//
//  Created by Artur Luis on 02/07/21.
//

import UIKit

class DetailsHeaderTableViewCell: UITableViewCell {
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var movieGenreLabel: UILabel!
    @IBOutlet var movieRatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func build(movie:Movie){
        movieNameLabel.text = movie.title
        movieGenreLabel.text = "Drama"
        movieRatingLabel.text = String(movie.voteAvarage)
        ImageService.setImageToImageView(imageView: movieImageView, from: movie.posterPath)

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
