//
//  AltTranslationsView.swift
//  Aura
//
//  Created by Max Dolensky on 9/17/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

protocol AltTranslationDelegate {
    
    func searchBackTranslation(backTranslation: String, searchInfo: SearchInfo)
    
}

class AltTranslationsView: UIView {
    
    // MARK: Data
    let baseTitleText = NSLocalizedString("Others ways to say", comment: "alternative translations of a given word")
    var searchedText = ""
    var dictionaryResult = [String : [DictionaryResult]]()
    var dictionaryKeys = [String]()
    var delegate: AltTranslationDelegate?
    var searchInfo: SearchInfo!
    
    // MARK: Subviews
    var container: UIView = {
        
        let v = UIView()
        v.backgroundColor = .white
        v.roundCorners(cornerRadius: 10)
        return v
        
    }()
    
    var purpleView: UIView = {
        
        let v = UIView()
        v.backgroundColor = K.DesignColors.primary
        return v
        
    }()
    
    var collectionView: UICollectionView = {
        
        let cv = DynamicCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .white
        return cv
        
    }()
    
    let titleLabel: UILabel = {
        
        let l = UILabel()
        l.backgroundColor = .clear
        l.textAlignment = .left
        l.textColor = .white
        l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return l
        
    }()
    
    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, searchedText: String, dictionaryResult: [String : [DictionaryResult]], searchInfo: SearchInfo) {
        
        self.init(frame:  frame)
        self.searchedText = searchedText
        self.dictionaryResult = dictionaryResult
        self.dictionaryKeys = Array(dictionaryResult.keys)
        self.searchInfo = searchInfo
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    // MARK: - Setup
    func setup() {
        
        // Add Container
        self.addSubview(container)
        
        container.anchor(top: self.topAnchor,
                         bottom: self.bottomAnchor,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil)
        
        // Add Purple View
        container.addSubview(purpleView)
        
        purpleView.anchor(top: container.topAnchor,
                          bottom: nil,
                          leading: container.leadingAnchor,
                          trailing: container.trailingAnchor,
                          height: 40,
                          width: nil)
        
        // Add Title Label
        purpleView.addSubview(titleLabel)
        
        titleLabel.anchor(top: purpleView.topAnchor,
                          bottom: purpleView.bottomAnchor,
                          leading: purpleView.leadingAnchor,
                          trailing: purpleView.trailingAnchor,
                          height: nil,
                          width: nil,
                          padding: UIEdgeInsets(top: 4, left: 10, bottom: -4, right: -4))
        
        titleLabel.text = "\(baseTitleText) \(searchedText)"
        
        // Collection View Setup
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AlternativeCell.self, forCellWithReuseIdentifier: AlternativeCell.identifier)
        collectionView.register(CVSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CVSectionHeader.identifier)
        collectionView.isScrollEnabled = false
        collectionView.allowsSelection = true
        
        container.addSubview(collectionView)
        
        collectionView.anchor(top: purpleView.bottomAnchor,
                              bottom: container.bottomAnchor,
                              leading: container.leadingAnchor,
                              trailing: container.trailingAnchor,
                              height: nil,
                              width: nil)
    }
    
    func update(searchedText: String, dictionaryResult: [String : [DictionaryResult]]) {
        
        self.searchedText = searchedText
        self.dictionaryResult = dictionaryResult
        self.dictionaryKeys = Array(dictionaryResult.keys)
        
        DispatchQueue.main.async {
            
            self.titleLabel.text = "\(self.baseTitleText) \(self.searchedText)"
            self.collectionView.reloadData()
            
        }
    }
}

extension AltTranslationsView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return dictionaryKeys.count
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dictionaryResult[dictionaryKeys[section]]?.count ?? 0
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlternativeCell.identifier, for: indexPath) as! AlternativeCell
        
        let dictResult = dictionaryResult[dictionaryKeys[indexPath.section]]![indexPath.row]
        
        cell.topLabel.text = dictResult.displayTarget
        
        cell.bottomLabel.text = dictResult.backTranslations.joined(separator: ",   ")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CVSectionHeader.identifier, for: indexPath) as! CVSectionHeader
            
            sectionHeader.label.text = "    \(dictionaryKeys[indexPath.section].lowercased())"
            
            return sectionHeader
            
        }
        
        else { return UICollectionReusableView() }
        
    }
    
}

extension AltTranslationsView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! AlternativeCell
        guard let backTranslation = cell.topLabel.text else { return }
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        reverseSearchInfo()
        
        self.delegate?.searchBackTranslation(backTranslation: backTranslation, searchInfo: searchInfo)
        
    }
    
    func reverseSearchInfo() {
        
        // Change Search Type and If Necessary, Change English HD to English
        switch self.searchInfo.searchType {
            
        case .englishToNative:
            self.searchInfo.searchType = .nativeToEnglish
            
        case .nativeToEnglish:
            self.searchInfo.searchType = .englishToNative
            
        }
        
        // Swap Source And Target Language Codes and Names
        let tempSourceCode = searchInfo.sourceLanguageCode
        searchInfo.sourceLanguageCode = searchInfo.targetLanguageCode
        searchInfo.targetLanguageCode = tempSourceCode
        
        let tempSourceName = searchInfo.sourceLanguageName
        searchInfo.sourceLanguageName = searchInfo.targetLanguageName
        searchInfo.targetLanguageName = tempSourceName
    }
    
}




extension AltTranslationsView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 60)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 30)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
        
    }
    
}
