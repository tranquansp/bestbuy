# Hướng dẫn sử dụng code trên linux #

Tóm tắt các bước thực hiện để sử dụng code :<br />
1/ tạo database mới<br />
2/ Chạy query nội dung file database.sql – nên chạy bằng phpmyadmin để an toàn.<br />Workbrench
có thể xảy ra lỗi làm gây ra sai 1 số store prodedure<br />
3/ Open Project<br />
4/ Cấu hình file MySqlDataAccessHelper trong source pakage > dao > MySqlDataAccessHelper<br />
5/ Chạy project<br />
6/ Để chạy được trang Admin thì phải gõ WelcomeAdmin.do trên trình duyệt.Ví dụ:<br />
Trang của ứng dụng là :<br />
Khách Hàng :<br />
http://localhost:8084/baitap15/<br />
Admin :<br />
http://localhost:8084/baitap15/WelcomeAdmin.do<br />
Để sử dụng database ta làm theo những bước sau:<br />
Cách 1:<br />
Trên Mysql WorkBench<br />
Tạo 1 schema mới với tên bất kỳ.<br />
Lưu ý cần nhớ tên này để sửa lại file kết nối trong netbean<br />
Set default shema<br />
Copy toàn bộ nội dụng của file database dán vào khung query của mysql
Nhấn Ctrl + Shify + Enter để excute<br />
Cách 2:<br />
Trên phpMyadmin<br />
Tạo 1 database mới ở trang chủ.Nhớ tên của nó !!<br />
Vào mục import để lấy file database lên
Source code<br />
Mở source code của ứng dụng lên netbean bằng cách
Vào File -> Open ->Open Project<br />
Mở chương trình lên<br />
Cấu hình để đọc database :<br />
Vào Phần Source Packages > dao > MySqlDataAccessHelper.java<br />
Đến dòng thứ 28<br />
Sửa lại connecting string.Thay chữ shopcart thành tên database vừa tạo ở trên.<br />
Load thư viện nằm ở thư mục source code<br />
Set default cho project chúng ta.<br />
Sau đó ấn F6 để chạy<br />