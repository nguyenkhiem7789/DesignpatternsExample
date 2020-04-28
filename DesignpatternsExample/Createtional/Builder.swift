//Ưu điểm:
//    Cho phép thay đổi biểu diễn nội bộ của một lớp.
//    Đóng gói code để xây dựng và trình bày.
//    Cho phép kiểm soát từng bước của quá trình xây dựng đối tượng.
//Nhược điểm:
//    Yêu cầu một Builder cho từng loại đối tượng khác nhau.
//    Các thuộc tính của đối tượng không đảm bảo rằng sẽ được khởi tạo.
/// Builder Khởi tạo đối tượng một cách linh động theo các tính chất của nó
class Car {
    var weel: Int?
    var color: String?
}

protocol CarBuilderProtocol {
    func build() -> Car
    func setWeel(weel:Int) -> CarBuilder
    func setColor(color:String) -> CarBuilder
}

// MARK: Builder
class CarBuilder: CarBuilderProtocol{
    var car: Car

    init() {
        self.car = Car()
    }

    func build() -> Car{
        return car
    }

    func setWeel(weel: Int) -> CarBuilder {
        car.weel = weel
        return self
    }

    func setColor(color: String) -> CarBuilder {
        car.color = color
        return self
    }
}

// MARK: Usage
class UsageBuilder {
    init() {
        let builder = CarBuilder()
        let car = builder.setWeel(weel: 4).setColor(color: "White").build()
        print("Car weel: \(car.weel!), Car color: \(car.color!)") //result: "Car weel: 4, Car color: White"
        let car2 = builder.setWeel(weel: 5).setColor(color: "Black").build()
        print("Car weel: \(car2.weel!), Car color: \(car2.color!)") //result: "Car weel: 5, Car color: Black"

    }
}
