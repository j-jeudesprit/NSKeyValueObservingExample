//
//  ViewController.swift
//  NSKeyValueObserving
//
//  Created by Lutfullin Ruslan on 28/08/2017.
//  Copyright © 2017 Lutfullin Ruslan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  // MARK: - Properties
  
  @IBOutlet var timeLabel: UILabel!
  
  // MARK: - ConfigurationManager
  
  let configurationManager = ConfigurationManager(withConfiguration: Configuration())
  
  // MARK: - Actions
  
  @IBAction func updateConfiguration(_ sender: UIButton) {
    configurationManager.updateConfiguration()
  }
  
  // MARK: - View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    addObserver(self,
                forKeyPath: #keyPath(configurationManager.configuration.updatedAt),
                options: [.old, .new, .initial],
                context: nil
  ) }
  
  // MARK: - Key-Value Observing
  
  override func observeValue(
    forKeyPath keyPath: String?,
    of object: Any?,
    change: [NSKeyValueChangeKey: Any]?,
    context: UnsafeMutableRawPointer?
  ) {
    if keyPath == #keyPath(configurationManager.configuration.updatedAt) {
      // Update Time Label
      timeLabel.text = configurationManager.updatedAt
    }
  }
  
  // MARK: - Deinitialization
  
  deinit {
    removeObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt))
  }
}

