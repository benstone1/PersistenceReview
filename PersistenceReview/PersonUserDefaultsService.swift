import Foundation

class PersonUserDefaultsService {
    private init() {}
    static let manager = PersonUserDefaultsService()
    
    private let key = "people"
    
    func save(_ person: Person) {
        var people = getAllPeople()
        people.append(person)
        UserDefaults.standard.set(people.map { $0.dict }, forKey: key)
    }
    
    func save(_ newPeople: [Person]) {
        var people = getAllPeople()
        people += newPeople
        UserDefaults.standard.set(newPeople.map { $0.dict }, forKey: key)
    }
    
    func getAllPeople() -> [Person] {
        guard let peopleDict = UserDefaults.standard.array(forKey: key) as? [[String: Any]] else { return [] }
        return peopleDict.map { Person(from: $0) }
    }
}
