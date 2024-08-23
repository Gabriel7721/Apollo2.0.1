package apollo.clients.service.catalog;

import apollo.clients.dto.catalog.StoreCategoryDTO;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

@Service
public class StoreCategoryService {

  private final String API_BASE_URL = "http://localhost:9999/api/store-category";

  private final RestTemplate restTemplate;

  public StoreCategoryService(RestTemplate restTemplate) {
    this.restTemplate = restTemplate;
  }

  public List<Map<String, Object>> getAllStoreCategories() {
    ResponseEntity<List<Map<String, Object>>> responseEntity = restTemplate.exchange(
            API_BASE_URL,
            HttpMethod.GET,
            null,
            new ParameterizedTypeReference<List<Map<String, Object>>>() {
            });
    return responseEntity.getBody();
  }

  public List<StoreCategoryDTO> getStoreCategoriesByStoreId(int storeId) {
    ResponseEntity<List<StoreCategoryDTO>> response = restTemplate.exchange(
        API_BASE_URL + "/by-store/" + storeId,
        HttpMethod.GET,
        null,
        new ParameterizedTypeReference<List<StoreCategoryDTO>>() {
        });
    return response.getBody();
  }

  public StoreCategoryDTO createStoreCategory(StoreCategoryDTO storeCategoryDTO) {
    return restTemplate.postForObject(API_BASE_URL, storeCategoryDTO, StoreCategoryDTO.class);
  }

}
