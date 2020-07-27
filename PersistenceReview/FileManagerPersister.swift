import Foundation

struct FileManagerPersister<T: Codable> {
    init(fileName: String) {
        self.fileName = fileName
    }
    private let fileName: String
    
    private var url: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentsDirectory.appendingPathComponent(fileName)
        return url
    }
    
    func getAllElements() throws -> [T] {
        guard let data = FileManager.default.contents(atPath: url.path) else { return [] }
        return try PropertyListDecoder().decode([T].self, from: data)
    }
    func deleteAllElements() throws {
        let encodedData = try PropertyListEncoder().encode([Person]())
        try encodedData.write(to: url)
    }
    func save(_ newElement: T) throws {
        var elements = try getAllElements()
        elements.append(newElement)
        let encodedData = try PropertyListEncoder().encode(elements)
        try encodedData.write(to: url)
    }
    func save(_ newElements: [T]) throws {
        var elements = try getAllElements()
        elements += newElements
        let encodedData = try PropertyListEncoder().encode(elements)
        try encodedData.write(to: url)
    }
}
