//
//  ScanQRViewController.swift
//  ioi
//
//  Created by Shlok Kapoor on 04/07/18.
//  Copyright © 2018 Shlok. All rights reserved.
//

import UIKit
import AVFoundation
import LGButton
import Material

class ScanQRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    
    @IBOutlet var cameraView: UIView!
    @IBOutlet var recentsView: UIView!
    @IBOutlet var recentsViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var recentPhotographerImage: [UIImageView]!
    @IBOutlet var recentPhotographerName: [UILabel]!
    @IBOutlet var continueButton: LGButton!
    @IBOutlet var mobileNumberTextField: TextField!
    @IBOutlet var continueBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        continueButton.isHidden = true
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func doneEnteringMobileNumber(_ sender: Any) {
        if mobileNumberTextField.text != "" {
            continueButton.isHidden = false
        } else {
            continueButton.isHidden = true
        }
    }
    
    @IBAction func mobileEditingBegan(_ sender: Any) {
        continueButton.isHidden = false
    }
    
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        scanSuccessful()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupCameraView()
        setupQRScanner()
        setRecentPhotographers()
        setNotifications()
    }
    
    func setRecentPhotographers() {
        for index in 0...4 {
            recentPhotographerImage[index].randomUserImage()
            recentPhotographerName[index].text = Lorem.firstName
        }
    }
    
    func scanSuccessful() {
        self.performSegue(withIdentifier: "scanSuccessful", sender: nil)
    }
}

extension ScanQRViewController {
    func setupCameraView() {
        // Get the back-facing camera for capturing videos
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera], mediaType: AVMediaType.video, position: .back)
        
        guard let captureDevice = deviceDiscoverySession.devices.first else {
            print("Failed to get the camera device")
            return
        }
        
        do {
            captureSession = AVCaptureSession()
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Set the input device on the capture session.
            captureSession!.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession!.addOutput(captureMetadataOutput)
            
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            
            videoPreviewLayer?.frame = cameraView.bounds
            
            cameraView.backgroundColor = UIColor.black
            cameraView.layer.addSublayer(videoPreviewLayer!)
            cameraView.bringSubview(toFront: mobileNumberTextField)
            cameraView.bringSubview(toFront: continueButton)
            // Start video capture.
            captureSession!.startRunning()
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
    }
    
    func setupQRScanner() {
        // Initialize QR Code Frame to highlight the QR code
        qrCodeFrameView = UIView()
        
        if let qrCodeFrameView = qrCodeFrameView {
            qrCodeFrameView.layer.borderColor = Colors.colors.orange.cgColor
            qrCodeFrameView.layer.borderWidth = 2
            qrCodeFrameView.layer.cornerRadius = 5
            cameraView.addSubview(qrCodeFrameView)
            cameraView.bringSubview(toFront: qrCodeFrameView)
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            
            
            if let result = metadataObj.stringValue {
                print(result)
                captureSession!.stopRunning()
                scanSuccessful()
            }
        }
    }
}


//code to move the coninue button
extension ScanQRViewController {
    
    func setNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    //MARK: - getKayboardHeight
    @objc func keyboardWillShow(notification: Notification) {
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        // do whatever you want with this keyboard height
        UIView.animate(withDuration: 0.5) {
            self.continueBottom.constant = keyboardHeight - 85
        }
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        // keyboard is dismissed/hidden from the screen
       continueBottom.constant = 0
    }
}
