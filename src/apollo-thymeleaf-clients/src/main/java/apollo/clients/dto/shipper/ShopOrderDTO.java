package apollo.clients.dto.shipper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ShopOrderDTO {
    private int id;
    private String status;
    private String orderDate;
    private String deliveryDate;
    private int quantity;
    private Double orderTotal;
}

