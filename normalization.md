### Normalization Improvements:
https://mermaid.live/edit#pako:eNrFV0tv4zYQ_isCz0lQO3G08W3bIpegwKLoXgoDAi2OJCISqZKUE2-S_94hZerNrIGkqA-2xW-GnPnmRb2QVDIgWwLqd05zRaudiPDzXYPS0evr5aV8ib4pWYMyHHS0jXakkNroHVkQ_FXKRy7yVqyij7As9iccODy1Uk-Km4DYH6A1zU-HahDsDDEFKfDD0oavr-4Bfcl46T2hnWD7PfB0yaU9PgDzKnPhoWPK_Q9KozlfGVNo-8mWUqbUAEuoCWucVo5_HeuTltXJpeI_rKYOW-Y1v1YgeB_Jqf-dt_5AekQF00rXlLMkk2qs0u_47lEyy0ChkfvjWL0N0Ev7YD_aKLQganA94Sz69jCDMq60SQStYAaVNIRARXkZfZ_vVlOtn6RiCZJRzNFCCkhEU-1B9SDgQqRkOTjG8Aq0oVUdpQp8IKe7eQhJmPlbsxH0thM9QV3SznmqWyhAlWdx6LeBZxPtuQxvVWE5JY0qewlrm_tKZJbsuTLFhIwDKJ5xzEYuRYI8mEafy02Peg482nHQV8qcANpiAQLwB2AhENwcF2Tx9LmobIRRc-kauyAtE9s-BzxBiuyVmIeGm2YRkSKfQB-mZ9wW5hQZXA_w46Bxwbj8YKBTxWsbzs83lIcy2XkRsNROHQvdP7yXAvcPQe8XoHMd98GrFU8BjRQ8Lwaec2Giij4neQN2Mo7W98CUlNV0lZpisoyzpQQqIq4TmhqcYR_n_YOdp2_gC1XnsFCszuXVG9cOseN_SsasWt5z7ye5GPA-bFp3eDdg52fuWyhw5NCi-3CjH0KuaaM9yiRs1NkcgPep6fIpy420jc3l-hxMbVysmRksoGjFAdXGoE14VxqJ66WTyTEbFjZbdI0bohEK_pnU1P9UC91FaCFXWigQt0FUR7E5EUarMSW9A37bcYwcZR6qwBSSBcApr74bKiq0rSmc05xNaPe6Qto7-eeVnL8Xz8lrb8mfl_Pvs24zUeFoFvl4zSV1yYUdIou4rKpG-OvNkoS7vYfAAy0bmCGOcbszDBNg0PkOXPN9-Zmtr3tVmgeiaqHQNQq7RZBsfOfiNT-VwPnBcP77Y_eSLbd_dHSa4V7HDvYl97U1ZZkZu1tPC7kgueKMbI1q4IJUoPAlAR-Jo2dHTAE4x4h9fWFUPdoXF6tTU_E3zm6vpmSTF2Sb0VLjU8v96V26E3H0_WZLnWxvr90WZPtCnsl2c3u1ur67Xn1Z38ab21W8viBHsr2Mr69WXzY3d3ermzhex5v47YL8cIeurjbrX-KbTRzfWYH1On77FwJyBeo


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
