# CNGD 02 - K71 — phiên bản đồng bộ dữ liệu dùng chung

## File
- `index.html` — giao diện chính, giữ nguyên dữ liệu/giao diện gốc và bổ sung đồng bộ.
- `login.html` — trang đăng nhập; phiên dùng `sessionStorage` nên đóng cửa sổ/tab sẽ phải đăng nhập lại.
- `supabase-config.js` — nơi điền URL và anon/public key của Supabase.
- `supabase_setup.sql` — tạo bảng và policy cho kho dữ liệu dùng chung.

## Cài đặt
1. Tạo một project Supabase.
2. Vào SQL Editor và chạy toàn bộ `supabase_setup.sql`.
3. Vào Project Settings → API, lấy Project URL và anon/public key.
4. Mở `supabase-config.js`, đổi `enabled: false` thành `enabled: true` và điền 2 giá trị.
5. Đưa cả 3 file HTML/JS lên cùng thư mục gốc GitHub Pages.

## Đồng bộ hoạt động thế nào
- Lần đầu, nếu database chưa có dữ liệu, hệ thống sẽ lấy dữ liệu hiện có trên máy và đưa lên cloud.
- Sau đó 3 người dùng cùng đọc/ghi hai nguồn dữ liệu: danh sách sinh viên và quỹ lớp.
- Hệ thống kiểm tra thay đổi cloud mặc định mỗi 5 giây, nên khi Ly thêm quỹ, Bách và Ngân sẽ nhận dữ liệu mới trong vài giây.
- Dữ liệu cũ trong trình duyệt vẫn được giữ làm bản dự phòng.

## Quan trọng
Phiên bản này giữ nguyên cơ chế đăng nhập 3 tài khoản ở phía trình duyệt. Đây không phải cơ chế xác thực máy chủ an toàn; không dùng `service_role` key trên GitHub Pages. Với dữ liệu cá nhân thực tế, nên nâng cấp tiếp sang Supabase Auth + Row Level Security theo từng tài khoản.
