import Foundation

class PersonPersistenceService {
    private init() {}
    
    static let manager = PersonPersistenceService()
    
    private let persister = FileManagerPersister<Person>(fileName: "people.plist")
    
    func save(_ person: Person) throws {
        try persister.save(person)
    }
    
    func save(_ people: [Person]) throws {
        try persister.save(people)
    }
    func deleteAllPeople() throws {
        try persister.deleteAllElements()
    }
    
    func getAllPeople() throws -> [Person] {
        try persister.getAllElements()
    }
}
