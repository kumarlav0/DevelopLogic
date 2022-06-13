import UIKit
import Foundation
import PlaygroundSupport

enum Gender {
    case male
    case female
    case other
}

struct People {
    var name: String
    var age: Int
    var contact: String?
    var gender: Gender

}

struct User {
    var isSlected: Bool
    var user: People
    var objId: String
}

let people1 = People(name: "Jenny", age: 24, contact: nil, gender: .female)
let people2 = People(name: "Ronaldo", age: 37, contact: "9977454578", gender: .male)
let people3 = People(name: "Devid", age: 16, contact: "david@gmail.com", gender: .male)
let people4 = People(name: "Jahanvi", age: 15, contact: nil, gender: .female)

let people5 = People(name: "Jahanvi", age: 23, contact: "jahanvi23@gmail.com", gender: .female)
let people6 = People(name: "Rahul", age: 20, contact: nil, gender: .male)
let people7 = People(name: "Farukh Malik", age: 56, contact: "8866434355", gender: .male)
let people8 = People(name: "Sanya Ahuja", age: 62, contact: nil, gender: .female)

var users = [User]()

users.append(User(isSlected: false, user: people1, objId: UUID().uuidString))
users.append(User(isSlected: false, user: people2, objId: UUID().uuidString))
users.append(User(isSlected: true, user: people3, objId: UUID().uuidString))
users.append(User(isSlected: false, user: people4, objId: UUID().uuidString))
users.append(User(isSlected: true, user: people5, objId: UUID().uuidString))
users.append(User(isSlected: true, user: people6, objId: UUID().uuidString))
users.append(User(isSlected: true, user: people7, objId: UUID().uuidString))
users.append(User(isSlected: false, user: people8, objId: UUID().uuidString))

// Write your logic and concept here

/**
1. Get all the `selected` `users` from the array
 */

let allSelectedUsers = users.filter{ $0.isSlected }
//print("allSelectedUsers", allSelectedUsers)


/**
2. Get all the `selected` users `Name` from the array
 */

let allSelectedUsersName = users.filter{ $0.isSlected }.map { $0.user.name }
//print("allSelectedUsersName", allSelectedUsersName)

/**
3. Get all the `selected` users `Name` from the array
 They are `Female`
 */

let allSelectedFemaleUsersName = users.filter{ $0.isSlected }.filter{ $0.user.gender == .female}.map { $0.user.name }
//print("allSelectedFemaleUsersName", allSelectedFemaleUsersName)

/**
4. Get all the `User`  from Users array
 There age is  `18 or 18+`
 */

let all_18_plus_users = users.filter{ $0.user.age >= 18 }
//print("all_18_plus_users", all_18_plus_users)

/**
4. Get all the `User` `name`  from Users array
 There age is  `18 or 18+`
 */

let all_18_plus_users_name = users.filter{ $0.user.age >= 18 }.map { $0.user.name }
//print("all_18_plus_users_name", all_18_plus_users_name)

/**
5. Get all the `User` `name`  from Users array
 There age is  `18 or 18+` and they are `Male`
 */

let all_18_plus_male_users_name = users.filter { $0.user.age >= 18 }.filter { $0.user.gender == .male }.map { $0.user.name }
//print("all_18_plus_male_users_name", all_18_plus_male_users_name)

/**
6. Get all the `User` `contact`  from Users array
 As you know contact is optional so, Array must contain `Nil` values
 */

let allContacts = users.map { $0.user.contact }
//print("allContacts", allContacts)

/**
7. Get all the `User` `contact`  from Users array
 As you know contact is optional so, Array must not contain `Nil` values
 */

let allContact = users.compactMap { $0.user.contact }
//print("allContact", allContact)

/**
8. Get all the `User` `contact`  from Users array
 As you know contact is optional so, Array must not contain `Nil` values
 and `Contact` must be an `email` type.
 Condition for a string to be an email is must contain `@`.
 */

let allEmailContact = users.compactMap { $0.user.contact }.filter { $0.contains("@")}
//print("allEmailContact", allEmailContact)

/**
 9. Get all the `User`  from Users array, whose `name` is `Jahanvi`
 */

let all_Jahanvi = users.filter { $0.user.name == "Jahanvi" }
//print(all_Jahanvi)

/**`
 10. Get  the `Index`  from Users array, in which index the email  jahanvi23@gmail.com  exist.
 We are assuming that email is unique entity for all the user.
 */

let index = users.firstIndex(where: { $0.user.contact == "jahanvi23@gmail.com" })
//print(index as Any)

/**
 11. Use `firstIndex` ,  `lastIndex`,  `first`  and `last`

 `firstIndex` :
 `lastIndex` :
 `first` :
 `last` :
 */

let firstIndex = users.firstIndex(where: { $0.isSlected })
//print(firstIndex as Any)

let lastIndex = users.lastIndex(where: { $0.isSlected })
//print(lastIndex as Any)

let firstObj = users.first(where: { $0.user.name == "Jahanvi" })
//print(firstObj as Any)
let lastObj = users.last(where: { $0.user.name == "Jahanvi" })
//print(lastObj as Any)

/**
12. `sort` all the users array data in the fashion of increasing order of `age`.
 */

let sortedUsers = users.sorted { user1, user2 in
    return user1.user.age < user2.user.age
}
//print(sortedUsers.map{ $0.user.age})


/**
13. get all the `user` from `users` array. whose `age` is `greater then 20`, `gender` is `Male`, and the `user` have some `contact` details.
 */

let allMaleWhoseAgeIsGreaterThen20AndHavingSomeContact = users.filter{ $0.user.age > 20 }.filter{ $0.user.gender == .male }.filter{ $0.user.contact != nil }
print(allMaleWhoseAgeIsGreaterThen20AndHavingSomeContact)

let allMaleWhoseAgeIsGreaterThen20AndHavingSomeContact_2 = users.filter{ $0.user.age > 20 && $0.user.gender == .male && $0.user.contact != nil }
print(allMaleWhoseAgeIsGreaterThen20AndHavingSomeContact_2)

/**
 14. `Remove` all the `user` from users array whose `age` is not `18 or 18+`
 */

//print(users.count)
users.removeAll(where: { $0.user.age <= 18 })
//print(users.count)


/**
We used `map`, `compactMap`,  `Filter`,  `contains`, `firstIndex`, `lastIndex`, `removeAll`
 */


/**
 Seprate a array of string from a comma seprated string.
 */

let alphabates = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"

let arrayOfAlphabtes = alphabates.components(separatedBy: ",")
print(arrayOfAlphabtes)
print(arrayOfAlphabtes.count)

//===================================

struct User {
    var userName: String
    var userAge: Int
}

let user = User(userName: "Shelly", userAge: 26)

print(user.userName)
let mirror = Mirror(reflecting: user)
print(mirror)
print(mirror.children)

for child in mirror.children {
    print(child.label ?? " ", ": ", child.value)
}

func nextStep(age: Int, completion: (_ is18Plus: Bool)-> Void ) {
    if age > 18 {
        print("18+ Young Buddy ☑️")
        print("Lets go for a date 👫")
        completion(true)
    } else {
        print("Not an adult....❌")
        completion(false)
    }
}

func completionWalaMethod(comletion: (_ age: Int)-> Void) {
    print("A")
    comletion(34)
    print("E")
}

completionWalaMethod { age in
    print("B")
    nextStep(age: age) { is18Plus in
        print("C : ", is18Plus)
    }
    print("D")
}

// OUTPUT 

/*

userName :  Shelly
userAge :  26
A
B
18+ Young Buddy ☑️
C :  true
D
E

*/
