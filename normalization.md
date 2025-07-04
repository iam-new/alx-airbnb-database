### Normalization Improvements:
![Uploading airbnb.svg…]()


1. **Location Data** (Properties table):
   - Currently storing location as a single string
   - Should be normalized into separate fields or a location table

2. **Address Normalization**:
   ```sql
   CREATE TABLE Addresses (
       address_id VARCHAR(36) DEFAULT(UUID()) PRIMARY KEY,
       street VARCHAR(255),
       city VARCHAR(100),
       state VARCHAR(100),
       country VARCHAR(100),
       postal_code VARCHAR(20),
       latitude DECIMAL(10,8),
       longitude DECIMAL(11,8)
   );
   ```

3. **Property Categories**:
   ```sql
   CREATE TABLE PropertyTypes (
       type_id VARCHAR(36) DEFAULT(UUID()) PRIMARY KEY,
       type_name VARCHAR(100) NOT NULL,
       description TEXT
   );
   ```

4. **Amenities** (Many-to-Many relationship):
   ```sql
   CREATE TABLE Amenities (
       amenity_id VARCHAR(36) DEFAULT(UUID()) PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       description TEXT
   );
   
   CREATE TABLE PropertyAmenities (
       property_id VARCHAR(36),
       amenity_id VARCHAR(36),
       PRIMARY KEY (property_id, amenity_id),
       FOREIGN KEY (property_id) REFERENCES Properties(property_id),
       FOREIGN KEY (amenity_id) REFERENCES Amenities(amenity_id)
   );
   ```

5. **Enhanced User Profiles**:
   ```sql
   CREATE TABLE UserProfiles (
       profile_id VARCHAR(36) DEFAULT(UUID()) PRIMARY KEY,
       user_id VARCHAR(36) UNIQUE,
       bio TEXT,
       profile_image_url VARCHAR(500),
       date_of_birth DATE,
       verification_status ENUM('unverified', 'verified'),
       FOREIGN KEY (user_id) REFERENCES Users(user_id)
   );
   ```

### Additional Recommendations:

1. **Add constraints** for data integrity:
   ```sql
   ALTER TABLE Bookings ADD CONSTRAINT chk_dates CHECK (end_date > start_date);
   ALTER TABLE Properties ADD CONSTRAINT chk_price CHECK (pricepernight > 0);
   ```

2. **Consider partitioning** large tables like Bookings by date for better performance

3. **Add audit fields** to track who made changes:
   ```sql
   created_by VARCHAR(36),
   updated_by VARCHAR(36)
   ```
I've created an improved ERD that incorporates all the normalization improvements to achieve proper 3NF. Here are the key improvements:

## New Tables Added:

1. **UserProfiles** - Separates user profile data from core user authentication
2. **Addresses** - Normalizes location data with proper geographical fields
3. **PropertyTypes** - Categorizes properties (apartment, house, villa, etc.)
4. **Amenities** - Master list of available amenities
5. **PropertyAmenities** - Junction table for many-to-many relationship

## Enhanced Fields:

- **Properties**: Added max_guests, bedrooms, bathrooms, is_active
- **Bookings**: Added cleaning_fee, service_fee, guest_count, special_requests
- **Payments**: Added payment_status, transaction_id, payment_notes
- **Reviews**: Added detailed rating breakdowns and booking reference
- **Messages**: Added booking context, read status, and message types
