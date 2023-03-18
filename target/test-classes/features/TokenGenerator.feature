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

##  another way that you can do here to read a file.
##  So now let's suppose instead of reading this value from here what you can do you can read this from 
##  the like from the JSON.And then just add that one here 
##  you can define like a JSON and then just read it from from from here
  
