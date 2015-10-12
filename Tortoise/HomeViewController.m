//
//  ViewController.m
//  Tortoise
//

#import "HomeViewController.h"
#import "GoogleMaps.h"
#import "HomeViewTableViewCell.h"
#import "SWRevealViewController.h"

@interface HomeViewController ()
{
    

}
@property (nonatomic,strong) NSMutableArray *dataArra;
@property (nonatomic,strong) IBOutlet UIView *mapContainerView;
@property (nonatomic,strong) IBOutlet UITableView * tableView;
@property (nonatomic,strong) IBOutlet HomeViewTableViewCell *hMVTableCell;
@property (weak,nonatomic) IBOutlet UIBarButtonItem *barButton;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    GoogleMaps * mapView =[[GoogleMaps alloc] initWithLatitude:0 longitude:0 zoom:12 title:@"" snippet:@"" frame:self.mapContainerView.frame];
    [self.mapContainerView addSubview:mapView];
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    

    [self dummyData];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;                                               // any offset changes
{
    
    
}



#pragma mark - UITableViewDataSource protocol methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArra.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ident = @"hMVTableCell";
    // re-use or create a cell
    HomeViewTableViewCell *cell = (HomeViewTableViewCell *)[tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    // find the to-do item for this index
    NSDictionary *duck = [_dataArra objectAtIndex:indexPath.row];
    
    cell.placeTitleLbl.text = [duck objectForKey:@"title"];
    cell.descriptionLbl.text = [duck objectForKey:@"description"];
    cell.placeImageView.image = [UIImage imageNamed:@"paris.png"];

    return cell;
}

#pragma mark - UITableViewDataDelegate protocol methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 112.0f;
}


- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"%f",velocity.y);
    if(velocity.y>2){
     self.tableView.frame = CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.width);
        
    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        
        self.topConstraint.constant = -20 + (self.view.frame.size.height/2);
        
        self.heightConstraint.constant = self.view.frame.size.height/2;

        [self.tableView layoutSubviews];

    } completion:^(BOOL finished) {
        
    }];
        
    }
    
}
#pragma Mark #

-(void)dummyData{
   NSString *des = @" Greater Paris (the city plus surrounding departments) received 22,4 million visitors in 2014, making it one of the world's top tourist destinations. The largest numbers of foreign tourists in 2014 came from the United States (2.74 million), the U.K., Germany, Italy, Japan, Spain and China (532,000). Arrivals from the U.K, Germany, Russia and Japan dropped from 2013, while arrivals from the Near and Middle East grew by twenty percent.";
    
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",des,@"description", nil];
    NSDictionary *dict1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",des,@"description", nil];
    NSDictionary *dict2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",des,@"description", nil];
    NSDictionary *dict3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",des,@"description", nil];
    NSDictionary *dict4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",des,@"description", nil];
    NSDictionary *dict33 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",des,@"description", nil];
    NSDictionary *dict44 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",des,@"description", nil];
    NSDictionary *dict333 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",des,@"description", nil];
    NSDictionary *dict444 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Paris",@"title",des,@"description", nil];
    _dataArra = [NSMutableArray arrayWithObjects:dict,dict1,dict2,dict3,dict4,dict33,dict44,dict333,dict444, nil];
    
}
@end
