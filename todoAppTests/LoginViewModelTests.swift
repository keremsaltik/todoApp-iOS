//
//  todoAppTests.swift
//  todoAppTests
//
//  Created by Kerem Saltık on 17.09.2025.
//

import Testing
@testable import todoApp

struct LoginViewModelTests {

    let viewModel = LoginViewModel()
    
    @Test func login_withValidCredentialsshouldSucceed()  throws {
        // Given
        let email = "keremsaltikbusiness@gmail.com"
        let password = "1234"
        
        // When
        let user = viewModel.loginUser(mail: email, password: password)
        
        
        // Then
        #expect(user != nil, "User should not be nil.")
        
        #expect(user?.mail == email, "Mail should be right.")
        
    }

    @Test
        func login_withInvalidCredentials_shouldFail() throws {
            // Given (Hazırlık)
            let email = "wrong@email.com"
            let password = "wrongpassword"
            
            // When (Eylem)
            let user = viewModel.loginUser(mail: email, password: password)
            
            // Then (Doğrulama)
            // XCTAssertNil yerine #expect kullanıyoruz.
            #expect(user == nil, "Kullanıcı, geçersiz bilgilerle giriş yaptığında nil olmalıdır.")
        }
}
