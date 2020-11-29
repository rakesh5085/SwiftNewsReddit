//
//  BaseController.swift

import UIKit

/// Used to separate between controller and view..
class BaseController<T: UIView>: UIViewController {
  let root = T()

  override func loadView() {
    view = root
  }
}
