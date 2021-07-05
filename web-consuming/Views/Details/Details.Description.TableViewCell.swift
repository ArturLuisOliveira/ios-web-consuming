//
//  DetailsDescriptionTableViewCell.swift
//  web-consuming
//
//  Created by Artur Luis on 02/07/21.
//

import UIKit

class DetailsDescriptionTableViewCell: UITableViewCell {

    @IBOutlet var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func build(movie:Movie){
        descriptionLabel.text = movie.overview
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
