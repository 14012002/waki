<?php

echo "Starting database setup...\n";

try {
    // Connect to MySQL server
    $pdo = new PDO('mysql:host=127.0.0.1', 'root', '');
    echo "Connected to MySQL server\n";
    
    // Drop the database if it exists
    $pdo->exec('DROP DATABASE IF EXISTS phonestore');
    echo "Dropped database if it existed\n";
    
    // Create the database
    $pdo->exec('CREATE DATABASE phonestore CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
    echo "Created database phonestore\n";
    
    // Select the database
    $pdo->exec('USE phonestore');
    echo "Selected database phonestore\n";
    
    // Read the SQL file
    $sql = file_get_contents('phonestore.sql');
    echo "Read SQL file\n";
    
    // Execute the SQL
    $pdo->exec($sql);
    echo "Successfully imported database schema and data\n";
    
    echo "Database setup completed successfully!\n";
    
} catch (PDOException $e) {
    echo 'Database operation failed: ' . $e->getMessage() . "\n";
} catch (Exception $e) {
    echo 'Error: ' . $e->getMessage() . "\n";
}