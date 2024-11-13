//
//  NSCollectionLayoutEnvironmentDummy.swift
//  CommonListKitTests
//
//  Created by 박기석 on 11/14/24.
//

import UIKit

final class NSCollectionLayoutEnvironmentDummy: NSObject, NSCollectionLayoutEnvironment {
    var container: any NSCollectionLayoutContainer { fatalError() }
    var traitCollection: UITraitCollection { .init() }
}
