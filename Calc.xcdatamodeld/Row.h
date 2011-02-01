//
//  Row.h
//  Calc
//
//  Created by Haldun Bayhantopcu on 8/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Document;

@interface Row :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * result;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * createdOn;
@property (nonatomic, retain) Document * document;

@end



