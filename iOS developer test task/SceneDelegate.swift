import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        
        let firstVC = ViewController()
        let secondVC = SecondViewController()
    
        let firstNC = UINavigationController(rootViewController: firstVC)
        let secondNC = UINavigationController(rootViewController: secondVC)
        
        let arrayNC = [firstNC, secondNC]
        
        
        
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers(arrayNC, animated: true)
        window?.rootViewController = tabBarVC
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

