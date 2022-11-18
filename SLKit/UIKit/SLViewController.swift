//
//  SLViewController.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import UIKit

class SLViewController: UIViewController {

  fileprivate var keyValueObserverList: [NSKeyValueObservation] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    setupObserver()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupViewStyle()
  }
  
  func setupObserver() { }
  func setupViewStyle() { }
  
  func addKeyValueObserverList(_ observer: [NSKeyValueObservation]) {
    keyValueObserverList.append(contentsOf: observer)
  }

}
