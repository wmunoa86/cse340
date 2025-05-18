-- Assignment 1

-- 1. Insert a new record into the account table
INSERT INTO account (account_firstname, account_lastname, account_email, account_password)
VALUES ('Tony', 'Stark', 'tony@starkent.com', 'Iam1ronM@n');

-- 2. Update a record in the account table
UPDATE account
SET account_type = 'Admin'
WHERE account_firstname = 'Tony';

-- 3. Delete a record from the account table
DELETE FROM account
WHERE account_firstname = 'Tony';

-- Search for a record in the account table with 2 conditions
-- SELECT * FROM inventory WHERE inv_make = 'GM' AND inv_model = "Hummer";

-- Allows to verify that de Replace function works 
-- SELECT REPLACE(inv_description, 'the small interiors', 'a huge interior') AS description_fixed FROM inventory WHERE inv_make = 'GM' AND inv_model = 'Hummer';

-- 4. REPLACE function to update
UPDATE inventory
SET inv_description = REPLACE(inv_description, 'the small interiors', 'a huge interior') 
WHERE inv_make = 'GM' AND inv_model = 'Hummer';

-- 5. inner join to combine data from two tables
SELECT
	inv_make, inv_model
FROM inventory
INNER JOIN classification
ON inventory.classification_id = classification.classification_id
WHERE classification.classification_name = 'Sport';

-- 6 update the path of image anf the thumbnail
UPDATE inventory
SET 
  inv_image = REPLACE(inv_image, 'images/', 'images/vehicles/'),
  inv_thumbnail = REPLACE(inv_thumbnail, 'images/', 'images/vehicles/');

