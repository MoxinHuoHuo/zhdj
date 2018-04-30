package com.zeng.zhdj.unity;

import java.util.ArrayList;
import java.util.List;

public class RemoveRepeatingElements {

    public String[] remove(String[] test1){

        List<String> list = new ArrayList<String>();
        for (int i = 0; i < test1.length; i++) {
            if (!list.contains(test1[i]))
                list.add(test1[i]);
        }

        String[] toBeStored = list.toArray(new String[list.size()]);
        return toBeStored;
    }
}
