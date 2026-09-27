# Supabase Turnkey Setup — Resonance Culinary Archive OS

Follow these 3 simple steps to connect Resonance Culinary Archive OS to your Supabase PostgreSQL backend.

---

### Step 1: Create Supabase Project
1. Go to [supabase.com](https://supabase.com) and create a new project.
2. Note your **Project URL** and **Anon Public Key** in **Settings > API**.

---

### Step 2: Run SQL Schema & Seed
1. In your Supabase Dashboard, open the **SQL Editor**.
2. Copy and paste the contents of `supabase/schema.sql` and click **Run**.
3. Copy and paste the contents of `supabase/seed.sql` and click **Run**.

---

### Step 3: Configure Environment Variables
Copy `.env.example` to `.env` and paste your Supabase keys:

```bash
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

Run `npm run dev` to launch the application.
