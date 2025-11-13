//
//  KeyController.swift
//  Aura
//
//  Created by Max Dolensky on 7/6/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class KeyController: UIViewController {
    
    var centerTitle: UILabel = {
       
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 30))
        label.backgroundColor = .clear
        label.font = UIFont(name: K.Fonts.avenirBlack, size: 17)
        label.text = "English HD \(NSLocalizedString("Key", comment: "Key, or legend of say a map, that explains things"))"
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .center
        return label
        
    }()
    
    var mainScrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        return scrollView
        
    }()
        
    var mainStackView: UIStackView = {
       
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
        return stackView
        
    }()
    
    var fullKeyView = FullKeyView()
    
    // Vowel Explanation View
    let vowelKey: ColorKeyView = {
        
        let keyView = ColorKeyView(frame: .zero,
                                   title: "Vowels",
                                   explanation: NSLocalizedString("Each color represents a single vowel sound that a letter or combination of letters can make.", comment: ""),
                                   numRows: 5,
                                   numCol: 3,
                                   cornerRadius: 0,
                                   colors: [K.Colors.green,      K.Colors.red,       K.Colors.blue,
                                            K.Colors.lightGreen, K.Colors.lightPink, K.Colors.lightBlue,
                                            K.Colors.seaBlue,    K.Colors.orange,    .white,
                                            K.Colors.darkGreen,  K.Colors.pink,      K.Colors.darkBlue,
                                            .white,              K.Colors.purple,    K.Colors.turquoise])
        
        keyView.explanationLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        keyView.titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return keyView
        
    }()
    
    // True Consonants Explanation View
    let trueConsonantsKey: ColorKeyView = {
        
        let keyView = ColorKeyView(frame: .zero,
                                   title: "True Consonants",
                                   explanation: NSLocalizedString("Black letters or letter combinations represent our textbook understanding of what each consonant letter sounds like.", comment: ""),
                                   numRows: 1,
                                   numCol: 1,
                                   cornerRadius: 0,
                                   colors: [.black])
        
        keyView.explanationLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        keyView.titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return keyView
        
    }()
    
    // Flip Consonants Explanation View
    let flipConsonantsKey: ColorKeyView = {
        
        let keyView = ColorKeyView(frame: .zero,
                                   title: "Flip Consonants",
                                   explanation: NSLocalizedString("Some consonants in the English language have a secondary sound associated with them, which we refer to as the \"flip\" sound. Gray letters or letter combinations represent this \"flip\" sound.", comment: ""),
                                   numRows: 1,
                                   numCol: 1,
                                   cornerRadius: 0,
                                   colors: [K.Colors.darkGrey])
        
        keyView.explanationLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        keyView.titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return keyView
        
    }()
    
    // Fluid Consonants Explanation View
    let fluidConsonantsKey: ColorKeyView = {
        
        let keyView = ColorKeyView(frame: .zero,
                                   title: "Fluid Consonants",
                                   explanation: NSLocalizedString("Certain consonant sounds do not have a dedicated letter to represent them. Each of these colors represents a specific consonant sound, regardless of the letter or letter combination.", comment: ""),
                                   numRows: 3,
                                   numCol: 2,
                                   cornerRadius: 0,
                                   colors: [K.Colors.tan, K.Colors.brownPurple,
                                            K.Colors.brownRed, K.Colors.brownYellow,
                                            K.Colors.blueGrey, .white])
        
        keyView.explanationLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        keyView.titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return keyView
    }()
    
    // Silent Explanation View
    let silentKey: ColorKeyView = {
        
        let keyView = ColorKeyView(frame: .zero,
                                   title: "Silent",
                                   explanation: NSLocalizedString("Light Gray indicates that the letter is silent and therefore creates no sound in the particular word.", comment: ""),
                                   numRows: 1,
                                   numCol: 1,
                                   cornerRadius: 0,
                                   colors: [K.Colors.lightGrey])
        
        keyView.explanationLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        keyView.titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return keyView
        
    }()
    
    // Wildcard Explanation View
    let wildcardKey: ColorKeyView = {
        
        let keyView = ColorKeyView(frame: .zero,
                                   title: "Wildcards",
                                   explanation: NSLocalizedString("Some letters or letter combinations in English do not sound as they appear. Instead of adding additional colors to represent each of these sounds, yellow is used to represent all outliers to the system as described above. In a given word, tap the yellow letter, or yellow box, to reveal a popup with the correct pronunciation.", comment: ""),
                                   numRows: 1,
                                   numCol: 1,
                                   cornerRadius: 0,
                                   colors: [K.Colors.yellow])
        
        keyView.explanationLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        keyView.titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return keyView
        
    }()
        
    // Initialize Scroll Views
    let vowelScrollView = KeyCardScrollView(frame: .zero, K.KeyInfo.vowelSoundAndColor, nil, true)
    let fluidScrollView = KeyCardScrollView(frame: .zero, K.KeyInfo.fluidSoundAndColor, nil, true)
    let trueScrollView = KeyCardScrollView(frame: .zero, nil, K.KeyInfo.trueSoundAndText, true)
    let flipScrollView = KeyCardScrollView(frame: .zero, nil, K.KeyInfo.flipSoundAndText, false)
    let silentScrollView = KeyCardScrollView(frame: .zero, [("", K.Colors.lightGrey)], nil, true)
    let wildScrollView = KeyCardScrollView(frame: .zero, [("", K.Colors.yellow)], nil, true)
    
    let containerView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .white
        return view
        
    }()
    
    let keyTypeLabel: UILabel = {
        
        let label = UILabel()
        label.text = NSLocalizedString("Micro View", comment: "view the detailed version of the key")
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.backgroundColor = .white
        return label
        
    }()
    
    let toggle: UISwitch = {
        
        let toggle = UISwitch()
        toggle.onTintColor = K.DesignColors.primary
        toggle.addTarget(self, action: #selector(togglePressed(_:)), for: .valueChanged)
        toggle.backgroundColor = .white
        return toggle
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = K.DesignColors.background
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        
        containerView.setShadow(color: .black, opacity: 0.3, offset: .init(width: 0, height: 3), radius: 2)
        containerView.backgroundColor = .white
        
        vowelKey.setShadows()
        fluidConsonantsKey.setShadows()
        trueConsonantsKey.setShadows()
        flipConsonantsKey.setShadows()
        silentKey.setShadows()
        wildcardKey.setShadows()
        
        fullKeyView.vowelKey.setShadows()
        fullKeyView.fluidConsonantsKey.setShadows()
        fullKeyView.trueConsonantsKey.setShadows()
        fullKeyView.flipConsonantsKey.setShadows()
        fullKeyView.silentKey.setShadows()
        fullKeyView.wildcardKey.setShadows()
        
    }
    
    func setup() {
       
        // Setup Navigation Bar
        self.navigationItem.titleView = centerTitle
        
        // Add UserButton
        if #available(iOS 13.0, *) {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"),
                                                                     style: .plain,
                                                                     target: self,
                                                                     action: #selector(settingsButtonTapped))
        } else {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "line.horizontal.3").withRenderingMode(.alwaysTemplate),
                                                                     style: .plain,
                                                                     target: self,
                                                                     action: #selector(settingsButtonTapped))
        }
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.isTranslucent = false

        // Configure navigation bar appearance for iOS 13+
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = K.DesignColors.primary
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
            self.navigationController?.navigationBar.compactAppearance = appearance
        } else {
            self.navigationController?.navigationBar.barTintColor = K.DesignColors.primary
        }
        // Add UISwitch and View Type Label
        containerView.addSubview(keyTypeLabel)
        containerView.addSubview(toggle)
        
        keyTypeLabel.anchor(top: containerView.topAnchor,
                            bottom: containerView.bottomAnchor,
                            leading: containerView.leadingAnchor,
                            trailing: nil,
                            height: nil,
                            width: nil,
                            padding: UIEdgeInsets(top: 10, left: 10, bottom: -10, right: 0))
        
        toggle.anchor(top: containerView.topAnchor,
                      bottom: containerView.bottomAnchor,
                      leading: nil,
                      trailing: containerView.trailingAnchor,
                      height: nil,
                      width: nil,
                      padding: UIEdgeInsets(top: 10, left: 0, bottom: -10, right: -10))
        
        view.addSubview(containerView)
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                             bottom: nil,
                             leading: view.leadingAnchor,
                             trailing: view.trailingAnchor,
                             height: nil,
                             width: nil)
        
        // Add scroll view and Content view
        view.addSubview(mainScrollView)
        view.sendSubviewToBack(mainScrollView)
        mainScrollView.addSubview(mainStackView)
        
        // Anchor Scroll View
        mainScrollView.anchor(top: containerView.bottomAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              leading: view.leadingAnchor,
                              trailing: view.trailingAnchor,
                              height: nil,
                              width: nil)
        
        // Anchor Content View
        mainStackView.anchor(top: mainScrollView.topAnchor,
                             bottom: mainScrollView.bottomAnchor,
                             leading: mainScrollView.leadingAnchor,
                             trailing: mainScrollView.trailingAnchor,
                             height: nil,
                             width: nil)
        
        mainStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor).isActive = true
        
        // Add Full Key to Stack View
        fullKeyView = FullKeyView(frame: .zero, width: view.frame.width)
        mainStackView.addArrangedSubview(fullKeyView)
        fullKeyView.isHidden = true
                
        // Create pointer from Color Key to its associated Key Card Scroll View
        vowelKey.myScrollView = vowelScrollView
        fluidConsonantsKey.myScrollView = fluidScrollView
        trueConsonantsKey.myScrollView = trueScrollView
        flipConsonantsKey.myScrollView = flipScrollView
        silentKey.myScrollView = silentScrollView
        wildcardKey.myScrollView = wildScrollView
        
        // Add Scroll Views to Main Stack View
        mainStackView.addArrangedSubview(vowelKey)
        mainStackView.addArrangedSubview(vowelScrollView)
        mainStackView.addArrangedSubview(trueConsonantsKey)
        mainStackView.addArrangedSubview(trueScrollView)
        mainStackView.addArrangedSubview(flipConsonantsKey)
        mainStackView.addArrangedSubview(flipScrollView)
        mainStackView.addArrangedSubview(fluidConsonantsKey)
        mainStackView.addArrangedSubview(fluidScrollView)
        mainStackView.addArrangedSubview(silentKey)
        mainStackView.addArrangedSubview(silentScrollView)
        mainStackView.addArrangedSubview(wildcardKey)
        mainStackView.addArrangedSubview(wildScrollView)
        
        // Constrain Scroll View width so that the prev and next cards show on the screen and the main stackView can adjust its size
        if UIScreen.main.bounds.width > 375 {
            
            vowelScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -160).isActive = true
            fluidScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -160).isActive = true
            trueScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -160).isActive = true
            flipScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -160).isActive = true
            silentScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -160).isActive = true
            wildScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -160).isActive = true
            
        }
        
        else if UIScreen.main.bounds.width > 320 {
            
            vowelScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -130).isActive = true
            fluidScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -130).isActive = true
            trueScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -130).isActive = true
            flipScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -130).isActive = true
            silentScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -130).isActive = true
            wildScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -130).isActive = true
            
        }
        
        else {
            
            vowelScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
            fluidScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
            trueScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
            flipScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
            silentScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
            wildScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
            
        }
        
        // Set widths of explanation keys so they strech the whole screen since alignment for stack view is center
        vowelKey.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        fluidConsonantsKey.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        trueConsonantsKey.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        flipConsonantsKey.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        silentKey.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        wildcardKey.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
    }
    
    @objc func settingsButtonTapped() {
    
        Utilities.shared.settingsLauncher.parentVC = self
        Utilities.shared.settingsLauncher.showSettings()
                
    }
    
    @objc func togglePressed(_ sender: UISwitch) {
        
        if !sender.isOn {
            
            keyTypeLabel.text = NSLocalizedString("Micro View", comment: "view the detailed version of the key")
            
            fullKeyView.isHidden = true
            
            vowelScrollView.isHidden = false
            vowelKey.isHidden = false
            fluidScrollView.isHidden = false
            fluidConsonantsKey.isHidden = false
            trueScrollView.isHidden = false
            trueConsonantsKey.isHidden = false
            flipScrollView.isHidden = false
            flipConsonantsKey.isHidden = false
            silentScrollView.isHidden = false
            silentKey.isHidden = false
            wildScrollView.isHidden = false
            wildcardKey.isHidden = false
        }
            
        else {
            
            keyTypeLabel.text = NSLocalizedString("Macro View", comment: "look at an overview of the English HD key")
            
            fullKeyView.isHidden = false
            
            vowelScrollView.isHidden = true
            vowelKey.isHidden = true
            fluidScrollView.isHidden = true
            fluidConsonantsKey.isHidden = true
            trueScrollView.isHidden = true
            trueConsonantsKey.isHidden = true
            flipScrollView.isHidden = true
            flipConsonantsKey.isHidden = true
            silentScrollView.isHidden = true
            silentKey.isHidden = true
            wildScrollView.isHidden = true
            wildcardKey.isHidden = true
            
        }
    }
}
