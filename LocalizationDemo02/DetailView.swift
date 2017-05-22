//
//  DetailView.swift
//  LocalizationDemo02
//
//  Created by Karol Altamirano on 5/21/17.
//  Copyright © 2017 Karol Altamirano. All rights reserved.
//

import UIKit

@IBDesignable
class DetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }

    func prepare() {
        let label = UILabel()

        label.textAlignment = .center
        label.text = NSLocalizedString("code-label-example", comment: "Label from code")

        addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}

