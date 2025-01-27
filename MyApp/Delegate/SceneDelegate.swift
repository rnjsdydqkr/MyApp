//
//  SceneDelegate.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    guard let _ = (scene as? UIWindowScene) else { return }
    
    debugPrint("[AppLifecycle] SceneDelegate : willConnectTo")
    
  }

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    debugPrint("[AppLifecycle] SceneDelegate : sceneDidDisconnect")
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    // 앱 포그라운드 진입
    debugPrint("[AppLifecycle] SceneDelegate : sceneDidBecomeActive")
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
    // 메뉴 선택 화면 or 홈 버튼 누를 시
    debugPrint("[AppLifecycle] SceneDelegate : sceneWillResignActive")
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
    // 앱 백그라운드 상태에서 다시 포그라운드 상태 진입
    debugPrint("[AppLifecycle] SceneDelegate : sceneWillEnterForeground")
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.

    // Save changes in the application's managed object context when the application transitions to the background.
    // 앱 백그라운드 진입
    debugPrint("[AppLifecycle] SceneDelegate : sceneDidEnterBackground")
    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
  }
  
  func changeRootNavigationController(_ vc: SLViewController,
                    transitionDuration: TimeInterval = 0.3,
                    transitionStyle: UIView.AnimationOptions = .transitionCrossDissolve) {
    guard let window = self.window else { return }
    window.rootViewController = vc
    
    UIView.transition(with: window, duration: transitionDuration, options: transitionStyle, animations: nil)
  }


}

