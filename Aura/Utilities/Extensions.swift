//
//  Extensions.swift
//  Aura
//
//  Created by Max Dolensky on 7/7/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import AVFoundation
import StoreKit

//MARK:- UIView Extensions
extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, height: CGFloat?, width: CGFloat?, padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
    
    func anchorXCenter(top: NSLayoutYAxisAnchor, bottom: NSLayoutYAxisAnchor?, centerAnchor: NSLayoutXAxisAnchor, width: NSLayoutDimension, height: CGFloat?, padding: UIEdgeInsets = .zero, widthMultiplier: CGFloat = 1, widthOffset: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        
        centerXAnchor.constraint(equalTo: centerAnchor).isActive = true
        
        widthAnchor.constraint(equalTo: width, multiplier: widthMultiplier, constant: widthOffset).isActive = true
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    
    func setUnderlineStyle(color: UIColor) {
        
        let border = UIView()
        border.backgroundColor = color
        self.addSubview(border)
        border.anchor(top: nil,
                      bottom: self.bottomAnchor,
                      leading: self.leadingAnchor,
                      trailing: self.trailingAnchor,
                      height: 1.0,
                      width: nil)
        
    }
    
    func setShadow(color: UIColor, opacity: Float, offset: CGSize, radius: CGFloat, cornerRadius: CGFloat = 0) {

        self.layer.masksToBounds = false
        self.clipsToBounds = false

        self.backgroundColor = .clear
        
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        
// THIS DOESNT ALLOW SHADOW TO RESIZE IF VIEW CHANGE. WORKS WITHOUT. IF WANT THIS, MUST REDRAW WHEN SUBVIEWS ARE RE-LAYED OUT
        
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
//        self.layer.shouldRasterize = true
//        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
        func setShadowWithBZPath(color: UIColor, opacity: Float, offset: CGSize, radius: CGFloat, cornerRadius: CGFloat = 0) {

            self.layer.masksToBounds = false
            self.clipsToBounds = false

            self.backgroundColor = .clear
            
            self.layer.shadowColor = color.cgColor
            self.layer.shadowOpacity = opacity
            self.layer.shadowOffset = offset
            self.layer.shadowRadius = radius

            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = UIScreen.main.scale
        }
    
    func roundCorners(cornerRadius: CGFloat) {
        
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
    
    func setGradientBackground(topColor: UIColor, bottomColor: UIColor, cornerRadius: CGFloat) {

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = cornerRadius

        self.layer.insertSublayer(gradientLayer, at:0)
    }

}

// MARK: - Global Func
func createButtons(_ attributedString: NSMutableAttributedString) -> [(color: UIColor, ID: String, range: NSRange)] {

    // Otherwise Return an array of SoundButtons
    var colors: [(color: UIColor, ID: String, range: NSRange)] = []
    
    attributedString.enumerateAttribute(.foregroundColor, in: NSRange(0..<attributedString.length)) { (color, range, stop) in
        
        if let color = color as? UIColor {
            
            attributedString.enumerateAttribute(.id, in: range) { (id, range, stop) in
                
                if let id = id as? String {
                    if color != K.Colors.lightGrey {
                        colors.append((color: color, ID: id, range: range))
                    }
                }
            }
        }
    }
    return colors
}

//MARK:- UIViewController Extensions
extension UIViewController {
    
    func goToLoginForPurchase(_ delegate: BuyButtonPopUpView) {
        let vc = Utilities.shared.getLoginVC()
        let login = vc.viewControllers[0] as! LoginController
        login.isModal = true
        login.isForPurchase = true
        login.buyDelegate = delegate
        self.present(vc, animated: true, completion: nil)
    }
    
    func setupToHideKeyboardOnTapOnView() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
        
    func getDeviceLanguageCode() -> String {
        
        guard let code = Locale.preferredLanguages.first else { return "en" }
        
        let codeAndRegion = code.split(separator: "-").map { String($0) }
        
        if codeAndRegion.count >= 3 {
            
            return "\(codeAndRegion[0])-\(codeAndRegion[1])"
            
        } else { return codeAndRegion[0] }
    }
    
    func startLoadingScreen() {
        loadingView = UIView(frame: self.view.bounds)
        loadingView?.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        
        var activityIndicator = UIActivityIndicatorView()
        
        if #available(iOS 13.0, *) {
            activityIndicator = UIActivityIndicatorView(style: .large)
        } else {
            activityIndicator = UIActivityIndicatorView(style: .gray)
        }
        
        activityIndicator.color = K.DesignColors.primary
        activityIndicator.center = loadingView!.center
        activityIndicator.startAnimating()
        loadingView?.addSubview(activityIndicator)
        self.view.addSubview(loadingView!)
        
        Timer.scheduledTimer(withTimeInterval: 40.0, repeats: false) { (t) in
            self.endLoadingScreen()
        }
    }
    
    func endLoadingScreen() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
    
    func showCannotSearchAlert() {
        let alert = UIAlertController(title: NSLocalizedString("Connect to the internet", comment: "Cannot connect to the internet"),
                                      message: NSLocalizedString("In order to search, you must be connected to the internet", comment: ""),
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default) { (_) in
            return
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func isShowing() -> Bool {
        guard let navVC = self.tabBarController?.selectedViewController as? UINavigationController else {
            return false
        }
        
        if self == navVC.topViewController {
            return true
        } else {
            return false
        }
    }
    
    func promptForRating() {
        let alert = UIAlertController(title: NSLocalizedString("Feedback", comment: ""),
                                      message: NSLocalizedString("Are you enjoying the app?", comment: ""),
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Yes, I love it!", comment: ""),
                                      style: .default,
                                      handler: { _ in
            SKStoreReviewController.requestReview()
        }))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Dismiss", comment: ""),
                                      style: .cancel,
                                      handler: nil))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("No, it could be better", comment: ""),
                                      style: .default,
                                      handler: { [weak self]_ in
            self?.present(SendEmailViewController(), animated: true, completion: nil)
        }))
        
        present(alert, animated: true, completion: nil)
    }
}

fileprivate var loadingView: UIView?

//MARK:- UILabel Extensions
extension UILabel {
    
    func configureBasedOnInput() {
        
        // Set Atrributed String Font Size
        guard let attributedString = self.attributedText else { return }
        
        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
        
        let numberOfLines = mutableAttributedString.configureBasedOnInput()
        
        // Configure Label
        self.attributedText = mutableAttributedString
        self.numberOfLines = numberOfLines
        self.adjustsFontSizeToFitWidth = numberOfLines == 1 ? true : false
        self.textAlignment = numberOfLines == 1 ? .center : .left

    }
    
    func configureBottomLabel() {
        
        guard let attributedString = self.attributedText else { return }
        
        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
        
        mutableAttributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40, weight: .regular), range: NSRange(location: 0, length: mutableAttributedString.length))
        
        self.attributedText = mutableAttributedString
        self.numberOfLines = 0
        
    }
    
    func boundingRect(forCharacterRange range: NSRange) -> CGRect? {

        guard let attributedText = attributedText else { return nil }

        let textStorage = NSTextStorage(attributedString: attributedText)
        let layoutManager = NSLayoutManager()

        textStorage.addLayoutManager(layoutManager)

        let textContainer = NSTextContainer(size: bounds.size)
        textContainer.lineFragmentPadding = 0.0

        layoutManager.addTextContainer(textContainer)

        var glyphRange = NSRange()

        // Convert the range for glyphs.
        layoutManager.characterRange(forGlyphRange: range, actualGlyphRange: &glyphRange)

        return layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
    }
    
    var fontSize: CGFloat {
        get {
            if adjustsFontSizeToFitWidth {
                var currentFont: UIFont = font
                let originalFontSize = currentFont.pointSize
                var currentSize: CGSize = (text! as NSString).size(withAttributes: [NSAttributedString.Key.font: currentFont])

                while currentSize.width > frame.size.width && currentFont.pointSize > (originalFontSize * minimumScaleFactor) {
                    currentFont = currentFont.withSize(currentFont.pointSize - 1)
                    currentSize = (text! as NSString).size(withAttributes: [NSAttributedString.Key.font: currentFont])
                }

                return currentFont.pointSize
            }

            return font.pointSize
        }
    }
    
    func adjustFontSizeToFit(minimumFontSize: CGFloat = 13, maximumFontSize: CGFloat = 60) {
        // Only need this for multiline labels
        if numberOfLines == 1 { return }
        
        let maxFontSize = maximumFontSize
        
        var sizeForHeight: CGFloat = 0
        
        // Adjusts for height
        for size in stride(from: maxFontSize, to: minimumFontSize, by: -CGFloat(1.0)) {
            let proposedFont = font.withSize(size)
            let constraintSize = CGSize(width: bounds.size.width, height: CGFloat(MAXFLOAT))
            let labelSize = (text! as NSString).boundingRect(with: constraintSize,
                                                            options: .usesLineFragmentOrigin,
                                                            attributes: [NSAttributedString.Key.font: proposedFont],
                                                            context: nil)
            
            if labelSize.height <= bounds.height {
                font = proposedFont
                setNeedsLayout()
                sizeForHeight = size
                break;
            }
        }
        
        // Adjust so the largest word will fit in a single line
        let textArray = self.text!.split(separator: " ").map { String($0) }
        var largestWord = textArray[0]
        for word in textArray {
            if word.count > largestWord.count {
                largestWord = word
            }
        }
        
        for size in stride(from: sizeForHeight, to: minimumFontSize, by: -CGFloat(1.0)) {
            let proposedFont = font.withSize(size)
            let constraintSize = CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT))
            let labelSize = (largestWord as NSString).boundingRect(with: constraintSize,
                                                            options: .usesLineFragmentOrigin,
                                                            attributes: [NSAttributedString.Key.font: proposedFont],
                                                            context: nil)
            
            if labelSize.width <= bounds.width {
                font = proposedFont
                setNeedsLayout()
                break;
            }
        }
    }
    
    func adjustsMultiLineFontToFitWidth() {
        
        if numberOfLines == 1 { return }
        
        // Adjust so the largest word will fit in a single line
        let textArray = self.text!.split(separator: " ").map { String($0) }
        var largestWord = textArray[0]
        for word in textArray {
            if word.count > largestWord.count {
                largestWord = word
            }
        }
        
        for size in stride(from: font.pointSize, to: 13, by: -CGFloat(1.0)) {
            let proposedFont = font.withSize(size)
            let constraintSize = CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT))
            let labelSize = (largestWord as NSString).boundingRect(with: constraintSize,
                                                            options: .usesLineFragmentOrigin,
                                                            attributes: [NSAttributedString.Key.font: proposedFont],
                                                            context: nil)
            
            if labelSize.width <= bounds.width {
                font = proposedFont
                setNeedsLayout()
                break;
            }
        }
        
    }
    
}

//MARK:- NSMutableAttributedString Extensions
extension NSMutableAttributedString {
    
    func configureBasedOnInput() -> Int {
        
        let text = self.string
        
        if ( text.split(separator: " ").count == 1 ) || ( text.count <= 16 ) {
            self.addAttribute(.font, value: UIFont.systemFont(ofSize: 60, weight: .bold), range: NSRange(location: 0, length: self.length))
            return 1
        }
        
        else if text.count <= 40 {
            self.addAttribute(.font, value: UIFont.systemFont(ofSize: 50, weight: .bold), range: NSRange(location: 0, length: self.length))
            return 0
        }
        
        else {
            self.addAttribute(.font, value: UIFont.systemFont(ofSize: 45, weight: .bold), range: NSRange(location: 0, length: self.length))
            return 0
        }
    }
    
    func capitalize(location: Int, length: Int) -> NSMutableAttributedString {

        let result = NSMutableAttributedString(attributedString: self)

        result.enumerateAttributes(in: NSRange(location: location, length: length), options: []) {_, range, _ in
            result.replaceCharacters(in: range, with: (string as NSString).substring(with: range).uppercased())
        }

        return result
    }
    
    func setCapitalLetters(from word: String) -> NSMutableAttributedString {
        
        var indices = [Int]()
        var result = self
        
        for i in 0..<word.count {
            if word[i].isUppercase {
                indices.append(i)
            }
        }
        
        for indice in indices {
            result = result.capitalize(location: indice, length: 1)
        }
        
        return result
    }
    
    func removeSymbols() -> NSMutableAttributedString {

        var indices = [Int]()
        let stringText = self.string
        
        for i in 0..<stringText.count {
            
            if !stringText[i].isLetter && stringText[i] != "'" {
                
                indices.append(i)
                
            }
            
        }
        
        if indices.count == self.length {
            return self
        }
        
        for index in indices.reversed() {
            self.deleteCharacters(in: NSRange(location: index, length: 1))
        }
        
        return self
    }
    
    func replaceSpecialCharacters(from word: String) -> NSMutableAttributedString {

        var indices = [Int]()
        var symbols = [NSMutableAttributedString]()
        
        for i in 0..<word.count {
            
            if !word[i].isLetter && word[i] != "'" {
                
                indices.append(i)
                symbols.append(NSMutableAttributedString(string: String(word[i]) ) )
                
            }
        }
        
        // If the word is all Symbols, nothing would have been deleted and thus no need for replacement
        if indices.count == word.count {
            return self
        }
        
        for (index, symbol) in zip(indices, symbols) {
            
            self.insert(symbol, at: index)
            
        }
        
      return self
    }
}

//MARK:- NSAttributedString.Key Extensions
extension NSAttributedString.Key {
    static let id = NSAttributedString.Key("id")
    static let linkNumber = NSAttributedString.Key("linkNumber")
}

//MARK:- String Extensions

// ==========================================================================================
// This is an extension to the String class which takes as input a substring we are searching
// for, and returns a list of all starting indices for the matches within the string
// Use like this:
//      let keyword = "a"
//      let html = "aaaa"
//      let indicies = html.indicesOf(string: keyword)
//      print(indicies) // result --> [0, 1, 2, 3]
// ===========================================================================================

extension String {
    
    func removeSymbols() -> String {
        
        let newString = self.filter { $0.isLetter || $0 == "'" }
        return newString != "" ? newString : self
        
    }
    
    func indicesOf(string: String) -> [Int] {
        var indices = [Int]()
        var searchStartIndex = self.startIndex

        while searchStartIndex < self.endIndex,
            // Finds and returns the range of the first occurrence of a given string within a
            // given range of the String, subject to given options, using the specified locale, if any.
            let range = self.range(of: string, range: searchStartIndex..<self.endIndex),
            !range.isEmpty
        {
            // Runs this block of code only if searchStartIndex < last index of the word, and if range finds a match
            let index = distance(from: self.startIndex, to: range.lowerBound)
            indices.append(index)
            searchStartIndex = range.upperBound
        }
        return indices
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

public extension String {
  subscript(value: Int) -> Character {
    self[index(at: value)]
  }
}

public extension String {
  subscript(value: NSRange) -> Substring {
    self[value.lowerBound..<value.upperBound]
  }
}

// =========================================================================
// All of this allows me to access substrings in a cleaner way
// Examples:
//          let text = "Hello world"
//          text[0] // H
//          text[...3] // "Hell"
//          text[6..<text.count] // world
//          text[NSRange(location: 6, length: 3)] // wor
// =========================================================================
public extension String {
  subscript(value: CountableClosedRange<Int>) -> Substring {
    self[index(at: value.lowerBound)...index(at: value.upperBound)]
  }

  subscript(value: CountableRange<Int>) -> Substring {
    self[index(at: value.lowerBound)..<index(at: value.upperBound)]
  }

  subscript(value: PartialRangeUpTo<Int>) -> Substring {
    self[..<index(at: value.upperBound)]
  }

  subscript(value: PartialRangeThrough<Int>) -> Substring {
    self[...index(at: value.upperBound)]
  }

  subscript(value: PartialRangeFrom<Int>) -> Substring {
    self[index(at: value.lowerBound)...]
  }
}

private extension String {
  func index(at offset: Int) -> String.Index {
    index(startIndex, offsetBy: offset)
  }
}

//MARK:- UIColor Extensions
extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
}

//MARK:- UIGestureRecognizer Extensions

extension UITapGestureRecognizer {

    func indexForTapAttributedTextInLabel(label: UILabel) -> Int? {
        
        // Configure NSTextContainer
        let textContainer = NSTextContainer(size: label.bounds.size)
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        
        // Configure NSLayoutManager and add the text container
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(textContainer)
        
        guard let attributedText = label.attributedText else {return nil}
        
        // Configure NSTextStorage and apply the layout manager
        let textStorage = NSTextStorage(attributedString: attributedText)
        textStorage.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: label.fontSize, weight: .bold), range: NSMakeRange(0, attributedText.length))
        textStorage.addLayoutManager(layoutManager)

        // get the tapped character location
        let locationOfTouchInLabel = self.location(in: label)
        
        // account for text alignment and insets
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        
        var alignmentOffset: CGFloat!
        switch label.textAlignment {
        case .left, .natural, .justified:
            alignmentOffset = 0.0
        case .center:
            alignmentOffset = 0.5
        case .right:
            alignmentOffset = 1.0
        @unknown default:
            fatalError()
        }
        
        let xOffset = ((label.bounds.size.width - textBoundingBox.size.width) * alignmentOffset) - textBoundingBox.origin.x
        let yOffset = ((label.bounds.size.height - textBoundingBox.size.height) * alignmentOffset) - textBoundingBox.origin.y
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - xOffset, y: locationOfTouchInLabel.y - yOffset)
        
        // work out which character was tapped
        let characterIndex = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

        return characterIndex
    }
}

//MARK:- Stack View Extensions

extension UIStackView {

    func addArrangedSubview(_ v:UIView, withMargin m:UIEdgeInsets ) {
        let containerForMargin = UIView()
        containerForMargin.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            v.topAnchor.constraint(equalTo: containerForMargin.topAnchor, constant:m.top ),
            v.bottomAnchor.constraint(equalTo: containerForMargin.bottomAnchor, constant: m.bottom ),
            v.leftAnchor.constraint(equalTo: containerForMargin.leftAnchor, constant: m.left),
            v.rightAnchor.constraint(equalTo: containerForMargin.rightAnchor, constant: m.right)
        ])

        addArrangedSubview(containerForMargin)
    }
    
    func addCenteredSubview(_ v: UIView, stackViewParent: UIView) {
        
        let containerView = UIView()
        containerView.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // center the view inside its container
        v.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        v.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        // set a height constraint so the stackView can adjust its size
        containerView.heightAnchor.constraint(greaterThanOrEqualTo: v.heightAnchor).isActive = true

        self.addArrangedSubview(containerView)
        
        // set the width of the container to be the same width as the scroll view so that paging works
        containerView.widthAnchor.constraint(equalTo: stackViewParent.widthAnchor).isActive = true
    }
    
    func addHorizontallyCenteredSubview(_ v: UIView, stackViewParent: UIView) {
        
        let containerView = UIView()
        containerView.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // center the view inside its container
        v.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        v.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        v.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        // set a height constraint so the stackView can adjust its size
        containerView.heightAnchor.constraint(greaterThanOrEqualTo: v.heightAnchor).isActive = true

        self.addArrangedSubview(containerView)
        
        // set the width of the container to be the same width as the scroll view so that paging works
        containerView.widthAnchor.constraint(equalTo: stackViewParent.widthAnchor).isActive = true
    }
    
}

//MARK: - UIButton Extensions

extension UIButton {
    
    func styleFilledButton(fillColor color: UIColor) {
        
        self.backgroundColor = color
        self.layer.cornerRadius = 24
        self.tintColor = .white
        self.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)

    }
    
    func styleHollowbutton(outlineColor color: UIColor) {
        
        self.layer.borderWidth = 2
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = 24
        self.tintColor = color
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
 
    }
}

//MARK: - Text Field Extensions

extension UITextField {
    
    func setBorder(color: UIColor) {
        
        self.layer.borderWidth = 2
        self.layer.borderColor = color.cgColor
        
    }
    
    
    func styleTextFieldWithUnderline(ofColor bottomLineColor: UIColor) {
        
        self.layoutIfNeeded()
        self.borderStyle = .none
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.bounds.height - 1, width: self.bounds.width, height: 1)
        bottomLine.backgroundColor = bottomLineColor.cgColor
        print(bottomLine.frame)
        self.layer.addSublayer(bottomLine)
        
    }
    
}

//MARK: - UIImageView

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageURLString: String?
    
    func loadImageUsingCacheWithURLString(urlString: String) {
        
        imageURLString = urlString
        
        self.image = nil
        
        // Check Cache For Image
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            
            self.image = cachedImage
            return
            
        }
        
        // Get Image From Web If not Cached
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Error fetching image with url: \(error)")
                return
            }
            
            guard let data = data else { return }
            
            guard let downloadedImage = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                
                if self.imageURLString == urlString {
                    self.image = UIImage(data: data)
                }
                
                imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                
            }
            
        }.resume()
        
    }
    
}

//MARK: - Table View Extensions
extension UITableView {
    
    func setEmptyView(title: String, message: String) {
        
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let titleLabel = UILabel()
        
        let messageLabel = UILabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        
        titleLabel.text = title
        
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
}

extension UIWindow {
    
    func displayCheck(text: String) {
        
        let container = UIView()
        container.backgroundColor = UIColor(white: 0, alpha: 0.1)
        container.alpha = 0
        
        self.addSubview(container)
        container.anchor(top: self.topAnchor,
                         bottom: self.bottomAnchor,
                         leading: self.leadingAnchor,
                         trailing: self.trailingAnchor,
                         height: nil,
                         width: nil)
        
        let v = UIView()
        v.backgroundColor = .white
        v.roundCorners(cornerRadius:  10)
        
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.textColor = .black
        
        let imageView = UIImageView()
        
        if #available(iOS 13.0, *) {
            
            imageView.image = UIImage(systemName: "checkmark")
            
        }
        
        else {
            
            imageView.image = #imageLiteral(resourceName: "check").withRenderingMode(.alwaysTemplate)
            
        }
        
        imageView.tintColor = .green
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        
        v.addSubview(label)
        v.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: v.topAnchor, constant: 30).isActive = true
        imageView.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        label.anchor(top: imageView.bottomAnchor,
                     bottom: v.bottomAnchor,
                     leading: v.leadingAnchor,
                     trailing: v.trailingAnchor,
                     height: nil,
                     width: nil,
                     padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
        
        self.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        v.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -120).isActive = true
        v.widthAnchor.constraint(equalToConstant: 200).isActive = true
        v.heightAnchor.constraint(equalToConstant: 200).isActive = true
        v.alpha = 0
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            container.alpha = 1
            v.alpha = 1
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0.0, options: .curveEaseIn,  animations: {
                
                container.alpha = 0
                v.alpha = 0
                
            }) { (_) in
                
                container.removeFromSuperview()
                v.removeFromSuperview()
                
            }
        }
    }
}

extension Double {
    
    func getAsFormattedScore() -> NSMutableAttributedString {
        
        var formatted = NSMutableAttributedString(string: String(format: "%.1f", self))
        formatted.append(NSAttributedString(string: "%"))
        
        if self < 0 {
            
            formatted = NSMutableAttributedString(string: "-%")
            
        }
        
        else if self <= 50 {
            
            formatted.addAttribute(.foregroundColor, value: K.Colors.red, range: NSRange(location: 0, length: formatted.length))
            
        }
        
        else if self <= 69 {
            
            formatted.addAttribute(.foregroundColor, value: K.Colors.orange, range: NSRange(location: 0, length: formatted.length))
            
        }
        
        else if self <= 79 {
            
            formatted.addAttribute(.foregroundColor, value: K.Colors.yellow, range: NSRange(location: 0, length: formatted.length))
            
        }
        
        else {
            
            formatted.addAttribute(.foregroundColor, value: K.Colors.green, range: NSRange(location: 0, length: formatted.length))
            
        }
        return formatted
    }
}
