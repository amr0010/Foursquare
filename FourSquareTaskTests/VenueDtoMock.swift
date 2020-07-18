//
//  VenueDtoMock.swift
//  FourSquareTaskTests
//
//  Created by Amr on 7/18/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
class VenueDTOMock {
    static var venueDTO: VenuesDTO {
       return VenuesDTO(meta: VenueDTOMock.meta, response: VenueDTOMock.response)
    }
    
    static var meta: Meta {
        return Meta(code: 1231, requestID: "123455")
    }
    
    static var response: Response {
        return Response(venues: VenueDTOMock.venues, confident: true)
    }
    
    static var venues: [Venue] {
       let venue1 = Venue(id: "123",
                          name: "Test Venue #1",
                          location: VenueDTOMock.location,
                          categories: nil,
                          referralID: nil,
                          hasPerk: true,
                          venuePage: nil)
        let venue2 = Venue(id: "123",
                                name: "Test Venue #1",
                                location: VenueDTOMock.location,
                                categories: nil,
                                referralID: nil,
                                hasPerk: true,
                                venuePage: nil)
        let venue3 = Venue(id: "123",
                                name: "Test Venue #1",
                                location: VenueDTOMock.location,
                                categories: nil,
                                referralID: nil,
                                hasPerk: true,
                                venuePage: nil)
        return [venue1, venue2, venue3]
    }
    
    static var location: Location {
        return Location(lat: 50,
                        lng: 50,
                        labeledLatLngs: nil,
                        distance: 50,
                        cc: "test cc",
                        city: "test city",
                        state: "test state",
                        country: "test county",
                        formattedAddress: ["one", "two", "three"],
                        address: "test address",
                        crossStreet: "test street",
                        postalCode: "12345")
    }
}
