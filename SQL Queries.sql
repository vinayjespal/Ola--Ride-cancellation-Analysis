create database Ola;
use Ola;
select* from bookings limit 105000;

-- 1. Retrieve all successful bookings:
create view Successful_Bookings as
select * from bookings 
where Booking_Status='Success' limit 100000;

select* from Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
create view Avg_ride_dist_for_each_vehicles as 
Select Vehicle_Type, round(avg(Ride_Distance),2) as Avg_distance 
from bookings 
group by Vehicle_Type ;

select * from Avg_ride_dist_for_each_vehicles;

-- 3. Get the total number of cancelled rides by customers:
create view Count_of_rides_Canceled_by_customer as
select count(*) as Count_of_rides_Canceled_by_customer from bookings 
where Booking_Status='Canceled by Customer';

select * from Count_of_rides_Canceled_by_customer;

-- 4. List the top 5 customers who booked the highest number of rides:
create view Top_5_customers as
select Customer_ID, count(Booking_ID) as Total_rides
from bookings
group by Customer_ID
order by Total_rides desc limit 5;

select * from Top_5_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_cancelled_by_Drivers_P_C_Issues as
select count(*) from bookings
where Canceled_Rides_by_Driver='Personal & Car related issue';

select * from Rides_cancelled_by_Drivers_P_C_Issues;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Max_Min_Driver_Rating as 
select Vehicle_Type, max(Driver_Ratings) as Max_rating, min(Driver_Ratings) as Min_rating 
from bookings where Vehicle_Type='Prime Sedan'and Driver_Ratings!='null';

select * from Max_Min_Driver_Rating;

-- 7. Retrieve all rides where payment was made using UPI:
create view UPI_payments as 
select * from bookings 
where Payment_Method='UPI';

select * from UPI_payments;

-- 8. Find the average customer rating per vehicle type:
create view AVG_Cust_Rating as 
select Vehicle_Type, round(avg(Customer_Rating),2) as Avg_Customer_rating
from bookings 
group by Vehicle_Type;

select * from AVG_Cust_Rating;

-- 9. Calculate the total booking value of rides completed successfully:
create view total_successful_ride_value as
select sum(Booking_Value) as total_successful_ride_value
from bookings 
where Booking_Status='success';

select * from total_successful_ride_value;

-- 10. List all incomplete rides along with the reason:
create view Incomplete_rides as 
select Booking_ID, Incomplete_Rides_Reason from bookings 
WHERE Incomplete_Rides = 'Yes';

select * from Incomplete_rides;