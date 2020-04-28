//
//  Iterator.swift
//  DesignpatternsExample
//
//  Created by Nguyen on 4/28/20.
//  Copyright © 2020 Apple. All rights reserved.
//
///This pattern is used for iterating over a collection of elements. It does not expose the data structure used in implementing it (array, dictionary or linked list) rather it gives an interface which iterates over the collection of elements without exposing its underlying representation.

import Foundation

struct MyBestFilms: Sequence {
    let films: [String]

    func makeIterator() -> MyBestFilmsIteractor {
        return MyBestFilmsIteractor(films)
    }
}

// MARK: Iteractor
struct MyBestFilmsIteractor: IteratorProtocol {

    var films: [String]
    var cursor: Int = 0

    init(_ films: [String]) {
        self.films = films
    }

    mutating func next() -> String? {
        defer { cursor += 1 }
        return films.count > cursor ? films[cursor] : nil
    }

}

// MARK: Usage
class UsageInteractor {

    init() {
        let myFilms = MyBestFilms(films: ["Prision Break", "Godfather", "Soledad"])
        for film in myFilms {
            print(film)
        }
    }

}

// MARK: Output
//Prision Break
//Godfather
//Soledad

