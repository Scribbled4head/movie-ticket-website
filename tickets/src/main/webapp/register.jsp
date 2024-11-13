<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Chalana Chitram</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary-color: #e11b1b;
            --secondary-color: #1a1a1a;
            --accent-color: #ffd700;
        }

      body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 100%);
            color: white;
        }

        .header {
            background: rgba(0, 0, 0, 0.9);
            padding: 1rem 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            backdrop-filter: blur(10px);
        }

        .nav-container {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 2rem;
        }

        .logo {
            color: var(--primary-color);
            font-size: 2rem;
            font-weight: bold;
            text-decoration: none;
            text-transform: uppercase;
            letter-spacing: 2px;
            transition: all 0.3s ease;
        }

        .logo:hover {
            color: var(--accent-color);
            transform: scale(1.05);
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            align-items: center;
        }

        .nav-links a, .dropdown-btn {
            color: white;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            transition: all 0.3s ease;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .nav-links a:hover, .dropdown-btn:hover {
            color: var(--primary-color);
            background: rgba(255, 255, 255, 0.1);
        }

        .dropdown {
            position: relative;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background: rgba(0, 0, 0, 0.95);
            min-width: 200px;
            border-radius: 10px;
            padding: 0.5rem 0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            z-index: 1000;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content a {
            padding: 0.8rem 1.5rem;
            border-radius: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .login-container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 8rem 2rem 4rem;
        }

        .login-box {
            background: rgba(255, 255, 255, 0.1);
            padding: 3rem;
            border-radius: 20px;
            width: 100%;
            max-width: 450px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
        }

        .login-title {
            text-align: center;
            margin-bottom: 2.5rem;
            color: var(--accent-color);
            font-size: 2.2rem;
            font-weight: 600;
        }

        .input-group {
            margin-bottom: 2rem;
            position: relative;
        }

        .input-group label {
            display: block;
            margin-bottom: 0.8rem;
            color: #fff;
            font-size: 1.1rem;
        }

        .input-group input {
            width: 100%;
            padding: 1rem 1.5rem;
            border: 2px solid rgba(255, 255, 255, 0.1);
            border-radius: 25px;
            background: rgba(255, 255, 255, 0.05);
            color: white;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }

        .input-group input:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 10px rgba(225, 27, 27, 0.3);
        }

        .input-group i {
            position: absolute;
            right: 1.5rem;
            top: 3.2rem;
            color: rgba(255, 255, 255, 0.5);
        }

        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .remember-me {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .forgot-password {
            color: var(--accent-color);
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .forgot-password:hover {
            color: var(--primary-color);
        }

        .login-btn {
            width: 100%;
            padding: 1rem;
            background: var(--primary-color);
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1.2rem;
            font-weight: 600;
            transition: all 0.3s ease;
            margin-bottom: 1.5rem;
        }

        .login-btn:hover {
            background: #ff2b2b;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(225, 27, 27, 0.3);
        }

        .register-link {
            text-align: center;
            color: #ccc;
        }

        .register-link a {
            color: var(--accent-color);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .register-link a:hover {
            color: var(--primary-color);
        }

        .footer {
            background: rgba(0, 0, 0, 0.95);
            padding: 4rem 0 2rem;
            margin-top: auto;
        }

        .footer-content {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 3rem;
        }

        .footer-section h3 {
            color: var(--accent-color);
            margin-bottom: 1.5rem;
            font-size: 1.3rem;
            position: relative;
        }

        .footer-section h3::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -0.5rem;
            width: 50px;
            height: 2px;
            background: var(--primary-color);
        }

        .footer-section p {
            color: #ccc;
            line-height: 1.8;
            margin-bottom: 1rem;
        }

        .footer-section a {
            color: #ccc;
            text-decoration: none;
            transition: all 0.3s ease;
            display: block;
            margin-bottom: 0.8rem;
        }

        .footer-section a:hover {
            color: var(--accent-color);
            padding-left: 0.5rem;
        }

        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .social-links a {
            color: white;
            background: rgba(255, 255, 255, 0.1);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            margin-bottom: 0;
        }

        .social-links a:hover {
            background: var(--primary-color);
            transform: translateY(-3px);
            padding-left: 0;
        }

        .footer-bottom {
            text-align: center;
            padding-top: 2rem;
            margin-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: #888;
        }

        @media (max-width: 768px) {
            .nav-container {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem;
            }

            .nav-links {
                flex-direction: column;
                width: 100%;
                gap: 0.5rem;
            }

            .dropdown-content {
                position: static;
                width: 100%;
                box-shadow: none;
                margin-top: 0.5rem;
            }

            .login-box {
                padding: 2rem;
            }

            .footer-content {
                grid-template-columns: 1fr;
                gap: 2rem;
            }
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="nav-container">
            <a href="index.jsp" class="logo">
                <i class="fas fa-film"></i> Chalana Chitram
            </a>
            <nav class="nav-links">
                <div class="dropdown">
                    <span class="dropdown-btn">
                        <i class="fas fa-bars"></i> Menu
                        <i class="fas fa-chevron-down"></i>
                    </span>
                    <div class="dropdown-content">
                        <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
                        <a href="about.jsp"><i class="fas fa-info-circle"></i> About Us</a>
                        <a href="contact.jsp"><i class="fas fa-envelope"></i> Contact</a>
                        <a href="faq.jsp"><i class="fas fa-question-circle"></i> FAQ</a>
                    </div>
                </div>
                <a href="movies.jsp"><i class="fas fa-video"></i> Movies</a>
                <a href="theaters.jsp"><i class="fas fa-theater-masks"></i> Theaters</a>
                <a href="myBookings.jsp"><i class="fas fa-ticket-alt"></i> My Bookings</a>
                <a href="login.jsp" class="active"><i class="fas fa-user"></i> Login</a>
            </nav>
        </div>
    </header>

    <main class="login-container">
        <div class="login-box">
            <h2 class="login-title"></h2>
          <form action="loginController" method="post">
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                    <i class="fas fa-user"></i>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                    <i class="fas fa-lock"></i>
                </div>
                 <div class="input-group">
                    <label for="password">Confirm Password</label>
                    <input type="password" id="password" name="confirm password" required>
                    <i class="fas fa-lock"></i>
                </div>
                  <div class="input-group">
                    <label for="email">Email-id</label>
                    <input type="email" id="email" name="email" required>
                    <i class="fas fa-lock"></i>
                </div>
                 <div class="input-group">
                    <label for="mobile number">Mobile n.o</label>
                    <input type="mobile number" id="mobiler number" name="mobile_number" required>
                    <i class="fas fa-lock"></i>
                </div>
                
              
                <button type="submit" class="login-btn">Register</button>
                
            </form>
        </div>
    </main>

    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>About Us</h3>
                <p>Chalana Chitram is your premier destination for booking movie tickets online. Experience the magic of cinema with comfort and convenience.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <a href="privacy.jsp">Privacy Policy</a>
                <a href="terms.jsp">Terms of Service</a>
                <a href="refund.jsp">Refund Policy</a>
                <a href="career.jsp">Careers</a>
            </div>
            <div class="footer-section">
                <h3>Connect With Us</h3>
                <p>Follow us on social media for updates, movie news, and exclusive offers!</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="footer-section">
                <h3>Contact Info</h3>
                <p>
                    <i class="fas fa-phone"></i> +1 234 567 8900<br>
                    <i class="fas fa-envelope"></i> info@chalanachitram.com<br>
                    <i class="fas fa-map-marker-alt"></i> 123 Movie Street, Cinema City, CC 12345
                </p>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 Chalana Chitram. All rights reserved.</p>
        </div>
    </footer>

    <script>
        // Add header shadow on scroll
        window.addEventListener('scroll', function() {
            const header = document.querySelector('.header');
            if (window.scrollY > 0) {
                header.style.boxShadow = '0 2px 10px rgba(0,0,0,0.3)';
            } else {
                header.style.boxShadow = 'none';
            }
        });

        // Toggle password visibility
        document.querySelector('.input-group i.fa-lock').addEventListener('click', function() {
            const passwordInput = document.querySelector('#password');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                this.classList.remove('fa-lock');
                this.classList.add('fa-lock-open');
            } else {
                passwordInput.type = 'password';
                this.classList.remove('fa-lock-open');
                this.classList.add('fa-lock');
            }
        });
    </script>
</body>
</html>