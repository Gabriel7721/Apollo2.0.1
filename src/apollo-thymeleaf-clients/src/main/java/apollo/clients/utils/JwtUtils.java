package apollo.clients.utils;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.Base64;
import java.util.Map;

@SuppressWarnings({ "unused", "unchecked" })
public class JwtUtils {

    public static Map<String, Object> decodePayloadJWT(String jwtToken) throws Exception {
        String[] parts = jwtToken.split("\\.");
        if (parts.length != 3) {
            throw new IllegalArgumentException("Invalid JWT token");
        }

        String headerJson = new String(Base64.getUrlDecoder().decode(parts[0]));
        String payloadJson = new String(Base64.getUrlDecoder().decode(parts[1]));

        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> header = objectMapper.readValue(headerJson, Map.class);
        Map<String, Object> payload = objectMapper.readValue(payloadJson, Map.class);

        return payload;
    }

    public static String decodeSubJWT(String jwtToken) throws Exception {
        String[] parts = jwtToken.split("\\.");
        if (parts.length != 3) {
            throw new IllegalArgumentException("Invalid JWT token");
        }

        String payloadJson = new String(Base64.getUrlDecoder().decode(parts[1]));

        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> payload = objectMapper.readValue(payloadJson, Map.class);

        return (String) payload.get("sub");
    }

    // public static void main(String[] args) {
    //     String token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIzIiwicm9sZSI6IlJPTEVfQURNSU4iLCJlbnRpdHlfdHlwZSI6ImFkbWluIiwiZXhwIjoxNzE5NzY4NjY4LCJpYXQiOjE3MTk2ODIyNjh9.nJTjPc5NSZiOP9O1CKZPMCxqqxqEYqz1l2XR-O4PoSaMhtwwZNwXgX89GWYwh-mTRfOnVEm_gcFl7Omaspro1Q";
    //     try {
    //         Map<String, Object> decodedPayload = decodePayloadJWT(token);
    //         System.out.println("Payload: " + decodedPayload);
    //         Map<String, Object> decodeSubJWT = decodeSubJWT(token);
    //         System.out.println("Payload: " + decodeSubJWT);
    //     } catch (Exception e) {
    //         e.printStackTrace();
    //     }
    // }
}