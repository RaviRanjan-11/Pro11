//
//  KYCScreen.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import SwiftUI
import UIKit

struct KYCVerificationScreen: View {
    @State private var documentImage: Image? = nil
    @State private var documentURL: URL? = nil
    @State private var showingImagePicker = false
    @State private var showingDocumentPicker = false
    @State private var isDocumentUploaded = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationBar(title: "KYC Verification")
                
                // Upload Section
                VStack(spacing: 20) {
                    Text("Please upload your KYC document")
                        .font(.headline)
                        .padding()
                    
                    if let documentImage = documentImage {
                        documentImage
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(8)
                    } else {
                        Text("No document selected")
                            .foregroundColor(.gray)
                            .padding()
                    }

                    // Buttons for Uploading Document
                    HStack {
                        Button(action: {
                            showingImagePicker.toggle()
                        }) {
                            Text("Upload Photo")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)

                        Button(action: {
                            showingDocumentPicker.toggle()
                        }) {
                            Text("Upload Document")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Submit Button
                    Button(action: {
                        // Perform KYC verification logic
                        isDocumentUploaded = documentImage != nil || documentURL != nil
                    }) {
                        Text("Submit KYC")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isDocumentUploaded ? Color.red : Color.gray)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    .disabled(!isDocumentUploaded)

                    Spacer()
                }
                .padding()

                // Image Picker for Photo Upload
                ImagePicker(isPresented: $showingImagePicker, image: $documentImage)
                
                // Document Picker for File Upload
                DocumentPicker(isPresented: $showingDocumentPicker, documentURL: $documentURL)
            }
            .navigationBarTitle("KYC Verification", displayMode: .inline)
        }
    }
}

// Image Picker - UIKit wrapper for image picking
struct ImagePicker: View {
    @Binding var isPresented: Bool
    @Binding var image: Image?

    var body: some View {
        ImagePickerController(isPresented: $isPresented, image: $image)
    }
}

// ImagePickerController is a UIKit wrapper
struct ImagePickerController: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var image: Image?

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var isPresented: Bool
        @Binding var image: Image?

        init(isPresented: Binding<Bool>, image: Binding<Image?>) {
            _isPresented = isPresented
            _image = image
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isPresented = false
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                image = Image(uiImage: selectedImage)
            }
            isPresented = false
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isPresented: $isPresented, image: $image)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = false
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

// Document Picker - UIKit wrapper for document picking
struct DocumentPicker: View {
    @Binding var isPresented: Bool
    @Binding var documentURL: URL?

    var body: some View {
        DocumentPickerController(isPresented: $isPresented, documentURL: $documentURL)
    }
}

// DocumentPickerController is a UIKit wrapper
struct DocumentPickerController: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var documentURL: URL?

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        @Binding var isPresented: Bool
        @Binding var documentURL: URL?

        init(isPresented: Binding<Bool>, documentURL: Binding<URL?>) {
            _isPresented = isPresented
            _documentURL = documentURL
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            if let selectedURL = urls.first {
                documentURL = selectedURL
            }
            isPresented = false
        }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            isPresented = false
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isPresented: $isPresented, documentURL: $documentURL)
    }

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [.pdf, .image, .plainText])
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
}

struct KYCVerificationScreen_Previews: PreviewProvider {
    static var previews: some View {
        KYCVerificationScreen()
    }
}
