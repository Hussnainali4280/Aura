//
//  SupportedLanguagesVC.swift
//  Aura
//
//  Created by Max Dolensky on 7/20/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

protocol SupportedLanguagesDelegate {
    func updateLanguageCodes(languageName: String, languageCode: String)
}

class SupportedLanguagesVC: UIViewController {

    var supportedLanguages = [SupportedLanguage]()
    var tableView = UITableView()
    var delegate: SupportedLanguagesDelegate?
    
    var searchBar: UISearchBar = {
        
        let searchBar = UISearchBar()
        searchBar.isTranslucent = false
        return searchBar
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    

    func setup() {
        
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        searchBar.anchor(top: view.topAnchor,
                         bottom: nil,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         height: nil,
                         width: nil)
        
        tableView.anchor(top: searchBar.bottomAnchor,
                         bottom: view.bottomAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         height: nil,
                         width: nil)
        
        setupToHideKeyboardOnTapOnView()
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SupportedLanguageCell.self, forCellReuseIdentifier: K.Cells.supportedLanguageCell)
        
        tableView.reloadData()
    }
}

//MARK: - TableView DataSource

extension SupportedLanguagesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if supportedLanguages.count == 0 {
            tableView.setEmptyView(title: NSLocalizedString("Unable to fetch supported Languages", comment: "cannot get supported languages for translation"), message: NSLocalizedString("check network connection", comment: ""))
        }
        
        
        return supportedLanguages.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.supportedLanguageCell, for: indexPath) as! SupportedLanguageCell
        
        let language = supportedLanguages[indexPath.row]
        cell.label.text = language.nativeName
        return cell
        
    }
    
}

//MARK: - TableView Delegate

extension SupportedLanguagesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedLanguage = supportedLanguages[indexPath.row]
        
        UserDefaults.standard.set(selectedLanguage.nativeName, forKey: K.UserDefaultKeys.langName)
        UserDefaults.standard.set(selectedLanguage.code, forKey: K.UserDefaultKeys.langCode)
        
        self.delegate?.updateLanguageCodes(languageName: selectedLanguage.nativeName, languageCode: selectedLanguage.code)
        
        dismiss(animated: true, completion: nil)
    
    }
    
}

//MARK: - SearchBar Delegate Methods

extension SupportedLanguagesVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if searchBar.text != nil && searchBar.text!.count > 0 {
            supportedLanguages = AzureTranslationManager.shared.supportedLanguages.filter({ (language: SupportedLanguage) -> Bool in
                return language.nativeName.lowercased().contains(searchBar.text!.lowercased())
            })
        }
        else {
            supportedLanguages = AzureTranslationManager.shared.supportedLanguages
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text != nil && searchBar.text!.count > 0 {
            supportedLanguages = AzureTranslationManager.shared.supportedLanguages.filter({ (language: SupportedLanguage) -> Bool in
                return language.nativeName.lowercased().contains(searchBar.text!.lowercased())
            })
        }
        else {
            supportedLanguages = AzureTranslationManager.shared.supportedLanguages
        }
    
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
