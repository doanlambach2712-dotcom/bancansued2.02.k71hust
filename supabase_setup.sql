-- CNGD 02 - K71: kho dữ liệu dùng chung
-- Chạy toàn bộ đoạn này trong Supabase SQL Editor.

create table if not exists public.app_state (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz not null default now(),
  updated_by text
);

alter table public.app_state enable row level security;

-- Lưu ý: các policy dưới đây phục vụ bản triển khai GitHub Pages + đăng nhập client-side hiện tại.
-- Chúng cho phép website đọc/ghi đúng 2 bản ghi dữ liệu dùng chung.
-- Nếu triển khai chính thức với dữ liệu cá nhân, nên chuyển sang Supabase Auth + RLS theo user.

drop policy if exists "cngd02_select" on public.app_state;
drop policy if exists "cngd02_insert" on public.app_state;
drop policy if exists "cngd02_update" on public.app_state;
drop policy if exists "cngd02_delete" on public.app_state;

create policy "cngd02_select" on public.app_state
for select to anon
using (key in ('cngd02k71.sinhvien.v1','cngd02k71.quy.v1'));

create policy "cngd02_insert" on public.app_state
for insert to anon
with check (key in ('cngd02k71.sinhvien.v1','cngd02k71.quy.v1'));

create policy "cngd02_update" on public.app_state
for update to anon
using (key in ('cngd02k71.sinhvien.v1','cngd02k71.quy.v1'))
with check (key in ('cngd02k71.sinhvien.v1','cngd02k71.quy.v1'));

create policy "cngd02_delete" on public.app_state
for delete to anon
using (key in ('cngd02k71.sinhvien.v1','cngd02k71.quy.v1'));
