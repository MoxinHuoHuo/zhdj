package zhdj;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class man {
    public static void main(String[] args){

        /*Calendar calendar=Calendar.getInstance();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        calendar.setTime(date);

        System.out.println("月份："+(calendar.get(Calendar.MONTH)+1));*/
        Map<Integer,List<String>> testMap=new HashMap<>();
        List<String> nameList;

        for (int i=0;i<12;i++) {
            testMap.put(i, new ArrayList<String>());
        }
        testMap.get(0).add("man");
        testMap.get(1).add("like");
        System.out.println(testMap.toString());
    }

}
