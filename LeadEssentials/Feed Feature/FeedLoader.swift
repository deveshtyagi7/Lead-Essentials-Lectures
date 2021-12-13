//
//  FeedLoader.swift
//  LeadEssentials
//
//  Created by Devesh Tyagi on 02/12/21.
//

import Foundation
enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}
protocol FeedLooder {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
