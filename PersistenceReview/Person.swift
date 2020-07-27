import Foundation

struct Person: Codable, Hashable {
    let name: String
    let age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    static func randomPerson() -> Person {
        let randVal = Int.random(in: 0...100_000_000_000)
        let name = "Test Person: \(randVal)"
        return Person(name: name,
                      age: Int.random(in: 0...120))
    }
    static func getRandomPeople(count: Int) -> [Person] {
        (0..<count).map { _ in Person.randomPerson() }
    }
    var dict: [String: Any] {
        return ["name": name, "age": age]
    }
    init(from dict: [String: Any]) {
        self.name = dict["name"]! as! String
        self.age = dict["age"]! as! Int
    }
}
