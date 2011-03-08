#import "Object.h"
#import "PCR_Cleanup.h"

@interface Qiagen_PCR_Cleanup: NSObject <PCR_Cleanup> {
}

-(void) print;
-(NSMutableArray*) run:(NSMutableArray*) inputs;
@end
