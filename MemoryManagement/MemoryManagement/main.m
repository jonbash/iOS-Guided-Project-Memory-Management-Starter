//
//  main.m
//  MemoryManagement
//
//  Created by Paul Solt on 1/29/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

// newer main version that doesn't work with MRC

//int main(int argc, char * argv[]) {
//    NSString * appDelegateClassName;
//    @autoreleasepool {
//        // Setup code that might create autoreleased objects goes here.
//        appDelegateClassName = NSStringFromClass([AppDelegate class]);
//    }
//    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
//}

// main must look like this for MRC

int main(int argc, char * argv[]) {
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
