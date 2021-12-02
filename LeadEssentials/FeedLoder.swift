//
//  FeedLoder.swift
//  LeadEssentials
//
//  Created by Devesh Tyagi on 01/12/21.
//

import Foundation
import UIKit
protocol FeedLoader {
    func loadFeed(competion : @escaping ([String]) -> Void)
}


class FeedViewController : UIViewController {
    var loder : FeedLoader!
    
    convenience init(loder : FeedLoader) {
        self.init()
        self.loder = loder
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loder.loadFeed { items in
            
        }
        
    }
}

class RemoteFeedLoder : FeedLoader {
    func loadFeed(competion: @escaping ([String]) -> Void) {
        //Load feed from server
    }
    
    
}

class LocalFeedLoder : FeedLoader {
    func loadFeed(competion: @escaping ([String]) -> Void) {
        //Load feed from cache
    }
}

class RemoteWithLocalFeedbackFeedLoader : FeedLoader {
    func loadFeed(competion: @escaping ([String]) -> Void) {
        let load = Reachability.networkAvailable ? remoteLoder.loadFeed : localLoder.loadFeed
        load(competion)
    }
    
    var remoteLoder : FeedLoader!
    var localLoder : FeedLoader!
    
    convenience init(remoteLoder : FeedLoader, localLoder : FeedLoader){
        self.init()
        self.remoteLoder = remoteLoder
        self.localLoder = localLoder
    }
}

struct Reachability {
    static let networkAvailable = false
}
