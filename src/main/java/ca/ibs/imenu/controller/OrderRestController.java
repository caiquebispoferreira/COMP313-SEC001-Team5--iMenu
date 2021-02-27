package ca.ibs.imenu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ca.ibs.imenu.dto.ProfitByDay;
import ca.ibs.imenu.dto.SoldProduct;
import ca.ibs.imenu.service.OrderService;
import ca.ibs.imenu.service.ProductService;

@RestController
public class OrderRestController {
	
	@Autowired
    private OrderService orderService;

	@RequestMapping (value = "/getMonthProfitByDay",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<ProfitByDay> getMonthProfitByDay(){
    	return orderService.getMonthProfitByDay();
    }

}
