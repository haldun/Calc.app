//
//  Row.h
//  Calc
//
//  Created by Haldun Bayhantopcu on 8/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Row :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSNumber * result;
@property (nonatomic, retain) NSManagedObject * document;

@end



