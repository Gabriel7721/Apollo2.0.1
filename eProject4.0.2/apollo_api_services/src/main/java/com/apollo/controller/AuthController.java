package com.apollo.controller;

import com.apollo.dto.*;
import com.apollo.entity.*;
import com.apollo.exception.RedirectException;
import com.apollo.repository.*;
import com.apollo.service.*;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletResponse;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api")
public class AuthController {

    private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private VerificationTokenRepository verificationTokenRepository;

    @Autowired
    private UserRepository userRepository;
    @Qualifier("shipperService")
    @Autowired
    private ShipperService shipperService;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody UserLoginDTO userLoginDto) {
        JwtResponse jwtResponse = userService.login(userLoginDto);
        return ResponseEntity.ok(jwtResponse);
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody UserRegisterDTO userRegisterDto) {
        logger.info("Register endpoint hit");
        User user = userService.register(userRegisterDto);
        userService.createVerificationToken(user);
        VerificationToken verificationToken = verificationTokenRepository.findByUser(user);
        String token = verificationToken.getToken();
        emailService.sendConfirmEmailToUser(user, token);
        return ResponseEntity.ok(user);
    }

    @PostMapping("/login/shipper")
    public ResponseEntity<?> loginShipper(@RequestBody ShipperLoginDTO shipperLoginDto) {
        try {
            JwtResponse jwtResponse = shipperService.loginShipper(shipperLoginDto);
            return ResponseEntity.ok(jwtResponse);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        }
    }

    @PostMapping("/register/shipper")
    public ResponseEntity<?> registerShipper(@RequestBody ShipperRegisterDTO shipperRegisterDTO) {
        logger.info("Register endpoint hit");
        try {
            Shipper shipper = shipperService.register(shipperRegisterDTO);
            return ResponseEntity.ok(shipper);
        } catch (UsernameNotFoundException e) {
            logger.error("Error during shipper registration: ", e);
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Email has already been registered");
        } catch (Exception e) {
            logger.error("Error during shipper registration: ", e);
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @GetMapping("/register/confirmation")
    public void verifyUser(@RequestParam(name = "token") String token, HttpServletResponse response) throws Exception {
        VerificationToken verificationToken = verificationTokenRepository.findByToken(token);
        if (verificationToken != null) {
            if (verificationToken.getUser() != null) {
                userService.verifyToken(verificationToken, response);
            } else if (verificationToken.getShipper() != null) {
                shipperService.verifyToken(verificationToken, response);
            } else {
                throw new RedirectException("Invalid verification token", "http://localhost:3000/confirm?status=error");
            }
        } else {
            throw new RedirectException("Invalid token", "http://localhost:3000/confirm?status=error");
        }
    }

    @PostMapping("/login/admin")
    public ResponseEntity<?> loginAdmin(@RequestBody AdminLoginDTO adminLoginDto) {
        JwtResponse jwtResponse = adminService.login(adminLoginDto);
        return ResponseEntity.ok(jwtResponse);
    }

    @PostMapping("/register/admin")
    public ResponseEntity<?> registerAdmin(@RequestBody AdminRegisterDTO adminRegisterDto) {
        try {
            Admin registeredAdmin = adminService.register(adminRegisterDto);
            return ResponseEntity.ok(registeredAdmin);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
}
