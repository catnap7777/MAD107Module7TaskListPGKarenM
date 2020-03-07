import Cocoa

var str = "Hello, playground"

//.. This program takes in an array of tuples and prints out a list of tasks based on how many the user wants to see ("maxTasks" input parm) and sorts
//..   the list by priority and then by task name
//.. NOTE: Any commented out code is left on purpose for future reference/explanation so that I "understand" better

typealias myTupleArray = [(task: String, priority: Int)] //..array of tuples

//old ---> var kamTaskList: [(task: String, priority: Int)] = [(task: "Do laundry", priority: 7),
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

//.. Closure used as input parameter for function.. sorts on first priority and then on task
//old ---> var sortClosure1 = { ([(task: String, priority: Int)]) -> ([(task: String, priority: Int)]) in
var sortClosure1 = {(forPriority: Int, [(task: String, priority: Int)]) -> myTupleArray in
    
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

//.. Closure used as input parameter for function.. sorts on first priority and then on task;
//..    returns array with only the specific forPriority the user requests
//old---> var sortClosure2 = { (priorityNumber: Int, ([(task: String, priority: Int)]) -> myTupleArray) in
var sortClosure2 = {(forPriority: Int, [(task: String, priority: Int)]) -> myTupleArray in
    
    var kamArray2: myTupleArray = ([])
    
    let tempArray2 = kamTaskList.sorted(by: { $0.1 != $1.1 ? $0.1 < $1.1 : $0.0 < $1.0 })
    
    //..build the "new" array with only the tasks from the input priority (forPriority)
    for item in tempArray2 where item.priority == forPriority {
        kamArray2.append(item)
    }
    
    //.. for testing purposes
    print("\t*** Derived task data based on user input parameter : \n\t\t\t\(kamArray2)\n")
    
    if forPriority == 0 {     //.. in function, this was set to zero if incoming function parameter, forPriorityIn was nil
        print("\n ***** The priority number was either not specified or was 0... Try again... *****\n")
    } else {
        print("\n The priority number for the tasks being printed is: \(forPriority)\n")
    }
    
    return kamArray2
    
}
    

//Function that takes an integer and a closure as it's input parameters
//old ---> func tasksForToday(maxTasks: Int, sortClosure: ([(task: String, priority: Int)]) -> ([(task: String, priority: Int)])) {
func tasksForToday(maxTasks: Int, forPriorityIn: Int?, sortClosure: (_ forPriority: Int, [(task: String, priority: Int)]) -> myTupleArray) {
    
    var count = 1
    
    var kamPriority: Int?
    kamPriority = forPriorityIn
    
    if kamPriority != nil {
        //... not null
    } else {
        //.. was nil; set to 0 now
        kamPriority = 0
    }
    
    let doneArray = sortClosure(kamPriority!, kamTaskList)
    
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

print("\n.........................................................................................................\n")
print("Executes the function tasksForToday using sortClosure1 and returns a list of the first \"n\" items regardless of the priority number: ")
print("\tFunction called via --> tasksForToday(maxTasks: 5, forPriorityIn: nil, sortClosure: sortClosure1)\n")
//.. test sortClosure1 to print out a set number of tasks regardless of the priority
tasksForToday(maxTasks: 5, forPriorityIn: nil, sortClosure: sortClosure1)

print("\n.........................................................................................................\n")
print("Executes the function taskForToday using sortClosure2 and returns only those priorities that are number \"n\" from user input: ")
print("\tFunction called via --> tasksForToday(maxTasks: 10, forPriorityIn: 1, sortClosure: sortClosure2)\n")
//.. test sortClosure2 to print out specific priority tasks
tasksForToday(maxTasks: 10, forPriorityIn: 1, sortClosure: sortClosure2)

print("\n.........................................................................................................\n")
print("Executes the function taskForToday using sortClosure2 where user input for priority number is nil: ")
print("\tFunction called via --> tasksForToday(maxTasks: 10, forPriorityIn: nil, sortClosure: sortClosure2)\n")
//.. testing sortClosure2 w nil
tasksForToday(maxTasks: 10, forPriorityIn: nil, sortClosure: sortClosure2)

print("\n.........................................................................................................\n")




