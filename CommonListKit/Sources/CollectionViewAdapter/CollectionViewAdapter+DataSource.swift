//
//  CollectionViewAdapter+DataSource.swift
//  CommonListKit
//
//  Created by 박기석 on 11/13/24.
//

import UIKit

// MARK: UICollectionView DataSource
extension CollectionViewAdapter: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.section(at: section)?.items.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cellProvider(with: collectionView, indexPath: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               viewForSupplementaryElementOfKind kind: String,
                               at indexPath: IndexPath) -> UICollectionReusableView {
        supplementaryProvider(with: collectionView, kind: kind, indexPath: indexPath)
    }
}

// MARK: Cell Bind
extension CollectionViewAdapter {
    private func cellProvider(with collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let component = item(at: indexPath) else { fatalError() }
        
        registerCell(about: component.reuseIdentifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: component.reuseIdentifier, for: indexPath)
        bindItem(to: cell, with: component)
        
        return cell
    }
    
    private func registerCell(about identifier: String) {
        guard registeredCellIdentifiers.contains(identifier) == false else { return }
        
        registeredCellIdentifiers.insert(identifier)
        collectionView?.register(ComponentCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }
}

// MARK: Supplementary Bind
extension CollectionViewAdapter {
    private func supplementaryProvider(with collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView {
        guard let section = section(at: indexPath.section) else { fatalError() }
        
        let component: ComponentWrapper? = switch kind {
        case UICollectionView.elementKindSectionHeader: section.header
        case UICollectionView.elementKindSectionFooter: section.footer
        default: nil
        }
        
        guard let component else { fatalError() }
        
        registerSupplementary(about: component.reuseIdentifier, kind: kind)
        
        let supplementary = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                            withReuseIdentifier: component.reuseIdentifier,
                                                                            for: indexPath)
        bindItem(to: supplementary, with: component)
        
        return supplementary
    }
    
    private func registerSupplementary(about identifier: String, kind: String) {
        let isContaints = switch kind {
        case UICollectionView.elementKindSectionHeader: registeredHeaderIdentifiers.contains(identifier)
        case UICollectionView.elementKindSectionFooter: registeredFooterIdentifiers.contains(identifier)
        default: false
        }
        
        guard isContaints == false else { return }
        
        switch kind {
        case UICollectionView.elementKindSectionHeader: registeredHeaderIdentifiers.insert(identifier)
        case UICollectionView.elementKindSectionFooter: registeredFooterIdentifiers.insert(identifier)
        default: return
        }
        collectionView?.register(ComponentCollectionReusableView.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
    }
}

// MARK: Component Bind
extension CollectionViewAdapter {
    private func bindItem(to cell: UICollectionReusableView, with component: ComponentWrapper) {
        guard let cell = cell as? ComponentRenderable else { return }
        
        cell.render(component: component)
    }
}
