//
//  Constants.swift
//  youtube-tinyworm
//
//  Created by Wei Liao on 3/3/21.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyBv1hXvm_m3pCSTX4j6OG1-tTxo6b3Bzy4"
    static var PLAYLIST_ID = "PL_UnJyWUd40ElUibCO0Gi5E10UmiOa3PR"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
