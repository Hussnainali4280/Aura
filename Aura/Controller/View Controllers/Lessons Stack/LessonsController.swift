//
//  LessonsController.swift
//  Aura
//
//  Created by Max Dolensky on 7/6/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class LessonsController: UIViewController {
    
    let popUpManager = SeminarPopUpManager()
    
    var noNetworkConnectionView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        
        let container = UIView()
        
        let l = UILabel()
        l.text = NSLocalizedString("Connect to the internet", comment: "Cannot connect to the internet")
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        l.textColor = .gray
        
        let l1 = UILabel()
        l1.text = NSLocalizedString("You're offline. Check your connection", comment: "Cannot connect to the internet")
        l1.textAlignment = .center
        l1.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        l1.textColor = .gray
        
        let iv = UIImageView()
        if #available(iOS 13, *) {
            iv.image = UIImage(systemName: "icloud.slash")
        } else {
            iv.image = #imageLiteral(resourceName: "wifi.slash").withRenderingMode(.alwaysTemplate)
        }
        iv.tintColor = K.DesignColors.lightVariant
        iv.contentMode = .scaleAspectFit
        
        container.addSubview(iv)
        container.addSubview(l)
        container.addSubview(l1)
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 160).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 160).isActive = true
        iv.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        
        l.anchor(top: iv.bottomAnchor,
                 bottom: nil,
                 leading: container.leadingAnchor,
                 trailing: container.trailingAnchor,
                 height: nil,
                 width: nil,
                 padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
        
        l1.anchor(top: l.bottomAnchor,
                  bottom: container.bottomAnchor,
                  leading: container.leadingAnchor,
                  trailing: container.trailingAnchor,
                  height: nil,
                  width: nil,
                  padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        v.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: v.centerYAnchor, constant: -30).isActive = true
        
        v.isHidden = true
        
        return v
    }()
    
    //MARK: - Data
    var scrollViewIndex = 0
    
    //MARK: - Views / Subviews
    
    var titleLabel: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 30))
        label.backgroundColor = .clear
        label.font = UIFont(name: K.Fonts.avenirBlack, size: 17)
        label.text = NSLocalizedString("Lessons", comment: "Course video lessons")
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .center
        return label
        
    }()
    
    lazy var scrollView: UIScrollView = {
        
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.clipsToBounds = false
        sv.isPagingEnabled = true
        sv.backgroundColor = .clear
        sv.showsHorizontalScrollIndicator = false
        sv.layer.masksToBounds = false
        sv.delegate = self
        sv.tag = 0
        return sv
        
    }()
    
    var stackView: UIStackView = {
       
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 0
        return stackView
        
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.dataSource = self
        cv.delegate = self
        cv.register(VideoCell.self, forCellWithReuseIdentifier: VideoCell.identifier)
        cv.register(HeaderCollectionReusableView.self,
                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: HeaderCollectionReusableView.identifier)
        cv.backgroundColor = .white
        cv.allowsSelection = true
        cv.tag = 1
        return cv
        
    }()
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        populateLessonsDB()
        NetworkManager.shared.lessonsDelegate = self
        Utilities.shared.lessonsTabDelegate = self
        AdManager.shared.lessonDelegate = self
        setup()
    }
    
    //MARK: - Setup
    
    func setup() {
        
        self.view.backgroundColor = K.DesignColors.background
        
        setupNavBar()
        if UIScreen.main.bounds.width < 375 {
            self.setupScrollViewForSmallerScreen()
        } else if UIScreen.main.bounds.width < 414 {
            self.setupScrollViewForMediumScreen()
        } else {
            self.setupScrollViewForLargerScreen()
        }
       
        self.setupCollectionView()
        
        view.addSubview(noNetworkConnectionView)
        
        noNetworkConnectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                       bottom: view.bottomAnchor,
                                       leading: view.leadingAnchor,
                                       trailing: view.trailingAnchor,
                                       height: nil,
                                       width: nil)
        
        if !NetworkManager.shared.isConnected {
            noNetworkConnectionView.isHidden = false
            view.bringSubviewToFront(noNetworkConnectionView)
        }
    }
    
    func setupNavBar() {
        
        // Add Center Title
        self.navigationItem.titleView = titleLabel
        
        // Add user button
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

        // Make bar color purple, and buttons white
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
        
    }
    
    func setupScrollViewForLargerScreen() {

        scrollView.addSubview(stackView)
        
        stackView.anchor(top: scrollView.topAnchor,
                         bottom: scrollView.bottomAnchor,
                         leading: scrollView.leadingAnchor,
                         trailing: scrollView.trailingAnchor,
                         height: nil,
                         width: nil)
        
        // Prevent Vertical Scrolling
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        // Populate Stack View
        for lesson in Utilities.shared.lessons! {

            let iv = CustomImageView()
            iv.loadImageUsingCacheWithURLString(urlString: lesson.thumbnailURL)
            iv.backgroundColor = K.DesignColors.primary
            iv.contentMode = .scaleAspectFill
            iv.translatesAutoresizingMaskIntoConstraints = false
            if UIScreen.main.bounds.width > 320 {
                iv.heightAnchor.constraint(equalToConstant: 180).isActive = true
                iv.widthAnchor.constraint(equalToConstant: 280).isActive = true
            } else {
                iv.heightAnchor.constraint(equalToConstant: 140).isActive = true
                iv.widthAnchor.constraint(equalToConstant: 240).isActive = true
            }
            
            iv.roundCorners(cornerRadius: 8)
            stackView.addCenteredSubview(iv, stackViewParent: scrollView)

        }
        
        // Add Scroll View to Main View
        view.addSubview(scrollView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -90).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupScrollViewForSmallerScreen() {

        scrollView.addSubview(stackView)
        
        stackView.anchor(top: scrollView.topAnchor,
                         bottom: scrollView.bottomAnchor,
                         leading: scrollView.leadingAnchor,
                         trailing: scrollView.trailingAnchor,
                         height: nil,
                         width: nil)
        
        // Prevent Vertical Scrolling
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        // Populate Stack View
        for lesson in Utilities.shared.lessons! {
            
            let iv = CustomImageView()
            iv.loadImageUsingCacheWithURLString(urlString: lesson.thumbnailURL)
            iv.backgroundColor = K.DesignColors.primary
            iv.contentMode = .scaleAspectFill
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.heightAnchor.constraint(equalToConstant: 140).isActive = true
            iv.widthAnchor.constraint(equalToConstant: 240).isActive = true
            iv.roundCorners(cornerRadius: 8)
            stackView.addCenteredSubview(iv, stackViewParent: scrollView)
            
        }
        
        // Add Scroll View to Main View
        view.addSubview(scrollView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -70).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupScrollViewForMediumScreen() {
        
        scrollView.addSubview(stackView)
        
        stackView.anchor(top: scrollView.topAnchor,
                         bottom: scrollView.bottomAnchor,
                         leading: scrollView.leadingAnchor,
                         trailing: scrollView.trailingAnchor,
                         height: nil,
                         width: nil)
        
        // Prevent Vertical Scrolling
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        // Populate Stack View
        for lesson in Utilities.shared.lessons! {
            
            let iv = CustomImageView()
            iv.loadImageUsingCacheWithURLString(urlString: lesson.thumbnailURL)
            iv.backgroundColor = K.DesignColors.primary
            iv.contentMode = .scaleAspectFill
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.heightAnchor.constraint(equalToConstant: 180).isActive = true
            iv.widthAnchor.constraint(equalToConstant: 280).isActive = true
            iv.roundCorners(cornerRadius: 8)
            stackView.addCenteredSubview(iv, stackViewParent: scrollView)
            
        }
        
        // Add Scroll View to Main View
        view.addSubview(scrollView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -70).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func updateScrollView() {
        
        for view in stackView.subviews {
            view.removeFromSuperview()
        }
        
        // Populate Stack View
        for lesson in Utilities.shared.lessons! {
            
            let iv = CustomImageView()
            iv.loadImageUsingCacheWithURLString(urlString: lesson.thumbnailURL)
            iv.backgroundColor = K.DesignColors.primary
            iv.contentMode = .scaleAspectFill
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.heightAnchor.constraint(equalToConstant: 180).isActive = true
            iv.widthAnchor.constraint(equalToConstant: 280).isActive = true
            iv.roundCorners(cornerRadius: 8)
            stackView.addCenteredSubview(iv, stackViewParent: scrollView)
            
        }
        
        scrollViewIndex = 0
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        collectionView.reloadData()
        
    }
    
    func setupCollectionView() {
        
        view.addSubview(collectionView)
        
        collectionView.anchor(top: scrollView.bottomAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              leading: view.leadingAnchor,
                              trailing: view.trailingAnchor,
                              height: nil,
                              width: nil,
                              padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        collectionView.reloadData()
    }
    
    //MARK: - Selector Functions
    
    @objc func settingsButtonTapped() {
        
        Utilities.shared.settingsLauncher.parentVC = self
        Utilities.shared.settingsLauncher.showSettings()
        
    }
}

//MARK: - Collection View Data Source

extension LessonsController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Utilities.shared.lessons![scrollViewIndex].sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Utilities.shared.lessons![scrollViewIndex].sections[section].videos.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCell.identifier, for: indexPath) as! VideoCell
        cell.cellMask.alpha = 0
        
        let lesson = Utilities.shared.lessons![scrollViewIndex]
        let requiresPurchase = lesson.requiresPurchase
        let sectionLockStarts = lesson.sectionLockStarts
        let rowLockStarts = lesson.rowLockStarts
        let courseID = Utilities.shared.lessons![scrollViewIndex].purchaseIdentifier
        let user = Utilities.shared.user
        
        cell.courseType = CourseType(rawValue: courseID)!
        
        if requiresPurchase && (user == nil || user!.purchases[courseID] == nil || !user!.purchases[courseID]!) {
            if indexPath.section > sectionLockStarts {
                cell.playView.isHidden = false
            } else if indexPath.section == sectionLockStarts && indexPath.row >= rowLockStarts {
                cell.playView.isHidden = false
            } else {
                cell.playView.isHidden = true
            }
        } else {
            cell.playView.isHidden = true
        }
        
        let currentVideo = lesson.sections[indexPath.section].videos[indexPath.row]
        
        let thumbnailUrlString = currentVideo.thumbnailURL
        
        cell.imageView.backgroundColor = .white
        
        cell.imageView.loadImageUsingCacheWithURLString(urlString: thumbnailUrlString)
        
        cell.titleLabel.text = currentVideo.title
        
        cell.videoLengthLabel.text = currentVideo.duration
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderCollectionReusableView.identifier,
            for: indexPath
        ) as! HeaderCollectionReusableView
        
        let lesson = Utilities.shared.lessons![scrollViewIndex]
        let title = lesson.sections[indexPath.section].title
        header.configure(title: title)
        
        return header
    }
    
 
    
}

//MARK: - Collection View Delegate Flow Layout

extension LessonsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 74)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
}

//MARK: - Collection View Delegate

extension LessonsController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! VideoCell
        
        if cell.courseType == .EHDMasterCourse {
            if !cell.playView.isHidden {
                if !UserDefaults.standard.bool(forKey: "hasClickedLock") {
                    popUpManager.showPopUpFadingIn()
                    UserDefaults.standard.set(true, forKey: "hasClickedLock")
                    return
                } else {
                    popUpManager.showPopUpFadingIn()
                    return
                }
            }
        } else if cell.courseType == .KYGCourse {
            if !cell.playView.isHidden {
                if !UserDefaults.standard.bool(forKey: "hasClickedKYGLock") {
                    popUpManager.showPopUpFadingIn()
                    UserDefaults.standard.set(true, forKey: "hasClickedKYGLock")
                    return
                } else {
                    popUpManager.showPopUpFadingIn()
                    return
                }
            }
        }
        
        let lesson = Utilities.shared.lessons![scrollViewIndex]
        
        let position = VideoPosition(
            baseID: lesson.baseID,
            section: indexPath.section,
            row: indexPath.row
        )
        
        let observer = VideoManager.shared.getTimeObserver(courseType: cell.courseType)
        
        let urlString = lesson.sections[indexPath.section].videos[indexPath.row].videoURL
        
        VideoManager.shared.playVideo(
            lesson: lesson,
            position: position,
            urlString: urlString,
            observerType: observer,
            presenter: self
        )
    }
}

//MARK: - Scroll View Delegate

extension LessonsController: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        // Don't want this happening when the collectionView scrolls, just the scrollView
        if scrollView.tag == 1 { return }
        
        scrollViewIndex = Int(targetContentOffset.pointee.x / scrollView.frame.size.width)
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
    }
    
}

extension LessonsController: FirebaseUpdaterDelegate {
    func updateLessonsDisplay() {
        self.updateScrollView()
    }
}

extension LessonsController {
    func playVideo() {
        
        guard let videoGroups = Utilities.shared.lessons else {
            return
        }
        
        let urlString = AdManager.shared.getVideoURLForCurrentUserState()
        let position = AdManager.shared.getPositionForCurrentUserState()
        
        guard let lesson = videoGroups.first(where: {$0.baseID == position.baseID}) else {
            return
        }
        
        let observer = getObserver(lesson: lesson, position: position)
        
        VideoManager.shared.playVideo(
            lesson: lesson,
            position: position,
            urlString: urlString,
            observerType: observer,
            presenter: self
        )
    }
    
    func getObserver(lesson: VideoGroup, position: VideoPosition) -> ObserverType {
        let courseType = CourseType(rawValue: lesson.purchaseIdentifier)!
        
        switch courseType {
        case .Secrets:
            return .secretsObserver
        case .EHDMasterCourse:
            return .ehdObserver
        case .KYGCourse:
            if let user = Utilities.shared.user, let didPurchase = user.purchases[K.productNames.kygCourse] {
                if didPurchase == true {
                    return .kygObserver
                }
            }
            
            if position.section != 0 && position.row != 0 {
                return .kygObserver
            }
            return .kygSalesObserver
        }
    }
    
    func scrollToPage(page: Int, animated: Bool) {
        DispatchQueue.main.async {
            self.scrollViewIndex = page
            self.scrollView.setContentOffset(CGPoint(x: CGFloat(page) * self.scrollView.frame.width, y: 0), animated: animated)
            self.collectionView.reloadData()
        }
    }
}

extension LessonsController: NetworkConnectionUpdater {
    
    func setInterfaceForNetworkConnection() {
        updateLessonsDisplay()
        noNetworkConnectionView.isHidden = true
        
        
    }
    
    func setInterfaceForNoNetworkConnection() {
        noNetworkConnectionView.isHidden = false
        view.bringSubviewToFront(noNetworkConnectionView)
    }
    
}

//extension LessonsController {
//    func populateLessonsDB() {
//
//        let video1_0 = VideoModel(videoTitle: "Introduction",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.0_THUMB.png?alt=media&token=0af6dbf8-6675-42ad-88d8-ac2c777cb1c2",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.0_MAIN_INTRO.m4v?alt=media&token=8b59dada-7ea5-4eda-98a4-063dc1929731",
//                                duration: "3 minutes, 22 seconds")
//
//        let video1_1 = VideoModel(videoTitle: "How to Listen",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.1_THUMB.png?alt=media&token=063ec5bb-cc40-4ce4-b6bb-5ad904fd899a",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.1_LISTEN_INTRO.m4v?alt=media&token=ffa5a62d-00db-4f6c-8ae2-5cea7bdc39b3",
//                                duration: "1 minute, 33 seconds")
//
//        let video1_2 = VideoModel(videoTitle: "How to Mimic",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.2_THUMB.png?alt=media&token=27a239bb-8623-42f3-9212-e9f2d957c5c5",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.2_MIMIC_INTRO.m4v?alt=media&token=2f638176-dee3-4f43-bff0-5ba1cf5ae4a2",
//                                duration: "2 minutes, 21 seconds")
//
//        let video1_3 = VideoModel(videoTitle: "How to Rehearse",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.3_THUMB.png?alt=media&token=29a8baf0-d81a-4a6e-8b18-6cc2c057825c",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.3_REHEARSE_INTRO.m4v?alt=media&token=27487645-2e40-4969-b61b-98778bf2b95c",
//                                duration: "3 minutes, 55 seconds")
//
//        let video1_4 = VideoModel(videoTitle: "What are Vowels & Consonants",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.4_THUMB.png?alt=media&token=38003671-f776-4d1d-89f7-9d36e9ecf09f",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.4_CLASSROOM_INTRO.mp4?alt=media&token=22a9e3a5-bd2d-4632-b53b-ab5e1d4477a9",
//                                duration: "1 minute, 48 seconds")
//
//        let video2_0 = VideoModel(videoTitle: "Vowels Introduction",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2.0_THUMB.png?alt=media&token=402dfada-7d72-4d20-9bef-e89f4c13abf8",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2.0_CLASSROOM_VOWEL_INTRO.mp4?alt=media&token=4c84ef66-a2ef-4345-a264-8fdc3217ccc1",
//                                duration: "0 minutes, 58 seconds")
//
//        let video3_0 = VideoModel(videoTitle: "KY Classroom - BOT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3.0_THUMB.png?alt=media&token=e7f3b9bf-5bf0-4edb-9b06-5088a938ebd4",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3.0_CLASSROOM_VOWELS_BOT.mp4?alt=media&token=afea33f1-c753-48cd-a9c6-1c370f693f74",
//                                duration: "0 minutes, 11 seconds")
//
//        let video3_1 = VideoModel(videoTitle: "Listen - BOT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3.1_THUMB.png?alt=media&token=ca1bc757-d794-468b-834f-13a8302cc6c7",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3.1_BOT_LISTEN.mp4?alt=media&token=2f21acb3-73df-45b6-ae49-8a98900ad23b",
//                                duration: "1 minute, 39 seconds")
//
//        let video3_2 = VideoModel(videoTitle: "Mimic - BOT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3.2_THUMB.png?alt=media&token=c748f171-2145-4c0a-976f-8cdc15669327",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3.2_BOT_MIMIC.mp4?alt=media&token=05a85a4f-1dd8-422b-bec0-00882ff584c9",
//                                duration: "1 minute, 38 seconds")
//
//        let video4_0 = VideoModel(videoTitle: "KY Classroom - BAT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4.0_THUMB.png?alt=media&token=8043cf5e-a959-4f51-b18a-9847fd4aaa5f",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4.0_CLASSROOM_VOWELS_BAT.mp4?alt=media&token=e8adf9f8-d42f-46bd-86f9-52366ecaf131",
//                                duration: "0 minutes, 35 seconds")
//
//        let video4_1 = VideoModel(videoTitle: "Listen - BAT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4.1_THUMB.png?alt=media&token=96b22daa-df04-41f5-91a5-c4a628bbc219",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4.1_BAT_LISTEN.mp4?alt=media&token=cc612027-cb04-4e01-ac62-8b49902e0d21",
//                                duration: "1 minute, 10 seconds")
//
//        let video4_2 = VideoModel(videoTitle: "Mimic - BAT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4.2_THUMB.png?alt=media&token=5f77d685-c11e-40f8-a86a-8e56b18c0bb7",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4.2_BAT_MIMIC.mp4?alt=media&token=a0cfc773-1cb5-49fc-ac87-aae4b93e9ae6",
//                                duration: "1 minute, 9 seconds")
//
//        let video5_0 = VideoModel(videoTitle: "KY Classroom - BOUT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5.0_THUMB.png?alt=media&token=573de8c6-4f47-47ff-be5b-3d3dfee8e48b",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5.0_CLASSROOM%20VOWELS_BOUT.mp4?alt=media&token=27b5d2c3-1409-47d1-905b-11a921fc39b6",
//                                duration: "0 minutes, 26 seconds")
//
//        let video5_1 = VideoModel(videoTitle: "Listen - BOUT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5.1_THUMB.png?alt=media&token=6024c321-4286-4984-908c-d03389b00179",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5.1_BOUT_LISTEN.mp4?alt=media&token=01cf69e6-870a-4261-b4c1-2c696661aa6e",
//                                duration: "1 minute, 16 seconds")
//
//        let video5_2 = VideoModel(videoTitle: "Mimic - BOUT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5.2_THUMB.png?alt=media&token=b9c20cb3-dc57-48bc-ad7b-937f262ecaa0",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5.2_BOUT_MIMIC.mp4?alt=media&token=aad85665-2375-42f4-9aa2-889b5b0b29a3",
//                                duration: "1 minute, 15 seconds")
//
//        let video6_0 = VideoModel(videoTitle: "KY Classroom - BOOT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6.0_THUMB.png?alt=media&token=c30048f4-0621-42df-802a-a9d4559d34ee",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6.0_CLASSROOM%20VOWELS_BOOT.mp4?alt=media&token=fbfde34f-6ff2-474f-817f-2e12b460fe94",
//                                duration: "0 minutes, 14 seconds")
//
//        let video6_1 = VideoModel(videoTitle: "Listen - BOOT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6.1_THUMB.png?alt=media&token=aca25522-675f-445d-abbf-443887e80d66",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6.1_BOOT_LISTEN.mp4?alt=media&token=d1016878-7007-4d1f-a7a8-d52f578e9d24",
//                                duration: "1 minute, 53 seconds")
//
//        let video6_2 = VideoModel(videoTitle: "Mimic - BOOT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6.2_THUMB.png?alt=media&token=6f4b22a9-0e26-4c7d-aaab-ad740e5cd27b",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6.2_BOOT_MIMIC.mp4?alt=media&token=0268b5e0-461f-49ed-9e09-b011f82bdc4c",
//                                duration: "1 minute, 52 seconds")
//
//        let video7_0 = VideoModel(videoTitle: "KY Classroom - BUT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7.0_THUMB.png?alt=media&token=332cfa8f-39ac-4951-90a6-c9a62b10b04c",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7.0_CLASSROOM_VOWELS_BUT.mp4?alt=media&token=b530e8b9-f82e-4d4c-831d-abeb6ce43150",
//                                duration: "0 minutes, 39 seconds")
//
//        let video7_1 = VideoModel(videoTitle: "Listen - BUT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7.1_THUMB.png?alt=media&token=57d5bcf5-3e1a-4691-a3ca-053d6e2c8e0b",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7.1_BUT_LISTEN.mp4?alt=media&token=6f26185e-4675-44f5-8f77-51aee1ef3ee5",
//                                duration: "2 minutes, 48 seconds")
//
//        let video7_2 = VideoModel(videoTitle: "Mimic - BUT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7.2_THUMB.png?alt=media&token=bf44b519-75ca-4735-913b-3c9a8b21f32d",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7.2_BUT_MIMIC.mp4?alt=media&token=40384ada-5703-424e-8fcf-6942953160f0",
//                                duration: "2 minutes, 47 seconds")
//
//        let video8_0 = VideoModel(videoTitle: "KY Classroom - BOOK",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/8.0_THUMB.png?alt=media&token=0c1eb4ba-1595-4757-9d0b-b4556825b084",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/8.0_CLASSROOM_VOWELS_BOOK.mp4?alt=media&token=0755e298-ec6d-42fe-a5ae-1aa50f648109",
//                                duration: "0 minutes, 33 seconds")
//
//        let video8_1 = VideoModel(videoTitle: "Listen - BOOK",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/8.1_THUMB.png?alt=media&token=31c905a5-557f-4543-b6b3-d94ba7b25490",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/8.1_BOOK_LISTEN.mp4?alt=media&token=dfcda9f8-7ce6-406f-a1e0-5f1ef08c4eed",
//                                duration: "1 minute, 16 seconds")
//
//        let video8_2 = VideoModel(videoTitle: "Mimic - BOOK",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/8.2_THUMB.png?alt=media&token=6ba91016-6c55-43fc-ba19-f794d657c16f",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/8.2_BOOK_MIMIC.mp4?alt=media&token=d3a767a1-37df-42be-b7cd-d7a45324d6ee",
//                                duration: "1 minute, 15 seconds")
//
//        let video9_0 = VideoModel(videoTitle: "KY Classroom - BEAT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/9.0_THUMB.png?alt=media&token=225f8768-623d-46f3-b7d3-c55979876fd7",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/9.0_CLASSROOM_VOWELS_BEAT.mp4?alt=media&token=dbe0f185-b1b4-46c5-ba3f-07d651d43946",
//                                duration: "0 minutes, 12 seconds")
//
//        let video9_1 = VideoModel(videoTitle: "Listen - BEAT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/9.1_THUMB.png?alt=media&token=0e6d0d95-ad2d-4991-bb04-dc15658e7f89",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/9.1_BEAT_LISTEN.mp4?alt=media&token=88caddc6-95b4-4624-bfd2-003e993aef70",
//                                duration: "2 minutes, 14 seconds")
//
//        let video9_2 = VideoModel(videoTitle: "Mimic - BEAT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/9.2_THUMB.png?alt=media&token=5982a3f1-2460-4808-b8e1-65876466e79a",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/9.2_BEAT_MIMIC.mp4?alt=media&token=d5a2af13-aa0e-4241-a47a-1adb9e74f5e4",
//                                duration: "2 minutes, 13 seconds")
//
//        let video10_0 = VideoModel(videoTitle: "KY Classroom - BIT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/10.0_THUMB.png?alt=media&token=74761026-40ff-4dfb-aa9a-906c3ad5622f",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/10.0_CLASSROOM_VOWELS_BIT.mp4?alt=media&token=9a1348b9-7d95-458e-bebd-5c3b97943d9e",
//                                duration: "0 minutes, 20 seconds")
//
//        let video10_1 = VideoModel(videoTitle: "Listen - BIT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/10.1_THUMB.png?alt=media&token=3082d919-c1df-4355-b4a5-fcf3a2aa1d69",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/10.1_BIT_LISTEN.mp4?alt=media&token=70a5f4ac-54e0-425c-8246-19386cc43622",
//                                duration: "2 minutes, 37 seconds")
//
//        let video10_2 = VideoModel(videoTitle: "Mimic - BIT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/10.2_THUMB.png?alt=media&token=b1afc0be-0d08-40ec-9680-23bcd90d9aab",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/10.2_BIT_MIMIC.mp4?alt=media&token=91363fdf-63f1-4642-b221-dba907300527",
//                                duration: "2 minutes, 36 seconds")
//
//        let video11_0 = VideoModel(videoTitle: "KY Classroom - BET",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/11.0_THUMB.png?alt=media&token=6632ae58-c94a-4add-8e4c-9f7097dd3278",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/11.0_CLASSROOM_VOWELS_BET.mp4?alt=media&token=4f8fddf5-dca0-4845-a5dd-fd4915fd96ef",
//                                duration: "0 minutes, 6 seconds")
//
//        let video11_1 = VideoModel(videoTitle: "Listen - BET",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/11.1_THUMB.png?alt=media&token=995ce334-5fda-4d57-8b61-36e58ea4b787",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/11.1_BET_LISTEN.mp4?alt=media&token=13239749-b881-4878-a4a6-35ca5acba41b",
//                                duration: "1 minute, 50 seconds")
//
//        let video11_2 = VideoModel(videoTitle: "Mimic - BET",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/11.2_THUMB.png?alt=media&token=30858a96-52a4-4be8-9ee6-323145971b1b",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/11.2_BET_MIMIC.mp4?alt=media&token=5e942f35-6af7-411f-b5b2-db29a27327af",
//                                duration: "1 minute, 49 seconds")
//
//        let video12_0 = VideoModel(videoTitle: "KY Classroom - BAIT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/12.0_THUMB.png?alt=media&token=73bbd17d-4400-4cb8-88b1-bec00cae0aab",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/12.0_CLASSROOM_VOWELS_BAIT.mp4?alt=media&token=9fd4cd57-5e53-4fac-9d8a-8d5c81869fd2",
//                                duration: "0 minutes, 25 seconds")
//
//        let video12_1 = VideoModel(videoTitle: "Listen - BAIT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/12.1_THUMB.png?alt=media&token=7a0bc9c4-535d-4a6d-b555-2bbbf9022bf9",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/12.1_BAIT_LISTEN.mp4?alt=media&token=312525ad-c4e7-4ad3-9872-e5c942fb9dad",
//                                duration: "1 minute, 56 seconds")
//
//        let video12_2 = VideoModel(videoTitle: "Mimic - BAIT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/12.2_THUMB.png?alt=media&token=cecd08ac-71ff-48f4-aa3c-c89ed3bd999e",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/12.2_BAIT_MIMIC.mp4?alt=media&token=5b91b694-920e-4920-a293-ab7a140790d6",
//                                duration: "1 minute, 55 seconds")
//
//        let video13_0 = VideoModel(videoTitle: "KY Classroom - BITE",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/13.0_THUMB.png?alt=media&token=dec2a581-5748-45c6-80d6-c20bd6beadc6",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/13.0_CLASSROOM_VOWELS_BITE.mp4?alt=media&token=b342627a-ed0b-4565-a7b9-2892119f504a",
//                                duration: "0 minutes, 18 seconds")
//
//        let video13_1 = VideoModel(videoTitle: "Listen - BITE",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/13.1_THUMB.png?alt=media&token=dfa39d61-e17c-4176-a721-f22c097ebe69",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/13.1_BITE_LISTEN.mp4?alt=media&token=e0b4cb47-634d-48d9-8f71-c5094697673c",
//                                duration: "2 minutes, 8 seconds")
//
//        let video13_2 = VideoModel(videoTitle: "Mimic - BITE",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/13.2_THUMB.png?alt=media&token=7cadc2f3-e7a0-4364-bb44-c3db93328261",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/13.2_BITE_MIMIC.mp4?alt=media&token=57126d38-491c-42f9-a285-4f18b0ccf61f",
//                                duration: "2 minutes, 7 seconds")
//
//        let video14_0 = VideoModel(videoTitle: "KY Classroom - BOAT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/14.0_THUMB.png?alt=media&token=d0788473-0e5f-4b77-9f3f-0a338f03fc2c",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/14.0_CLASSROOM_VOWELS_BOAT.mp4?alt=media&token=28a5c934-de58-425f-a934-fc122f22a826",
//                                duration: "0 minutes, 48 seconds")
//
//        let video14_1 = VideoModel(videoTitle: "Listen - BOAT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/14.1_THUMB.png?alt=media&token=6b725d1f-51f0-462a-9ebc-772e785e57b1",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/14.1_BOAT_LISTEN.mp4?alt=media&token=1590ee2a-8032-4323-8792-ed12fea5a4f8",
//                                duration: "1 minute, 27 seconds")
//
//        let video14_2 = VideoModel(videoTitle: "Mimic - BOAT",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/14.2_THUMB.png?alt=media&token=c70b453f-f3b2-4361-8499-a79f70fa285d",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/14.2_BOAT_MIMIC.mp4?alt=media&token=a888a9f3-ea73-4d3e-8fa0-53780ce736e1",
//                                duration: "1 minute, 26 seconds")
//
//        let video15_0 = VideoModel(videoTitle: "KY Classroom - BOYD",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/15.0_THUMB.png?alt=media&token=66cfb19b-649b-4def-b39c-4210421ff420",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/15.0_CLASSROOM_VOWELS_BOYD.mp4?alt=media&token=8c453e2a-fae8-41d5-8262-5fb5543666c0",
//                                duration: "0 minutes, 16 seconds")
//
//        let video15_1 = VideoModel(videoTitle: "Listen - BOYD",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/15.1_THUMB.png?alt=media&token=a67957d8-3280-4852-9d96-46e6c5967463",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/15.1_BOYD_LISTEN.mp4?alt=media&token=9586b6fc-3618-4090-93a7-3afe3ef46257",
//                                duration: "1 minute, 21 seconds")
//
//        let video15_2 = VideoModel(videoTitle: "Mimic - BOYD",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/15.2_THUMB.png?alt=media&token=e82d8a4a-1e06-45b4-9222-123548114faa",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/15.2_BOYD_MIMIC.mp4?alt=media&token=3be11386-eb16-4013-b5f0-84c0c97feec3",
//                                duration: "1 minute, 20 seconds")
//
//        let video16_0 = VideoModel(videoTitle: "Consonants Intro - True & Flip",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/16.0_THUMB.png?alt=media&token=6520eb3a-7cae-4550-9c78-b6940e890826",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/16.0_CLASSROOM_%20CONSONANTS_INTRO.mp4?alt=media&token=54bf607d-f4d6-4aea-ae91-834d0743bcae",
//                                duration: "3 minutes, 24 seconds")
//
//        let video17_0 = VideoModel(videoTitle: "KY Classroom - B",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/17.0_THUMB.png?alt=media&token=b25fb82f-799f-4c36-8ad8-acad35c5b684",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/17.0_CLASSROOM_CONSONANTS%20B.mp4?alt=media&token=c6fcb9c1-1c81-48fe-b6b4-35c2778fb515",
//                                duration: "0 minutes, 10 seconds")
//
//        let video17_1 = VideoModel(videoTitle: "Listen - True B",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/17.1_THUMB.png?alt=media&token=21cf934d-4365-4767-94d6-34d8253636cd",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/17.1_TRUE_B_LISTEN.mp4?alt=media&token=01e4c37b-50fb-4a41-bd38-6b1d0a16cb36",
//                                duration: "0 minutes, 46 seconds")
//
//        let video17_2 = VideoModel(videoTitle: "Mimic - True B",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/17.2_THUMB.png?alt=media&token=46c515ee-29d7-40e8-bab6-035432de7a2f",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/17.2_TRUE_B_MIMIC.mp4?alt=media&token=a5b5609a-d1dc-4192-9a9f-3b21e3bb4e68",
//                                duration: "0 minutes, 45 seconds")
//
//        let video18_0 = VideoModel(videoTitle: "KY Classroom - C",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.0_THUMB.png?alt=media&token=d2d2403e-5059-4284-bbd3-726037d0d140",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.0_CLASSROOM_CONSONANTS_C.mp4?alt=media&token=9ce3da08-2070-47ce-ba21-8ca9a784cdb4",
//                                duration: "0 minutes, 24 seconds")
//
//        let video18_1 = VideoModel(videoTitle: "Listen - True C",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.1_THUMB.png?alt=media&token=ec4daa84-f827-4417-811f-bf1ed3e6d732",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.1_TRUE_C_LISTEN.mp4?alt=media&token=e548c4d5-28f8-42b1-bd09-209b3d5834c6",
//                                duration: "0 minutes, 46 seconds")
//
//        let video18_2 = VideoModel(videoTitle: "Mimic - True C",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.2_THUMB.png?alt=media&token=c2432976-1881-4a42-8b51-e08e9ad8c58c",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.2_TRUE_C_MIMIC.mp4?alt=media&token=60ef9668-3e08-4804-b941-ee0d2930374a",
//                                duration: "0 minutes, 45 seconds")
//
//        let video18_3 = VideoModel(videoTitle: "Listen - Flip C",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.3_THUMB.png?alt=media&token=bded8944-2488-4837-9962-776517fe7c57",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.3_FLIP_C_LISTEN.mp4?alt=media&token=5637d129-ff5e-41a9-af6b-d6818ff21422",
//                                duration: "0 minutes, 46 seconds")
//
//        let video18_4 = VideoModel(videoTitle: "Mimic - Flip C",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.4_THUMB.png?alt=media&token=525c1643-6aac-4ab0-bf2c-732444df00de",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.4_FLIP_C_MIMIC.mp4?alt=media&token=e2d7c246-be7c-4cb3-ab69-f198048a5df2",
//                                duration: "0 minutes, 45 seconds")
//
//        let video19_0 = VideoModel(videoTitle: "KY Classroom - D",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.0_THUMB.png?alt=media&token=30273af1-6d82-41e7-b0f1-216b6f861a5f",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.0_CLASSROOM_CONSONANTS_D.mp4?alt=media&token=03fdcd4b-7942-453e-ab6f-bf323e15833f",
//                                duration: "0 minutes, 23 seconds")
//
//        let video19_1 = VideoModel(videoTitle: "Listen - True D",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.1_THUMB.png?alt=media&token=59fb740c-9a38-4679-8265-9d01d7a77dda",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.1_TRUE_D_LISTEN.mp4?alt=media&token=73381e62-1bc9-4d0b-b498-79971233676b",
//                                duration: "0 minutes, 46 seconds")
//
//        let video19_2 = VideoModel(videoTitle: "Mimic - True D",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.2_THUMB.png?alt=media&token=aa175844-93cf-4dd5-bb06-07c7220e48ed",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.2_TRUE_D_MIMIC.mp4?alt=media&token=1d15b1d7-6c00-4e1a-a14d-b77d01e9085a",
//                                duration: "0 minutes, 45 seconds")
//
//        let video19_3 = VideoModel(videoTitle: "Listen - Flip D",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.3_THUMB.png?alt=media&token=af2e6014-0ec7-4158-93bc-a867e180844e",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.3_FLIP_D_LISTEN.mp4?alt=media&token=167b4558-2873-4884-9ed7-4ae833c8f648",
//                                duration: "0 minutes, 46 seconds")
//
//        let video19_4 = VideoModel(videoTitle: "Mimic - Flip D",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.4_THUMB.png?alt=media&token=5bb6683f-656a-4618-a3e1-0465e5015c5e",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.4_FLIP_D_MIMIC.mp4?alt=media&token=06e1f167-9dd7-4346-9907-d85e5d4a1087",
//                                duration: "0 minutes, 45 seconds")
//
//        let video20_0 = VideoModel(videoTitle: "KY Classroom - F",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.0_THUMB.png?alt=media&token=95e7a9c9-3a8d-4a9f-9788-75ba6b874c0d",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.0_CLASSROOM_CONSONANTS_F.mp4?alt=media&token=94420078-c571-42ac-a94f-70fa8e494cb9",
//                                duration: "0 minutes, 57 seconds")
//
//        let video20_1 = VideoModel(videoTitle: "Listen - True F",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.1_THUMB.png?alt=media&token=e8bcce99-c5e8-4d1c-8d89-448faa59f0f0",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.1_TRUE_F_LISTEN.mp4?alt=media&token=d456bf7f-ab1a-40f5-8446-96228962b794",
//                                duration: "0 minutes, 46 seconds")
//
//        let video20_2 = VideoModel(videoTitle: "Mimic - True F",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.2_THUMB.png?alt=media&token=e05ae39c-e30c-4fa6-a7a8-176e762581c9",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.2_TRUE_F_MIMIC.mp4?alt=media&token=b48ad785-4961-4220-a2a4-39409a508475",
//                                duration: "0 minutes, 45 seconds")
//
//        let video20_3 = VideoModel(videoTitle: "Listen - Flip F",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.3_THUMB.png?alt=media&token=5fe0d74e-54e9-42b1-8668-26c55242a41d",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.3_FLIP_F_LISTEN.mp4?alt=media&token=dc767408-f664-48c0-ae01-25be0e1b6bfb",
//                                duration: "0 minutes, 34 seconds")
//
//        let video20_4 = VideoModel(videoTitle: "Mimic - Flip F",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.4_THUMB.png?alt=media&token=80c054a0-ec2f-47e0-9ea2-b5cfb7017f38",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.4_FLIP_F_MIMIC.mp4?alt=media&token=ea60fd30-19b3-4481-a77a-d7ccf5b2dad7",
//                                duration: "0 minutes, 33 seconds")
//
//        let video21_0 = VideoModel(videoTitle: "KY Classroom - G",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/21.0_THUMB.png?alt=media&token=e4b9d0c0-a919-4bd5-8f42-5279b1a35d52",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/21.0_CLASSROOM_CONSONANTS_G.mp4?alt=media&token=1a78294b-a4d0-4903-9bd3-53c55c5097c1",
//                                duration: "0 minutes, 11 seconds")
//
//        let video21_1 = VideoModel(videoTitle: "Listen - True G",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/21.1_THUMB.png?alt=media&token=0b982779-a5d5-46f9-a8a7-c29eb994d5d7",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/21.1_TRUE_G_LISTEN.mp4?alt=media&token=17ca4336-fbf5-43df-b7f0-544d9edb07b7",
//                                duration: "0 minutes, 46 seconds")
//
//        let video21_2 = VideoModel(videoTitle: "Mimic - True G",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/21.2_THUMB.png?alt=media&token=39c0f5af-178a-455a-9cc0-27e16b71b364",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/21.2_TRUE_G_MIMIC.mp4?alt=media&token=c71e73d2-50f4-43bf-8d8e-bfc045d8bd1b",
//                                duration: "0 minutes, 45 seconds")
//
//        let video22_0 = VideoModel(videoTitle: "KY Classroom - H",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/22.0_THUMB.png?alt=media&token=f4d4ec38-7080-4e35-903f-debe6ce05665",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/22.0_CLASSROOM_CONSONANTS_H.mp4?alt=media&token=5a1f9777-7c0d-4936-ba04-188cf3ddbf8a",
//                                duration: "0 minutes, 15 seconds")
//
//        let video22_1 = VideoModel(videoTitle: "Listen - True H",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/22.1_THUMB.png?alt=media&token=a95b0252-e0d0-41d2-960e-1df13903f657",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/22.1_TRUE_H_LISTEN.mp4?alt=media&token=802d4097-8673-4fa8-9baa-cf6ca57bde69",
//                                duration: "0 minutes, 42 seconds")
//
//
//        let video22_2 = VideoModel(videoTitle: "Mimic - True H",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/22.2_THUMB.png?alt=media&token=d409340d-5e4a-476e-a067-0889d0c1102d",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/22.2_TRUE_H_MIMIC.mp4?alt=media&token=ab7d3c11-964e-4897-8b87-eb4d0ee91221",
//                                duration: "0 minutes, 41 seconds")
//
//        let video23_0 = VideoModel(videoTitle: "KY Classroom - K",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/23.0_THUMB.png?alt=media&token=029d0583-2d66-4ecf-9d80-cd568027661a",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/23.0_CLASSROOM_CONSONANTS_K.mp4?alt=media&token=c4e20afb-d783-4c17-a4bb-fa4a9359dda8",
//                                duration: "0 minutes, 12 seconds")
//
//        let video23_1 = VideoModel(videoTitle: "Listen - True K",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/23.1_THUMB.png?alt=media&token=fdb8fdf5-5090-47ab-9138-0d6f88710af2",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/23.1_TRUE_K_LISTEN.mp4?alt=media&token=d32cfb6c-948d-4926-a638-02d15bd725e2",
//                                duration: "0 minutes, 49 seconds")
//
//        let video23_2 = VideoModel(videoTitle: "Mimic - True K",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/23.2_THUMB.png?alt=media&token=cee8fbe4-632f-40ad-81a4-7f477731891d",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/23.2_TRUE_K_MIMIC.mp4?alt=media&token=8ea65fc3-8d94-4fac-80e9-c8e1c7b76728",
//                                duration: "0 minutes, 48 seconds")
//
//        let video24_0 = VideoModel(videoTitle: "KY Classroom - L",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.0_THUMB.png?alt=media&token=c3e28d7a-54e5-4158-b924-5217cb3d37e4",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.0_CLASSROOM_CONSONANTS_L.mp4?alt=media&token=e0ae54ba-5a00-4cf0-8d7f-9cdf7716e50d",
//                                duration: "1 minute, 24 seconds")
//
//        let video24_1 = VideoModel(videoTitle: "Listen - True L",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.1_THUMB.png?alt=media&token=f19e55d5-ac3a-4c46-aedc-4c249da620b7",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.1_TRUE_L_LISTEN.mp4?alt=media&token=902fe1a6-bd25-4cf5-877d-bd79c3718deb",
//                                duration: "0 minutes, 46 seconds")
//
//        let video24_2 = VideoModel(videoTitle: "Mimic - True L",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.2_THUMB.png?alt=media&token=3663d014-602f-4dde-8b5b-6ac98c285fec",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.2_TRUE_L_MIMIC.mp4?alt=media&token=471e0e69-c463-44a7-938a-1457d2c8626c",
//                                duration: "0 minutes, 45 seconds")
//
//        let video24_3 = VideoModel(videoTitle: "Listen - Flip L",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.3_THUMB.png?alt=media&token=6fe0f255-513b-4a81-bc90-7a6c43cce09b",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.3_FLIP_L_LISTEN.mp4?alt=media&token=82aca982-f24b-40b1-ac7f-fc5d16e2b9f8",
//                                duration: "0 minutes, 46 seconds")
//
//        let video24_4 = VideoModel(videoTitle: "Mimic - Flip L",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.4_THUMB.png?alt=media&token=d62efca5-3f9a-4f98-91f5-cea3a65d86be",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.4_FLIP_L_MIMIC.mp4?alt=media&token=f4009e76-dcb2-4693-b49c-0ca2b0ffb372",
//                                duration: "0 minutes, 45 seconds")
//
//        let video25_0 = VideoModel(videoTitle: "KY Classroom - M",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/25.0_THUMB.png?alt=media&token=ea3cbef5-a013-4dd4-b5d8-42514fcafa4b",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/25.0_CLASSROOM_CONSONANTS_M.mp4?alt=media&token=537e705f-a443-469f-941f-87d2ddd10065",
//                                duration: "0 minutes, 7 seconds")
//
//        let video25_1 = VideoModel(videoTitle: "Listen - True M",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/25.1_THUMB.png?alt=media&token=35b39687-1b60-4e2b-8cb3-4ab0f904214a",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/25.1_TRUE_M_LISTEN.mp4?alt=media&token=0a418343-ee8b-479e-8a13-84f8f6883e94",
//                                duration: "0 minutes, 46 seconds")
//
//        let video25_2 = VideoModel(videoTitle: "Mimic - True M",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/25.2_THUMB.png?alt=media&token=92caee28-36fe-41da-a82b-834505608581",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/25.2_TRUE_M_MIMIC.mp4?alt=media&token=cee2af04-b3a7-473e-ab60-3af8b61cf0a5",
//                                duration: "0 minutes, 45 seconds")
//
//        let video26_0 = VideoModel(videoTitle: "KY Classroom - N",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.0_THUMB.png?alt=media&token=fab14f45-e8ae-4f67-8020-c48542d78945",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.0_CLASSROOM_CONSONANTS_N.mp4?alt=media&token=45df793f-1519-40f5-b73c-52b70f0f7d52",
//                                duration: "0 minutes, 44 seconds")
//
//        let video26_1 = VideoModel(videoTitle: "Listen - True N",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.1_THUMB.png?alt=media&token=5c3df39d-97cd-4b13-8d51-e4538c7d899e",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.1_TRUE_N_LISTEN.mp4?alt=media&token=72edbbbb-9936-45b1-be24-6b5fbe0469a7",
//                                duration: "0 minutes, 46 seconds")
//
//
//        let video26_2 = VideoModel(videoTitle: "Mimic - True N",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.2_THUMB.png?alt=media&token=778e7af7-3177-4d06-ae78-c92369ae22ae",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.2_TRUE_N_MIMIC.mp4?alt=media&token=a9747de7-a3a9-4a04-8e05-9ad4e44c3194",
//                                duration: "0 minutes, 45 seconds")
//
//        let video26_3 = VideoModel(videoTitle: "Listen - Flip N",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.3_THUMB.png?alt=media&token=010a6c09-8949-4376-b026-71398d82e883",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.3_FLIP_N_LISTEN.mp4?alt=media&token=d07b5fc6-1cac-4406-b884-b08874d8f70e",
//                                duration: "0 minutes, 46 seconds")
//
//        let video26_4 = VideoModel(videoTitle: "Mimic - Flip N",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.4_THUMB.png?alt=media&token=61b6349b-2150-4e00-85ac-3a15998891d3",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.4_FLIP_N_MIMIC.mp4?alt=media&token=2b75de06-4959-4dfd-9dad-d6bdc328c22a",
//                                duration: "0 minutes, 45 seconds")
//
//        let video27_0 = VideoModel(videoTitle: "KY Classroom - P",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/27.0_THUMB.png?alt=media&token=8a3ccaa3-92db-4239-b265-d5d3ac55b70e",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/27.0_CLASSROOM_CONSONANTS_P.mp4?alt=media&token=4dcece48-f9ea-4f53-934c-3e06dff5888b",
//                                duration: "0 minutes, 27 seconds")
//
//        let video27_1 = VideoModel(videoTitle: "Listen - True P",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/27.1_THUMB.png?alt=media&token=0f631ca2-30c1-4247-acd0-700e62626fd4",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/27.1_TRUE_P_LISTEN.mp4?alt=media&token=6b38bb4a-bc8d-4043-80a7-a29a8500f881",
//                                duration: "0 minutes, 46 seconds")
//
//        let video27_2 = VideoModel(videoTitle: "Mimic - True P",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/27.2_THUMB.png?alt=media&token=2735bfa3-ef9b-4383-a161-7f64ed39ae45",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/27.2_TRUE_P_MIMIC.mp4?alt=media&token=8ed69f4d-1be9-4186-951f-56506485de3b",
//                                duration: "0 minutes, 45 seconds")
//
//        let video28_0 = VideoModel(videoTitle: "KY Classroom - QU",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/28.0_THUMB.png?alt=media&token=1cf78682-e16d-4664-ac36-1695a077caf7",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/28.0_CLASSROOM_CONSONANTS_Qu.mp4?alt=media&token=2c516122-d7bc-4fa8-b4d3-ba27b77e3d3a",
//                                duration: "0 minutes, 29 seconds")
//
//        let video28_1 = VideoModel(videoTitle: "Listen - QU",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/28.1_THUMB.png?alt=media&token=527b0364-9608-4af9-84fe-c25ac70bebdf",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/28.1_TRUE_QU_LISTEN.mp4?alt=media&token=2e4ecc4a-c092-4a47-afa1-37b0396e7d9c",
//                                duration: "0 minutes, 46 seconds")
//
//        let video28_2 = VideoModel(videoTitle: "Mimic - QU",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/28.2_THUMB.png?alt=media&token=81beba2c-60d7-454a-8cbb-deea1be9cd22",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/28.2_TRUE_QU_MIMIC.mp4?alt=media&token=fa95e6df-a7ce-4bbb-bf16-a3b6e59f149b",
//                                duration: "0 minutes, 45 seconds")
//
//        let video29_0 = VideoModel(videoTitle: "KY Classroom - R",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.0_THUMB.png?alt=media&token=2b7598ca-104e-43d5-a726-9a45a6e85a31",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.0_CLASSROOM_CONSONANTS_R.mp4?alt=media&token=be9534b5-60fc-4ca2-acb7-5d732e3dc119",
//                                duration: "0 minutes, 56 seconds")
//
//        let video29_1 = VideoModel(videoTitle: "Listen - True R",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.1_THUMB.png?alt=media&token=d8d02b5e-e721-46d1-b02f-04305954ea9e",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.1_TRUE_R_LISTEN.mp4?alt=media&token=dd976385-ffc2-4822-84e7-5b3e5b09aa71",
//                                duration: "0 minutes, 40 seconds")
//
//        let video29_2 = VideoModel(videoTitle: "Mimic - True R",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.2_THUMB.png?alt=media&token=56dcf55d-c6ac-4d76-948e-107a797ce2bc",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.2_TRUE_R_MIMIC.mp4?alt=media&token=b9552298-3400-48aa-b037-7b11eca4c4b0",
//                                duration: "0 minutes, 39 seconds")
//
//        let video29_3 = VideoModel(videoTitle: "Listen - Flip R",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.3_THUMB.png?alt=media&token=6fb9347c-4655-4f82-af19-1a6369666195",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.3_FLIP_R_LISTEN.mp4?alt=media&token=a98ff012-cf4d-4eb0-a81e-3d3087024547",
//                                duration: "0 minutes, 46 seconds")
//
//        let video29_4 = VideoModel(videoTitle: "Mimic - Flip R",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.4_THUMB.png?alt=media&token=bb494280-476b-43d0-9830-6d996fb3bf81",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.4_FLIP_R_MIMIC.mp4?alt=media&token=82c197cd-60fd-4fe4-a81d-3e2e0c26479b",
//                                duration: "0 minutes, 45 seconds")
//
//        let video30_0 = VideoModel(videoTitle: "KY Classroom - S",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.0_THUMB.png?alt=media&token=82a09a39-a4c1-4cbc-b9e6-647a07ef0a74",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.0_CLASSROOM_CONSONANTS_S.mp4?alt=media&token=2de61bd0-6be8-43fb-a43c-fa096190322b",
//                                duration: "0 minutes, 30 seconds")
//
//        let video30_1 = VideoModel(videoTitle: "Listen - True S",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.1_THUMB.png?alt=media&token=0d8ae29b-c049-4258-a24d-c825f922f025",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.1_TRUE_S_LISTEN.mp4?alt=media&token=6b3357a2-9153-47e3-bc93-72a171bc0830",
//                                duration: "0 minutes, 46 seconds")
//
//        let video30_2 = VideoModel(videoTitle: "Mimic - True S",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.2_THUMB.png?alt=media&token=cde472ee-3586-4a66-95d7-bb9901318bb8",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.2_TRUE_S_MIMIC.mp4?alt=media&token=ccb73f7c-b00a-41f4-ac89-f9d5e140650b",
//                                duration: "0 minutes, 45 seconds")
//
//        let video30_3 = VideoModel(videoTitle: "Listen - Flip S",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.3_THUMB.png?alt=media&token=540e1a26-721a-44fc-99c8-cb8cc39b917a",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.3_FLIP_S_LISTEN.mp4?alt=media&token=dba6085d-9486-4ccc-af4d-ad847a0fab5d",
//                                duration: "0 minutes, 46 seconds")
//
//        let video30_4 = VideoModel(videoTitle: "Mimic - Flip S",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.4_THUMB.png?alt=media&token=571db319-028e-4337-8390-9785dfb0a553",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.4_FLIP_S_MIMIC.mp4?alt=media&token=1e8c40ad-91f3-471a-b046-c221fcf7af2c",
//                                duration: "0 minutes, 45 seconds")
//
//        let video31_0 = VideoModel(videoTitle: "KY Classroom - T",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.0_THUMB.png?alt=media&token=fe41ca28-f503-4571-9ebb-e2fd67be9533",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.0_CLASSROOM_CONSONANTS_T.mp4?alt=media&token=a0dd4175-145a-4e22-8795-096f2e509b45",
//                                duration: "0 minutes, 25 seconds")
//
//        let video31_1 = VideoModel(videoTitle: "Listen - True T",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.1_THUMB.png?alt=media&token=29fe2f5d-dc43-4376-a0ae-56563911c7ed",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.1_TRUE_T_LISTEN.mp4?alt=media&token=6a57104b-160d-4f2a-ace4-9161f563397e",
//                                duration: "0 minutes, 46 seconds")
//
//        let video31_2 = VideoModel(videoTitle: "Mimic - True T",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.2_THUMB.png?alt=media&token=ba2bc6d4-805b-48f4-a434-4a11fe79be83",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.2_TRUE_T_MIMIC.mp4?alt=media&token=3c4a1e60-563f-4d4a-8921-7684128691b1",
//                                duration: "0 minutes, 45 seconds")
//
//        let video31_3 = VideoModel(videoTitle: "Listen - Flip T",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.3_THUMB.png?alt=media&token=b81c3339-690e-48ea-b3c5-ee724da53a30",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.3_FLIP_T_LISTEN.mp4?alt=media&token=fbe9c68b-21c2-42ad-82d8-9e9df0e76c91",
//                                duration: "0 minutes, 46 seconds")
//
//        let video31_4 = VideoModel(videoTitle: "Mimic - Flip T",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.4_THUMB.png?alt=media&token=e230d8a3-f1af-4823-b3c1-1ec4bff9c736",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.4_FLIP_T_MIMIC.mp4?alt=media&token=a4b5de6d-e513-4c51-af61-4d2687ed2539",
//                                duration: "0 minutes, 45 seconds")
//
//        let video32_0 = VideoModel(videoTitle: "KY Classroom - TH",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.0_THUMB.png?alt=media&token=e3996625-41dc-4268-b1f0-e644274b4fea",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.0_CLASSROOM_CONSONANTS_Th.mp4?alt=media&token=df2bbd38-80cb-443c-9622-38a219e26f3a",
//                                duration: "1 minute, 1 second")
//
//        let video32_1 = VideoModel(videoTitle: "Listen - True TH",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.1_THUMB.png?alt=media&token=6198ef57-c379-410f-934e-7ac752ac2680",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.1_TRUE_TH_LISTEN.mp4?alt=media&token=a4cf06b9-6bf8-4a32-8ba9-eee84053d36c",
//                                duration: "0 minutes, 46 seconds")
//
//        let video32_2 = VideoModel(videoTitle: "Mimic - True TH",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.2_THUMB.png?alt=media&token=0bc9e59e-ed5c-4241-9d12-ad61b2b53a17",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.2_TRUE_TH_MIMIC.mp4?alt=media&token=ab072541-ffe2-45df-a7f8-dcb0455b3875",
//                                duration: "0 minutes, 45 seconds")
//
//        let video32_3 = VideoModel(videoTitle: "Listen - Flip TH",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.3_THUMB.png?alt=media&token=1bcbe40f-b301-4c4f-9541-37b2ab1aab42",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.3_FLIP_TH_LISTEN.mp4?alt=media&token=fc79233f-0570-425f-9064-ff5efe71a79d",
//                                duration: "0 minutes, 46 seconds")
//
//        let video32_4 = VideoModel(videoTitle: "Mimic - Flip TH",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.4_THUMB.png?alt=media&token=63f0f104-b615-463d-9be6-35bc8510ac19",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.4_FLIP_TH_MIMIC.mp4?alt=media&token=4ed95d8f-f23a-4bb6-a3b4-831af7edb912",
//                                duration: "0 minutes, 45 seconds")
//
//        let video33_0 = VideoModel(videoTitle: "KY Classroom - V",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/33.0_THUMB.png?alt=media&token=9c371e10-1b2f-4da0-8f68-0c9ac0ead5e0",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/33.0_CLASSROOM_CONSONANTS_V.mp4?alt=media&token=b42c77c2-b1d0-44a1-8acb-b1a3abfb942a",
//                                duration: "0 minutes, 33 seconds")
//
//        let video33_1 = VideoModel(videoTitle: "Listen - True V",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/33.1_THUMB.png?alt=media&token=5cfa6230-d7af-401e-a282-bdf9357682ee",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/33.1_TRUE_V_LISTEN.mp4?alt=media&token=3163a346-8c87-4507-a477-73f2a5ecf881",
//                                duration: "0 minutes, 46 seconds")
//
//        let video33_2 = VideoModel(videoTitle: "Mimic - True V",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/33.2_THUMB.png?alt=media&token=035bcc63-a328-4296-84f3-989778937305",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/33.2_TRUE_V_MIMIC.mp4?alt=media&token=09ece034-44ca-42c0-a3a1-a5f5742f06aa",
//                                duration: "0 minutes, 45 seconds")
//
//        let video34_0 = VideoModel(videoTitle: "KY Classroom - W",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/34.0_THUMB.png?alt=media&token=ec15c31f-8e5f-4a8c-a9f2-1f016092948e",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/34.0_CLASSROOM_CONSONANTS_W.mp4?alt=media&token=905d8b58-a61b-45bb-a784-ebac013eab8b",
//                                duration: "0 minutes, 41 seconds")
//
//        let video34_1 = VideoModel(videoTitle: "Listen - True W",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/34.1_THUMB.png?alt=media&token=ada2709f-c519-4065-bb6d-a16b45840a24",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/34.1_TRUE_W_LISTEN.mp4?alt=media&token=21446aec-d758-40f1-8890-1d8ec8dba09b",
//                                duration: "0 minutes, 46 seconds")
//
//        let video34_2 = VideoModel(videoTitle: "Mimic - True W",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/34.2_THUMB.png?alt=media&token=9dff2e98-ee7f-4fc2-beb7-6c4661f0d42e",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/34.2_TRUE_W_MIMIC.mp4?alt=media&token=7ed423a6-a4bf-4c02-b107-d1b7c7933678",
//                                duration: "0 minutes, 45 seconds")
//
//        let video35_0 = VideoModel(videoTitle: "KY Classroom - X",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.0_THUMB.png?alt=media&token=e56be045-9482-45be-b608-4425a6dda646",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.0_CLASSROOM_CONSONANTS_X.mp4?alt=media&token=a4bf2b13-4759-4722-a3a0-6f362fdc3223",
//                                duration: "0 minutes, 34 seconds")
//
//        let video35_1 = VideoModel(videoTitle: "Listen - True X",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.1_THUMB.png?alt=media&token=00a3f17e-ef9f-43ef-b404-9cc8f14cfbd3",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.1_TRUE_X_LISTEN.mp4?alt=media&token=a241e7b4-9472-4c6f-bb66-e0101fb66792",
//                                duration: "0 minutes, 40 seconds")
//
//        let video35_2 = VideoModel(videoTitle: "Mimic - True X",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.2_THUMB.png?alt=media&token=b9eac94c-96da-4bb1-b609-886160dfb217",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.2_TRUE_X_MIMIC.mp4?alt=media&token=28ffea5a-9209-46e4-8659-5ec1417be69f",
//                                duration: "0 minutes, 39 seconds")
//
//        let video35_3 = VideoModel(videoTitle: "Listen - Flip X",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.3_THUMB.png?alt=media&token=7dd42241-77ed-4a96-9a7b-a115faf01d1c",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.3_FLIP_X_LISTEN.mp4?alt=media&token=4ca3ce74-b64a-4045-9825-bccf774706b7",
//                                duration: "0 minutes, 46 seconds")
//
//        let video35_4 = VideoModel(videoTitle: "Mimic - Flip X",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.4_THUMB.png?alt=media&token=ed4ec495-5721-4adc-8fd2-95a8fbbfcb5e",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.4_FLIP_X_MIMIC.mp4?alt=media&token=e9d0dbb8-0d02-4217-a3d3-38d16af05e04",
//                                duration: "0 minutes, 45 seconds")
//
//        let video36_0 = VideoModel(videoTitle: "KY Classroom - Z",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.0_THUMB.png?alt=media&token=881bf411-9f65-4ccd-bf55-56c63fec2b10",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.0_CLASSROOM_CONSONANTS_Z.mp4?alt=media&token=676ebb5a-8e8a-4768-9a6a-8bfc36ee6c97",
//                                duration: "0 minutes, 22 seconds")
//
//        let video36_1 = VideoModel(videoTitle: "Listen - True Z",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.1_THUMB.png?alt=media&token=12e138f0-12df-4259-b88c-1535935b81ad",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.1_TRUE_Z_LISTEN.mp4?alt=media&token=dcebd5a4-f116-4508-9192-d786ae5f3d07",
//                                duration: "0 minutes, 46 seconds")
//
//        let video36_2 = VideoModel(videoTitle: "Mimic - True Z",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.2_THUMB.png?alt=media&token=33b63f9d-ad7d-4cd6-846e-9c4b7a2b0519",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.2_TRUE_Z_MIMIC.mp4?alt=media&token=dcbb4a18-14ef-4267-a421-ac13e223e907",
//                                duration: "0 minutes, 45 seconds")
//
//        let video36_3 = VideoModel(videoTitle: "Listen - Flip Z",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.3_THUMB.png?alt=media&token=c047fb93-f757-4437-be87-caac1679d8fa",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.3_FLIP_Z_LISTEN.mp4?alt=media&token=6e6442c8-40c3-469d-9c96-5aed0bd9aca3",
//                                duration: "0 minutes, 46 seconds")
//
//        let video36_4 = VideoModel(videoTitle: "Mimic - Flip Z",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.4_THUMB.png?alt=media&token=494e632c-0e0e-46bb-a0db-99a07615aff4",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.4_FLIP_Z_MIMIC.mp4?alt=media&token=f8c394e0-813d-4126-ae82-c56449111c70",
//                                duration: "0 minutes, 45 seconds")
//
//        let video37_0 = VideoModel(videoTitle: "Consonants Intro - Fluid",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/37.0_THUMB.png?alt=media&token=61a91c23-67f5-4890-b81f-996caf1e8d15",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/37.0_CLASSROOM_FLUID_INTRO.mp4?alt=media&token=6750c375-d2f7-47f5-97be-7d8a54557e4a",
//                                duration: "0 minutes, 41 seconds")
//
//        let video38_0 = VideoModel(videoTitle: "KY Classroom - MISSION",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/38.0_THUMB.png?alt=media&token=2264338c-140e-4e4f-a29a-85949a340f55",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/38.0_CLASSROOM_FLUID_MISSION.mp4?alt=media&token=f17c3664-cdb0-43b3-afd3-bfb6b5d7e0bd",
//                                duration: "0 minutes, 15 seconds")
//
//        let video38_1 = VideoModel(videoTitle: "Listen - MISSION",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/38.1_THUMB.png?alt=media&token=b45ca0af-aae4-40b8-b368-28d1dc7107ad",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/38.1_FLUID_MISSION_LISTEN.mp4?alt=media&token=e4d35e28-079b-45a3-b281-d3dd310bf30c",
//                                duration: "1 minute, 33 seconds")
//
//        let video38_2 = VideoModel(videoTitle: "Mimic - MISSION",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/38.2_THUMB.png?alt=media&token=d7b78ff7-fe3e-4d6c-a949-675f29d485d9",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/38.2_FLUID_MISSION_MIMIC.mp4?alt=media&token=7bc78806-0cb9-4240-aea2-d7225a6ff134",
//                                duration: "1 minute, 32 seconds")
//
//        let video39_0 = VideoModel(videoTitle: "KY Classroom - VISION",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/39.0_THUMB.png?alt=media&token=fb564ff9-4115-46b7-be5c-f45c2d1aff7a",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/39.0_CLASSROOM_FLUID_VISION.mp4?alt=media&token=b249f64a-14ab-4eb4-bad6-8805680fb280",
//                                duration: "0 minutes, 38 seconds")
//
//        let video39_1 = VideoModel(videoTitle: "Listen - VISION",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/39.1_THUMB.png?alt=media&token=84a87032-b1e6-490f-b6bd-0d60dd878101",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/39.1_FLUID_VISION_LISTEN.mp4?alt=media&token=d1e7bc3f-979f-468c-9410-10e2af27bb84",
//                                duration: "1 minute, 15 seconds")
//
//        let video39_2 = VideoModel(videoTitle: "Mimic - VISION",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/39.2_THUMB.png?alt=media&token=80013912-d98e-4261-aa7b-30d51b921fca",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/39.2_FLUID_VISION_MIMIC.mp4?alt=media&token=143dbec9-6dc2-4261-a0ab-0676cd968521",
//                                duration: "1 minute, 14 seconds")
//
//        let video40_0 = VideoModel(videoTitle: "KY Classroom - CHOKE",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/40.0_THUMB.png?alt=media&token=9b42132b-f624-495f-8341-1e7a15b6e277",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/40.0_CLASSROOM_FLUID_CHOKE.mp4?alt=media&token=a9980e97-2522-4ed0-b15f-8713936a5d7b",
//                                duration: "0 minutes, 14 seconds")
//
//        let video40_1 = VideoModel(videoTitle: "Listen - CHOKE",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/40.1_THUMB.png?alt=media&token=44135188-1c1b-49b9-b2fa-98b9b52b18b1",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/40.1_FLUID_CHOKE_LISTEN.mp4?alt=media&token=330754ea-b571-420b-bb1f-80fa9872e6de",
//                                duration: "1 minute, 27 seconds")
//
//        let video40_2 = VideoModel(videoTitle: "Mimic - CHOKE",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/40.2_THUMB.png?alt=media&token=85c21a38-9338-41de-ae68-29508adca440",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/40.2_FLUID_CHOKE_MIMIC.mp4?alt=media&token=488fb3b3-8fe6-4f38-bab1-bd159ea0425a",
//                                duration: "1 minute, 26 seconds")
//
//        let video41_0 = VideoModel(videoTitle: "KY Classroom - JOKE",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/41.0_THUMB.png?alt=media&token=ca31a95a-3ea3-4541-b0ee-76540ea76642",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/41.0_CLASSROOM_FLUID_JOKE.mp4?alt=media&token=5177caf1-9a75-4798-ac97-2f4b1a9f8c19",
//                                duration: "0 minutes, 20 seconds")
//
//        let video41_1 = VideoModel(videoTitle: "Listen - JOKE",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/41.1_THUMB.png?alt=media&token=c03497fe-81a2-49be-8cf3-81b58c03192a",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/41.1_FLUID_JOKE_LISTEN.mp4?alt=media&token=9574dcf9-b730-4e8f-815a-3ed4e83f5be8",
//                                duration: "1 minute, 33 seconds")
//
//        let video41_2 = VideoModel(videoTitle: "Mimic - JOKE",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/41.2_THUMB.png?alt=media&token=a93c4d01-bbdb-4d17-b29f-1010bb70a580",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/41.2_FLUID_JOKE_MIMIC.mp4?alt=media&token=8b652453-ee6f-47d3-967e-4b6e66e9f869",
//                                duration: "1 minute, 32 seconds")
//
//        let video42_0 = VideoModel(videoTitle: "KY Classroom - YOU",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/42.0_THUMB.png?alt=media&token=2b4799b9-5e61-4ca4-a748-a87d94fe5dcb",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/42.0_CLASSROOM_FLUID_YOKE.mp4?alt=media&token=34b04069-7a18-407b-8820-03dfd6877f2b",
//                                duration: "0 minutes, 40 seconds")
//
//        let video42_1 = VideoModel(videoTitle: "Listen - YOU",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/42.1_THUMB.png?alt=media&token=43b88b5d-d3e8-4f17-9b54-74a374c02b4b",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/42.1_FLUID_YOKE_LISTEN.mp4?alt=media&token=65be0744-6e07-4b93-958e-d8518ac85674",
//                                duration: "1 minute, 39 seconds")
//
//        let video42_2 = VideoModel(videoTitle: "Mimic - YOU",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/42.2_THUMB.png?alt=media&token=32f9b977-6e5f-4411-819d-a26827fdb0c0",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/42.2_FLUID_YOKE_MIMIC.mp4?alt=media&token=a06463ce-882e-4ad9-9282-88104c4feed2",
//                                duration: "1 minute, 38 seconds")
//
//        let video43_0 = VideoModel(videoTitle: "KY Classroom - Silents",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/43.0_THUMB.png?alt=media&token=4a6e87a4-9d7b-4ac8-94ab-aebd60b480d8",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/43.0_CLASSROOM_SILENT.mp4?alt=media&token=8a6924bf-5251-4e31-9665-45ccbe3736d0",
//                                duration: "0 minutes, 32 seconds")
//
//        let video43_1 = VideoModel(videoTitle: "Listen - Silents",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/43.1_THUMB.png?alt=media&token=567a075d-efb7-4c49-94e3-011b83aa35a4",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/43.1_SILENT_LISTEN.mp4?alt=media&token=775bc249-5afa-405b-b779-e7868d730a45",
//                                duration: "0 minutes, 41 seconds")
//
//        let video43_2 = VideoModel(videoTitle: "Mimic - Silents",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/43.2_THUMB.png?alt=media&token=a5dba091-c36f-4ca0-b048-cb998237512f",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/43.2_SILENT_MIMIC.mp4?alt=media&token=1ff7b955-5834-411b-a879-f896ea7c1b8b",
//                                duration: "0 minutes, 40 seconds")
//
//        let video44_0 = VideoModel(videoTitle: "KY Classroom - Wildcards",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/44.0_THUMB.png?alt=media&token=97abb1a9-37f9-46e2-8bd5-85c986f13e34",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/44.0_CLASSROOM_WILDCARDS.mp4?alt=media&token=f2ce4cce-ddad-4b2a-be9d-801e54b62140",
//                                duration: "1 minutes, 21 seconds")
//
//        let video45_0 = VideoModel(videoTitle: "KY Classroom - AN & AM",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/45.0_THUMB.png?alt=media&token=ff23670b-c8f3-473d-b567-11ae46ba1ab7",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/45.0_BONUS_AN_AM.mp4?alt=media&token=802da2c7-a34c-41c7-9881-d2c3a901c29e",
//                                duration: "1 minute, 32 seconds")
//
//        let video45_1 = VideoModel(videoTitle: "KY Classroom - L & R",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/45.1_THUMB.png?alt=media&token=92fde0eb-8f0b-441b-a5f7-dc7de6afb0b0",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/45.1_BONUS_L%26R.mp4?alt=media&token=422e3fdc-3fea-469d-9a0e-f0233d52d3de",
//                                duration: "1 minute, 13 seconds")
//
//        let video45_2 = VideoModel(videoTitle: "KY Classroom - R Colored Vowels",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/45.2_THUMB.png?alt=media&token=eebf0fb9-bb92-451c-b9f5-7eb21567b08d",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/45.2_BONUS_R_COLORED_VOWELS.mp4?alt=media&token=8a7388d3-d606-461f-a1e0-a304fee63467",
//                                duration: "2 minutes, 0 seconds")
//
//        let video46_0 = VideoModel(videoTitle: "Summary",
//                                videoThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/46.0_THUMB.png?alt=media&token=c99b6a44-d7b6-4eb4-9970-1cdb4c8ea1c7",
//                                videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/46.0_OUTRO.mp4?alt=media&token=f438cb4b-2a7d-4e5d-9a9f-536d33038ffc",
//                                duration: "0 minutes, 56 seconds")
//
//        let videos = [video1_0, video1_1, video1_2, video1_3, video1_4, video2_0, video3_0, video3_1, video3_2,
//                      video4_0, video4_1, video4_2, video5_0, video5_1, video5_2, video6_0, video6_1, video6_2,
//                      video7_0, video7_1, video7_2, video8_0, video8_1, video8_2, video9_0, video9_1, video9_2,
//                      video10_0, video10_1, video10_2, video11_0, video11_1, video11_2, video12_0, video12_1,
//                      video12_2, video13_0, video13_1, video13_2, video14_0, video14_1, video14_2, video15_0,
//                      video15_1, video15_2, video16_0, video17_0, video17_1, video17_2, video18_0, video18_1,
//                      video18_2, video18_3, video18_4, video19_0, video19_1, video19_2, video19_3, video19_4,
//                      video20_0, video20_1, video20_2, video20_3, video20_4, video21_0, video21_1, video21_2,
//                      video22_0, video22_1, video22_2, video23_0, video23_1, video23_2, video24_0, video24_1,
//                      video24_2, video24_3, video24_4, video25_0, video25_1, video25_2, video26_0, video26_1,
//                      video26_2, video26_3, video26_4, video27_0, video27_1, video27_2, video28_0, video28_1,
//                      video28_2, video29_0, video29_1, video29_2, video29_3, video29_4, video30_0, video30_1,
//                      video30_2, video30_3, video30_4, video31_0, video31_1, video31_2, video31_3, video31_4,
//                      video32_0, video32_1, video32_2, video32_3, video32_4, video33_0, video33_1, video33_2,
//                      video34_0, video34_1, video34_2, video35_0, video35_1, video35_2, video35_3, video35_4,
//                      video36_0, video36_1, video36_2, video36_3, video36_4, video37_0, video38_0, video38_1,
//                      video38_2, video39_0, video39_1, video39_2, video40_0, video40_1, video40_2, video41_0,
//                      video41_1, video41_2, video42_0, video42_1, video42_2, video43_0, video43_1, video43_2,
//                      video44_0, video45_0, video45_1, video45_2, video46_0
//        ]
//
//        let lesson1 = LessonModel(lessonTitle: "EHD  Master Course",
//                                  lessonThumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/MasterCourseThumbnail.png?alt=media&token=99ade6c0-597d-4d8b-bdca-2b17f4a97819",
//                                  videos: videos)
//
//        FirebaseManager.shared.updateLesson(lesson: lesson1)
//    }
//}
