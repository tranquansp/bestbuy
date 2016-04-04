# Hướng dẫn sử dụng code trên windows #

Tóm tắt các bước thực hiện để sử dụng code :<br />
1/ tạo database mới<br />
2/ Chạy query nội dung file database.sql<br />
3/ Open Project<br />
4/ Cấu hình file MySqlDataAccessHelper trong source pakage > dao > MySqlDataAccessHelper<br />
5/ Chạy project<br />
6/ Để chạy được trang Admin thì phải gõ WelcomeAdmin.do trên trình duyệt.Ví dụ:<br />
Trang của ứng dụng là :<br />
Khách Hàng :<br />
http://localhost:8084/DoAnCuoiKy/<br />
Admin :<br />
http://localhost:8084/DoAnCuoiKy/WelcomeAdmin.do<br />
Hướng dẫn cụ thể sử dụng source code<br />
1/ Cài đặt java apt-get install sun-java6-jdk sun-java6-jre<br />
2/Cài đặt netbean<br />
Lên trang chủ của netbean tải bản cài đặt cho linux về có dạng
netbeans-7.0.1.sh<br />
Vào thư mục chứ file này gõ<br />
chmod –R 755 netbeans-7.0.1.sh<br />
./netbeans-7.0.1.sh<br />
Để chạy Netbean<br />
Khi cài đặt Netbean sẽ tạo ra 4 thư mục sau :<br />
/usr/local/netbeans-7.0.1<br />
/usr/lib/jvm/default-java<br />
/usr/local/glassfish-3.1.1<br />
/usr/local/apache-tomcat-7.0.14<br />
Ta cũng tiến hành chmod 755 cho các thư mục này để chạy được web<br />
Cài đặt mysql sudo apt-get install mysql-server<br />
nhập pass để login vào sql ( bỏ cũng dc) Start mysql : <br />Mysql –u root –p Nhập pass vào Tạo 1 database: CREATE shopcart;<br />
Sau đó excute câu truy vấn là đoạn database của chúng ta: Use shopcart; mysql> ….<br /> Thực thi tại đây<br />
SOURCE CODE Mở source code của ứng dụng lên netbean bằng cách<br />
Vào File -> Open ->Open Project Mở chương trình lên Cấu hình để đọc database : Vào Phần Source Packages > dao > MySqlDataAccessHelper.java Đến dòng thứ 28 Sửa lại connecting string.Thay chữ shopcart thành tên database vừa tạo ở trên. Chú ý port mặc định của mysql chính là 3306,tuy nhiên nếu port trong máy k phải là 3306 thì ta có thể điều chỉnh lại như sau: Vào /etc/mysql/my.conf Đến dòng port 3306 Sửa lại số 3306 thành port ta cần<br />
Load thư viện. Toàn bộ thự viện nằm trong thư mục sourcecode<br />
Set default cho project chúng ta. Sau đó ấn F6 để chạy<br />