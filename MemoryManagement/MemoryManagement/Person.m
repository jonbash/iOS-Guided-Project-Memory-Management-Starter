//
//  Person.m
//  iOS9-MemoryManagement
//
//  Created by Paul Solt on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "Person.h"
#import "Car.h"
#import "LSILog.h"

@implementation Person

- (instancetype)initWithCar:(Car *)car {
	self = [super init];
	if (self) {
        _car = car;
        NSLog(@"Person.init: %@", _car);
	}
	return self;
}

- (void)dealloc {
    NSLog(@"Person.dealloc: %@", _car);
    [_car release];
    _car = nil;
    [super dealloc];
}

- (void)setCar:(Car *)car {
    [_car release];
    _car = car;
    [_car retain];
}

@end
