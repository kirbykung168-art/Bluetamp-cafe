# CLAUDE.md — Bluetamp Cafe website

## Brand
- Bluetamp Cafe — Specialty Coffee & All Day Brunch
- Founder: Chat "Toon" Thanaploypong — Bronze, Thailand National Barista Championship 2020 · Silver, Leva Speed Thailand 2023. Formerly 7 years as Breakfast Chef at Bluestone (Australia); trained on coffee at Campos Sydney — hence "Bluetamp".
- Motto: "Joy of life through coffee."
- Voice: friendly imperfect English from FB header — "We are small cafe in a great spot. We serve Specialty Coffee and we proud to present our Australian…" Preserve that voice. Don't over-polish.

## Two locations
- **Lat Phrao 73 (Cafe):** 56 Soi Lat Phrao 73, Saphan Song, Wang Thonglang, Bangkok 10310 · สาขาลาดพร้าว 73 · Specialty Coffee + All-Day Brunch.
- **Choke Chai 4 Soi 54 (Academy & Roastery):** 75/7 Soi Chokchai 4 Soi 54, Lat Phrao, Bangkok · สาขาโชคชัย 4 ซอย 54 · Academy Coffee & Roastery — training, roasting, retail beans.

## Verified facts
- Hours: daily ~08:00–18:00 (Google Maps shows "Closes 5 PM" with takeout ending 4:45 PM; some sources show 9–6). Default 08:00–18:00 but caveat with "see Maps for today" link.
- Phone: 02 070 9282 (+66 2 070 9282)
- Email: bluetamp@gmail.com
- Price tier: ££ · ฿200–400 per person (60 reports on Google Maps)
- Services: dine-in · curbside pickup · takeaway · Robinhood delivery (Thai delivery app)
- Social: FB 30K · IG 13.9K @bluetampcafe · YouTube @toonbluetamp
- Reviews: 96% recommend (2,795) · Google 4.6 / 1.7K · Wongnai 4.0 / 140
- Linktree lin.ee/rjt9sie → Academy, Roasted Beans (Shopee s.shopee.co.th/1bits1wsyp), YouTube
- Coffee origins surfaced: Ethiopia, Guatemala, Brazil + northern Thai single origins. Equipment: La Marzocco.

## Verified menu (use exact prices)
- Egg Benedict's Salmon — 280฿
- Bluetamp Melt (sourdough + ham + house tomato sauce + fries) — 230฿
- Spaghetti Carbonara (fettuccine, cream, milk, bacon, poached egg) — 190฿
- Caesar Salad — 180฿
- Cheese Stick — 120฿
- Brownie — 55฿
- Cappuccino — 90฿
- Piccolo Latte — 90฿
- Latte — 90฿
- Iced Mocha — 100฿
- Iced Chocolate — 120฿
- Matcha Latte — 170฿
- Monday Toast — 380฿
- Strawberry Toast — 240฿

## CTAs (priority)
1. **Get Directions** (primary) — to nearest location, two side-by-side cards.
2. **Order on Robinhood** (secondary) — Thai delivery.
3. **Shop Beans on Shopee** (tertiary) — s.shopee.co.th/1bits1wsyp.

## Five revenue lines — all must be surfaced
1. The Cafe (two locations)
2. Specialty Coffee Program + Roastery
3. All-Day Brunch
4. Bluetamp Academy (barista training)
5. Roasted Beans on Shopee

Plus: Robinhood delivery · LINE Official Account · YouTube @toonbluetamp.

## Palette
- Primary sky-blue `#4E9DD6` (from FB cover + IG avatar)
- Deep navy `#1A4D80` (typographic weight)
- Espresso brown `#3A2419` (coffee imagery, dark accents)
- Warm cream `#F4ECD9` (brunch warmth)
- Crisp white `#FCFCFC` (background)

## Typography
- Display: Fraunces (variable serif — confident editorial, faintly Australian-roastery)
- Body: Inter (clean modern sans)
- Thai: Noto Sans Thai
- Smart quotes, en/em dashes, generous line-height, tight tracking on display.

## Brand animations to ship (≥6)
1. **Tamper press on logo** — SVG `.bt-tamper` translates down 4px + bounce-out (400ms) on hover and on load.
2. **Espresso pour hero reveal** — deep-brown circular wipe-in over hero on load; wordmark fades up. 1.2s ease-out.
3. **Steam wisps** — pure-CSS translucent SVG wisps rising from menu cards / coffee photos. 0.15 opacity loop.
4. **Coffee-bean scroll progress** — tiny SVG bean traveling along thin line tied to scroll progress.
5. **Puck-drop card hover** — menu/section card lifts 4px + warm cocoa shadow blooms beneath.
6. **Count-up social proof** — 96 / 2,795 / 13.9K / 4.6 animate from 0 with stagger when scrolled into view.
7. **Two-location carousel** — snap-scroll on mobile, side-by-side parallax on desktop.
8. **Day → afternoon palette warm** — background subtly warms as user scrolls (CSS var interpolation).
9. **CTA pulse** — primary "Get Directions" CTA has soft pulsing ring loop.
10. **Ken Burns gallery drift** — gallery tiles drift slowly while visible.

All respect `prefers-reduced-motion: reduce` (no transforms, no auto-play).

## Always Do First
- Verify every image is Bluetamp. Inline `<!-- src: <URL>, verified via <method> -->` next to each `<img>`.
- Mobile-first 390px.

## Local Server
- `node serve.mjs` → http://localhost:3000
- Never screenshot file://

## Image discipline
- WebP only in production. 800w + 1600w srcset. Hero `<link rel="preload">`. All others `loading="lazy" decoding="async"`.
- Originals (JPG) kept in `/images/` for reference only; production uses `/images/optimized/`.

## Hard rules
- Don't ship before screenshot QA round 2 (desktop + 390px mobile, compared to FB banner + IG grid).
- Don't use `transition-all`. Animate `transform` + `opacity` only.
- Don't substitute generic stock for Bluetamp imagery.
- Don't correct the friendly imperfect-English brand voice into corporate.
