//
//  ConfigurationManager.swift
//  NSKeyValueObserving
//
//  Created by Lutfullin Ruslan on 28/08/2017.
//  Copyright © 2017 Lutfullin Ruslan. All rights reserved.
//

import UIKit

class ConfigurationManager: NSObject {
  // MARK: - Properties
  
  var configuration: Configuration
  
  // MARK: - DateFormatter
  
  private lazy var dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
    return dateFormatter
  }()
  
  var createdAt: String {
    return dateFormatter.string(from: configuration.createdAt)
  }
  
  var updatedAt: String {
    return dateFormatter.string(from: configuration.updatedAt)
  }
  
  // MARK: - Initialization
  
  init(withConfiguration configuration: Configuration) {
    self.configuration = configuration
    
    super.init()
  }
  
  // MARK: - Public Interface
  
  func updateConfiguration() {
    configuration.updatedAt = Date()
  }
}
