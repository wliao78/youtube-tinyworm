//
//  Model.swift
//  youtube-tinyworm
//
//  Created by Wei Liao on 3/3/21.
//

import Foundation

protocol ModelDelegate {
    func videosFetched (_ videos:[Video])
}


class Model {
    
    var delegate : ModelDelegate?
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string:  Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from URLSession object
        let dataTask = session.dataTask(with: url!) {(data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
        do {
            // Parsing the data into video objects
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let response = try decoder.decode(Response.self, from: data!)
            //Call the "videosFetched" method of the delegate
            if response.items != nil {
                
                DispatchQueue.main.async {
                    self.delegate?.videosFetched(response.items!)
                }
                
            }
            
               // dump(response)
        }
        catch {
                
        }
    }
        // Kick off the task
        dataTask.resume()
    }
}
