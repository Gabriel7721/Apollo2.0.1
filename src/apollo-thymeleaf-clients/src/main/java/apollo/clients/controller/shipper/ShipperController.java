package apollo.clients.controller.shipper;

import apollo.clients.dto.shipper.OrderDeliveryDTO;
import apollo.clients.service.shipper.ShipperService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/shipper")
public class ShipperController {

    @Autowired
    private ShipperService shipperService;

    private static final String Layout = "shipper/fragments/_layout";

    static String renderView(Model model, String viewName, String pageTitle, String[] breadcrumb) {
        model.addAttribute("view", viewName);
        model.addAttribute("title", pageTitle);
        model.addAttribute("breadcrumb", breadcrumb);
        model.addAttribute("activeView", viewName);
        return Layout;
    }

    @GetMapping()
    public String home(Model model) {
        String[] breadcrumb = { "Shipper Dashboard" };
        return renderView(model, "shipper/index", "Dashboard", breadcrumb);
    }

    @GetMapping("/neworder")
    public String newOrder(Model model, HttpSession session) {
        String[] breadcrumb = { "Shipper Dashboard" };
        List<Map<String, Object>> orders = shipperService.getAllShopOrdersByStatus("ACCEPTED");
//        List<Object> shippers = shipperService.getAllShippers();
        String shipperEmail = (String) session.getAttribute("shipperEmail");

        model.addAttribute("orders", orders);
//        model.addAttribute("shippers", shippers);
        model.addAttribute("shipperEmail", shipperEmail);

        return renderView(model, "shipper/pages/catalog/neworder", "NewOrder", breadcrumb);
    }


    @GetMapping("/process")
    public String process(Model model, HttpSession session) {
        String[] breadcrumb = {"Shipper Dashboard"};
        List<Map<String, Object>> orderDeliveries = shipperService.getAllOrderDeliveriesByStatus("PENDING");
        String shipperEmail = (String) session.getAttribute("shipperEmail");

        model.addAttribute("orderDeliveries", orderDeliveries);
        model.addAttribute("shipperEmail", shipperEmail);

        return renderView(model, "shipper/pages/catalog/process", "Process", breadcrumb);
    }


    @PostMapping("/acceptOrder")
    public String acceptOrder(@RequestParam Long orderId, @RequestParam String shipperEmail, Model model) {
        if (shipperEmail == null || shipperEmail.isEmpty()) {
            model.addAttribute("error", "Shipper email cannot be null or empty.");
            return "redirect:/shipper/neworder";
        }
        shipperService.saveOrderDelivery(orderId, shipperEmail);
        return "redirect:/shipper/process";
    }

    @PostMapping("/updateOrderStatus")
    public String updateOrderStatus(@RequestParam Long orderId, @RequestParam String newStatus, @RequestParam(required = false) String inducement) {
        shipperService.changeOrderStatus(orderId, newStatus, inducement);
        return "redirect:/shipper/completed";
    }


    @GetMapping("/completed")
    public String completed(Model model, HttpSession session) {
        String[] breadcrumb = { "Shipper Dashboard" };
        List<Map<String, Object>> orders = shipperService.getAllOrderDeliveriesByStatus("COMPLETED");
        List<Object> shippers = shipperService.getAllShippers();
        String shipperEmail = (String) session.getAttribute("shipperEmail");

        model.addAttribute("orders", orders);
        model.addAttribute("shippers", shippers);
        model.addAttribute("shipperEmail", shipperEmail);

        return renderView(model, "shipper/pages/catalog/completed", "Completed", breadcrumb);
    }

    @GetMapping("/cancel")
    public String cancel(Model model, HttpSession session) {
        String[] breadcrumb = { "Shipper Dashboard" };
        List<Map<String, Object>> orders = shipperService.getAllOrderDeliveriesByStatus("CANCEL");
        List<Object> shippers = shipperService.getAllShippers();
        String shipperEmail = (String) session.getAttribute("shipperEmail");

        model.addAttribute("orders", orders);
        model.addAttribute("shippers", shippers);
        model.addAttribute("shipperEmail", shipperEmail);

        return renderView(model, "shipper/pages/catalog/cancel", "Cancel", breadcrumb);
    }

    @GetMapping("/detail-order/{orderId}")
    public String detailOrder(@PathVariable Long orderId, Model model, HttpSession session) {
        String[] breadcrumb = { "Shipper Dashboard" };

        String shipperEmail = (String) session.getAttribute("shipperEmail");

        model.addAttribute("shipperEmail", shipperEmail);

        Map<String, Object> order = shipperService.getShopOrderById(orderId);

        model.addAttribute("order", order);

        return renderView(model, "shipper/pages/details/detailorder", "Order Detail", breadcrumb);
    }

    @GetMapping("/detail-delivery/{orderId}")
    public String detailDelivery(@PathVariable Long orderId, Model model, HttpSession session) {
        String[] breadcrumb = { "Shipper Dashboard" };

        String shipperEmail = (String) session.getAttribute("shipperEmail");

        model.addAttribute("shipperEmail", shipperEmail);
        Map<String, Object> orderDelivery = shipperService.getOrderDeliveryById(orderId);

        model.addAttribute("orderDeliveryDTO", new OrderDeliveryDTO());

        model.addAttribute("orderDelivery", orderDelivery);

        return renderView(model, "shipper/pages/details/detaildelivery", "Delivery Detail", breadcrumb);
    }

    @GetMapping("/detail-completed/{orderId}")
    public String detailCompleted(@PathVariable Long orderId, Model model, HttpSession session) {
        String[] breadcrumb = { "Shipper Dashboard" };

        Map<String, Object> orderDelivery = shipperService.getOrderDeliveryById(orderId);
        model.addAttribute("orderDelivery", orderDelivery);

        return renderView(model, "shipper/pages/details/detailcompleted", "Delivery Detail", breadcrumb);
    }

    @GetMapping("/detail-cancel/{orderId}")
    public String detailCancel(@PathVariable Long orderId, Model model, HttpSession session) {
        String[] breadcrumb = { "Shipper Dashboard" };

        Map<String, Object> orderDelivery = shipperService.getOrderDeliveryById(orderId);
        model.addAttribute("orderDelivery", orderDelivery);

        return renderView(model, "shipper/pages/details/detailcancel", "Delivery Detail", breadcrumb);
    }

}
