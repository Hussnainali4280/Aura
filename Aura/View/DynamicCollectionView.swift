//
//  SoundsCollectionView.swift
//  Aura
//
//  Created by Max Dolensky on 7/15/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class DynamicCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        return self.contentSize
    }
}
