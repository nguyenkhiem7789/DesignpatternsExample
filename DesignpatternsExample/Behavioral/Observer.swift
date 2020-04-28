//
//  Observer.swift
//  DesignpatternsExample
//
//  Created by Nguyen on 4/28/20.
//  Copyright © 2020 Apple. All rights reserved.
//
/// In this pattern, one object notifies other objects about its state change i.e. when the state of one object changes, other object which are subscribed to it gets notified about the state change.

///AppleSeller is the class that implements the Observable protocol. When the appleCount variable value changes, it calls the notify() method to notify the customers who are added to it.
///Customer is a class that listens to the changes in the appleCount variable. As soon as this variable’s value changes, the customer gets updated via the update() method.
Customer is a class that listens to the changes in the appleCount variable. As soon as this variable’s value changes, the customer gets updated via the update() method.
import Foundation

protocol Observable {
    func add(customer: Observer)
    func remove(customer: Observer)
    func notify()
}

protocol Observer {
    var id: Int { get set }
    func update()
}

// MARK: Observable
class AppleSeller: Observable {

    private var observers: [Observer] = []
    private var count: Int = 0

    var appleCount: Int {
        set {
            count = newValue
            notify()
        }
        get {
            return count
        }
    }

    func add(customer: Observer) {
        observers.append(customer)
    }

    func remove(customer: Observer) {
        observers = observers.filter{ $0.id != customer.id }
    }

    func notify() {
        for observer in observers {
            observer.update()
        }
    }

}

class Customer: Observer {
    var id: Int
    var observable: AppleSeller
    var name: String

    init(name: String, o: AppleSeller, customerId: Int) {
        self.name = name
        self.observable = o
        self.id = customerId
        self.observable.add(customer: self)
    }

    func update() {
        print("Hurry \(name)! \(observable.appleCount) apples arrived at shop.")
    }
}

// MARK: Usage
class UsageObserver {

    init() {
        let appleSeller = AppleSeller()
        let james = Customer(name: "James", o: appleSeller, customerId: 101)
        let david = Customer(name: "David", o: appleSeller, customerId: 102)

        appleSeller.appleCount = 10
        appleSeller.remove(customer: james)
        appleSeller.appleCount = 20
    }
}

// MARK: Output
//Hurry James! 10 apples arrived at shop.
//Hurry David! 10 apples arrived at shop.
//Hurry David! 20 apples arrived at shop.

