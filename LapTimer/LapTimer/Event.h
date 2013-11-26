//
//  Event.h
//  LapTimer
//
//  Created by Andre Morrison on 11/23/13.
//  Copyright (c) 2013 Andre Morrison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;

@end
