package apollo.clients.controller.admin.catalog;

import java.util.List;
import java.util.Map;

import apollo.clients.controller.admin.AdminController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import apollo.clients.dto.catalog.ProductDTO;
import apollo.clients.dto.catalog.VariantDTO;
import apollo.clients.service.catalog.CategoryService;
import apollo.clients.service.catalog.ProductService;
import apollo.clients.service.catalog.StoreCategoryService;
import apollo.clients.service.catalog.StoreService;
import apollo.clients.service.catalog.VariantService;
import apollo.clients.utils.FileUploadUtil;

@Controller
@RequestMapping("/dashboard/catalog/products")
public class ProductManagerCtrl {

    private static final String productDirect = "admin/pages/catalog/products/";

    private final ProductService service;

    private final VariantService variantService;

    private final CategoryService categoryService;

    private final StoreService storeService;

    private final StoreCategoryService storeCategoryService;

    public ProductManagerCtrl(ProductService service, VariantService variantService, CategoryService categoryService, StoreService storeService, StoreCategoryService storeCategoryService) {
        this.service = service;
        this.variantService = variantService;
        this.categoryService = categoryService;
        this.storeService = storeService;
        this.storeCategoryService = storeCategoryService;
    }

    @GetMapping()
    public String products(Model model) {
        String[] breadcrumb = {"Catalog", "Products"};

        try {
            List<Map<String, Object>> products = service.getProducts();
            model.addAttribute("products", products);
        } catch (Exception ignored) {
        }

        return AdminController.renderView(model, productDirect + "index", "Products", breadcrumb);
    }

    @GetMapping("/{id}")
    public String getProductById(@PathVariable int id, Model model) {
        String[] breadcrumb = {"Catalog", "Products", "Detail"};

        ProductDTO product = service.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("variant", new VariantDTO());
        model.addAttribute("variants", variantService.getVariantsByProductId(id));
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("stores", storeService.getAllStores());
        model.addAttribute("store_categories", storeCategoryService.getAllStoreCategories());

        return AdminController.renderView(model, productDirect + "detail", "Product Detail - " + product.getTitle(), breadcrumb);
    }

    @PostMapping("/save/variant/{productId}")
    public String createVariantForProduct(@PathVariable int productId,
                                          @RequestBody VariantDTO variantDTO,
                                          @RequestParam(value = "imgPatch", required = false) MultipartFile imgPatch,
                                          Model model) {
        try {
            if (variantDTO.getImgPatch() != null && !variantDTO.getImgPatch().isEmpty()) {
                String imagePath = FileUploadUtil.saveFile(imgPatch, "variants", variantDTO.getName());
                variantDTO.setImg(imagePath);
            }
            variantDTO.setImgPatch(null);
            variantService.createVariantForProduct(productId, variantDTO);
            return getProductById(productId, model);
        } catch (Exception e) {
            return getProductById(productId, model);
        }
    }

    @GetMapping("new")
    public String newProductForm(Model model) {
        String[] breadcrumb = {"Catalog", "Products", "Add Product"};
        model.addAttribute("productDTO", new ProductDTO());
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("stores", storeService.getAllStores());
        model.addAttribute("store_categories", storeCategoryService.getAllStoreCategories());
        return AdminController.renderView(model, productDirect + "new", "Add Product", breadcrumb);
    }

    @PostMapping("/create")
    public String createProduct(@ModelAttribute ProductDTO productDTO,
                                @RequestParam(value = "mainPicturePatch", required = false) MultipartFile mainPicturePatch,
                                Model model) {
        try {
            if (productDTO.getMainPicturePatch() != null && !productDTO.getMainPicturePatch().isEmpty()) {
                String imagePath = FileUploadUtil.saveFile(mainPicturePatch, "products", productDTO.getTitle());
                productDTO.setMainPicture(imagePath);
            }
            productDTO.setMainPicturePatch(null);
            service.createProduct(productDTO);
            return products(model);
        } catch (Exception e) {
            return newProductForm(model);
        }
    }

    @PostMapping("/{id}")
    public String updateProduct(@PathVariable int id,
                                @ModelAttribute ProductDTO productDTO,
                                @RequestParam(value = "mainPicturePatch", required = false) MultipartFile mainPicturePatch,
                                Model model) {
        try {
            ProductDTO existingProduct = service.getProductById(id);

            existingProduct.setTitle(productDTO.getTitle());
            existingProduct.setDescription(productDTO.getDescription());
            existingProduct.setStatus(productDTO.getStatus());
            existingProduct.setCategory(productDTO.getCategory());
            existingProduct.setStore(productDTO.getStore());
            existingProduct.setStoreCategory(productDTO.getStoreCategory());

            if (mainPicturePatch != null && !mainPicturePatch.isEmpty()) {
                String imagePath = FileUploadUtil.saveFile(mainPicturePatch, "products", existingProduct.getTitle());
                existingProduct.setMainPicture(imagePath);
            }

            service.updateProduct(id, existingProduct);

            model.addAttribute("message", "Product updated successfully");
            return products(model);
        } catch (Exception e) {
            model.addAttribute("error", "Failed to update product: " + e.getMessage());
            return getProductById(id, model);
        }

    }
}
