//
//  HBCellView.h
//  Calc
//
//  Created by Haldun Bayhantopcu on 8/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBDocumentDetailViewController.h"

@interface HBCellView : UITableViewCell {  
  UITextField *textField;
  UILabel *label;
  
  HBDocumentDetailViewController *docController;
}

@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) HBDocumentDetailViewController *docController;

@end
