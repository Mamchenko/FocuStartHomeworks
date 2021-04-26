//
//  ThreadManager.swift
//  SaveThread
//
//  Created by Anatoliy Mamchenko on 26.04.2021.
//

import Foundation

class ThreadManager<T> {
   private var threadSafeArray: [T] = []
   
   let queue = DispatchQueue(label: "thread-safe-array", attributes: .concurrent)
   
   var count: Int {
       return self.threadSafeArray.count
   }
   
   var isEmpty: Bool {
       let result = self.threadSafeArray.isEmpty
       return result
   }
   
   
   func appendItem (item: T) {
       self.queue.async( qos: .userInitiated, flags: .barrier) {
           self.threadSafeArray.append(item)
       }
   }
   
   func remove (index: Int) {
       self.queue.async( qos: .userInitiated, flags: .barrier) {
           self.threadSafeArray.remove(at: index)
       }
   }
   
   subscript (index: Int) -> T {
       set {
           queue.async {
               self.threadSafeArray[index] = newValue
           }
       }
       get {
           var element: T!
           queue.async {
               element = self.threadSafeArray[index]
           }
           return element
       }
   }
   func fulledArrayFromZeroToThousandElement () {
       for number in 0...1000 {
               self.queue.async( qos: .userInitiated, flags: .barrier) {
                   self.threadSafeArray.append(number as! T)
               }
               self.queue.async {
                   self.threadSafeArray.append(number as! T)}
       }
       print (self.threadSafeArray.map{$0})
   }
   
}

