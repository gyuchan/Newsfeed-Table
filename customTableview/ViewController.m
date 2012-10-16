//
//  ViewController.m
//  customTableview
//
//  Created by gyuchan jeon on 12. 10. 9..
//  Copyright (c) 2012년 gyuchan jeon. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *statuses;
@property (nonatomic, retain) IBOutlet UITableView *table;
@end

@implementation ViewController
@synthesize statuses, table;

- (void)viewDidLoad
{
    [super viewDidLoad];
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NSString *contents1 = @"asasdbjiasjbioajsoebj oasijboi oasbjoas jdbioa soidb aosjdbiaj dibjo adjfioafidojasdofjaoisjfoias fjiaojfoiajdfioajdiofa fids foa iofj sdiofod fisdf oiasd fiosjfiojdsfijojsiodfjisdjfsio dfjioasdjf ioa sjdifoj asoidjf";
    NSString *contents2 = @"asdgabbbadfjsaf adoif aiodfjoajdfoia dfoi aodfjioa dfiaj dofjaiod foiadj fadijsfoajdsfoia dfioa jiodfjias dfiasj dfojaiosdfj oajdsiof jois dfjaios fdoia doifjaiosd fioa sdfjioa joidfjaiods fjoia iodf jaiosdf jioadsjfio jaiosdf oisjdfiajsiofd jaiosdfoiasjdfi aiosd fioa dfoia sidf aidf joiad fioasj dfioaj sodfija iodsfj oiasd fjoiajdiof oijasd fjo";
    NSString *contents3 = @"asasdbjiasjbioajsoebj oasijboi oasbjoas jdbioa soidb aosjdbiaj dibjo adjfioafidojasdofjaoisjfoias fjiaojfoiajdfioajdiofa fids foa iofj sdiofod fisdf oiasd fiosjfiojdsfijojsiodfjisdjfsio dfjioasdjf ioa sjdifoj asoidjfasdnfajsdifjaodsfjoasdjfoaijdoi asjd fajods fjaio fjioa sdifajsofjaoisdjfoadsjfioa sjfoias jfio asojfa sjfioads jfioa sfiojsdfjaiosdfjiosdjfisjdfioas difo aifjoasjfiosjd ifojsdiofjsidof jaiosdj fiajs diofja iosdf jioajsiodfjaosdjfoaisd foia diof asoidf iosd jfioa sjifoa jsidofj oaids jfo";
    NSString *contents4 = @"aasdff  difjsodfdsjf sdfis fisdj ofaodfjoa sd fjo";
    NSString *contents5 = @"asdfjoijdiojos";
    NSString *contents6 = @"a가나가나다란가나가나가나 가나가나다라나가낙나가나가나가나 ";
    statuses = [[NSArray alloc] initWithObjects:contents1,contents2,contents3,contents4,contents5,contents6, nil];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableView data source and delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"CustomCell";
    CustomCell *cell = (CustomCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
	{
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:self options:nil];
        cell=[nibs objectAtIndex:0];
        [cell initCustomCell:0 likeVisible:FALSE];
    }
    else{
        [cell initCustomCell:0 likeVisible:FALSE];
    }
    //cell.title.adjustsFontSizeToFitWidth = NO;
    
    CGSize size = [[statuses objectAtIndex:indexPath.row] sizeWithFont:[UIFont systemFontOfSize:10]
                                                     constrainedToSize:CGSizeMake(300, 9000)];
    CGFloat labelHeight = MAX(size.height, 10.0);
    [cell.title setFont:[UIFont systemFontOfSize:10.0]];
    [cell.title setLineBreakMode:UILineBreakModeCharacterWrap];
    [cell.title setNumberOfLines:0];
    [cell.title setFrame:CGRectMake(cell.title.frame.origin.x, cell.title.frame.origin.y, cell.title.frame.size.width, labelHeight+5.0)];
    
    if(indexPath.row%2 == 0){
        
        //사진이 없는경우
        cell.imageView.hidden = YES;
        [cell.bottomView setFrame:CGRectMake(cell.bottomView.frame.origin.x, cell.title.frame.origin.y + cell.title.frame.size.height, cell.bottomView.frame.size.width, cell.bottomView.frame.size.height)];
        [cell.background setFrame:CGRectMake(cell.background.frame.origin.x, cell.background.frame.origin.y, cell.background.frame.size.width, cell.title.frame.origin.y + cell.title.frame.size.height)];
        [cell.title setText:[statuses objectAtIndex:indexPath.row]];
        [cell.name setText:@"전규찬"];
    }else{
        //사진이 있는경우
        cell.imageView.hidden = NO;
        [cell.imageView setFrame:CGRectMake(cell.imageView.frame.origin.x, cell.title.frame.origin.y + cell.title.frame.size.height, cell.imageView.frame.size.width, 200)];
        
        //////////////////////////////////////////////////////////
        UIImage *image = [UIImage imageNamed:@"sample.png"];
        //////////////////////////////////////////////////////////
        CGSize imageSize = [image size];
        
        [cell.imageView setImage:image];
        [cell.imageView setClipsToBounds:YES];
        
        /*
        if(imageSize.height >=200){
            
            CGRect rect = CGRectMake(imageSize.width / 2, imageSize.height / 2 ,
                                     cell.imageView.frame.size.width, cell.imageView.frame.size.height);
            CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
            UIImage *img = [UIImage imageWithCGImage:imageRef];
            CGImageRelease(imageRef);
            [cell.imageView setImage:img];
        }else{
//            UIGraphicsBeginImageContext(cell.imageView.frame.size);
//            [image drawInRect:CGRectMake(0,0,cell.imageView.frame.size.width,200)];
//            UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
//            UIGraphicsEndImageContext();
            [cell.imageView setImage:image];
        }
        */
        
        
        

        [cell.bottomView setFrame:CGRectMake(cell.bottomView.frame.origin.x, cell.title.frame.origin.y + cell.title.frame.size.height + cell.imageView.frame.size.height, cell.bottomView.frame.size.width, cell.bottomView.frame.size.height)];
        
        [cell.background setFrame:CGRectMake(cell.background.frame.origin.x, cell.background.frame.origin.y, cell.background.frame.size.width, cell.title.frame.origin.y + cell.title.frame.size.height + cell.imageView.frame.size.height)];
        [cell.title setText:[statuses objectAtIndex:indexPath.row]];
        [cell.name setText:@"전규찬"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	/*
	 If the requesting table view is the search display controller's table view, configure the next view controller using the filtered content, otherwise use the main list.
	 */
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2 == 0){
        
        //사진이 없는경우
        
        CGSize size = [[statuses objectAtIndex:indexPath.row] sizeWithFont:[UIFont systemFontOfSize:10]
                                                         constrainedToSize:CGSizeMake(300, 9000)];
        return size.height + 70;
        
    }
    else{
        
        //사진이 있는경우
        
        CGSize size = [[statuses objectAtIndex:indexPath.row] sizeWithFont:[UIFont systemFontOfSize:10]
                                                         constrainedToSize:CGSizeMake(300, 9000)];
        return size.height + 270;
        
    }
}

@end
