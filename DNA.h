#import <Property.h>

@interface DNA:BioProperty{
}
-(void) printWithPrefix:(NSString*)prefix;
@end

@interface Single_Stranded_DNA:DNA{
}
-(void) printWithPrefix:(NSString*)prefix;
@end

@interface Double_Stranded_DNA:DNA{
}
-(void) printWithPrefix:(NSString*)prefix;
@end
