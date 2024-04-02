<?php
// Include database connection
include "conn.php";

// Retrieve invoice ID from URL parameter
$invoiceID = $_GET['invoice_id']; // Assuming 'invoice_id' is passed through the URL

// Query to retrieve invoice details based on invoice ID
$query = "SELECT p.TransactionDate AS payment_date, p.Amount, pm.MethodName, i.Status, i.TransactionDate AS invoice_date
          FROM payments p
          JOIN payment_methods pm ON p.MethodID = pm.MethodID
          JOIN invoices i ON p.PaymentID = i.PaymentID
          WHERE i.InvoiceID = '$invoiceID'"; // Using invoice ID to fetch data

$result = $conn->query($query);

if ($result && $result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $paymentDate = $row['payment_date'];
    $amount = $row['Amount'];
    $methodName = $row['MethodName'];
    $status = $row['Status'];
    $invoiceDate = $row['invoice_date'];
    
    // Update status to "Paid" after 5 seconds
    echo "<script>
            setTimeout(function() {
                window.location.reload(); // Reload the page
            }, 5000);
         </script>";

    // After 5 seconds, update status to "Paid" in the database
    usleep(5000000); // Sleep for 5 seconds (PHP usleep is in microseconds)
    
    // Update status in the database
    $updateStatusQuery = "UPDATE invoices SET Status = 'Paid' WHERE InvoiceID = '$invoiceID'";
    if ($conn->query($updateStatusQuery) === TRUE) {
        // Status updated successfully
        $status = 'Paid'; // Update the status variable
    } else {
        echo "Error updating status: " . $conn->error;
    }
} else {
    // Invoice not found
    echo "Invoice not found!";
    exit();
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice Details</title>
    <link rel="stylesheet" href="./css/transaksi.css">
</head>

<body>
    <h1>INVOICE DETAILS</h1>
    <h3>Invoice Information</h3>
    <div class="frame1">
        <div class="frame2">
            <div class="status">Status: <?php echo $status; ?></div>
            <div class="status">Payment Method: <?php echo $methodName; ?></div>
            <div class="status">Payment Date: <?php echo $paymentDate; ?></div>
            <div class="status">Invoice ID: <?php echo $invoiceID; ?></div>
            <div class="status"><b>Total Amount: <?php echo $amount; ?></b></div>
        </div>
    </div>
    <footer>
        <div class="footer">
            <img loading="lazy" class="img" srcset="logoPU.png" />
            <div class="div-15">President University</div>
            <div class="div-16">E-Course</div>
            <div class="div-17">Accessibility</div>
            <div class="div-18">Privacy Policy</div>
            <div class="div-19">Terms of Use</div>
            <div class="div-20">EEA Privacy Disclosures</div>
        </div>
    </footer>
</body>

</html>
