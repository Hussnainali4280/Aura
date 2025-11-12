//
//  NoScrollTableView.swift
//  Aura
//
//  Created by Max Dolensky on 8/12/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class NoScrollTableView: UITableView {
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }
    
    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
    
}
