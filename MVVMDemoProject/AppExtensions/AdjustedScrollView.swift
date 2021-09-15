//
//  AdjustedScrollView.swift
//  UAEProLeague
//
//  Created by Dixit Rathod on 09/06/20.
//  Copyright © 2020 Mobiiworld. All rights reserved.
//

import UIKit

class AdjustedScrollView: UIScrollView {

    override func awakeFromNib() {
        super.awakeFromNib()
        guard let root = UIApplication.shared.keyWindow?.rootViewController else {return}
        contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: root.view.safeAreaInsets.bottom + 60.0, right: 0.0)
    }

}
