Feature: Tek Retail Service

  Background: 
    Given url retailURL
    * def generateToken = call read("TokenGenerator.feature")
    * def token = generateToken.response.accessToken
    * header x-access-token = token

  @AddAddress
  Scenario: post address for primary person
    * path "/address"
    * request
      """
      {
        "country": "United States",
        "fullName": "jamila",
        "phoneNumber": "6758789800",
        "street": "440 Qalai Gandana",
        "apartment": "103",
        "city": "Kabul",
        "state": "VA",
        "zipCode": "14201"
        }
      """
    * method post
    * print response
    * status 200

  @getAddress
  Scenario: get address of primary person
    * path "/address"
    * method get
    * status 200
    * print response[1].id
    #* print response.id = 5044
    * karate.write(response,'address.json')

  # we need to capture the value and store that ID so we can reuse it. so we have to store it.Ride this one into a Jason file and after that you can read it.
  # The only problem: That file will be righted in your target folder, and it's only available at that time of the belt.
  # So it means if you do, Maven clean or clean your belt That data will be lost. So it means you have to generate a new. You need to basically use another karate dot write method.
  @putAddress
  Scenario: update adress of primary person
    * def addressID = read('file:./target/address.json')
    * def id = addressID[1].id
    * path "/address/" + id
    * request
      """
      {
        "country": "United States",
        "fullName": "chamon",
        "phoneNumber": "7676767667",
        "street": "400 bestar",
        "apartment": "Home",
        "city": "Dewanakhana",
        "state": "VA",
        "zipCode": "42005"
      }
      """
    * method put
    * print response

  @deletAddress
  Scenario: delete address
    * def addressID = read('file:./target/address.json')
    * def id = addressID[1].id
    * path "/address/" + id
    * method delete
    * print response
