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

Here is the sample code how to use it:  
Assume you have installed RealmSwift and ObjectMapper.  
Next step to create realm object. 

### Json you get
/**
 For e.g.
 ```json
 {
    "id": 12,
    "email": "volsterm@gmail.com",
    "phone": "+79133736950",
    "firstName": "Mark",
    "lastName": null,
    "privateInfo": {
        "city": {
          "id": 1,
          "value": "Krasnodar"
        },
      "emails": [
        {
          "id": 22,
          "value": "gd@hd.dj"
        }
      ],
      "country": {
        "id": 1,
          "value": "Russia"
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
    ]
   "timeOfPhotoUpload": 1485442694,
   "avatarUrl": "http://any_link.com/hot_girl.png",
 }
 */
```



import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

class UserProfile: Object, Mappable {
  let id = RealmOptional<Int>()
  dynamic var email: String? = nil
  dynamic var phone: String = ""
  dynamic var status: String? = nil
  dynamic var lastName: String? = nil
  dynamic var olNumber: String = ""
  dynamic var firstName: String? = nil
  dynamic var privateInfo: PrivateInfo?
  let socialMedia = List<Messenger>()
  let socialNetworks = List<SocialNetwork>()
  let timeOfPhotoUpload = RealmOptional<Double>()
  dynamic var avatarUrl: String? = nil
  dynamic var olNumberType: String? = nil
  
  required convenience init?(map: Map) {
    if
        !map["id"].isKeyPresent ||
        !map["phone"].isKeyPresent ||
        !map["olNumber"].isKeyPresent
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
    status            <- map["status"]
    lastName          <- map["lastName"]
    olNumber          <- map["olNumber"]
    firstName         <- map["firstName"]
    privateInfo       <- map["privateInfo"]
    socialMedia       <- map["socialMedia"]
    socialNetworks    <- map["socialNetworks"]
    timeOfPhotoUpload <- map["privateInfo"]
    avatarUrl         <- map["avatarUrl"]
    olNumberType      <- map["olNumberType"]
  }
}


## Took from

https://gist.github.com/danilValeev/ef29630b61eed510ca135034c444a98a

## License

ObjectMapper_RealmSwift is available under the MIT license. See the LICENSE file for more info.
