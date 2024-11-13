<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chalana chitram - Book Your Tickets</title>
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
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .nav-links a:before {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            width: 0;
            height: 2px;
            background-color: var(--primary-color);
            transition: all 0.3s ease;
            transform: translateX(-50%);
        }

        .nav-links a:hover:before {
            width: 80%;
        }

        .nav-links a:hover {
            color: var(--primary-color);
            background: rgba(255, 255, 255, 0.1);
        }

        .movie-container {
            max-width: 1400px;
            margin: 7rem auto 2rem;
            padding: 0 2rem;
        }

        .section-title {
            font-size: 2.5rem;
            margin-bottom: 2rem;
            text-align: center;
            color: white;
            position: relative;
            padding-bottom: 1rem;
        }

        .section-title:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: var(--primary-color);
        }

        .movie-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
            padding: 2rem 0;
        }

        .movie-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            transition: all 0.4s ease;
            position: relative;
        }

        .movie-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.5);
        }

        .movie-poster {
            position: relative;
            height: 400px;
            overflow: hidden;
        }

        .movie-poster img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .movie-card:hover .movie-poster img {
            transform: scale(1.1);
        }

        .movie-info {
            padding: 1.5rem;
            background: linear-gradient(to top, rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0.7));
        }
        .movie-title {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: white;
        }

        .movie-details {
            display: grid;
            gap: 0.8rem;
            margin-bottom: 1.5rem;
            color: #ccc;
        }

        .movie-details p {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .movie-details i {
            color: var(--accent-color);
        }

        .book-btn {
            background: var(--primary-color);
            color: white;
            padding: 1rem 2rem;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            width: 100%;
            font-size: 1.1rem;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .book-btn:hover {
            background: #ff2b2b;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(225, 27, 27, 0.3);
        }

        .book-btn:active {
            transform: translateY(0);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .movie-card {
            animation: fadeIn 0.6s ease-out forwards;
        }

        .movie-card:nth-child(2) { animation-delay: 0.2s; }
        .movie-card:nth-child(3) { animation-delay: 0.4s; }
        .movie-card:nth-child(4) { animation-delay: 0.6s; }

        @media (max-width: 768px) {
            .nav-container {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem;
            }

            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
                gap: 1rem;
            }

            .movie-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            }

            .section-title {
                font-size: 2rem;
            }
        }

        .genre-tag {
            display: inline-block;
            padding: 0.3rem 0.8rem;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            margin: 0.2rem;
            font-size: 0.9rem;
            color: var(--accent-color);
        }

        .rating-stars {
            color: var(--accent-color);
            margin-right: 0.5rem;
        }

        .coming-soon {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: var(--primary-color);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 15px;
            font-weight: bold;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
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
                <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
                <a href="movies.jsp"><i class="fas fa-video"></i> Movies</a>
                <a href="theaters.jsp"><i class="fas fa-theater-masks"></i> Theaters</a>
                <a href="myBookings.jsp"><i class="fas fa-ticket-alt"></i> My Bookings</a>
                <a href="login.jsp"><i class="fas fa-user"></i> Login</a>
            </nav>
        </div>
    </header>

    <main class="movie-container">
        <h2 class="section-title">Now Showing</h2>
        <div class="movie-grid">
            <div class="movie-card">
                <div class="movie-poster">
                    <img src="movie2.jpeg" alt="breaking bad">
                </div>
                <div class="movie-info">
                    <h3 class="movie-title">breaking bad</h3>
                    <div class="movie-details">
                        <p>
                            <span class="rating-stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </span>
                            4.8/5
                        </p>
                        <p><i class="fas fa-clock"></i> 2h 46m</p>
                        <div>
                            <span class="genre-tag">Sci-Fi</span>
                            <span class="genre-tag">Adventure</span>
                        </div>
                    </div>
                  <button class="book-btn" onclick="location.href='selectShow.jsp?movie=breaking-bad&image=movie2.jpeg'">
    Book Now
</button>
                    
                </div>
            </div>
            

            <div class="movie-card">
                <div class="movie-poster">
                    <img src="movie3.jpeg" alt="The Batman">
                    <div class="coming-soon">Coming Soon</div>
                </div>
                <div class="movie-info">
                    <h3 class="movie-title">The Batman</h3>
                    <div class="movie-details">
                        <p>
                            <span class="rating-stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </span>
                            4.5/5
                        </p>
                        <p><i class="fas fa-clock"></i> 2h 56m</p>
                        <div>
                            <span class="genre-tag">Action</span>
                            <span class="genre-tag">Drama</span>
                        </div>
                    </div>
                    <button class="book-btn" style="background: #666;" disabled>
                        Coming Soon
                    </button>
                </div>
            </div>

            <div class="movie-card">
                <div class="movie-poster">
                    <img src="Deadpool.jpeg" alt="Deadpoets society">
                </div>
                <div class="movie-info">
                    <h3 class="movie-title">deadpool</h3>
                    <div class="movie-details">
                        <p>
                            <span class="rating-stars">
                 
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </span>
                            4.9/5
                        </p>
                        <p><i class="fas fa-clock"></i> 2h 28m</p>
                        <div>
                            <span class="genre-tag">Sci-Fi</span>
                            <span class="genre-tag">Thriller</span>
                        </div>
                    </div>
           <button class="book-btn" onclick="location.href='selectShow.jsp?movie=deadpool&image=Deadpool.jpeg'">
    Book Now

                    </button>
                </div>
            </div>

            <div class="movie-card">
                <div class="movie-poster">
                    <img src="Fight Club (1999).jpeg" alt="Breaking bad season2">
                </div>
                <div class="movie-info">
                    <h3 class="movie-title">fight club</h3>
                    <div class="movie-details">
                        <p>
                            <span class="rating-stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </span>
                            4.7/5
                        </p>
                        <p><i class="fas fa-clock"></i> 3h 12m</p>
                        <div>
                            <span class="genre-tag">Fantasy</span>
                            <span class="genre-tag">Adventure</span>
                        </div>
                    </div>
                   <button class="book-btn" onclick="location.href='selectShow.jsp?movie=fight-club&image=Fight%20Club%20(1999).jpeg'">
 
                        Book Now
                    </button>
                </div>
            </div>
              <div class="movie-card">
                <div class="movie-poster">
                    <img src="American Psycho.jpeg" alt="American Psycho">
                </div>
                <div class="movie-info">
                    <h3 class="movie-title">American Psycho</h3>
                    <div class="movie-details">
                        <p>
                            <span class="rating-stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </span>
                            4.9/5
                        </p>
                        <p><i class="fas fa-clock"></i> 2h 28m</p>
                        <div>
                            <span class="genre-tag">Sci-Fi</span>
                            <span class="genre-tag">Thriller</span>
                        </div>
                    </div>
                 <button class="book-btn" onclick="location.href='selectShow.jsp?movie=american-psycho&image=American%20Psycho.jpeg'">
   
                        Book Now
                    </button>
                </div>
            </div>
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
        // Add smooth scroll behavior
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });

        // Add header shadow on scroll
        window.addEventListener('scroll', function() {
            const header = document.querySelector('.header');
            if (window.scrollY > 0) {
                header.style.boxShadow = '0 2px 10px rgba(0,0,0,0.3)';
            } else {
                header.style.boxShadow = 'none';
            }
        });

        // Animate movie cards on scroll
        const observerOptions = {
            root: null,
            rootMargin: '0px',
            threshold: 0.1
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, observerOptions);

        document.querySelectorAll('.movie-card').forEach(card => {
            observer.observe(card);
        });
    </script>
</body>
</html>