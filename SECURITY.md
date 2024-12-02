# Security Policy

Chào mừng bạn đến với dự án **Xây dựng hệ thống quản lý đăng ký giờ nhiệm vụ của giảng viên Khoa Kỹ thuật và Công nghệ (Phân hệ: giờ giảng)**! Để đảm bảo an toàn bảo mật cho hệ thống của chúng tôi, chúng tôi đã thiết lập một số quy trình và chính sách bảo mật dưới đây. Vui lòng tham khảo và thực hiện theo các hướng dẫn này khi làm việc với mã nguồn của dự án.

## Báo cáo lỗ hổng bảo mật

Chúng tôi rất coi trọng bảo mật và sẵn sàng hợp tác với các nhà phát triển và người dùng để sửa chữa bất kỳ lỗ hổng bảo mật nào. Nếu bạn phát hiện ra bất kỳ lỗ hổng bảo mật nào, vui lòng thực hiện các bước sau để thông báo:

1. **Không công khai lỗ hổng**: Vui lòng không công khai các lỗ hổng bảo mật mà bạn phát hiện trong báo cáo vấn đề công khai (public issue tracker) của GitHub.
2. **Gửi email bảo mật**: Gửi email đến [baoquoczero@gmail.com] để báo cáo vấn đề bảo mật. Hãy mô tả chi tiết về lỗ hổng và cách tái tạo lỗi.
3. **Tính bảo mật trong quy trình đóng góp**: Các đóng góp mã nguồn sẽ được xem xét kỹ lưỡng để đảm bảo tính bảo mật của dự án, bao gồm kiểm tra các lỗ hổng phổ biến như SQL Injection, XSS, CSRF, và các lỗ hổng liên quan đến xác thực và phân quyền người dùng.

## Chính sách bảo mật

Dự án này tuân thủ các nguyên tắc bảo mật sau:

1. **Mã hóa dữ liệu nhạy cảm**:
   - Mọi thông tin nhạy cảm như mật khẩu người dùng sẽ được mã hóa trước khi lưu trữ trong cơ sở dữ liệu. Chúng tôi sử dụng các thuật toán mã hóa mạnh và tuân thủ các tiêu chuẩn bảo mật hiện đại như bcrypt hoặc Argon2.

2. **Xác thực và phân quyền người dùng**:
   - Chúng tôi sử dụng cơ chế xác thực mạnh mẽ (JWT hoặc session cookies) để đảm bảo người dùng chỉ có thể truy cập vào những tài nguyên mà họ có quyền.
   - Phân quyền người dùng dựa trên vai trò để đảm bảo chỉ có người dùng có quyền mới có thể thực hiện các hành động nhất định.

3. **Bảo vệ khỏi các cuộc tấn công phổ biến**:
   - **XSS (Cross-Site Scripting)**: Chúng tôi đảm bảo mã nguồn không chứa các lỗ hổng XSS bằng cách xác thực và làm sạch tất cả dữ liệu đầu vào.
   - **CSRF (Cross-Site Request Forgery)**: Các form sẽ sử dụng token bảo vệ CSRF để đảm bảo rằng các yêu cầu không bị giả mạo từ trang web bên ngoài.
   - **SQL Injection**: Dự án sử dụng ORM (Entity Framework hoặc Sequelize) để tránh việc trực tiếp sử dụng các câu lệnh SQL dễ bị tấn công.

4. **Cập nhật và vá lỗi**:
   - Dự án sẽ được duy trì và cập nhật thường xuyên để khắc phục bất kỳ lỗ hổng bảo mật mới nào được phát hiện.
   - Chúng tôi sẽ đảm bảo các thư viện và công cụ bên ngoài mà dự án sử dụng đều là phiên bản mới nhất và không chứa lỗ hổng bảo mật.

## Các bước bảo mật khi phát triển

1. **Kiểm tra bảo mật mã nguồn**:
   - Trước khi gửi pull request, các thay đổi trong mã nguồn phải được kiểm tra cẩn thận để tránh các lỗ hổng bảo mật.
   - Các công cụ như linters, formatters và kiểm tra bảo mật có thể được sử dụng để tự động phát hiện các vấn đề bảo mật.

2. **Đảm bảo môi trường phát triển an toàn**:
   - Không bao giờ chia sẻ thông tin nhạy cảm (như mật khẩu, khóa API, v.v.) trong mã nguồn.
   - Các khóa API và các thông tin bảo mật khác cần phải được lưu trữ an toàn và không bị đẩy lên GitHub hoặc các công cụ chia sẻ mã nguồn công khai khác.

3. **Đảm bảo tính bảo mật trong các quy trình CI/CD**:
   - Quy trình CI/CD cần được cấu hình để chạy các bài kiểm tra bảo mật, bao gồm kiểm tra mã nguồn và kiểm tra các lỗ hổng bảo mật.
   - Các kho lưu trữ nhạy cảm phải được bảo mật trong quá trình phát triển và triển khai.

## Cảm ơn và Hỗ trợ

Chúng tôi luôn sẵn sàng hợp tác và nhận phản hồi về bảo mật từ cộng đồng. Nếu bạn có bất kỳ câu hỏi nào liên quan đến bảo mật, hoặc cần hỗ trợ khẩn cấp, vui lòng gửi email đến [baoquoczero@gmail.com].

Cảm ơn bạn đã giúp duy trì một môi trường bảo mật cho dự án của chúng tôi!