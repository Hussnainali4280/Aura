//
//  SpeechToTextController.swift
//  Aura
//
//  Created by Max Dolensky on 10/2/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import UIKit
import Speech

protocol SpeechToTextDelegate {
    
    func updateText(with transcription: String, shouldPerformSearch: Bool)
    
}

class SpeechToTextController: UIViewController {
    
    // MARK: - Variables
    var speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))!
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    var delegate: SpeechToTextDelegate?
    var pulseLayers = [CAShapeLayer]()

    // MARK: - Views
    var micButton: UIButton = {
        
        let button = UIButton()
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "mic.fill"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "mic.fill").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        button.backgroundColor = K.DesignColors.primary
        button.tintColor = .white
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        button.roundCorners(cornerRadius: 40)
        
        button.addTarget(self, action: #selector(micPressed), for: .touchUpInside)
        
        return button
        
    }()
    
    var micButtonBackground: UIView = {
       
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.widthAnchor.constraint(equalToConstant: 80).isActive = true
        v.heightAnchor.constraint(equalToConstant: 80).isActive = true
        v.roundCorners(cornerRadius: 40)
        return v
        
    }()
        
    var cancelButton: UIButton = {
        
        let button = UIButton()
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "multiply"), for: .normal)
        } else {
            button.setImage(#imageLiteral(resourceName: "multiply").withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .white
        button.tintColor = .black
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        return button
        
    }()
    
    var transcriptionOutputLabel: UILabel = {
        
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        l.numberOfLines = 0
        return l
        
    }()
        
    // MARK: - INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        micButton.isEnabled = false
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        micButtonBackground.setShadow(color: .black, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 3, cornerRadius: 40)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        speechRecognizer.delegate = self
        
        // Asynchronously make the authorization request.
        SFSpeechRecognizer.requestAuthorization { authStatus in

            // Divert to the app's main thread so that the UI
            // can be updated.
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.micButton.isEnabled = true
                    self.micButton.backgroundColor = K.DesignColors.primary
                    do {
                        try self.startRecording()
                    } catch {
                        print("Recording not available")
                    }
                case .denied:
                    self.micButton.isEnabled = false
                    self.micButton.backgroundColor = .gray
                    self.transcriptionOutputLabel.text = NSLocalizedString("Must allow access to speech recognition in settings", comment: "")
                case .restricted:
                    self.micButton.isEnabled = false
                    self.micButton.backgroundColor = .gray
                    self.transcriptionOutputLabel.text = NSLocalizedString("Must allow access to speech recognition in settings", comment: "")
                case .notDetermined:
                    self.micButton.isEnabled = false
                    self.micButton.backgroundColor = .gray
                    self.transcriptionOutputLabel.text = NSLocalizedString("Must allow access to speech recognition in settings", comment: "")
                default:
                    self.micButton.isEnabled = false
                    self.micButton.backgroundColor = .gray
                    self.transcriptionOutputLabel.text = NSLocalizedString("Must allow access to speech recognition in settings", comment: "")
                }
            }
        }
    }
    
    // MARK: - Setup
    func setup() {
        
        view.addSubview(transcriptionOutputLabel)
        view.addSubview(micButtonBackground)
        view.addSubview(cancelButton)
        micButtonBackground.addSubview(micButton)
        
        view.backgroundColor = .white
        
        cancelButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                            bottom: nil,
                            leading: nil,
                            trailing: view.trailingAnchor,
                            height: 30,
                            width: 30,
                            padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: -20))
        
        transcriptionOutputLabel.anchor(top: cancelButton.bottomAnchor,
                                        bottom: nil,
                                        leading: view.leadingAnchor,
                                        trailing: view.trailingAnchor,
                                        height: nil,
                                        width: nil,
                                        padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: -30))
        
        micButton.anchor(top: micButtonBackground.topAnchor,
                         bottom: micButtonBackground.bottomAnchor,
                         leading: micButtonBackground.leadingAnchor,
                         trailing: micButtonBackground.trailingAnchor,
                         height: nil,
                         width: nil)
        
        micButton.translatesAutoresizingMaskIntoConstraints = false
        micButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        micButton.topAnchor.constraint(greaterThanOrEqualTo: transcriptionOutputLabel.bottomAnchor, constant: 10).isActive = true
        micButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        
        createPulses()
    }
    
    // MARK: - Speech To Text Functions
    private func startRecording() throws {
        
        // Cancel the previous task if it's running.
        recognitionTask?.cancel()
        self.recognitionTask = nil
        
        // Configure the audio session for the app.
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        let inputNode = audioEngine.inputNode

        // Create and configure the speech recognition request.
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create a SFSpeechAudioBufferRecognitionRequest object")
        }
        
        recognitionRequest.shouldReportPartialResults = true
        
        // Keep speech recognition data on device
        if #available(iOS 13, *) {
            recognitionRequest.requiresOnDeviceRecognition = false
        }
        
        // Create a recognition task for the speech recognition session.
        // Keep a reference to the task so that it can be canceled.
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
            var isFinal = false
            
            if let result = result {
                // Update the text view with the results.
                self.transcriptionOutputLabel.text = result.bestTranscription.formattedString
                isFinal = result.isFinal
                print("Text \(result.bestTranscription.formattedString)")
            }
            
            if error != nil || isFinal {
                // Stop recognizing speech if there is a problem.
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)

                self.recognitionRequest = nil
                self.recognitionTask = nil

                self.micButton.isEnabled = true
            }
        }

        // Configure the microphone input.
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        try audioEngine.start()
        
        // Let the user know to start talking.
        transcriptionOutputLabel.text = NSLocalizedString("Go ahead, I'm listening...", comment: "listening to your speech and creating text from what you say")
    }
    
    // MARK: - Selector Functions
    
    @objc func micPressed() {
        
        audioEngine.stop()
        recognitionRequest?.endAudio()
        micButton.isEnabled = false
        self.delegate?.updateText(with: transcriptionOutputLabel.text ?? "", shouldPerformSearch: true)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func cancelButtonPressed() {
        
        audioEngine.stop()
        recognitionRequest?.endAudio()
        micButton.isEnabled = false
        self.delegate?.updateText(with: transcriptionOutputLabel.text ?? "", shouldPerformSearch: false)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    // MARK: - Pulse Animation
    func createPulses() {
        for _ in 0...1 {
            let circularPath = UIBezierPath(arcCenter: .zero,
                                            radius: UIScreen.main.bounds.size.width/2.0,
                                            startAngle: 0,
                                            endAngle: 2 * .pi,
                                            clockwise: true)
            
            let pulseLayer = CAShapeLayer()
            pulseLayer.path = circularPath.cgPath
            pulseLayer.lineWidth = 2.0
            pulseLayer.fillColor = UIColor.clear.cgColor
            pulseLayer.lineCap = .round
            pulseLayer.position = CGPoint(x: 40, y: 40)
            micButtonBackground.layer.addSublayer(pulseLayer)
            pulseLayers.append(pulseLayer)
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.animatePulse(index: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.animatePulse(index: 1)
            }
        }
    }
    
    func animatePulse(index: Int) {
        
        pulseLayers[index].strokeColor = K.DesignColors.primary.cgColor

        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = 2.0
        scaleAnimation.fromValue = 0.0
        scaleAnimation.toValue = 0.9
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        scaleAnimation.repeatCount = .greatestFiniteMagnitude
        pulseLayers[index].add(scaleAnimation, forKey: "scale")
        
        let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacityAnimation.duration = 2.0
        opacityAnimation.fromValue = 0.9
        opacityAnimation.toValue = 0.0
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        opacityAnimation.repeatCount = .greatestFiniteMagnitude
        pulseLayers[index].add(opacityAnimation, forKey: "opacity")
        
    }
}

extension SpeechToTextController: SFSpeechRecognizerDelegate {
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        
        if available {
            micButton.isEnabled = true
            
        } else {
            micButton.isEnabled = false
        }
    }
}
