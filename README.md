# ObjectMapper-RealmSwift

![Cocoapods](https://img.shields.io/badge/pod-available-brightgreen.svg?style=flat)
![Platform](https://img.shields.io/badge/platform-ios-blue.svg?style=flat)
![Version](https://img.shields.io/badge/version-0.1.0-blue.svg?style=flat)
![Swift version](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)
![License](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)
 
## Installation

ObjectMapper-RealmSwift is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ObjectMapper-RealmSwift'
```

## Example

Here is the sample code how to use it. Assume you have installed RealmSwift and ObjectMapper. Next step to create realm object. 

### Json you get
 ```json
 {
    "id": 12,
    "email": "hackall@gmail.com",
    "phone": "+79996663213",
    "firstName": "Mark",
    "lastName": null,
    "privateInfo": {
      "city": {
          "id": 1,
          "value": "Vice City"
        },
      "emails": [
        {
          "id": 22,
          "value": "gdeeqq@hrrrd.dj"
        }
      ],
      "country": {
        "id": 1,
          "value": "Calefornication"
        },
      "birthday": 1042070400
    },
    "socialMedia": {
    "messengers": [
      {
        "name": "one",
        "userId": "+79997776666",
        "userName": "+79998887777"
      },
      {
        "name": "two",
        "userId": "3456622",
        "userName": "megaCoolGuy",
        "userPhone": "+79995663322"
      }
    ],
    "socialNetworks": [
      {
        "name": "first",
        "userId": "31515121221",
        "userName": "Yellow Duck"
      },
      {
        "name": "second",
        "userId": "32532523532",
        "userName": "Luckky"
      }
    ],
   "timeOfPhotoUpload": 1485442694,
   "avatarUrl": "http://any_link.com/hot_girl.png",
 }
```

### Here is the model
According to https://realm.io/docs/swift/latest/#cheatsheet don't forget `dynamic` and `let` where it is nessesary.
```swift
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

class UserProfile: Object, Mappable {
  let id = RealmOptional<Int>()
  dynamic var email: String? = nil
  dynamic var phone: String = ""
  dynamic var firstName: String? = nil
  dynamic var lastName: String? = nil
  dynamic var privateInfo: PrivateInfo?
  let socialMedia = List<Messenger>()
  let socialNetworks = List<SocialNetwork>()
  let timeOfPhotoUpload = RealmOptional<Double>()
  dynamic var avatarUrl: String? = nil
  
  required convenience init?(map: Map) {
    if
        !map["id"].isKeyPresent ||
        !map["phone"].isKeyPresent
    {
      print("Can't parse profile info")
      return nil
    }
    self.init()
  }
  
  override class func primaryKey() -> String? {
    return "id"
  }
  
  func mapping(map: Map) {
    id                <- map["id"]
    email             <- map["email"]
    phone             <- map["phone"]
    firstName         <- map["firstName"]
    lastName          <- map["lastName"]
    privateInfo       <- map["privateInfo"]
    socialMedia       <- map["socialMedia"]
    socialNetworks    <- map["socialNetworks"]
    timeOfPhotoUpload <- (map["privateInfo"], DateTransform())
    avatarUrl         <- map["avatarUrl"]
  }
}
```

and nested classes: 

```swift
class Messenger: Object, Mappable {
  dynamic var name: String? = ""
  dynamic var userID: String? = ""
  dynamic var userName: String? = ""
  
  required convenience init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    name            <- map["name"]
    userID          <- map["userId"]
    userName        <- map["userName"]
  }
}
```
```swift
class PrivateInfo: Object, Mappable {
  dynamic var city: Item?
  let emails = List<Item>()
  dynamic var country: Item?
  var birthday = RealmOptional<Double>()
  
  required convenience init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    city              <- map["city"]
    emails            <- map["emails"]
    country           <- map["country"]
    birthday          <- (map["birthday"], DateTransform())
  }
}
```

## Took from

https://gist.github.com/danilValeev/ef29630b61eed510ca135034c444a98a

## License

ObjectMapper_RealmSwift is available under the MIT license. See the LICENSE file for more info.
