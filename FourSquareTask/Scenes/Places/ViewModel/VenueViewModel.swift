//
//  VenueViewModel.swift
//  FourSquareTask
//
//  Created by Amr on 7/17/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation

class VenueViewModel {
    var venue: Venue?
    init(venue: Venue) {
        self.venue = venue
    }
    var imageUrl: URL? {
        guard venue?.categories?.count ?? 0 > 0 else { return nil }
        guard let prefix = venue?.categories?[0].icon?.iconPrefix,
            let suffix = venue?.categories?[0].icon?.suffix else { return nil }
        let iconUrlString = String(format: "%@%d%@", prefix, 88, suffix)
        return URL(string: iconUrlString)
    }
    var title: String {
        return venue?.name ?? ""
    }
    var address: String? {
        return venue?.location?.formattedAddress?.joined(separator: " - ")
    }
}
