import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var dataSource: UITableViewDiffableDataSource<String, Person>!
    
    var people = [Person]() {
        didSet {
            updateDataSource(using: people)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadPeople()
    }
    func configureTableView() {
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "personCell")
        dataSource = UITableViewDiffableDataSource(tableView: tableView,
                                                   cellProvider: { (tableView, indexPath, person) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "personCell")
            cell?.textLabel?.text = person.name
            cell?.detailTextLabel?.text = person.age.description
            return cell
        })
    }
    func updateDataSource(using people: [Person]) {
        var snapshot = NSDiffableDataSourceSnapshot<String, Person>()
        snapshot.appendSections(["Main"])
        snapshot.appendItems(people, toSection: "Main")
        dataSource.apply(snapshot)
    }
    func loadPeople() {
        do {
//            try PersonPersistenceService.manager.deleteAllPeople()
//            let randoPeople = Person.getRandomPeople(count: 60_000)
            
            print("App is loaded, fetching people", Date())
//            let filePeople = try PersonPersistenceService.manager.getAllPeople()
//            print(filePeople.count)
//            self.people = [filePeople[1_000_000]]
            print(PersonUserDefaultsService.manager.getAllPeople().last)
            print("People are fetched", Date())

//            try PersonPersistenceService.manager.save(randoPeople)
//            PersonUserDefaultsService.manager.save(randoPeople)
//            print("saved")
        }
        catch {
            print(error)
        }
    }
}

