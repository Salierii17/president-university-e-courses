<?
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $card_number = $_POST['card_number'];
    $card_owner = $_POST['card_owner'];
    $expiration_date = $_POST['expiration_date'];
    $cvv = $_POST['cvv'];
    $amount = $_POST['amount']; // Retrieve the amount from the form

    // Retrieve the SelectionID from the session or wherever it's stored
    $selectionID = $_SESSION['selectionID']; // Adjust this based on where the SelectionID is stored

    // Retrieve the MethodID based on the selected method name
    $methodName = $_POST['methodID']; // Adjust this based on your form field
    $sql = "SELECT MethodID FROM payment_methods WHERE MethodName = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $methodName);
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if a row is returned
    if ($result->num_rows > 0) {
        // Fetch the MethodID
        $row = $result->fetch_assoc();
        $methodID = $row['MethodID'];

        // Prepare SQL statement to insert data into payments table
        $sql = "INSERT INTO payments (SelectionID, MethodID, CardNumber, CardExpirationDate, CardOwnerName, TransactionDate, Amount) VALUES (?, ?, ?, ?, ?, NOW(), ?)";

        // Create prepared statement
        $stmt = $conn->prepare($sql);
        if ($stmt === false) {
            die("Error in preparing statement: " . $conn->error);
        }

        // Bind parameters to statement
        $stmt->bind_param("iisssd", $selectionID, $methodID, $card_number, $expiration_date, $card_owner, $amount);

        // Execute statement
        if ($stmt->execute()) {
            // After successful payment, retrieve the last inserted payment ID
            $paymentID = $conn->insert_id;

            // Set the initial status of the invoice to 'Pending'
            $status = 'Pending';

            // Insert a new invoice record into the database
            $insertInvoiceQuery = "INSERT INTO invoices (PaymentID, Status, TransactionDate) VALUES ('$paymentID', '$status', NOW())";
            if ($conn->query($insertInvoiceQuery) === TRUE) {
                // Insert transaction data into the transactions table for documentation
                $transactionType = "Membership"; // Adjust the transaction type as needed
                $userID = 1; // Assuming you have the user ID available

                // Prepare SQL statement to insert data into transactions table
                $insertTransactionQuery = "INSERT INTO transactions (TransactionType, TransactionDate, Amount, MethodID, UserID, InvoiceID) VALUES ('$transactionType', NOW(), '$amount', '$methodID', '$userID', '$paymentID')";

                // Execute the transaction insertion query
                if ($conn->query($insertTransactionQuery) === TRUE) {
                    // Redirect to invoices page with the auto-incremented invoice ID as parameter
                    header("Location: invoices.php?invoice_id=$paymentID");
                    exit();
                } else {
                    echo "Error inserting transaction: " . $conn->error;
                }
            } else {
                echo "Error inserting invoice: " . $conn->error;
            }
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }

        // Close statement
        $stmt->close();
    } else {
        // Method not found
        echo "Method not found!";
    }
}
