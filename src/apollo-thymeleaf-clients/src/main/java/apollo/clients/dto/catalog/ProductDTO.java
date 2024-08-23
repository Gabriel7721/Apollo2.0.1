package apollo.clients.dto.catalog;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductDTO {
    private Long id;
    private String title;
    private String description;
    private String mainPicture;
    private String status;
    private CategoryDTO category;
    private StoreCategoryDTO storeCategory;
    private StoreDTO store;
    private VariantDTO variants;
    private MultipartFile mainPicturePatch;

}
