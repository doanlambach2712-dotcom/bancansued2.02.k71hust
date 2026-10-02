// CẤU HÌNH ĐỒNG BỘ DỮ LIỆU DÙNG CHUNG
// 1) Tạo project Supabase.
// 2) Chạy file supabase_setup.sql trong SQL Editor.
// 3) Điền Project URL và anon/public key bên dưới.
// Không dùng service_role key trong file này.
window.CNGD_SUPABASE = {
  enabled: false,
  url: 'https://YOUR_PROJECT_ID.supabase.co',
  anonKey: 'YOUR_SUPABASE_ANON_PUBLIC_KEY',
  pollMs: 5000
};
