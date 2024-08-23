package apollo.clients.controller.admin.sale;

import apollo.clients.controller.admin.AdminController;
import apollo.clients.service.sale.OrderService;
import apollo.clients.service.shipper.ShipperService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/dashboard/sales/order")
public class OrderManagerCtrl {

    private static final String orderDirect = "admin/pages/sale/orders/";

    private final OrderService orderService;

    private final ShipperService shipperService;

    public OrderManagerCtrl(OrderService orderService, ShipperService shipperService) {
        this.orderService = orderService;
        this.shipperService = shipperService;
    }

    @GetMapping()
    public String index(Model model) {
        String[] breadcrumb = { "Catalog", "Orders" };

        model.addAttribute("orders", orderService.getAllOrders());
        model.addAttribute("order_pending", shipperService.getAllShopOrdersByStatus("PENDING"));

        return AdminController.renderView(model, orderDirect + "index", "Orders", breadcrumb);
    }

    @GetMapping("/cancel")
    public String cancel(Model model) {
        String[] breadcrumb = { "Admin Dashboard" };

        List<Map<String, Object>> orders = shipperService.getAllOrderDeliveriesByStatus("CANCEL");

        model.addAttribute("orders", orders);

        return AdminController.renderView(model, orderDirect + "cancel", "Orders Cancel", breadcrumb);
    }

    @PostMapping("/submit/{orderId}")
    public String submit(@PathVariable Long orderId) {
        shipperService.acceptOrder(orderId);
        return "redirect:/admin/pages/sale/orders/index";
    }

    @GetMapping("/detail-order/{orderId}")
    public String detailOrder(Model model, @PathVariable("orderId") Long orderId, HttpSession session) {
        String[] breadcrumb = { "Admin Dashboard" };

        Map<String, Object> order = shipperService.getShopOrderById(orderId);

        model.addAttribute("order", order);

        return AdminController.renderView(model, orderDirect + "detailorder", "Detail", breadcrumb);
    }

    @GetMapping("/detail-cancel/{orderId}")
    public String detailCancel(Model model, @PathVariable("orderId") Long orderId) {
        String[] breadcrumb = { "Admin Dashboard" };

        Map<String, Object> orderDelivery = shipperService.getOrderDeliveryById(orderId);
        model.addAttribute("orderDelivery", orderDelivery);

        return AdminController.renderView(model, orderDirect + "detailcancel", "Detail", breadcrumb);
    }
}
