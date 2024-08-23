package apollo.clients.controller.admin.catalog;

import apollo.clients.controller.admin.AdminController;
import apollo.clients.dto.catalog.StoreCategoryDTO;
import apollo.clients.dto.catalog.StoreDTO;
import apollo.clients.service.catalog.StoreCategoryService;
import apollo.clients.service.catalog.StoreService;
import apollo.clients.utils.JwtUtils;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/dashboard/catalog/stores")
public class StoreManagerCtrl {

    private static final String pageDirect = "admin/pages/catalog/stores/";

    private final StoreService service;

    private final StoreCategoryService storeCategoryService;

    public StoreManagerCtrl(StoreService service, StoreCategoryService storeCategoryService) {
        this.service = service;
        this.storeCategoryService = storeCategoryService;
    }

    @GetMapping()
    public String stores(Model model) {
        String[] breadcrumb = { "Catalog", "Stores" };
        try {
            List<Map<String, Object>> stores = service.getAllStores();
            model.addAttribute("stores", stores);
        } catch (Exception ignored) {
        }

        return AdminController.renderView(model, pageDirect + "index", "Stores", breadcrumb);
    }

    @PostMapping("/create-store-categories")
    public String createStoreCategory(@ModelAttribute StoreCategoryDTO storeCategoryDTO, Model model) {
        try {
            storeCategoryService.createStoreCategory(storeCategoryDTO);
            return stores(model);
        } catch (Exception ignored) {
        }
        return stores(model);
    }

    @GetMapping("/{id}")
    public String getStoreById(@PathVariable("id") int id, Model model) {
        String[] breadcrumb = { "Catalog", "Stores", "Detail" };

        StoreDTO store = service.getStoreById(id);

        model.addAttribute("storeCategoryDTO", new StoreCategoryDTO());
        model.addAttribute("store", store);
        model.addAttribute("categories", storeCategoryService.getStoreCategoriesByStoreId(id));

        return AdminController.renderView(model, pageDirect + "detail", "Store Detail - " + store.getName(),
                breadcrumb);
    }

    @GetMapping("/new")
    public String newStoreForm(Model model) {
        String[] breadcrumb = { "Catalog", "Stores", "Add Store" };
        model.addAttribute("store", new StoreDTO());
        return AdminController.renderView(model, pageDirect + "new", "Add Store", breadcrumb);
    }

    @PostMapping()
    public String createStore(@ModelAttribute StoreDTO storeDTO, Model model, HttpSession session) {
        try {
            String token = (String) session.getAttribute("jwtToken");
            Map<String, Object> storeMap = new HashMap<>();
            storeMap.put("name", storeDTO.getName());

            service.createStore(Long.parseLong(JwtUtils.decodeSubJWT(token)), storeMap);
            return "redirect:/dashboard/catalog/stores";
        } catch (Exception e) {
            model.addAttribute("error", "Không thể tạo store mới: " + e.getMessage());
            return newStoreForm(model);
        }
    }

    @GetMapping("/{id}/delete")
    public String deleteStore(@PathVariable("id") int id, Model model) {
        try {
            service.deleteStore(id);
            return "redirect:/dashboard/catalog/categories";
        } catch (Exception e) {
            model.addAttribute("error", "Không thể xóa store");
            return stores(model);
        }
    }

}
