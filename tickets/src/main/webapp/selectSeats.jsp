<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Seats - Chalana Chitram</title>
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
        }

        .booking-header {
            text-align: center;
            margin-bottom: 3rem;
            animation: fadeInDown 0.8s ease;
        }

        .booking-header h1 {
            color: var(--accent-color);
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .booking-header p {
            color: #ccc;
            font-size: 1.2rem;
        }

        .screen-container {
            margin: 4rem 0;
            perspective: 1000px;
            animation: fadeIn 1s ease;
        }

        .screen {
            background: linear-gradient(to bottom, var(--accent-color), var(--primary-color));
            height: 5px;
            margin: 0 auto;
            width: 90%;
            transform: rotateX(-30deg);
            box-shadow: 0 3px 10px rgba(255, 215, 0, 0.3);
            position: relative;
            animation: glow 2s infinite alternate;
        }

        .screen::before {
            content: '';
            position: absolute;
            top: -20px;
            left: 0;
            right: 0;
            height: 20px;
            background: rgba(255, 215, 0, 0.1);
            transform: rotateX(45deg);
        }

        .screen-text {
            text-align: center;
            color: #ccc;
            margin-top: 2rem;
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .seating-layout {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            align-items: center;
            margin: 3rem 0;
            animation: fadeInUp 1s ease;
        }

        .seat-row {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .row-label {
            width: 40px;
            text-align: center;
            font-weight: bold;
            color: var(--accent-color);
        }

        .seat {
            width: 35px;
            height: 35px;
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 0.9em;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
        }

        .seat:hover {
            transform: translateY(-2px);
            border-color: var(--accent-color);
            box-shadow: 0 0 15px rgba(255, 215, 0, 0.2);
        }

        .seat.selected {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            color: white;
            animation: selectSeat 0.3s ease;
        }

        .seat.booked {
            background-color: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.1);
            cursor: not-allowed;
            color: rgba(255, 255, 255, 0.3);
        }

        .legend {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin: 2rem 0;
            padding: 1rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            backdrop-filter: blur(10px);
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #ccc;
        }

        .legend-box {
            width: 25px;
            height: 25px;
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 6px;
        }

        .legend-box.selected {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .legend-box.booked {
            background-color: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.1);
        }

        .booking-summary {
            background: rgba(255, 255, 255, 0.05);
            padding: 2rem;
            border-radius: 15px;
            margin-top: 2rem;
            backdrop-filter: blur(10px);
            animation: fadeIn 1s ease;
        }

        .booking-summary h3 {
            color: var(--accent-color);
            margin-bottom: 1rem;
        }

        .summary-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .summary-item {
            padding: 1rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
        }

        .proceed-btn {
            background: var(--primary-color);
            color: white;
            padding: 1rem 2rem;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            width: 100%;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .proceed-btn:hover:not(:disabled) {
            background: #ff2b2b;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(225, 27, 27, 0.3);
        }

        .proceed-btn:disabled {
            background-color: rgba(255, 255, 255, 0.1);
            cursor: not-allowed;
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

        @keyframes selectSeat {
            0% { transform: scale(1); }
            50% { transform: scale(0.9); }
            100% { transform: scale(1); }
        }

        @keyframes glow {
            from { box-shadow: 0 0 5px var(--accent-color), 0 0 10px var(--accent-color); }
            to { box-shadow: 0 0 10px var(--accent-color), 0 0 20px var(--accent-color); }
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
                margin-top: 6rem;
            }

            .seat {
                width: 30px;
                height: 30px;
                font-size: 0.8em;
            }

            .seat-row {
                gap: 0.5rem;
            }

            .legend {
                flex-direction: column;
                align-items: center;
                gap: 1rem;
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
    </style>
</head>
<body>
   

    <div class="container">
        <div class="booking-header">
            <h1><%= request.getParameter("movie") %></h1>
            <p><i class="fas fa-theater-masks"></i> <%= request.getParameter("theater") %> | <i class="far fa-clock"></i> <%= request.getParameter("time") %></p>
        </div>

        <div class="screen-container">
            <div class="screen"></div>
            <p class="screen-text">Screen</p>
        </div>

        <div class="seating-layout">
            <!-- Seat rows will be generated by JavaScript -->
        </div>

        <div class="legend">
            <div class="legend-item">
                <div class="legend-box"></div>
                <span>Available</span>
            </div>
            <div class="legend-item">
                <div class="legend-box selected"></div>
                <span>Selected</span>
            </div>
            <div class="legend-item">
                <div class="legend-box booked"></div>
                <span>Booked</span>
            </div>
        </div>

        <div class="booking-summary">
            <h3>Booking Summary</h3>
            <div class="summary-details">
                <div class="summary-item">
                    <p>Selected Seats: <span id="selectedSeats">None</span></p>
                </div>
                <div class="summary-item">
                    <p>Total Amount: ₹<span id="totalAmount">0</span></p>
                </div>
            </div>
            <button class="proceed-btn" id="proceedBtn" disabled>
                Proceed to Payment <i class="fas fa-arrow-right"></i>
            </button>
        </div>
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
        // Generate seating layout
        const seatingLayout = document.querySelector('.seating-layout');
        const rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
        const seatsPerRow = 12;
        const selectedSeats = new Set();

        rows.forEach(row => {
            const seatRow = document.createElement('div');
            seatRow.className = 'seat-row';
            
            const rowLabel = document.createElement('div');
            rowLabel.className = 'row-label';
            rowLabel.textContent = row;
            seatRow.appendChild(rowLabel);

            for (let i = 1; i <= seatsPerRow; i++) {
                const seat = document.createElement('div');
                seat.className = 'seat';
                seat.dataset.seat = `${row}${i}`;
                seat.textContent = i;

                // Randomly mark some seats as booked
                if (Math.random() < 0.3) {
                    seat.classList.add('booked');
                } else {
                    seat.addEventListener('click', () => toggleSeat(seat));
                }

                seatRow.appendChild(seat);
            }

            seatingLayout.appendChild(seatRow);
        });

        function toggleSeat(seat) {
            const seatId = seat.dataset.seat;
            
            if (selectedSeats.has(seatId)) {
                selectedSeats.delete(seatId);
                seat.classList.remove('selected');
            } else {
                selectedSeats.add(seatId);
                seat.classList.add('selected');
            }

            updateSummary();
        }

        function updateSummary() {
            const selectedSeatsElem = document.getElementById('selectedSeats');
            const totalAmountElem = document.getElementById('totalAmount');
            const proceedBtn = document.getElementById('proceedBtn');

            if (selectedSeats.size > 0) {
                selectedSeatsElem.textContent = Array.from(selectedSeats).join(', ');
                totalAmountElem.textContent = (selectedSeats.size * 250).toLocaleString();
                proceedBtn.disabled = false;
            } else {
                selectedSeatsElem.textContent = 'None';
                totalAmountElem.textContent = '0';
                proceedBtn.disabled = true;
            }
        }

        // Proceed to payment
        document.getElementById('proceedBtn').addEventListener('click', () => {
            const seats = Array.from(selectedSeats).join(',');
            window.location.href = `payment.jsp?seats=${seats}&movie=<%= request.getParameter("movie") %>&theater=<%= request.getParameter("theater") %>&time=<%= request.getParameter("time") %>`;
        });
    </script>
</body>
</html>