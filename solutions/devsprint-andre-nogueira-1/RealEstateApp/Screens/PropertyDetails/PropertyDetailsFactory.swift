import Foundation

struct PropertyDetailsFactory {
    static func createPropertyDetails() -> PropertyDetailsViewController {
        let managerUrl = ManagerGetURL()
        let apiClientProperty = RealEstateAPIClientProperty(url: managerUrl)
        let viewController = PropertyDetailsViewController()
        return viewController
    }
}
