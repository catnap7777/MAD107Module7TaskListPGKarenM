import Cocoa

var str = "Hello, playground"

var kamTaskList: [(task: String, priority: Int)] = [(task: "Do laundry", priority: 7),
                                                    (task: "Walk Dog", priority: 1),
                                                    (task: "Text children", priority: 1),
                                                    (task: "Feed hamsters and clean cages", priority: 1),
                                                    (task: "Make dinner", priority: 2),
                                                    (task: "Do iOS homework", priority: 2),
                                                    (task: "Work on Android MCH", priority: 3),
                                                    (task: "Clean bathrooms", priority: 9),
                                                    (task: "Work out", priority: 2),
                                                    (task: "Load/unload the dishwasher", priority: 5),
                                                    (task: "Work on Mom's taxes", priority: 6)
]


//.. closure
var sortClosure1 = { ([(task: String, priority: Int)]) -> ([(task: String, priority: Int)]) in
    
    let kamArray = kamTaskList.sorted(by: {$0.priority < $1.priority })
    
    
    //.. EXAMPLE of how to sort on multiple tuple values
    var myArray = [ (1,1,"cat"), (1,2,"dog"), (3,4,"mouse99"), (3,4,"mouse1"), (3,4,"mouse2"), (3,1,"elephant"), (2,1,"hamster"), (2,2,"guinea pig")]
    //myArray.sort{ $0.1 != $1.1 ? $0.1 > $1.1 : $0.0 < $1.0 } //.. use ternary operator -> (boolValue ? valueA : valueB) -> (boolValue ? true : false)
    
    myArray.sort{ $0.1 != $1.1 ? $0.1 < $1.1 : $0.2 < $1.2 }
    print(myArray)
    print("\n")
    //[(1, 1, "cat"), (3, 1, "elephant"), (2, 1, "hamster"), (1, 2, "dog"), (2, 2, "guinea pig"), (3, 4, "mouse1"), (3, 4, "mouse2"), (3, 4, "mouse99")]
    
    
    return kamArray
    
    
//.. original from stackoverflow
//    var myArray = [ (1,1), (1,2), (3,4), (3,1), (2,1), (2,2)]
//    //myArray.sort{ $0.1 != $1.1 ? $0.1 > $1.1 : $0.0 < $1.0 }
//    myArray.sort{ $0.1 != $1.1 ? $0.1 < $1.1 : $0.0 < $1.0 }
//    print(myArray)
//    print("\n")
//    // [(1, 2), (2, 2), (1, 1), (2, 1)]

//.. another example from stackoverflow... but this one doesn't work
//
//    let sortedContacts = contacts.sort {
//        if $0.lastName != $1.lastName { // first, compare by last names
//            return $0.lastName < $1.lastName
//        }
//            /*  last names are the same, break ties by foo
//             else if $0.foo != $1.foo {
//             return $0.foo < $1.foo
//             }
//             ... repeat for all other fields in the sorting
//             */
//        else { // All other fields are tied, break ties by last name
//            return $0.firstName < $1.firstName
//        }
//    }
    
  

}

func tasksForToday(maxTasks: Int, sortClosure: ([(task: String, priority: Int)]) -> ([(task: String, priority: Int)])) {
    
    var count = 1
    let doneArray = sortClosure(kamTaskList)
    
    var maxNbr = maxTasks
    
    if maxNbr <= doneArray.count {
        //
    } else {
        maxNbr = doneArray.count
    }
    
    print("   Number of tasks printed: \(maxNbr) out of \(doneArray.count)")    //"\(maxTasks)")
    print("\n Priority             Task      ")
    print(" --------       ----------------")

    for item in doneArray where (count <= maxNbr && maxNbr <= doneArray.count) {
        print("    \(item.priority)    \t\t\(item.task)")
        count += 1
    }
}

tasksForToday(maxTasks: 12, sortClosure: sortClosure1)


