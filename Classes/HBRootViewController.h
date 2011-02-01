//
//  HBRootViewController.h
//  Calc
//
//  Created by Haldun Bayhantopcu on 8/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HBRootViewController : UITableViewController {

  NSMutableArray *documentsArray;
  NSManagedObjectContext *managedObjectContext;
  
  UIBarButtonItem *addButton;
}

@property (nonatomic, retain) NSMutableArray *documentsArray;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain) UIBarButtonItem *addButton;

- (void)addDocument;

@end
