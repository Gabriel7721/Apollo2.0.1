package apollo.clients.service.catalog;

import apollo.clients.dto.catalog.StoreDTO;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

@SuppressWarnings("unchecked")
@Service
public class StoreService {

  private final String API_BASE_URL = "http://localhost:9999/api/stores";

  private final RestTemplate restTemplate;

  public StoreService(RestTemplate restTemplate) {
    this.restTemplate = restTemplate;
  }

  public List<Map<String, Object>> getAllStores() {
    ResponseEntity<List<Map<String, Object>>> responseEntity = restTemplate.exchange(
        API_BASE_URL,
        HttpMethod.GET,
        null,
        new ParameterizedTypeReference<List<Map<String, Object>>>() {
        });
    return responseEntity.getBody();
  }

  public StoreDTO getStoreById(int id) {
    return restTemplate.getForObject(API_BASE_URL + "/{id}", StoreDTO.class, id);
  }

  public Map<String, Object> createStore(Long adminId, Map<String, Object> storeDto) {
    HttpEntity<Map<String, Object>> request = new HttpEntity<>(storeDto);
    return restTemplate.postForObject(API_BASE_URL + "/create/" + adminId, request, Map.class);
  }

  public void deleteStore(int id) {
    restTemplate.delete(API_BASE_URL + "/{id}", id);
  }

}
