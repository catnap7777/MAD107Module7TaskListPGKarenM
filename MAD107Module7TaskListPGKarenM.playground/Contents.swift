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

//Examples but they do the same
//*******************************************************
//var getTask1 = {
//    (nbr1: Int, nbr2: Int) -> Int in
//    print("\(nbr1) \(nbr2)")
//    return 5
//}
//
//var getTask2: (Int, Int) -> Int = {
//    print("\($0) \($1)")
//    return 5
//}
//
//var testKam1 = getTask1(3, 7)
//print("\(testKam1)")
//
//var testKam2 = getTask2(3, 7)
//print("\(testKam2)")
//*******************************************************


//var sortTasks = kamTaskList.sorted(by: { $0.priority < $1.priority})

//.. closure
//var sortClosure1 = { ([(task: String, priority: Int)]) -> Void in
var sortClosure1 = { ([(task: String, priority: Int)]) -> ([(task: String, priority: Int)]) in
    
    //var count = 0

    let kamArray = kamTaskList.sorted(by: {$0.priority < $1.priority })
    return kamArray

    //print(kamArray)

//    print("   Number of tasks printed: ")    //"\(maxTasks)")
//    print("\n Priority             Task      ")
//    print(" --------       ----------------")
//
//    for item in kamArray {
//        print("    \(item.priority)    \t\t\(item.task)")
//        //count += 1
//    }
}

//func tasksForToday(maxTasks: Int, sortArray: ([(String, Int)]) -> Void) {
func tasksForToday(maxTasks: Int, sortArray: ([(task: String, priority: Int)]) -> ([(task: String, priority: Int)])) {
    //print("I am in the function")
    
    //print(maxTasks)
    var count = 1
    var done = sortArray(kamTaskList)
    //print(done)
    print("   Number of tasks printed: \(maxTasks) out of \(done.count)")    //"\(maxTasks)")
    print("\n Priority             Task      ")
    print(" --------       ----------------")

    //for item in kamArray {
    for item in done where (count <= maxTasks && maxTasks <= done.count) {
        print("    \(item.priority)    \t\t\(item.task)")
        count += 1
    }
}

tasksForToday(maxTasks: 7, sortArray: sortClosure1)


