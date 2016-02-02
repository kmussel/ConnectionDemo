/*
 This source file is part of the Swift.org open source project

 Copyright 2015 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

#if os(Linux)
import Glibc
srandom(UInt32(clock()))
#endif

import Foundation
import Connection

var server = try Server(port:8188)
print("CREATED SERVER")
print(server)
try server.serve(){(socket) -> Void in
//    print("INSDIE SERVE")
//    print(socket)
    let message       = "Hello World\n"
    let contentLength = message.utf8.count
    
    let sd = socket.socketDescriptors
//    print("THE SD = \(sd.count)\n")
    let fd = socket.socketDescriptors[0]
//    print("THE FD = \(fd)\n")
//    server.socket?.write(fd:fd, message:"HTTP/1.1 200 OK\n")
//    server.socket?.write(fd:fd, message:"Server: Pilot Example \n")
//    server.socket?.write(fd:fd, message:"Content-length: \(contentLength)\n")
//    server.socket?.write(fd:fd, message:"Content-type: text-plain\n")
//    server.socket?.write(fd:fd, message:"\r\n")
//    server.socket?.write(fd:fd, message:message)
    socket.write(fd:fd, message:"HTTP/1.1 200 OK\n")
    socket.write(fd:fd, message:"Server: Pilot Example \n")
    socket.write(fd:fd, message:"Content-length: \(contentLength)\n")
    socket.write(fd:fd, message:"Content-type: text-plain\n")
    socket.write(fd:fd, message:"\r\n")
    socket.write(fd:fd, message:message)

    socket.close()
    
//    var index = 0
//    for index = 0; index < 300000; ++index {
////        print("index is \(index)")
////        j = j+1
//    }
    
//    print("CLOSING SOCKET")

//    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
//    dispatch_after(delayTime, dispatch_get_main_queue()) {
//        print("test")
//    }
    
//    NSThread.sleepForTimeInterval(2)
//    let seconds = 4.0
//    let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
//    let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(4))
//    print("the dispatchTime = \(dispatchTime)")
//    dispatch_after(dispatchTime, dispatch_get_main_queue(), {
//        
//        // here code perfomed with delay
//        print("CLOSING SOCKET")
//
//        
//    })


    
}

