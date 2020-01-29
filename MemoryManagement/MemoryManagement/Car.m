//
//  Car.m
//  iOS9-MemoryManagement
//
//  Created by Paul Solt on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "Car.h"
#import "LSILog.h"

@implementation Car

- (instancetype)initWithMake:(NSString *)make {
	self = [super init];
	if (self) {
        NSLog(@"Car.init: %@", make);
        _make = [make copy];
	}
	return self;
}

+ (instancetype)carWithMake:(NSString *)make {
    return [[[Car alloc] initWithMake:make] autorelease];
}

// TODO: Implement autoreleased class car method

- (void)dealloc {
    NSLog(@"Car.dealloc: %@", self);
    if (_make) {
        [_make release];
        _make = nil;
    }

    [super dealloc];
}

- (NSString *)description {
    return self.make;
}

@end
