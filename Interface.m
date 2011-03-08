#import "Interface.h"

@implementation Interface
-(void) print {
}

-(BOOL) Implemented_By: (Object*) object {
  if([object isKindOfClass:[self class]]){
    return YES;
  }
  return NO;
}

@end

