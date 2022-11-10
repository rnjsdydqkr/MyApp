//
//  SLViewController.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import UIKit

class MCViewController: UIViewController {

  fileprivate var keyValueObserverList: [NSKeyValueObservation] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    setupObserver()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupViewStyle()
  }
  
  open func setupObserver() { }
  open func setupViewStyle() { }
  
  open func addKeyValueObserverList(_ observer: [NSKeyValueObservation]) {
    keyValueObserverList.append(contentsOf: observer)
  }

}
