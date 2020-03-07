import Cocoa

var str = "Hello, playground"

//.. This program takes in an array of tuples and prints out a list of tasks based on how many the user wants to see ("maxTasks" input parm) and sorts
//..   the list by priority and then by task name
//.. NOTE: Any commented out code is left on purpose for future reference/explanation so that I "understand" better

typealias myTupleArray = [(task: String, priority: Int)] //..array of tuples

//var kamTaskList: [(task: String, priority: Int)] = [(task: "Do laundry", priority: 7),
var kamTaskList: myTupleArray = [
                                (task: "Do laundry", priority: 7),
                                (task: "Walk Dog", priority: 1),
                                (task: "Text children", priority: 1),
                                (task: "Feed hamsters and clean cages", priority: 1),
                                (task: "Make dinner", priority: 2),
                                (task: "Do iOS homework", priority: 2),
                                (task: "Work on Android MCH", priority: 3),
                                (task: "Clean bathrooms", priority: 9),
                                (task: "Work out", priority: 2),
                                (task: "Load/unload the dishwasher", priority: 5),
                                (task: "Go food shopping", priority: 3),
                                (task: "Work on hibiscus watercolor", priority: 3),
                                (task: "Mow the lawn", priority: 9),
                                (task: "Work on Oma's internets \"issues\" using Chrome Remote Access", priority: 4),
                                (task: "Work on Mom's income taxes", priority: 6)
]

//.. Closure used as input parameter for function
//var sortClosure1 = { ([(task: String, priority: Int)]) -> ([(task: String, priority: Int)]) in
var sortClosure1 = { ([(task: String, priority: Int)]) -> myTupleArray in
    
    //.. sort using ternary operator on priority then task;
    //..     Example ***  (boolValue ? valueA : valueB)  *** .ie (boolValue ? true : false)
    
    //.. sorting on one tuple value
    //let kamArray = kamTaskList.sorted(by: {$0.priority < $1.priority })
    //.. sorting on multiple tuple values but this one did not like the "sort" func used; wanted "sorted(by:"
    //let kamArray = kamTaskList.sort{ $0.1 != $1.1 ? $0.1 < $1.1 : $0.0 < $1.0 }
    
    //..  sorting on multiple tuple values; had to use "sorted(by:" to get it to work; not sure why
    let kamArray = kamTaskList.sorted(by: { $0.1 != $1.1 ? $0.1 < $1.1 : $0.0 < $1.0 })
    
//
//    //********************************************************************
//    //.. EXAMPLE of how to sort on multiple tuple values
//    var myArray = [ (1,1,"cat"), (1,2,"dog"), (3,4,"mouse99"), (3,4,"mouse1"), (3,4,"mouse2"), (3,1,"elephant"), (2,1,"hamster"), (2,2,"guinea pig")]
//
//    //..myArray.sort{ $0.1 != $1.1 ? $0.1 > $1.1 : $0.0 < $1.0 } //.. use ternary operator -> (boolValue ? valueA : valueB) -> (boolValue ? true : false)
//    myArray.sort{ $0.1 != $1.1 ? $0.1 < $1.1 : $0.2 < $1.2 }     //.. "$0.2" and "$1.2" refer to comparision of "third value in tuple"
//                                                                 //     .ie string w/ animals
//
//    print(myArray)
//    print("\n")
//    //.. output equals...
//    //[(1, 1, "cat"), (3, 1, "elephant"), (2, 1, "hamster"), (1, 2, "dog"), (2, 2, "guinea pig"), (3, 4, "mouse1"), (3, 4, "mouse2"), (3, 4, "mouse99")]
//    //********************************************************************
//
   
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
    

    return kamArray
    
}

//Function that takes an integer and a closure as it's input parameters
//func tasksForToday(maxTasks: Int, sortClosure: ([(task: String, priority: Int)]) -> ([(task: String, priority: Int)])) {
func tasksForToday(maxTasks: Int, sortClosure: ([(task: String, priority: Int)]) -> myTupleArray) {
    
    var count = 1
    //.. "activate" closure
    let doneArray = sortClosure(kamTaskList)
    
    var maxNbr = maxTasks
    
    //.. if the input number of tasks desired for printing is less than or equal to the count of tasks in the array,
    //..    print out that number of tasks; otherwise, print out ALL the tasks
    
    if maxNbr <= doneArray.count {
        //
    } else {
        maxNbr = doneArray.count
    }
    
    print("   Number of tasks printed: \(maxNbr) out of \(doneArray.count)")    //"\(maxTasks)")
    print("\n Priority             Task      ")
    print(" --------       ----------------")

    //.. iterate over the array for the number of tasks the user wants printed and print the items
    for item in doneArray where (count <= maxNbr && maxNbr <= doneArray.count) {
        print("    \(item.priority)    \t\t\(item.task)")
        count += 1
    }
}

tasksForToday(maxTasks: 17, sortClosure: sortClosure1)


