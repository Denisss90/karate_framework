package thetestingacademy;
import com.intuit.karate.junit5.Karate;


public class PersonsTest {
    @Karate.Test
    Karate testAll(){
        return Karate.run().relativeTo(getClass());
    }
    
}
