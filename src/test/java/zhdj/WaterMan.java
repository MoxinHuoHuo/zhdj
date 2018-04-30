package zhdj;

import java.util.List;

public class WaterMan {
    List<String> nameList;

    public List<String> getNameList() {
        return nameList;
    }

    public void setNameList(List<String> nameList) {
        this.nameList = nameList;
    }

    @Override
    public String toString() {
        return "WaterMan{" +
                "nameList=" + nameList +
                '}';
    }
}
