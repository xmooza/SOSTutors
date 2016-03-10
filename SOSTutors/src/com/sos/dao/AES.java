package com.sos.dao;

import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class AES {

	private static final String ALGORITHM = "AES";
	private static final String KEY = "1234567890123456";

	public static String encrypt(String value) throws Exception {
		Key key = generateKey();
		Cipher cipher = Cipher.getInstance(AES.ALGORITHM);
		cipher.init(Cipher.ENCRYPT_MODE, key);
		byte[] encryptedByteValue = cipher.doFinal(value.getBytes("utf-8"));
		String encryptedValue64 = new BASE64Encoder().encode(encryptedByteValue);
		return encryptedValue64;

	}

	public static String decrypt(String value) throws Exception {
		Key key = generateKey();
		Cipher cipher = Cipher.getInstance(AES.ALGORITHM);
		cipher.init(Cipher.DECRYPT_MODE, key);
		byte[] decryptedValue64 = new BASE64Decoder().decodeBuffer(value);
		byte[] decryptedByteValue = cipher.doFinal(decryptedValue64);
		String decryptedValue = new String(decryptedByteValue, "utf-8");
		return decryptedValue;

	}

	private static Key generateKey() throws Exception {
		Key key = new SecretKeySpec(AES.KEY.getBytes(), AES.ALGORITHM);
		return key;
	}

}
