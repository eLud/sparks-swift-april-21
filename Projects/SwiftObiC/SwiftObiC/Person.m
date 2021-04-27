//
//  Person.m
//  SwiftObiC
//
//  Created by Ludovic Ollagnier on 27/04/2021.
//

#import "Person.h"
#import "SwiftObiC-Swift.h"

@implementation Person

- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        NSLog(@"%@", name);
    }
    return self;
}

- (void)doSomething {
    Animal* ani = [[Animal alloc] initWithName: @"Titi"];
    NSLog(@"%@", ani.name);
    ani.name = @"Toto";

    [ani setName:@""];
}

@end
