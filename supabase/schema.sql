-- ====================================================================
-- RESONANCE CULINARY ARCHIVE OS — Database Schema & Row Level Security
-- Historic Foodways, Sensory Gastronomy & Curated Private Dining
-- ====================================================================

-- Enable UUID extension
create extension if not exists "uuid-ossp";

-- 1. CULINARY CHAPTERS (Historic & Regional Foodway Curations)
create table if not exists public.culinary_chapters (
  id uuid primary key default uuid_generate_v4(),
  title text not null,
  slug text unique not null,
  era text not null,
  culinary_region text not null,
  narrative text not null,
  cover_image_url text not null,
  published boolean default true not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 2. TASTING MENUS (Historic Courses & Sensory Provisions)
create table if not exists public.tasting_menus (
  id uuid primary key default uuid_generate_v4(),
  chapter_id uuid references public.culinary_chapters(id) on delete cascade,
  course_number int not null,
  dish_name text not null,
  heritage_notes text not null,
  ingredients text[] not null,
  dietary_notes text,
  wine_pairing text,
  price numeric(10,2) default 185.00 not null,
  active boolean default true not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 3. SALON RESERVATIONS (Private Supper Club & Tasting Bookings)
create table if not exists public.salon_reservations (
  id uuid primary key default uuid_generate_v4(),
  booking_code text unique not null,
  guest_name text not null,
  guest_email text not null,
  guest_phone text not null,
  party_size int default 2 not null check (party_size between 1 and 12),
  reservation_date date not null,
  seating_time text not null,
  dietary_restrictions text default 'None Reported',
  deposit_amount numeric(10,2) default 150.00 not null,
  deposit_paid boolean default true not null,
  status text default 'Confirmed' check (status in ('Pending', 'Confirmed', 'Seated', 'Completed', 'Cancelled')),
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 4. EDITORIAL LOOKBOOKS (Sensory Photography & Culinary Archives)
create table if not exists public.lookbooks (
  id uuid primary key default uuid_generate_v4(),
  title text not null,
  photographer text not null,
  caption text not null,
  image_url text not null,
  category text default 'Gastronomy' not null,
  display_order int default 1 not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- ====================================================================
-- ROW-LEVEL SECURITY (RLS) POLICIES
-- ====================================================================

alter table public.culinary_chapters enable row level security;
alter table public.tasting_menus enable row level security;
alter table public.salon_reservations enable row level security;
alter table public.lookbooks enable row level security;

-- Public read access
create policy "Chapters are publicly viewable"
  on public.culinary_chapters for select
  using (published = true);

create policy "Tasting menus are publicly viewable"
  on public.tasting_menus for select
  using (active = true);

create policy "Lookbooks are publicly viewable"
  on public.lookbooks for select
  using (true);

-- Public reservation booking
create policy "Public can submit salon reservations"
  on public.salon_reservations for insert
  with check (true);

-- Admin / Service Role full access
create policy "Admin full access on culinary_chapters"
  on public.culinary_chapters for all
  using (auth.role() = 'service_role' or auth.jwt() ->> 'role' = 'admin');

create policy "Admin full access on tasting_menus"
  on public.tasting_menus for all
  using (auth.role() = 'service_role' or auth.jwt() ->> 'role' = 'admin');

create policy "Admin full access on salon_reservations"
  on public.salon_reservations for all
  using (auth.role() = 'service_role' or auth.jwt() ->> 'role' = 'admin');

create policy "Admin full access on lookbooks"
  on public.lookbooks for all
  using (auth.role() = 'service_role' or auth.jwt() ->> 'role' = 'admin');
