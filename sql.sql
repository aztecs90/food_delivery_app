CREATE TABLE `Users` (
  `id` Int PRIMARY KEY AUTO_INCREMENT,
  `username` String,
  `email` String,
  `password` String,
  `role` String,
  `registration_date` DateTime,
  `last_login_date` DateTime
);

CREATE TABLE `Restaurants` (
  `id` Int PRIMARY KEY AUTO_INCREMENT,
  `name` String,
  `address` String,
  `contact_info` String,
  `menu_id` Int,
  `verification_status` String
);

CREATE TABLE `Menus` (
  `id` Int PRIMARY KEY AUTO_INCREMENT,
  `restaurant_id` Int,
  `menu_items` String,
  `prices` String,
  `specials` String
);

CREATE TABLE `Orders` (
  `id` Int PRIMARY KEY AUTO_INCREMENT,
  `customer_id` Int,
  `restaurant_id` Int,
  `delivery_boy_id` Int,
  `order_date` DateTime,
  `status` String,
  `total_amount` Decimal,
  `payment_method` String
);

CREATE TABLE `DeliveryBoys` (
  `id` Int PRIMARY KEY AUTO_INCREMENT,
  `name` String,
  `contact_info` String,
  `vehicle_info` String,
  `verification_status` String
);

CREATE TABLE `Feedback` (
  `id` Int PRIMARY KEY AUTO_INCREMENT,
  `order_id` Int,
  `user_id` Int,
  `rating` Int,
  `comments` String,
  `feedback_date` DateTime
);

ALTER TABLE `Restaurants` ADD FOREIGN KEY (`menu_id`) REFERENCES `Menus` (`id`);

ALTER TABLE `Menus` ADD FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants` (`id`);

ALTER TABLE `Orders` ADD FOREIGN KEY (`customer_id`) REFERENCES `Users` (`id`);

ALTER TABLE `Orders` ADD FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants` (`id`);

ALTER TABLE `Orders` ADD FOREIGN KEY (`delivery_boy_id`) REFERENCES `DeliveryBoys` (`id`);

ALTER TABLE `Feedback` ADD FOREIGN KEY (`order_id`) REFERENCES `Orders` (`id`);

ALTER TABLE `Feedback` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);
