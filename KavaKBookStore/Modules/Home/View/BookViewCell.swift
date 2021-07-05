//
//  BookViewCell.swift
//  KavaKBookStore
//
//  Created by Ranferi Dominguez Rios on 04/07/21.
//

import Foundation
import UIKit

import UIKit
import SDWebImage

class BookViewCell: UITableViewCell {
  
  static let identifier = "BookViewCell"

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLable: UILabel!
  
  override func prepareForReuse() {
        super.prepareForReuse()
        bookImage.image = nil
        titleLabel.text = nil
        authorLable.text = nil
  }

  func configure(with model: BookViewModel) {
        titleLabel.text = model.title
        authorLable.text = model.author
        bookImage.clipsToBounds = true
        bookImage.sd_setImage(with: model.image, completed: nil)
  }
}
