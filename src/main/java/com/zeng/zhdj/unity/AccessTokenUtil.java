package com.zeng.zhdj.unity;

import java.security.Key;
import java.util.Date;
import java.util.Map;

import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class AccessTokenUtil {
	private static Logger log =Logger.getLogger(AccessTokenUtil.class);
	/**
	 * @author qwc
	 * 2017年8月1日下午9:31:39
	 * @return Key
	 * 生成token签名秘钥
	 * 使用HS256算法和Secret生成signKey
	 */
    private static Key getKeyInstance() {
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
        byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary("adfasjdkfjasld02388w8*@osfdsfasodfajsd");
        Key signingKey = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm.getJcaName());
        return signingKey;
    }

    /**
     * @author qwc
     * 2017年8月1日下午9:30:15
     * @param claims
     * @return String
     * Token生成方法
     * 使用HS256签名算法和生成的signingKey最终的Token,claims中是有效载荷
     */
    public static String getAccessToken(Map<String, Object> claims,int minutes) {
    	//int minutes=60*1000;
    	long nowMillis = System.currentTimeMillis();//系统当前时间
        Date now = new Date(nowMillis+60*1000*minutes);//设置accessToken一天过期
        return Jwts.builder()
        		.setIssuer("ezsh")
        		.setClaims(claims)
        		.setExpiration(now)
        		.signWith(SignatureAlgorithm.HS256, getKeyInstance())
        		.compact();
    }
    
    /**
     * @author qwc
     * 2017年8月1日下午9:29:54
     * @param accessToken
     * @return Map<String,Object>
     * Token验证方法，解析Token的同时验证token,验证失败返回null
     */
    public static Map<String, Object> parserAccessTokenToMap(String accessToken) {
        try {
            Map<String, Object> jwtClaims =Jwts.parser()
            		.setSigningKey(getKeyInstance())
            		.parseClaimsJws(accessToken)
            		.getBody();
            return jwtClaims;
        } catch (Exception e) {
            log.error("Token验证失败!");
            return null;
        }
    }
    
   /* public static String pToMap(String accessToken) {
        try {
            return Jwts.parser()
            		.setSigningKey(getKeyInstance())
            		.parseClaimsJws(accessToken).toString();
        } catch (Exception e) {
            log.error("Token验证失败!");
            return null;
        }
    }*/

}
