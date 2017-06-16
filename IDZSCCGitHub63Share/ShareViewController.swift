//
//  ShareViewController.swift
//  IDZSCCGitHub63Share
//
//  Created by idz on 6/16/17.
//  Copyright © 2017 iOS Developer Zone. All rights reserved.
//

import UIKit
import Social
import IDZSwiftCommonCrypto

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Use something from IDZSwiftCommonCrypto just in case the optimizer is not pulling it in
        let md = Digest(algorithm: .md5).update(string: "My hovercraft is full of eels.")?.final()
        NSLog("Content is valid \(String(describing:md))")
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
        
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
