//
//  Queue.m
//  RM LocationReminder
//
//  Created by Randy McLain on 4/27/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

#import "Queue.h"

@implementation Queue

@synthesize count;

-(id)init {
  if (self = [super init]) {
    theQueue = [[NSMutableArray alloc] init];
    count = 0;
  }
  return self;
}

-(void) add:(NSObject *)theObject {
  if (!theObject){
  [theQueue addObject: (NSObject *) theObject];
  count = theQueue.count;
  }
}

-(NSObject *) remove {
  NSObject *obj = nil;
  if (theQueue.count > 0) {
    obj = [theQueue objectAtIndex: 0];
    [theQueue removeObjectAtIndex: 0];
  }
  return obj;
}
-(void) clear {
  [theQueue removeAllObjects];
  count = 0;
}
@end
