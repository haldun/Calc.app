//
//  HBDocumentDetailViewController.h
//  Calc
//
//  Created by Haldun Bayhantopcu on 8/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Document;

@interface HBDocumentDetailViewController : UITableViewController {

  Document *document;
  
  NSMutableArray *rowsArray;
  NSManagedObjectContext *managedObjectContext;
  
  UIBarButtonItem *addButton;
}

@property (nonatomic, retain) Document *document;
@property (nonatomic, retain) NSMutableArray *rowsArray;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain) UIBarButtonItem *addButton;


- (void)addRow;

@end
