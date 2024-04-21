<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Registration Form</title>
    <link rel="stylesheet" href="./css/register.css">
</head>
<% String msg=(String)request.getAttribute("msg"); %>
<body>
    <div class="container">
        <%if(msg!=null){ %>
            <p class="error-msg"><%= msg %></p>
        <%} %>

        <form action="BookingService" class="form" method="post" onsubmit="return register()">
            <div id="registerForm">
                <h2 id="title">Registration form</h2>

                <div>
                    <label for="custName">Customer Name:</label>
                    <input type="text" name="customerName" id="custName" maxlength="50" required>
                    <p id="custName-error" class="error"></p>
                </div>

                <div>
                    <label for="custEmail">Customer Email:</label>
                    <input type="email" name="email" id="custEmail" required>
                    <p id="errorEmail" class="error"></p>
                </div>

                <div>
                    <label for="countryCode">Country Code:</label>
                    <select name="countryCode" id="countryCode" required>
                        <option value="+91">+91 (India)</option>
                        <option value="+1">+1 (USA)</option>
                        <option value="+44">+44 (UK)</option>
                        <option value="+86">+86 (China)</option>
                        <option value="+82">+86 (South Korea)</option>
                        <option value="+65">+86 (Singapore)</option>
                    </select>
                </div>

                <div>
                    <label for="mobNo">Mobile Number:</label>
                    <input type="number" name="mobileNumber" id="mobNo" maxlength="10" required>
                    <p id="mobileNumber-error" class="error"></p>
                </div>

                <div>
                    <label for="address">Address:</label>
                    <input type="text" name="address" id="address" required>
                </div>

                <div>
                    <label for="userId">User ID:</label>
                    <input type="text" name="userId" id="userId" minlength="5" maxlength="20" required>
                    <p id="userId-error" class="error"></p>
                </div>

                <div>
                    <label for="password">Password:</label>
                    <input type="password" name="password" id="password" maxlength="30" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                    <p id="password-error" class="error"></p>
                </div>

                <div>
                    <label for="confirmpassword">Confirm Password:</label>
                    <input type="password" name="confirmpassword" id="confirmpassword" maxlength="30" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                    <p id="confirmpassword-error" class="error"></p>
                </div>

                <div>
                    <label for="prefer">Preferences:</label>
                    <textarea name="preferences" id="prefer" cols="30" rows="2"></textarea>
                </div>

                <div>
                    <button type="submit" class="btn" id="Register" name="action" value="Register">Register</button>
                    <button type="reset" class="btn">Reset</button>
                </div>
            </div>

            
        </form>

    </div>

    <script>
        function register() {
            clearErrors();

            var custName = document.getElementById("custName").value;
            var custEmail = document.getElementById("custEmail").value;
            var mobNo = document.getElementById("mobNo").value;
            var address = document.getElementById("address").value;
            var userId = document.getElementById("userId").value;
            var password = document.getElementById("password").value;
            var confirmpassword = document.getElementById("confirmpassword").value;

            if (!validateRequiredFields()) {
                return false;
            } else if (mobNo.length !== 10 || isNaN(mobNo)) {
                document.getElementById("mobileNumber-error").innerText = "Invalid mobile number!";
                return false;
            } else if (userId.length < 5 || userId.length > 20) {
                document.getElementById("userId-error").innerText = "UserId should contain at least 5 or at max 20 characters!";
                return false;
            } else if (custName.length > 50) {
                document.getElementById("custName-error").innerText = "Customer Name can have at max 50 characters!";
                return false;
            }

            if (password !== confirmpassword) {
                document.getElementById("password-error").innerText = "Password and Confirm password didn't match!";
                document.getElementById("confirmpassword-error").innerText = "Password and Confirm password didn't match!";
                return false;
            }

            document.getElementById('ackusername').innerText = generateRandomUsername();
            document.getElementById('ackname').innerText = custName;
            document.getElementById('ackemail').innerText = custEmail;
            document.getElementById('successMessage').innerText = "Registration Successful";
            document.getElementById('acknowledgement').style.display = "block";
            document.getElementById('registerForm').style.display = "none";

            return false;
        }

        function clearErrors() {
            var errorElements = document.querySelectorAll(".error");
            errorElements.forEach(function (element) {
                element.innerText = "";
            });
        }

        function validateRequiredFields() {
            var fields = ["custName", "custEmail", "mobNo", "address", "userId", "password", "confirmpassword", "prefer"];
            var isValid = true;

            fields.forEach(function (field) {
                var value = document.getElementById(field).value;

                if (!value) {
                    document.getElementById(field + "-error").innerText = "This field is required";
                    isValid = false;
                }
            });
            return isValid;
        }

        
    </script>
</body>
</html>
