//
//  EntryController.swift
//  Journal
//
//  Created by Darianne Salinas on 6/1/22.
//

import Foundation

class EntryController {
    
    //Create a shared property as a shared instance (hint: remember, shared instances require an important keyword at the beginning of the line of code).
    static let shared = EntryController()
    
    //Add an entries array property, and set its value to an empty array of Entry.
    var entries: [Entry] = []
    
    //Create a createEntryWith(title: ...) function that takes in a title and body.
    func createEntryWith(title: String, body: String) {
        
        // It should create a new instance of Entry and add it to the entries array.
        let newEntry = Entry(title: title, body: body)
        entries.append(newEntry)
    }
    
    func deleteEntry(entry: Entry) {
        guard let index = entries.firstIndex(of: entry) else {
            return }
        entries.remove(at: index)
    }
    
    
    //Note that this method returns a URL, which is the URL for the file location where we will be saving our data.
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectoryURL = urls[0].appendingPathComponent("Journal.json")
        return documentsDirectoryURL
    }
    
    func saveToPersistentStorage() {
        do {
            let data = try JSONEncoder().encode(entries)
            try data.write(to: fileURL())
        } catch {
            print("======== ERROR ========")
            print("Function: \(#function)")
            print("Error: \(error)")
            print("Description: \(error.localizedDescription)")
            print("======== ERROR ========")
        }
    }
    
/*
 Now set self.entries to this array of entries.

 Finally, you need to call the loadFromPersistentStorage() function. While there are many different places you could do this successfully, for now, go to the viewDidLoad() lifecycle method in your EntryListTableViewController and call EntryController.shared.loadFromPersistentStorage().


 */
    // Write a method called loadFromPersistentStorage() that will load the current data from the file on disk where we saved our entries(data).
    func loadFromPersistentStorage() {
        
        // Create a constant called data to hold the data that you will get back by calling Data(contentsOf:). Now pass in the fileURL() as an argument (hint: this is a throwing function).
        do {
            let data = try Data(contentsOf: fileURL())
            
            //Call decode(from:) on an instance of the JSONDecoder. Assign the return of this function to a constant named entries. This function takes in two arguments: a type [Entry].self and your instance of data. It will decode the data into an array of Entry.
            let entries = try JSONDecoder().decode([Entry].self, from: data)
            self.entries = entries
        } catch {
            print("======== ERROR ========")
            print("Function: \(#function)")
            print("Error: \(error)")
            print("Description: \(error.localizedDescription)")
            print("======== ERROR ========")        }
    }
    
}
