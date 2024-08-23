package apollo.clients.service.catalog;

import java.util.List;
import java.util.Map;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import apollo.clients.dto.catalog.ProductDTO;

@Service
public class ProductService {

    private final String API_BASE_URL = "http://localhost:9999/api/products";

    private final RestTemplate restTemplate;

    public ProductService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public List<Map<String, Object>> getProducts() {
        ResponseEntity<List<Map<String, Object>>> response = restTemplate.exchange(
                API_BASE_URL,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<List<Map<String, Object>>>() {
                });
        return response.getBody();
    }

    public ProductDTO getProductById(int id) {
        return restTemplate.getForObject(API_BASE_URL + "/{id}", ProductDTO.class, id);
    }

    public ProductDTO createProduct(ProductDTO productDTO) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<ProductDTO> request = new HttpEntity<>(productDTO, headers);

        ResponseEntity<ProductDTO> response = restTemplate.postForEntity(API_BASE_URL, request, ProductDTO.class);

        if (response.getStatusCode() != HttpStatus.CREATED) {
            throw new RuntimeException("Failed to create product");
        }

        return response.getBody();
    }

    public ProductDTO updateProduct(int id, ProductDTO productDTO) {
        HttpEntity<ProductDTO> request = new HttpEntity<>(productDTO);
        ResponseEntity<ProductDTO> response = restTemplate.exchange(
                API_BASE_URL + "/{id}",
                HttpMethod.PUT,
                request,
                ProductDTO.class,
                id
        );
        return response.getBody();
    }
}
