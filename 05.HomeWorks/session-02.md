# Homework

## ERD and Normalization

### Bài 1 (BikeStores)

Cho mẫu dữ liệu sau

| ProductId | CategoryId | CategoryName           | ProductName       | BrandId | BrandName | Price |
|-----------|------------|------------------------|-------------------|------------|--------------|-------|
| 142       | 113, 124   | FASHION, SMART DEVICES | Apple Watch       | 120        | APPLE        | 1,200 |
| 168       | 113        | FASHION                | T-SHIRT           | 122        | CK           | 700   |
| 263       | 113        | FASHION                | DRESS             | 145        | TOMMY        | 350   |
| 109       | 124        | SMART DEVICES          | iPhone 14 PRO MAX | 120        | APPLE        | 2,200 |


- Hãy phân tích và chuẩn hóa thành chuẩn 3NF
- Sau đó vẽ sơ đồ E.R.D

### Bài 2 (BikeStores)

Cho mẫu dữ liệu Orders sau:

| OrderId | CustomerId | CustomerName | CreatedAt  | StaffId | StaffName | Status | StatusName |
|---------|------------|--------------|------------|------------|--------------|--------|------------|
| 142     | 124        | James        | 2023-04-10 | 334        | Jack         | P      | Pending    |
| 168     | 113        | Peter        | 2023-04-10 | 453        | Mary         | P      | Pending    |
| 263     | 113        | Peter        | 2023-04-05 | 234        | Andrew       | C      | Completed  |
| 109     | 124        | James        | 2023-03-12 | 112        | Tom          | C      | Completed  |


Cho mẫu dữ liệu Order_Items sau:


| OrderId | ProductId | ProductName | Price | Quantity | Unit  | Discount |
|---------|-----------|-------------|-------|----------|-------|----------|
| 142     | P001      | Pencil      | 10    | 1        | Item  | 0        |
| 142     | P987      | Ruler       | 5     | 2        | Item  | 0        |
| 263     | P987      | Ruler       | 5     | 3        | Item  | 0        |
| 3109    | P098      | Paper       | 2     | 50       | Paper | 10       |


- Hãy phân tích và chuẩn hóa thành chuẩn 3NF
- Sau đó vẽ sơ đồ E.R.D


### Bài 3 (Elearning)

**Cho mẫu dữ liệu sau**

- Bảng Questions:

| QuestionId | CategoryId | CategoryName | QuestionContent               | AnswerOptions             | CorrectOption | Score |
|------------|------------|--------------|-------------------------------|---------------------------|---------------|-------|
| 142        | 124        | HISTORY      | Quốc khánh của nước Việt Nam? | 1945 / 1954 / 1975 / 1968 | 1945          | 1     |
| 168        | 113        | MATH         | 3 x 5 = ?                     | 15 / 50 / 21 / 23 / 20    | 15            | 2     |
| 263        | 113        | MATH         | 15 - 7 = ?                    | 9 / 12 / 8 / 11           | 8             | 2     |
| 109        | 124        | HISTORY      | 80 / 4 = ?                    | 120 / 40 / 20             | 40            | 2     |

- Bảng Answers:


| UserId | UserName | Email           | QuestionId | AnswerOption | Score | CreatedAt           |
|--------|----------|-----------------|------------|--------------|-------|---------------------|
| 1      | Tony     | tony@gmail.com  | 142        | 1945         | 1     | 2023-04-10 19:00:10 |
| 1      | Tony     | tony@gmail.com  | 168        | 15           | 2     | 2023-04-10 19:01:13 |
| 2      | Peter    | peter@gmail.com | 142        | 1954         | 0     | 2023-04-05 13:11:34 |
| 3      | Jack     | jack@gmail.com  | 109        | 40           | 2     | 2023-03-12 09:17:04 |


- Hãy phân tích và chuẩn hóa thành chuẩn 3NF
- Sau đó vẽ sơ đồ E.R.D

### Bài 4 (EducationManagement)

**Cho mẫu dữ liệu sau**

- Bảng Classes: Lớp học

| ClassId | ClassName      | StudentId | StudentName | TeacherId | TeacherName |
|---------|----------------|-----------|-------------|-----------|-------------|
| 142     | ADSE           | 124       | James       | 334       | Jack        |
| 168     | M.E.R.N        | 113       | Peter       | 453       | Mary        |
| 263     | Java Fullstack | 113       | Peter       | 234       | Andrew      |
| 109     | .NET Fullstack | 124       | James       | 334       | Jack        |

- Bảng Marks: Điểm thi

| StudentId | StudentName | SubjectId | SubjectName | Mark |
|-----------|-------------|-----------|-------------|------|
| 124       | James       | 12        | HTML        | 100  |
| 113       | Peter       | 23        | SQL         | 85   |
| 113       | Peter       | 43        | Java        | 65   |
| 124       | James       | 16        | PHP         | 90   |

Bảng Attendances: Điểm danh


| StudentId | StudentName | Date       | SubjectId | SubjectName | Status | StatusName |
|-----------|-------------|------------|-----------|-------------|--------|------------|
| 124       | James       | 2023-04-10 | 12        | HTML        | 1      | Present    |
| 113       | Peter       | 2023-02-11 | 23        | SQL         | 1      | Present    |
| 113       | Peter       | 2023-02-20 | 43        | Java        | 0      | Absent     |
| 124       | James       | 2023-03-15 | 16        | PHP         | 2      | Late       |


Bảng Tuitions: Học phí

| StudentId | StudentName | InvoiceDate | InvoiceCode | EmployeeId | EmployeeName | Amount |
|-----------|-------------|-------------|-------------|------------|--------------|--------|
| 124       | James       | 2023-04-10  | I0012       | 113        | Tony         | 1000   |
| 113       | Peter       | 2023-02-11  | I0023       | 223        | Mary         | 1200   |
| 113       | Peter       | 2023-02-20  | I0043       | 339        | James        | 1170   |
| 124       | James       | 2023-03-15  | I0016       | 455        | Andrew       | 1235   |

- Hãy phân tích và chuẩn hóa thành chuẩn 3NF
- Sau đó vẽ sơ đồ E.R.D

### Bài 5 (Booking Hotel)

Khai thác yêu cầu khách hàng thực tế ==> Chuyển thành Database

Tình huống:

- Chủ khách sạn muốn số hóa việc quản lý phòng, đặt phòng khách sạn muốn:
  - Quản lý phòng: Xem được danh sách phòng khách sạn đang có, bao gồm số lượng phòng cho mỗi loại phòng, phòng nào đang trống...
  - Quản lý Danh mục phòng: Ví dụ phòng Standard, Superior, Deluxe, Suite
  - Đặt phòng: Quản lí đơn đặt phòng
  - Quản lý nhân viên: Danh sách nhân viên

Hãy vẽ sơ đồ E.R.D và chuẩn hóa thành chuẩn 3NF (Làm ngay bước 3F luôn)
