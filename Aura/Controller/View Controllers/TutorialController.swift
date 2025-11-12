//
//  TutorialController.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/20/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit

class TutorialController: UIViewController {
    
    var pages: [UIView] = [Page1(frame: .zero), Page2(frame: .zero), Page3(frame: .zero), Page4(frame: .zero),
                           Page5(frame: .zero), Page6(frame: .zero), Page7(frame: .zero), Page8(frame: .zero),
                           Page8_1(frame: .zero), Page9(frame: .zero), Page10(frame: .zero), Page11(frame: .zero),
                           Page12(frame: .zero)
    ]
    
    // MARK: - Views
    var scrollView = HorizontalScrollView(frame: .zero)
    
    let previousButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle(NSLocalizedString("PREV", comment: "abbreviation for previous, go to prev page"), for: .normal)
        b.setTitleColor(K.DesignColors.purpleGrey, for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        b.addTarget(self, action: #selector(prevPressed), for: .touchUpInside)
        return b
    }()
    
    let nextButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle(NSLocalizedString("NEXT", comment: "go to next page"), for: .normal)
        b.setTitleColor(K.DesignColors.primary, for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        b.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        return b
    }()
    
    let skipButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle(NSLocalizedString("skip", comment: "skip, don't for example watch this video even though you should"), for: .normal)
        b.setTitleColor(UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1), for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        b.addTarget(self, action: #selector(skipPressed), for: .touchUpInside)
        return b
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = K.DesignColors.primary
        pc.pageIndicatorTintColor = UIColor(red: 217/255, green: 199/255, blue: 242/255, alpha: 1)
        pc.addTarget(self, action: #selector(changePage(_:)), for: .valueChanged)
        return pc
    }()
    
    let bottomControlsStackView: UIStackView = {
        
        let sv = UIStackView()
        sv.distribution = .fillEqually
        return sv
        
    }()
    
    // MARK: - INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        AnalyticsManager.shared.logTutorialBegin()
        setup()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Setup
    func setup() {
        
        // Setup Scroll View for full screen
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = .white
        scrollView.stackView.distribution = .fill
        scrollView.stackView.spacing = 0
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor,
                          bottom: view.bottomAnchor,
                          leading: view.leadingAnchor,
                          trailing: view.trailingAnchor,
                          height: nil,
                          width: view.frame.width)
        
        // Add prev, next, skip, and page Control
        view.addSubview(bottomControlsStackView)
        bottomControlsStackView.anchor(top: nil,
                                       bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                       leading: view.safeAreaLayoutGuide.leadingAnchor,
                                       trailing: view.safeAreaLayoutGuide.trailingAnchor,
                                       height: 50,
                                       width: nil)
        
        bottomControlsStackView.addArrangedSubview(previousButton)
        bottomControlsStackView.addArrangedSubview(pageControl)
        bottomControlsStackView.addArrangedSubview(nextButton)
        
        if #available(iOS 13, *) {
            //Do nothing
        } else {
            pageControl.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        
        }
        
        view.addSubview(skipButton)
        skipButton.anchor(top: view.topAnchor,
                          bottom: nil,
                          leading: nil,
                          trailing: view.trailingAnchor,
                          height: 50,
                          width: nil,
                          padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -35))
        
        // Add pages to stack view
        for v in pages {
            scrollView.stackView.addArrangedSubview(v)
        }
        
    }
    
    // MARK: Selector Functions
    @objc func prevPressed() {
        
        if pageControl.currentPage == pages.count - 1 {
            nextButton.setTitle(NSLocalizedString("NEXT", comment: "go to next page"), for: .normal)
        }
        
        let prevIndex = max(pageControl.currentPage - 1, 0)
        pageControl.currentPage = prevIndex
        scrollView.setContentOffset( CGPoint(x: view.frame.width * CGFloat(prevIndex), y: 0.0), animated: true)
    }
    
    @objc func nextPressed() {
        
        if pageControl.currentPage + 1 == pages.count - 1 {
            
            nextButton.setTitle(NSLocalizedString("DONE", comment: "done with this tutorial"), for: .normal)
            let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
            pageControl.currentPage = nextIndex
            scrollView.setContentOffset( CGPoint(x: view.frame.width * CGFloat(nextIndex), y: 0.0), animated: true)
        
        } else if pageControl.currentPage == pages.count - 1 {
            AnalyticsManager.shared.logTutorialComplete()
            self.dismiss(animated: true, completion: nil)
        
        } else {
        
            let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
            pageControl.currentPage = nextIndex
            scrollView.setContentOffset( CGPoint(x: view.frame.width * CGFloat(nextIndex), y: 0.0), animated: true)
        
        }
    }
    
    @objc func skipPressed() {
        if pageControl.currentPage == pages.count - 1 {
            AnalyticsManager.shared.logTutorialComplete()
        } else {
            AnalyticsManager.shared.logTutorialSkipped()
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func changePage(_ sender: UIPageControl) {
        let idx = pageControl.currentPage
        scrollView.setContentOffset(CGPoint(x: view.frame.width * CGFloat(idx), y: 0.0), animated: true)
        
        if idx == pages.count - 1 {
            nextButton.setTitle(NSLocalizedString("DONE", comment: "done with this tutorial"), for: .normal)
        } else {
            nextButton.setTitle(NSLocalizedString("NEXT", comment: "go to next page"), for: .normal)
        }
    }
}

// MARK: - Scroll View Functions
extension TutorialController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let idx = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = idx
        
        if idx == pages.count - 1 {
            nextButton.setTitle(NSLocalizedString("DONE", comment: "done with this tutorial"), for: .normal)
        } else {
            nextButton.setTitle(NSLocalizedString("NEXT", comment: "go to next page"), for: .normal)
        }
    }
}
