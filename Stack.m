//
//  Stack.m
//  RM LocationReminder
//
//  Created by Randy McLain on 4/27/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//  borrowed format from codeproject.com (Cloud Hsu)

#import "Stack.h"

@implementation Stack

@synthesize count;

-(id)init {
  if (self = [super init]) {
    theStack = [[NSMutableArray alloc] init];
    count = 0;
    
  }
  return self;
}

-(void) push:(id)theObject {
  // we have to move the objects to the next index before we can add the new object.
//  
//  // should use a for loop here.
//  for (NSObject *o in theStack) {
//    
//  }
//  [theStack addOb];
//  count = theStack.count;
}

- (NSObject *)pop {
  NSObject *obj = nil;
  if (theStack.count > 0) {
    obj = [theStack lastObject];
    [theStack removeLastObject];
    count = theStack.count;
  }
  return obj;
}

-(void)clear {
  
  [theStack removeAllObjects];
  count = 0;
  
}

@end
