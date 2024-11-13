<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Show Time - Chalana Chitram</title>
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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .container {
            max-width: 1200px;
            margin: 8rem auto 4rem;
            padding: 2rem;
            animation: fadeIn 0.8s ease;
        }

        .movie-details {
            display: flex;
            gap: 2rem;
            margin-bottom: 3rem;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            backdrop-filter: blur(10px);
            animation: fadeInDown 0.8s ease;
        }

        .movie-poster {
            width: 250px;
            height: 375px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
            position: relative;
            transition: transform 0.3s ease;
        }

        .movie-poster:hover {
            transform: scale(1.02);
        }

        .movie-poster img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .movie-info {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .movie-info h1 {
            color: var(--accent-color);
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .movie-meta {
            display: flex;
            gap: 2rem;
            color: #ccc;
            font-size: 1.1rem;
        }

        .meta-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .meta-item i {
            color: var(--accent-color);
        }

        .date-selector {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            overflow-x: auto;
            padding: 1rem 0;
            scrollbar-width: none;
            animation: fadeInUp 0.8s ease;
        }

        .date-selector::-webkit-scrollbar {
            display: none;
        }

        .date-box {
            padding: 1rem 1.5rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            cursor: pointer;
            min-width: 120px;
            text-align: center;
            transition: all 0.3s ease;
        }

        .date-box:hover {
            transform: translateY(-2px);
            background: rgba(255, 255, 255, 0.1);
        }

        .date-box.active {
            background: var(--primary-color);
            color: white;
            box-shadow: 0 5px 15px rgba(225, 27, 27, 0.3);
        }

        .theater-section {
            margin-bottom: 2rem;
            padding: 1.5rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            backdrop-filter: blur(10px);
            animation: fadeIn 1s ease;
        }

        .theater-name {
            font-size: 1.3rem;
            margin-bottom: 1.5rem;
            color: var(--accent-color);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .show-times {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .show-time {
            padding: 1rem 1.5rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
        }

        .show-time:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .price {
            margin-top: 0.5rem;
            color: var(--accent-color);
            font-size: 0.9rem;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
                margin-top: 6rem;
            }

            .movie-details {
                flex-direction: column;
                padding: 1rem;
            }

            .movie-poster {
                width: 200px;
                height: 300px;
                margin: 0 auto;
            }

            .date-selector {
                padding: 0.5rem;
            }

            .show-times {
                gap: 0.5rem;
            }

            .show-time {
                padding: 0.8rem 1.2rem;
            }
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
    <div class="container">
        <div class="movie-details">
            <div class="movie-poster">
                <div class="movie-poster">
    <img src="<%= request.getParameter("image") %>" alt="<%= request.getParameter("movie") %> Poster">
</div>
            </div>
            <div class="movie-info">
                <h1><%= request.getParameter("movie") %></h1>
                <div class="movie-meta">
                    <div class="meta-item">
                        <i class="fas fa-star"></i>
                        <span>4.5/5</span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-clock"></i>
                        <span>2h 30m</span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-film"></i>
                        <span>Action, Adventure</span>
                    </div>
                </div>
                <div class="meta-item">
                    <i class="fas fa-language"></i>
                    <span>English, Hindi, Telugu</span>
                </div>
                <div class="meta-item">
                    <i class="fas fa-closed-captioning"></i>
                    <span>U/A</span>
                </div>
            </div>
        </div>

        <div class="date-selector">
            <%
            String[] dates = {"Today", "Tomorrow", "Sun", "Mon", "Tue"};
            for(int i = 0; i < dates.length; i++) {
            %>
                <div class="date-box <%= i == 0 ? "active" : "" %>">
                    <div><%= dates[i] %></div>
                    <div style="font-size: 0.9em; margin-top: 0.5rem;">Nov <%= i + 8 %></div>
                </div>
            <% } %>
        </div>

        <%
        String[] theaters = {"PVR Cinemas", "INOX Movies", "Cinepolis"};
        String[] times = {"10:30 AM", "1:45 PM", "4:30 PM", "7:15 PM", "10:00 PM"};
        for(String theater : theaters) {
        %>
            <div class="theater-section">
                <h3 class="theater-name">
                    <i class="fas fa-theater-masks"></i>
                    <%= theater %>
                </h3>
                <div class="show-times">
                    <% for(String time : times) { %>
                        <div class="show-time" onclick="selectShowTime('<%= theater %>', '<%= time %>')">
                            <div><%= time %></div>
                            <div class="price">₹250</div>
                        </div>
                    <% } %>
                </div>
            </div>
        <% } %>
    </div>
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
        // Handle date selection
        document.querySelectorAll('.date-box').forEach(box => {
            box.addEventListener('click', () => {
                document.querySelector('.date-box.active').classList.remove('active');
                box.classList.add('active');
            });
        });

        // Handle show time selection
        function selectShowTime(theater, time) {
            const movie = '<%= request.getParameter("movie") %>';
            // Add smooth transition animation
            document.body.style.opacity = '0.5';
            setTimeout(() => {
                window.location.href = `selectSeats.jsp?movie=${encodeURIComponent(movie)}&theater=${encodeURIComponent(theater)}&time=${encodeURIComponent(time)}`;
            }, 300);
        }

        // Add smooth scroll behavior
        document.addEventListener('DOMContentLoaded', () => {
            const theaterSections = document.querySelectorAll('.theater-section');
            theaterSections.forEach((section, index) => {
                setTimeout(() => {
                    section.style.opacity = '1';
                }, 200 * (index + 1));
            });
        });
    </script>
</body>
</html>