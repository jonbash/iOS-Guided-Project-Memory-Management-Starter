//
//  ViewController.m
//  MemoryManagement
//
//  Created by Paul Solt on 1/29/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Person.h"
#import "LSILog.h"

@interface ViewController ()

@property (nonatomic, retain) NSMutableArray *people;

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _people = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // TODO: Disable ARC in settings
    
    NSLog(@"Hi");

    NSString *jsonString = [[NSString alloc] initWithString:@"{ \"name\": \"Jon\" }"];
    // RetainCount = 1
    NSLog(@"jsonString: %p", jsonString);
    NSString *alias = [jsonString retain];
    // RetainCount = 2
    NSLog(@"alias: %p", alias);

    [alias release];
    // RetainCount = 1
    alias = nil; // clear variable so we don't accidentally use it

    [jsonString release];
    // retaincount = 0 (immediately clean up memory)
    jsonString = nil;

    // collections

    // collections designed to take ownership of data we give them

    NSString *jim = [[NSString alloc] initWithString:@"Jim"]; // jim: 1
    [self.people addObject:jim]; // jim: 2

    [self.people removeObject:jim]; // jim: 1
    [jim release]; // jim: 0 -- cleaned up
    jim = nil;

    Car *honda = [Car carWithMake:@"Civic"];
    Person *elie = [[Person alloc] initWithCar:honda];
    [elie autorelease];

    // auto released, or no?
    NSString *name = [NSString stringWithFormat:@"%@ %@", @"John", @"Miller"]; // yes
    NSDate *today = [NSDate date]; // yes
    NSDate *now = [NSDate new]; // no
    NSDate *tomorrow2 = [NSDate dateWithTimeIntervalSinceNow:60*60*24]; // yes
    NSDate *nextTomorrow = [tomorrow2 copy]; // retain: 1 // no
    NSArray *words = [@"This sentence is the bomb" componentsSeparatedByString:@" "]; // yes
    NSString *idea = [[NSString alloc] initWithString:@"Hello Ideas"]; // no
    Car *redCar = [Car carWithMake:@"Civic"]; // yes
    NSString *idea2 = [[[NSString alloc] initWithString:@"Hello Ideas"] autorelease]; // yes
    NSString *idea3 = [[NSString alloc] initWithString:@"Hello Ideas"]; // not yet...
    [idea3 autorelease]; // ...now, yes!

    [now release];
    [nextTomorrow release];
    [idea release];
}

- (void)dealloc {
    [_people release];
    _people = nil;

    [super dealloc];
}

@end
