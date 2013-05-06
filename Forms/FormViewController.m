
    //
//  FormViewController.m
//  TraitWare
//
//  Created by Waqar on 5/1/13.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import "FormViewController.h"
#import "formCell.h"


@interface FormViewController ()

@end

@implementation FormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
//    [self.checkButton setImage:[UIImage imageNamed:@"uicheckbox_checked.png"] forState:UIControlStateNormal];
    
    self.formsTable.delegate = self;
    self.formsTable.dataSource = self;
	// Do any additional setup after loading the view.
    [self.checkButton setTitle:@"ppwpdoppokp" forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark TableViewDelegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return 2;
    //return [objTransactions count];
}

//RootViewController.m
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if(section == 0)
        return @"Countries to visit";
    else
        return @"Countries visited";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

	formCell *cell = [tableView
                              dequeueReusableCellWithIdentifier:@"formCell"];
   
    if(cell == nil ){
        NSLog(@"cell == nil ");
    }else{
        NSLog(@"cell != nil: %i", indexPath.section);
        
    }
    
//    [self.checkButton setTitle:@"ppwpdoppokp" forState:UIControlStateNormal];
//    [self.checkButton setImage:[UIImage imageNamed:@"uicheckbox_unchecked.png"] forState:UIControlStateNormal];
//    [self.checkButton setImage:[UIImage imageNamed:@"uicheckbox_unchecked.png"] forState:UIControlStateHighlighted];

    if(indexPath.section == 0){
        cell.checkButton.titleLabel.text = (indexPath.row == 0) ? @"a" : @"b";

    }else{
        cell.checkButton.titleLabel.text = (indexPath.row == 0) ? @"c" : @"d";

    }
    //	Player *player = [self.players objectAtIndex:indexPath.row];
    //	cell.textLabel.text = player.name;
    //	cell.detailTextLabel.text = player.game;
    NSLog(@" cell.checkButton.titleLabel.text: %@",  cell.checkButton.titleLabel.text);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    formCell *cell = (formCell*)[tableView cellForRowAtIndexPath:indexPath] ;
    [cell.checkButton setTitle:@"ssssssss" forState:UIControlStateNormal];
    //Get the
//    NSLog(@"didSelectRowAtIndexPath row = %i section= %i", indexPath.section, indexPath.row);
    //UITableViewCell *cell = (formCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"didSelectRowAtIndexPath section = %i row = %i", indexPath.section, indexPath.row);

    
}



- (IBAction)checkButtonAction:(id)sender {
    NSIndexPath *indexPath =
    [self.formsTable
     indexPathForCell:(UITableViewCell *)[[sender superview] superview]];
    
//    self.checkButton.enabled = NO;
//    [self.checkButton setEnabled:NO];
    
//    NSLog(@"checkButtonAction row = %i", indexPath.row);
//    NSLog(@"checkButtonAction section = %i", indexPath.section);

    //[self.checkButton setBackgroundImage:[UIImage imageNamed:@"uicheckbox_checked.png"] forState:UIControlStateHighlighted];
    //[self.checkButton setImage:[UIImage imageNamed:@"uicheckbox_checked.png"] forState:UIControlStateNormal];
    
//    NSLog(@"checkButtonAction tirle = %@", self.checkButton.titleLabel.text);

//    cell.checkButton.titleLabel.text = @"oohhh";
//
        [self.checkButton setTitle:@"asojdnvn" forState:UIControlStateNormal];
//    [self.checkButton setImage:[UIImage imageNamed:@"uicheckbox_checked.png"] forState:UIControlStateNormal];

//    cell.checkButton.titleLabel.text = @"xyz";
//    NSLog(@"checkButtonAction title = %@", self.checkButton.titleLabel.text);
    

}



@end
