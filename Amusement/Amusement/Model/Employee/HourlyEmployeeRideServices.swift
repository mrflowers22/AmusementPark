//
//  HourlyEmployeeRideServices.swift
//  Amusement
//
//  Created by Michael Flowers on 9/22/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class HourlyEmployeeRideServices: Entrant, BirthdayProvidable {
    let SSN: String
    let dateOfBirth: Date
    
    init(employeeInformation: PersonalInformation, SSN: String?, dateOfBirth: String?) throws {
        guard let SSN = SSN, !SSN.isEmpty else { throw AmusementParkError.noSSNProvided }
        guard let dateOfBirth = dateOfBirth, let birthday = Date.fromString(dateOfBirth) else { throw AmusementParkError.noBirthdayProvided }
        
        self.dateOfBirth = birthday
        self.SSN = SSN
        
        super.init(entrantType: .hourlyEmployee, passType: .hourlyEmplyoeeRideServices, rideAccess: [.allRides], areaAccess: [.amusement, .rideControl], discountType: [.foodDiscount, .merchandiseDiscount], personInformation: employeeInformation)
    }
    
    override func swipe(rideAccess: RideAccess) -> Bool {
        return !self.rideAccess.isEmpty
    }
    
    override func swipe(areaAccess: AreaAccess) -> Bool {
        return !self.areaAccess.isEmpty
    }
    
    override func swipe(discount: DiscountType) -> Float {
        if discount == .foodDiscount {
            return 0.15
        }
        
        if discount == .merchandiseDiscount {
            return 0.25
        }
        return 0.0
    }
}
