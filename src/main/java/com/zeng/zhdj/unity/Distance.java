package com.zeng.zhdj.unity;
/**   
 * 通过经纬度获取距离(单位：米)   
 * @param lat1   
 * @param lng1   
 * @param lat2   
 * @param lng2   
 * @return   
 */    
public class Distance {
	
	private static final double EARTH_RADIUS = 6378.137;

    private static double rad(double d){
        return d * Math.PI / 180.0;
    }

    public static double GetDistance(double lat1, double lng1, double lat2,    
            double lng2) {
    	double radLat1 = rad(lat1);    
        double radLat2 = rad(lat2);    
        double a = radLat1 - radLat2;    
        double b = rad(lng1) - rad(lng2);    
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2)    
                + Math.cos(radLat1) * Math.cos(radLat2)    
                * Math.pow(Math.sin(b / 2), 2)));    
        s = s * EARTH_RADIUS;    
        s = Math.round(s * 10000d) / 10000d;    
        s = s*1000;    
        return s;  
    }

//    public static void main(String[] args) {
//        //根据两点间的经纬度计算距离，单位：km
//        System.out.println(GetDistance(116.5542, 39.81621, 116.5539, 39.81616));
//        System.out.println(GetDistance(117.1181, 36.68484, 117.01, 36.66123));
//        System.out.println(GetDistance(112.9084, 28.14203, 112.9083, 28.14194));
//        System.out.println(GetDistance(121.5373, 38.86827, 121.5372, 38.86832));
//        System.out.println(GetDistance(20.5, 118.2, 21.1, 117.6));
//        System.out.println(GetDistance(121.445140,31.177779, 121.444832,31.179313));
//    }

}
