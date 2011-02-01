//
//  HBCellView.m
//  Calc
//
//  Created by Haldun Bayhantopcu on 8/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HBCellView.h"
#import "HBParser.h"

@implementation HBCellView

@synthesize textField;
@synthesize label;
@synthesize docController;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
  }
  return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  //[super setSelected:selected animated:animated];
  // Configure the view for the selected state
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
  HBParser *parser = [HBParser parser];  
  [[self label] setText:[NSString stringWithFormat:@"%.0f",
                         [parser parse:[textField text]]]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
  [theTextField resignFirstResponder];
  return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//  NSString *searchString      = [textField text];
//  NSString *regexString       = @"(\\d+)";
//  NSString *replaceWithString = @"{$1}";
//  NSString *replacedString    = NULL;
//  
//  NSNumberFormatter *numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
//  
//  NSLog(@"%@", [searchString arrayOfCaptureComponentsMatchedByRegex:regexString]);
//  
//  replacedString = [searchString stringByReplacingOccurrencesOfRegex:regexString 
//                                                          withString:replaceWithString];
//  
//  NSLog(@"replaced string: %@", replacedString);
  
//  matchedRange = [text rangeOfRegex:regexString 
//                            options:RKLNoOptions
//                            inRange:searchRange
//                            capture:2L
//                              error:&error];
//  
//  NSLog(@"matched range: %@", NSStringFromRange(matchedRange));
//                  
  
//  NSLog(@"%@", text);
  return YES;
}

- (void)dealloc {
  [docController release];
  [super dealloc];
}


@end
