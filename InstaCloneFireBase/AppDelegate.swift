import UIKit
import FirebaseCore


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        self.window = UIWindow(frame:UIScreen.main.bounds)
//        let nav1 = UITabBarController()
//        let nav1 = UINavigationController()
//        let mainView = HomePage(nibName: nil, bundle: nil)
//        HomePage().tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.contacts, tag: 0)
//        HomePage().tabBarItem = UITabBarItem(title: "a", image: UIImage(systemName: "add"), tag: 0)
//        SecondPage().tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 1)
//        
//        nav1.viewControllers = [HomePage(),SecondPage()]
//        self.window?.rootViewController = nav1
        
        
//        let tabbar = UITabBarController()
//        
//        let firstVC = UINavigationController(rootViewController: HomePage())
//        let secondVC = UINavigationController(rootViewController: SecondPage())
//        let thirdVC = UINavigationController(rootViewController: ThirdPage())
//        let forthVC = UINavigationController(rootViewController: FourthPage())
        let signVC = UINavigationController(rootViewController: SignPage())

//        firstVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"),selectedImage: UIImage(systemName: "house.fill"))
//        forthVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
//        secondVC.tabBarItem = UITabBarItem(title: "Add", image: UIImage(systemName: "person.line.dotted.person"), selectedImage: UIImage(systemName: "person.line.dotted.person.fill"))
//        thirdVC.tabBarItem =  UITabBarItem(title: "Profile", image: UIImage(systemName: "person"),selectedImage: UIImage(systemName: "person.fill"))

//        tabbar.viewControllers = [firstVC,forthVC, secondVC,thirdVC ]

        window?.rootViewController = signVC
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
