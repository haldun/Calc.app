//
//  Document.h
//  Calc
//
//  Created by Haldun Bayhantopcu on 8/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Row;

@interface Document :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDate * createdOn;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * lastUpdatedOn;
@property (nonatomic, retain) NSSet* rows;

@end


@interface Document (CoreDataGeneratedAccessors)
- (void)addRowsObject:(Row *)value;
- (void)removeRowsObject:(Row *)value;
- (void)addRows:(NSSet *)value;
- (void)removeRows:(NSSet *)value;

@end

