-- 花花名冊專用資料表（不會修改電訪紀錄資料）
create table if not exists public.flower_records (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  image_data text,
  image_scale numeric not null default 100,
  owners text[] not null default '{}',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.flower_records enable row level security;

drop policy if exists "flower_records_select" on public.flower_records;
drop policy if exists "flower_records_insert" on public.flower_records;
drop policy if exists "flower_records_update" on public.flower_records;
drop policy if exists "flower_records_delete" on public.flower_records;

create policy "flower_records_select" on public.flower_records for select to anon using (true);
create policy "flower_records_insert" on public.flower_records for insert to anon with check (true);
create policy "flower_records_update" on public.flower_records for update to anon using (true) with check (true);
create policy "flower_records_delete" on public.flower_records for delete to anon using (true);
