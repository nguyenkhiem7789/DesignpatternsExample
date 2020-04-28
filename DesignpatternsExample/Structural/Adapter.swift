//
//when you want to use a third-party class but its interface doesn’t match the rest of your application’s code;
//when you need to use several existing subclasses but they lack particular functionality and, on top of that, you can’t extend the superclass.
//
/// Adapter biến những tính chất của đối tượng mình không cần thành tính chất mà mình cần
/// Adapter chuyển đổi mã nguồn để làm việc được với mã nguồn khác

import Foundation

// MARK: In third libs
protocol Connection {
    func makeReady() -> Void
    func isReady() -> Bool
    func sendPacket(_ data: String) -> Void
}

class EthernetConnection : Connection {

    func makeReady() {
        print("Making Ethernet Ready...")
    }

    func isReady() -> Bool {
        return arc4random_uniform(2) == 0
    }

    func sendPacket(_ data: String) {
        if data.count > 10 { return }
        print("Packet sent. [\(data)]")
    }
}

class MobileDataConnection: Connection {

    func makeReady() {
        print("Making MobileData Ready...")
    }

    func isReady() -> Bool {
        return arc4random_uniform(2) == 0
    }

    func sendPacket(_ data: String) {
        if data.count > 5 { return }
        print("Packet sent. [\(data)]")
    }
}

// MARK: class Adapter
class ThunderboltAdapter {
    var connection: Connection

    init(_ connection: Connection) {
        self.connection = connection
    }

    func sendData(_ data: String) {

        if connection is EthernetConnection {
            let sequence = stride(from: 0, to: data.count, by: 10)
            for i in sequence {
                let start = data.index(data.startIndex, offsetBy: i)
                let end = i + 10 >= data.count ?
                    data.index(data.endIndex, offsetBy: 0) :
                    data.index(data.startIndex, offsetBy: i+10)
                connection.sendPacket(String(data[start..<end]))
            }
            return
        }

        if connection is MobileDataConnection {
            let sequence = stride(from: 0, to: data.count, by: 5)
            for i in sequence {
                let start = data.index(data.startIndex, offsetBy: i)
                let end = i + 5 >= data.count ?
                    data.index(data.endIndex, offsetBy: 0) :
                    data.index(data.startIndex, offsetBy: i+5)
                connection.sendPacket(String(data[start..<end]))
            }
            return
        }
    }
}

// MARK: Usage
class UsageAdapter {
    init() {
        let DEMO_TEXT: String = "My Name is Mahbub. I like to use design pattern as much as possible"

        let ethernetConn: EthernetConnection = EthernetConnection()
        let mobileDataConn: MobileDataConnection = MobileDataConnection()

        var adapter: ThunderboltAdapter = ThunderboltAdapter(ethernetConn)
        adapter.sendData(DEMO_TEXT)

        print("=====")

        adapter = ThunderboltAdapter(mobileDataConn)
        adapter.sendData(DEMO_TEXT)
    }
}

// MARK: Result

//Packet sent. [My Name is]
//Packet sent. [ Mahbub. I]
//Packet sent. [ like to u]
//Packet sent. [se design ]
//Packet sent. [pattern as]
//Packet sent. [ much as p]
//Packet sent. [ossible]
//=====
//Packet sent. [My Na]
//Packet sent. [me is]
//Packet sent. [ Mahb]
//Packet sent. [ub. I]
//Packet sent. [ like]
//Packet sent. [ to u]
//Packet sent. [se de]
//Packet sent. [sign ]
//Packet sent. [patte]
//Packet sent. [rn as]
//Packet sent. [ much]
//Packet sent. [ as p]
//Packet sent. [ossib]
//Packet sent. [le]
