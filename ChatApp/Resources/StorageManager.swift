//
//  StorageManager.swift
//  ChatApp
//
//  Created by 최기훈 on 2022/02/20.
//

import Foundation
import FirebaseStorage

final class StorageManager {
    
    static let shared = StorageManager()
    
    private let storage = Storage.storage().reference()
    
    public typealias UploadPictureCompletion = (Result<String, Error>) -> Void
    
    
    public func uploadProfilePicture(with data: Data,
                                     fileName: String,
                                     completion: @escaping UploadPictureCompletion ) {
        
        storage.child("images/\(fileName)").putData(data, metadata: nil, completion: { metadata, error in
                                                   
            guard error == nil else {
                completion(.failure(StorageErrors.failedToUpload))
            return
        }
            self.storage.child("images/\(fileName)").downloadURL { url, error in
                guard let url = url else {
                    completion(.failure(StorageErrors.failedToGetDownloadUrl))
                    return
                }
            }
        })
    }
    
    public enum StorageErrors: Error {
        case failedToUpload
        case failedToGetDownloadUrl
    }
}
