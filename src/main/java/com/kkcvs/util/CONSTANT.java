package com.kkcvs.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by 14437 on 2017/5/18.
 */
public class CONSTANT {
    public static String[] provinceList = new String[] {
            "安徽省","澳门特别行政区","北京市","重庆市","福建省","甘肃省"," 广东省",
            "广西壮族自治区","贵州省","海南省","河北省","河南省","黑龙江省","湖北省",
            "湖南省","吉林省","江苏省","江西省","辽宁省","内蒙古自治区","宁夏回族自治区",
            "青海省","山东省","山西省","陕西省","上海市","四川省","台湾省","天津市",
            "西藏自治区","香港特别行政区","新疆维吾尔族自治区","云南省","浙江省"
    };

    public static int getProvinceIdByName(String provinceName){
        for(int i=0;i<provinceList.length;i++)
            if(provinceList[i].equals(provinceName))
                return i;
        return -1;
    }

}
