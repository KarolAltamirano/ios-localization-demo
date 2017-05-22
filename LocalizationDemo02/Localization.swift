//
//  Localization.swift
//  LocalizationDemo02
//
//  Created by Karol Altamirano on 5/21/17.
//  Copyright © 2017 Karol Altamirano. All rights reserved.
//

import Foundation

class Localization {

    fileprivate static var languageCache: String?
    fileprivate static var languageBundle: Bundle?

    class func create() {
        method_exchangeImplementations(
            class_getInstanceMethod(
                Bundle.self,
                #selector(Bundle.localizedString(forKey:value:table:))
            ),
            class_getInstanceMethod(
                Bundle.self,
                #selector(Bundle.specialLocalizedString(forKey:value:table:))
            )
        )
    }

    class func currentLanguage() -> String {
        let languages = UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray
        return languages.firstObject as! String
    }

}

extension Bundle {

    func specialLocalizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        let currentLanguage = Localization.currentLanguage()

        if Localization.languageCache != currentLanguage || Localization.languageBundle == nil {
            var path: String

            Localization.languageCache = currentLanguage

            if currentLanguage.hasPrefix("sk") {
                path = Bundle.main.path(forResource: "sk-SK", ofType: "lproj")!
            } else {
                path = Bundle.main.path(forResource: "en-150", ofType: "lproj")!
            }

            Localization.languageBundle = Bundle(path: path)
        }

        return Localization.languageBundle!.specialLocalizedString(
            forKey: key, value: value, table: tableName
        )
    }

}

