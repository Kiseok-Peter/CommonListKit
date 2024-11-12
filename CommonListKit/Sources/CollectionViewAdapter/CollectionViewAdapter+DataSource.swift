//
//  CollectionViewAdapter+DataSource.swift
//  CommonListKit
//
//  Created by 박기석 on 11/13/24.
//

import UIKit

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
}

extension CollectionViewAdapter {
    private func cellProvider(with collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let component = item(at: indexPath) else { fatalError() }
        
        registerCellIfNeeded(about: component.reuseIdentifier)

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: component.reuseIdentifier, for: indexPath)
        bindItemModelIfNeeded(to: cell, with: component)

        return cell
    }
    
    private func registerCellIfNeeded(about identifier: String) {
        guard registeredCellIdentifiers.contains(identifier) == false else { return }
        
        registeredCellIdentifiers.insert(identifier)
        collectionView?.register(ComponentCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }
    
    private func bindItemModelIfNeeded(to cell: UICollectionReusableView, with component: ComponentWrapper) {
        guard let cell = cell as? ComponentRenderable else { return }
        
        cell.render(component: component)
    }
}
