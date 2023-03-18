Feature: Tek Retail API Service

@generateToken
Scenario: Generate Token for application
Given url retailURL
* path "/auth/login"
* request {"email": "laila@gmail.com","password": "12345@Meyouwe"}
* method post
* print response.token
* print response.fullName
* status 200

  
  
