//Theo như GoF (Gang of Four), mẫu thiết kế Decorator là một trong nhiều những mẫu thiết kế cấu trúc thường được sử dụng. Mẫu thiết kế này sẽ linh động thay đổi tính chất (functionality) đã có trong một đối tượng khi chương trình đang chạy (runtime) mà không ảnh hưởng đến các tình chất đã tồn tại của các đối tượng khác.
/// Decorator thêm tính chất vào đối tượng một cách tuỳ chỉnh. 
protocol Pizza {
    func doPizza() -> String
}

class TomatoPizza: Pizza {
    func doPizza() -> String {
        return "I am a Tomato Pizza"
    }
}

class ChickenPizza: Pizza {
    func doPizza() -> String {
        return "I am a Chicken Pizza"
    }
}

// MARK: Decorator
class PizzaDecorator: Pizza {

    let pizza: Pizza

    init(pizza: Pizza) {
        self.pizza = pizza
    }

    func doPizza() -> String {
        return pizza.doPizza()
    }

}

class CheeseDecorator: PizzaDecorator {

    override init(pizza: Pizza) {
        super.init(pizza: pizza)
    }

    override func doPizza() -> String {
        let type = pizza.doPizza()
        return type + addCheese()
    }

    func addCheese() -> String {
        return "+ Cheese"
    }

}

class PeppperDecorator: PizzaDecorator {

    override init(pizza: Pizza) {
        super.init(pizza: pizza)
    }

    override func doPizza() -> String {
        let type = pizza.doPizza()
        return type + addPepper()
    }

    func addPepper() -> String {
        return "+ Pepper"
    }
}

// MARK: Usage
class PizzaShop {

    init() {
        let tomatoPizza = TomatoPizza()
        let chickenPizza = ChickenPizza()
        print("\(tomatoPizza.doPizza())")
        print("\(chickenPizza.doPizza())")

        /// Use Decoractor pattern to extend existing pizza dynamically

        /// Add pepper to tomato-pizza
        let pepperDecorator = PeppperDecorator(pizza: tomatoPizza)
        print("\(pepperDecorator.doPizza())")

        /// Add cheese to tomato-pizza
        let cheeseDecorator = CheeseDecorator(pizza: tomatoPizza)
        print("\(cheeseDecorator.doPizza())")

        /// Add pepper to chicken-pizza
        let pepperDecorator2 = PeppperDecorator(pizza: chickenPizza)
        print("\(pepperDecorator2.doPizza())")
    }

}

// MARK: Result
//I am a Tomato Pizza
//I am a Chicken Pizza
//I am a Tomato Pizza+ Pepper
//I am a Tomato Pizza+ Cheese
//I am a Chicken Pizza+ Pepper
