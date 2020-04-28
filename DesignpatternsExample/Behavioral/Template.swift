//
//  Template.swift
//  DesignpatternsExample
//
//  Created by Nguyen on 4/28/20.
//  Copyright © 2020 Apple. All rights reserved.
//
/// Just only abtract class

import Foundation

protocol Office {
    func officeSchedule()
}

protocol Employee {
    func work()
    func getPaid()
}

class XYZOffice: Office {
    var delegate: Employee

    init(employee: Employee) {
        self.delegate = employee
    }

    func officeSchedule() {
        delegate.work()
        delegate.getPaid()
    }
}

class Developer: Employee {
    func work() {
        print("Developer has worked 40 hours/week this month")
    }

    func getPaid() {
        print("Developer has earned Rs 50,000 this month")
    }
}

class ProductManager: Employee {
    func work() {
        print("Product Manager has worked 55 hours/week this month")
    }

    func getPaid() {
        print("Product Manager has earned Rs 77,000 this month")
    }
}

class UsageTemplate {

    init() {
        let xyzOfficeDev = XYZOffice(employee: Developer())
        let xyzOfficeManager = XYZOffice(employee: ProductManager())

        xyzOfficeDev.officeSchedule()
        xyzOfficeManager.officeSchedule()
    }
}

// MARK: Output
//Developer has worked 40 hours/week this month
//Developer has earned Rs 50,000 this month
//Product Manager has worked 55 hours/week this month
//Product Manager has earned Rs 77,000 this month
