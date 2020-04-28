//
//  Command.swift
//  DesignpatternsExample
//
//  Created by Nguyen on 4/28/20.
//  Copyright © 2020 Apple. All rights reserved.
//
///Event bus, Notification Center

import Foundation

struct Color {
    var name: String
}

class ColorReceiver {
    var color: Color

    init(color: Color) {
        self.color = color
    }

    func changeColor() {
        print(color.name)
    }
}

// MARK: Command
protocol Command {
    func execute()
}

class ConcreteCommand: Command {

    var colorReceiver: ColorReceiver

    init(colorReceiver: ColorReceiver) {
        self.colorReceiver = colorReceiver
    }

    func execute() {
        colorReceiver.changeColor()
    }

}

class Invoker {
    func execute(command: Command) {
        command.execute()
    }
}

class Client {
    let invoker = Invoker()

    func showPattern() {
        let colorReceiver = ColorReceiver(color: Color(name: "red"))
        let command: Command = ConcreteCommand(colorReceiver: colorReceiver)
        invoker.execute(command: command)
    }
}

// MARK: Usage
class UsageCommand {

    init() {
        let client = Client()
        client.showPattern()
    }

}

// MARK: Output
//red
