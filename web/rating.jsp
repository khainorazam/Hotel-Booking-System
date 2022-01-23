<%-- 
    Document   : rating
    Created on : Jan 13, 2022, 3:41:11 PM
    Author     : FAIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Rating Page</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css" />
        
        <style>
                        * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: arial;
            }
            .star-rating form {
                display: none;
            }
            .star-rating .thanks-msg {
                display: none;
                font-size: 20px;
                margin: 40px auto;
                color: #4caf50;
                background-color: rgba(76, 175, 80, 0.1411764705882353);
                padding: 8px 20px;
                border-left: 3px solid #4caf50;
                border-radius: 20px;
            }
            .star-rating input {
                display: none;
            }
            .star-rating {
                margin: 50px auto;
                display: table;
                width: 350px;
            }
            .star-rating label {
                padding: 10px;
                float: right;
                font-size: 44px;
                color: #eee;
            }
            .star-rating input:not(:checked) ~ label:hover,
            .star-rating input:not(:checked) ~ label:hover ~ label {
                color: #ffc107;
            }
            .star-rating input:checked ~ label {
                color: #ffc107;
            }
            .star-rating form .rating-reaction:before {
                width: 100%;
                float: left;
                color: #ffc107;
            }
            .star-rating #rating-1:checked ~ form .rating-reaction:before {
                content: "Bad Service and not recommended";
            }
            .star-rating #rating-2:checked ~ form .rating-reaction:before {
                content: "Bad Service";
            }
            .star-rating #rating-3:checked ~ form .rating-reaction:before {
                content: "Good service";
            }
            .star-rating #rating-4:checked ~ form .rating-reaction:before {
                content: "Great service and nice room";
            }
            .star-rating #rating-5:checked ~ form .rating-reaction:before {
                content: "I love it";
            }
            .star-rating input:checked ~ form {
                border-top: 1px solid #ddd;
                width: 100%;
                padding-top: 15px;
                margin-top: 15px;
                display: inline-block;
            }
            .star-rating form .rating-reaction {
                font-size: 24px;
                float: left;
                text-transform: capitalize;
            }
            .star-rating form .submit-rating {
                border: none;
                outline: none;
                background: #795548;
                color: #ffc107;
                font-size: 18px;
                border-radius: 4px;
                padding: 5px 15px;
                cursor: pointer;
                float: right;
            }
            form .submit-rating:hover {
                background-color: #333;
            }
        </style>
        
    </head>
    <body>
        <!-- Rating Submit Form -->
<!--        <div class="star-rating">
            
            <h1>Hotel Review</h1>
            
            <div class="thanks-msg">Thanks for your feedback !!!</div>
                
            <div class="star-input">
                
                <input type="radio" name="rating" id="rating-5" value="5">
                <label for="rating-5" class="fas fa-star"></label>
                <input type="radio" name="rating" id="rating-4" value="4">
                <label for="rating-4" class="fas fa-star"></label>
                <input type="radio" name="rating" id="rating-3" value="3">
                <label for="rating-3" class="fas fa-star"></label>
                <input type="radio" name="rating" id="rating-2" value="2">
                <label for="rating-2" class="fas fa-star"></label>
                <input type="radio" name="rating" id="rating-1" value="1">
                <label for="rating-1" class="fas fa-star"></label>
                
                <div>
                    <textarea id="review" name="review" rows="4" cols="50" placeholder="Please enter review here"></textarea> 
                </div>
                
                <form action="RatingServlet" method="get">
                    <span class="rating-reaction"></span>
                    <button type="submit" class="submit-rating">Submit</button>
                </form>
            </div>
      
        </div>-->
        
        <div class="star-rating">
            
            <h1>Hotel Review</h1>
            
            <div class="thanks-msg">Thanks for your feedback !!!</div>
                
            <div class="star-input">
                <form action="RatingServlet" method="get">
                    
                <input type="radio" name="rating" id="rating-5" value="5">
                <label for="rating-5" class="fas fa-star"></label>
                <input type="radio" name="rating" id="rating-4" value="4">
                <label for="rating-4" class="fas fa-star"></label>
                <input type="radio" name="rating" id="rating-3" value="3">
                <label for="rating-3" class="fas fa-star"></label>
                <input type="radio" name="rating" id="rating-2" value="2">
                <label for="rating-2" class="fas fa-star"></label>
                <input type="radio" name="rating" id="rating-1" value="1">
                <label for="rating-1" class="fas fa-star"></label>
                
                <div>
                    <textarea id="review" name="review" rows="4" cols="50" placeholder="Please enter review here"></textarea> 
                </div>
                
                
                    <span class="rating-reaction"></span>
                    <button type="submit" class="submit-rating">Submit</button>
                </form>
            </div>
      
        </div>
        
<!--        <script>const btn = document.querySelector(".submit-rating");
        const thanksmsg = document.querySelector(".thanks-msg");
        const starRating = document.querySelector(".star-input");
        // Success msg show/hide
        btn.onclick = () => {
            starRating.style.display = "none";
            thanksmsg.style.display = "table";
            return false;
        };
        </script>-->
    </body>
</html>