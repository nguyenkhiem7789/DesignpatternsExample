//
//  Facade.swift
//  DesignpatternsExample
//
//  Created by Nguyen on 4/28/20.
//  Copyright © 2020 Apple. All rights reserved.
//
///Facade Pattern cho phép bao bọc mã nguồn gốc để nó có thể giao tiếp với mã nguồn khác dễ dàng hơn.

import Foundation

class AccountService {

    func getAccount(email: String) {
        print("Getting the account of \(email)")
    }
}

class PaymentService {

    func paymentByPaypal() {
        print("Payment by Paypal")
    }

    func paymentByCreditCard() {
        print("Payment by Credit Card")
    }

    func paymentByEbankingAccount() {
        print("Payment by E-banking account")
    }

    func paymentByCash() {
        print("Payment by cash")
    }
}

class ShippingService {
    func freeShipping() {
        print("Free Shipping")
    }

    func standardShipping() {
        print("Standard Shipping")
    }

    func expressShipping() {
        print("Express Shipping")
    }
}

// MARK: Facade
class ShopFacade {

    lazy var accountService: AccountService = {
        return AccountService()
    }()

    lazy var paymentService: PaymentService = {
        return PaymentService()
    }()

    lazy var shippingService: ShippingService = {
        return ShippingService()
    }()

    init() {
    }

    func byPaypalFreeShipping(email: String) {
        accountService.getAccount(email: email)
        paymentService.paymentByPaypal()
        shippingService.freeShipping()
    }

    func byCashExpressShipping(email: String) {
        accountService.getAccount(email: email)
        paymentService.paymentByCash()
        shippingService.expressShipping()
    }
}

// MARK: Usage
class UsageFacade {

    init() {
        let shop: ShopFacade = ShopFacade()
        print("\(shop.byPaypalFreeShipping(email: "nguyenkhiem7789@gmail.com"))")
        print("\(shop.byCashExpressShipping(email: "huongphung7995@gmail.com"))")
    }

}

// MARK: Result
//Getting the account of nguyenkhiem7789@gmail.com
//Payment by Paypal
//Free Shipping
//
//Getting the account of huongphung7995@gmail.com
//Payment by cash
//Express Shipping
