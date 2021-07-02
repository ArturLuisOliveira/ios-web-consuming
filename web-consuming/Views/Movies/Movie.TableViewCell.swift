//
//  PopularMoviesTableViewCell.swift
//  web-consuming
//
//  Created by Artur Luis on 01/07/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    static func build(music: Movie) {
//        nameLabel =
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
