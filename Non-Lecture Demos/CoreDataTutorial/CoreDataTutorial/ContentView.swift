//
//  ContentView.swift
//  CoreDataTutorial
//
//  Created by Visal Rajapakse on 2022-04-05.
//

import SwiftUI

struct ContentView: View {
    // sortDescriptors specify how you want it sorted by, you can pass an empty array to say you want it random
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var students: FetchedResults<Student>
    @FetchRequest(entity: Student.entity(), sortDescriptors: [], predicate: NSPredicate(format: "isFavourite = %d", true)) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "") // All properties are optional
                    .foregroundColor(student.isFavourite ? .red : .black)
            }
            Button {
                let fnames = ["John", "Jack", "Gota", "Otto"]
                let lnames = ["Paul", "Hudson", "Antoine", "Anthony"]
                
                let first = fnames.randomElement()!
                let last = lnames.randomElement()!
                
                // Specifying the context of the object we need to save to
                let student = Student(context: moc)
                student.id = UUID()
                student.name = first + " " + last
                student.isFavourite = Bool.random()
                
                try? moc.save() // Saving the object
            } label: {
                Text("Add")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
