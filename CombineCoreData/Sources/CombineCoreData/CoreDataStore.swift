import CoreData

public enum StorageType {
    case persistent, inMemory
}

public extension NSManagedObject {
    class var entityName: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}

public protocol EntityCreating {
    var viewContext: NSManagedObjectContext { get }
    func createEntity<T: NSManagedObject>() -> T
}

public extension EntityCreating {
    func createEntity<T: NSManagedObject>() -> T {
        T(context: viewContext)
    }
}

public protocol CoreDataFetchResultsPublishing {
    var viewContext: NSManagedObjectContext { get }
    func publisher<T: NSManagedObject>(fetch request: NSFetchRequest<T>) -> CoreDataFetchResultsPublisher<T>
}

public extension CoreDataFetchResultsPublishing {
    func publisher<T: NSManagedObject>(fetch request: NSFetchRequest<T>) -> CoreDataFetchResultsPublisher<T> {
        return CoreDataFetchResultsPublisher(request: request, context: viewContext)
    }
}

public protocol CoreDataDeleteModelPublishing {
    var viewContext: NSManagedObjectContext { get }
    func publisher(delete request: NSFetchRequest<NSFetchRequestResult>) -> CoreDataDeleteModelPublisher
}

public extension CoreDataDeleteModelPublishing {
    func publisher(delete request: NSFetchRequest<NSFetchRequestResult>) -> CoreDataDeleteModelPublisher {
        return CoreDataDeleteModelPublisher(delete: request, context: viewContext)
    }
}

public protocol CoreDataSaveModelPublishing {
    var viewContext: NSManagedObjectContext { get }
    func publisher(save action: @escaping Action) -> CoreDataSaveModelPublisher
}

extension CoreDataSaveModelPublishing {
    public func publisher(save action: @escaping Action) -> CoreDataSaveModelPublisher {
        return CoreDataSaveModelPublisher(action: action, context: viewContext)
    }
}

public protocol CoreDataStoring: EntityCreating, CoreDataFetchResultsPublishing, CoreDataDeleteModelPublishing, CoreDataSaveModelPublishing {
    var viewContext: NSManagedObjectContext { get }
}

//class CoreDataStore: CoreDataStoring {
//
//    private let container: NSPersistentContainer
//
//    static var `default`: CoreDataStoring = {
//        return CoreDataStore(name: "CoreDataExample", in: .persistent)
//    }()
//
//    var viewContext: NSManagedObjectContext {
//        return self.container.viewContext
//    }
//
//    init(name: String, in storageType: StorageType) {
//        self.container = NSPersistentContainer(name: name)
//        self.setupIfMemoryStorage(storageType)
//        self.container.loadPersistentStores { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        }
//    }
//
//    private func setupIfMemoryStorage(_ storageType: StorageType) {
//        if storageType  == .inMemory {
//            let description = NSPersistentStoreDescription()
//            description.url = URL(fileURLWithPath: "/dev/null")
//            self.container.persistentStoreDescriptions = [description]
//        }
//    }
//}
