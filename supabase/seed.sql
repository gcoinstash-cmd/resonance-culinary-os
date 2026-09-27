-- ====================================================================
-- RESONANCE CULINARY ARCHIVE OS — Seed Data
-- ====================================================================

-- 1. Seed Culinary Chapters
insert into public.culinary_chapters (id, title, slug, era, culinary_region, narrative, cover_image_url, published)
values
  (
    'c1111111-1111-1111-1111-111111111111',
    'Lowcountry Gullah-Geechee Diaspora',
    'lowcountry-gullah-geechee',
    '18th–19th Century Sea Islands',
    'South Carolina & Georgia Coastline',
    'The preservation of West African rice cultivation techniques, benne seed alchemy, and iron-pot slow braising across the tidal marshes.',
    'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1200&q=80',
    true
  ),
  (
    'c2222222-2222-2222-2222-222222222222',
    'Creole French Quarter Guilds',
    'creole-french-quarter',
    '19th Century Antebellum & Reconstruction',
    'New Orleans River Parishes',
    'Complex roux architectures, aromatic trinity foundations, and classical French technique filtered through Afro-Caribbean spice sovereignty.',
    'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?auto=format&fit=crop&w=1200&q=80',
    true
  ),
  (
    'c3333333-3333-3333-3333-333333333333',
    'Great Migration Smokehouse Vanguard',
    'great-migration-smokehouse',
    'Early 20th Century Urban Corridors',
    'Chicago Bronzeville & Kansas City 18th & Vine',
    'Hardwood hickory distillation, heritage Berkshire pork shoulders, and heirloom sorghum mop sauces defined in subterranean jazz lounges.',
    'https://images.unsplash.com/photo-1529193591184-b1d58069ecdd?auto=format&fit=crop&w=1200&q=80',
    true
  )
on conflict (id) do nothing;

-- 2. Seed Tasting Menus
insert into public.tasting_menus (id, chapter_id, course_number, dish_name, heritage_notes, ingredients, dietary_notes, wine_pairing, price, active)
values
  (
    'm1111111-1111-1111-1111-111111111111',
    'c1111111-1111-1111-1111-111111111111',
    1,
    'Carolina Gold Rice Perloo & Crispy Soft-Shell Crab',
    'Stone-milled Carolina gold heirloom grain steeped in charred shellfish broth with sea-island field peas.',
    array['Carolina Gold Heirloom Rice', 'Soft-Shell Crab', 'Sea Island Red Peas', 'Benne Seed Oil', 'Charred Allium Broth'],
    'Pescatarian, Gluten-Free',
    'Domaine Huet Vouvray Sec 2021',
    185.00,
    true
  ),
  (
    'm2222222-2222-2222-2222-222222222222',
    'c2222222-2222-2222-2222-222222222222',
    2,
    'Duck & Smoked Andouille Gumbo Ya-Ya with Sassafras Filé',
    '45-minute mahogany copper roux, heritage Muscovy duck leg confit, and wild-foraged spring sassafras.',
    array['Confit Duck Leg', 'House-Smoked Andouille', 'Mahogany Roux', 'Trinity Mirepoix', 'Wild Sassafras Filé'],
    'Contains Poultry & Pork',
    'Ridge Geyserville Zinfandel Blend 2020',
    215.00,
    true
  ),
  (
    'm3333333-3333-3333-3333-333333333333',
    'c3333333-3333-3333-3333-333333333333',
    3,
    'Hickory-Smoked Heritage Pork Belly & Braised Collard Velouté',
    '14-hour post-oak and green hickory smoke, potlikker reduction, and pickled mustard caviar.',
    array['Berkshire Pork Belly', 'Potlikker Reduction', 'Slow-Simmered Brassica Greens', 'Mustard Caviar', 'Heirloom Cornbread Crisp'],
    'Gluten-Free upon request',
    'Château Musar Bekaa Valley Red 2017',
    225.00,
    true
  )
on conflict (id) do nothing;

-- 3. Seed Salon Reservations
insert into public.salon_reservations (id, booking_code, guest_name, guest_email, guest_phone, party_size, reservation_date, seating_time, dietary_restrictions, deposit_amount, deposit_paid, status)
values
  (
    'r1111111-1111-1111-1111-111111111111',
    'RES-2026-081',
    'Dr. Marcus Sterling',
    'm.sterling@gastronomy.org',
    '+1 (504) 555-0192',
    4,
    '2026-10-15',
    '19:30',
    'Shellfish allergy for 1 guest (substitute confit quail)',
    600.00,
    true,
    'Confirmed'
  ),
  (
    'r2222222-2222-2222-2222-222222222222',
    'RES-2026-082',
    'Elena Vance-DuPont',
    'elena.vance@dupontcellars.com',
    '+1 (212) 555-8374',
    2,
    '2026-10-16',
    '20:15',
    'None Reported',
    300.00,
    true,
    'Confirmed'
  )
on conflict (id) do nothing;

-- 4. Seed Lookbooks
insert into public.lookbooks (id, title, photographer, caption, image_url, category, display_order)
values
  (
    'l1111111-1111-1111-1111-111111111111',
    'The Iron Pot Hearth: Lowcountry Tidal Alchemy',
    'Alain St. Julien',
    'Hand-forged cast iron kettles resting over live hickory embers at the Beaufort salt marsh supper club.',
    'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1200&q=80',
    'Historic Documentation',
    1
  ),
  (
    'l2222222-2222-2222-2222-222222222222',
    'Copper & Trinity: The Architecture of Creole Roux',
    'Nadine Delacroix',
    'A 45-minute continuous dark mahogany reduction in hand-beaten French quarter copper braisers.',
    'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?auto=format&fit=crop&w=1200&q=80',
    'Technique & Craft',
    2
  )
on conflict (id) do nothing;
