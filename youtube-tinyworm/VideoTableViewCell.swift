//
//  VideoTableViewCell.swift
//  youtube-tinyworm
//
//  Created by Wei Liao on 3/3/21.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video : Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(_ v:Video) {
        
        self.video = v
        
        // Set the title and date label
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video!.thumbnail != nil else {
            return
        }
    
    
    let url = URL(string: self.video!.thumbnail)
    
    let session = URLSession.shared
    
    let dataTask = session.dataTask(with: url!) {(data, response, error) in
        
        if error == nil && data != nil {
            if url!.absoluteString != self.video?.thumbnail {
                return
            }
            let image = UIImage(data: data!)
            
            DispatchQueue.main.async{
                self.thumbnailImageView.image = image
            }
        }
    }
        dataTask.resume()
    }
        
}

