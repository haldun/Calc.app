//
//  HBRootViewController.m
//  Calc
//
//  Created by Haldun Bayhantopcu on 8/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HBRootViewController.h"
#import "Document.h"
#import "HBDocumentDetailViewController.h"

@implementation HBRootViewController

@synthesize documentsArray;
@synthesize managedObjectContext;
@synthesize addButton;

#pragma mark -
#pragma mark Initialization

/*
 - (id)initWithStyle:(UITableViewStyle)style {
 // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 if ((self = [super initWithStyle:style])) {
 }
 return self;
 }
 */


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
  [super viewDidLoad];

  // Set the title
  self.title = @"Notebooks";
  
  // Configure the add and edit buttons
  self.navigationItem.leftBarButtonItem = self.editButtonItem;
  
  addButton = [[UIBarButtonItem alloc] 
               initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
               target:self 
               action:@selector(addDocument)];
  addButton.enabled = YES;
  self.navigationItem.rightBarButtonItem = addButton;
  
  // Fetch existing documents.
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription 
                                 entityForName:@"Document"
                                 inManagedObjectContext:managedObjectContext];  
  [request setEntity:entity];
  
  // Order the documents by creation date, most recent first.
  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] 
                                      initWithKey:@"createdOn" ascending:NO];
  NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];  
  [request setSortDescriptors:sortDescriptors];
  [sortDescriptors release];
  [sortDescriptor release];
  
  // Execute the fetch -- create a mutable copy of the result
  NSError *error;
  NSMutableArray *mutableFetchResults = [[managedObjectContext 
                                          executeFetchRequest:request 
                                          error:&error] 
                                         mutableCopy];
  
  if (mutableFetchResults == nil) {
    // Handle the error
  }
  
  // Set self's documents array to the mutable data, then clean up.
  [self setDocumentsArray:mutableFetchResults];
  [mutableFetchResults release];
  [request release];
}


- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.tableView reloadData];
}

/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */
/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  // Return the number of sections.
  return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [documentsArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  Document *document = (Document *)[documentsArray objectAtIndex:indexPath.row];
  cell.textLabel.text = document.title;
  
  return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
   // Delete the managed object at the given index path
   NSManagedObject *documentToDelete = [documentsArray objectAtIndex:indexPath.row];
   [managedObjectContext deleteObject:documentToDelete];
   
   // Update the array and table view
   [documentsArray removeObjectAtIndex:indexPath.row];
   [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                                             withRowAnimation:YES];
   
   // Commit the change
   NSError *error;
   
   if (![managedObjectContext save:&error]) {
     // Handle the error
   }
 }
}


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  HBDocumentDetailViewController *detailViewController = 
      [[HBDocumentDetailViewController alloc] 
          initWithNibName:@"HBDocumentDetailViewController" bundle:nil];
  
  [detailViewController setDocument:[documentsArray objectAtIndex:indexPath.row]];
  
  [self.navigationController pushViewController:detailViewController animated:YES];
  [detailViewController release];
}

- (void)addDocument {
  Document *document = (Document *)[NSEntityDescription 
                                    insertNewObjectForEntityForName:@"Document" 
                                    inManagedObjectContext:managedObjectContext];
  
  Row *row = (Document *)[NSEntityDescription 
                                    insertNewObjectForEntityForName:@"Row" 
                                    inManagedObjectContext:managedObjectContext];
  
  [document setTitle:@"Untitled document"];
  [document setCreatedOn:[NSDate date]];
  [document addRowsObject:row];
     
  NSError *error;
  
  if (![managedObjectContext save:&error]) {
    // Handle the error
  }
  
  [documentsArray insertObject:[document retain] atIndex:0];
  
  NSLog(@"%d", [documentsArray count]);
  
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
  
  [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                        withRowAnimation:UITableViewRowAnimationFade];
  [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
  self.documentsArray = nil;
  self.addButton = nil;
}


- (void)dealloc {
  [managedObjectContext release];
  [documentsArray release];
  [addButton release];
  [super dealloc];
}


@end

