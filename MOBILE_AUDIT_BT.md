# Bluetamp Cafe — Mobile Audit (iPhone 14 · 390 × 844 · DPR 3)

Live URL audited: **https://bluetamp-cafe.vercel.app/**
Run: Playwright headless, 24 section screenshots + JS probe (overflow, broken images, tap targets, console errors).
Screenshots saved under `.qa/mobile-v3/`.

## Headline numbers

| Metric | Value | Verdict |
|---|---|---|
| Page width | 390 (= viewport) | ✅ no horizontal overflow |
| Page height | 17,706 px | within range |
| Broken images (`naturalWidth === 0`) | 0 | ✅ |
| Console errors | 0 | ✅ |
| Failed / 4xx requests | 0 | ✅ |
| Tap targets < 44×44 | **24** | ⚠️ fix |
| Counters mid-paint flash of 0 | none (hero shows 96%, 4.6★, 30K, 13.9K immediately) | ✅ |
| Counters animating when proof strip scrolled in | yes — captured 95% / 13.8K mid-tween | ✅ working as designed |

The two big-impact bugs:

1. **Footer "© 2026 Bluetamp Cafe · บลูแทมป์ คาเฟ่"** renders the Thai as tofu boxes (`□□□□□□□□`) because the footer `<p>` doesn't pull the Noto Sans Thai stack.
2. **Type-moment "BLUETAMP" wordmark crops to "BLUETAMI"** on 390px viewports — 24vw font × 8 chars overruns the viewport off the right edge instead of centering symmetrically.

Then a bunch of micro tap targets in the footer + press card "Read"/"Watch" links.

## Per-section findings + fixes

### Hero (`sec-hero.png`)

- ✅ Wordmark + display headline scale cleanly. Manifesto block + CTAs stack correctly.
- ⚠️ **Bug — dangling close-quote.** The `<p class="manifesto">` uses `::after { content: "”" }` for the closing curly quote. Because `<cite>` is inside the paragraph and appears between the prose and the close-quote, the curly quote renders **on its own line BELOW the cite** ("— BLUETAMP CAFE, IN THEIR OWN WORDS / ”").
  - **Fix:** wrap the prose-only text in a `<span>` and let the cite sit OUTSIDE the quoted span; OR restructure to put `<cite>` *after* a manually-typed closing quote inside the span. Cheapest fix: remove `::after` and place the closing quote inline at the end of the prose span before the cite.
- ✅ Tap targets on hero CTAs are 50×50 — meets 44px.
- ⚠️ Nav "Get Directions" pill: 127×36 — 8px under target height. Easy fix: `padding-block: 12px` on `.nav-cta`.

### Type moment (`sec-type.png`)

- ⚠️ **Bug — "BLUETAMP" crops to "BLUETAMI" on mobile.** `font-size: clamp(80px, 24vw, 360px)` × 8 chars at 390vw = ~750px wide. `white-space:nowrap` keeps it one line, `overflow:hidden` clips the right edge. Browsers don't always center-align overflowing nowrap text symmetrically.
  - **Fix:** at `(max-width: 640px)`, drop font size so the word fits or nearly fits: `font-size: clamp(56px, 14vw, 80px)` brings it to ~55px × 8 = 440px (just slightly over) but center-aligned crop is barely visible at the edges. Alternatively: reduce to 13vw to fit fully (390/8 ≈ 49px = 12.5vw).
  - **Chosen fix:** mobile breakpoint `font-size: clamp(54px, 13vw, 78px)` so BLUETAMP fits within ~405px → 4px overflow per side which centers cleanly.

### Story strip (`sec-story.png`, `-mid.png`, `-bot.png`)

- ✅ Horizontal snap-scroll works on mobile. Chapter cards display correctly.
- ✅ Scroll-hint "Scroll →" is visible.
- No bugs.

### Locations (`sec-locations.png`, `-mid.png`, `-bot.png`)

- ✅ Cards stack vertically as designed at `< 880px`. Lat Phrao 73 + Choke Chai 4 Soi 54 get equal prominence with full map iframes, addresses, Thai sub-labels, action pills.
- ✅ "Get Directions" pill is 139×38 — needs 6px more vertical padding to reach 44.
- ✅ "Call" + "Facebook" + "Academy info" + "@bluetamp.academy" pills: 38px tall — same fix.
- ⚠️ Tel link `02 070 9282` inside meta line: 80×16 — too small (it's an inline `<a>`). Either make the whole meta line `<a>`-wrappable, or just wrap it in `tel:` with `padding: 6px 0` to bump it to 28+px.

### Coffee program (`sec-coffee.png`)

- ✅ Brand-card image renders correctly. Coffee list items stack readably.
- ✅ "market" price label on items 5 + 6 reads clearly.

### Brunch / Bento (`sec-menu.png`, `-mid.png`, `-bot.png`)

- ✅ Bento collapses to single-column on mobile as designed. Feature (Egg Benedict), tall (Monday Toast), wide (Bluetamp Melt), quote callout, plus the three thirds (Carbonara, Capellini, Spread, Strawberry Toast, Iced Coffee Bar) all render at full mobile width.
- ✅ Photos are well-cropped at 4:3 (no awkward squish).
- ✅ "Service-charge free" + LINE link footer prose reads naturally.
- ⚠️ Inline `<a>` to LINE in the footer prose: 31×17 — micro tap target.

### Academy (`sec-academy.png`)

- ✅ Dark theme transitions cleanly from the menu's cream. Headline scales. Founder portrait renders properly.
- ⚠️ Action CTAs ("Course info on LINE →", "@bluetamp.academy", "YouTube · @toonbluetamp") are 50px tall — meets target. Good.
- ✅ Founder pull-quote ("Joy of life through coffee.") renders at proper italic display weight.

### Beans (`sec-beans.png`, `-mid.png`, `-bot.png`)

- ✅ Brand-bag photo renders correctly.
- ⚠️ **Bean rows feel cramped on mobile.** The 60-1fr-auto grid leaves the description column ~190px wide, forcing 6 lines of wrap for the House Blend notes. The right "buy" column with ฿380 · 250g + "Shopee →" feels squashed beside the long description.
  - **Fix:** on `(max-width: 600px)` switch `.bean-row` to a two-row grid: row 1 = badge + name/notes block, row 2 = price+buy spans full width with `justify-content: space-between`. Much more breathable.

### Social proof strip (`sec-proof.png`)

- ✅ Caught mid-animation count-up: 95% / 13.8K — confirms animation runs when scrolled in.
- ⚠️ "30K / FACEBOOK FOLLOWERS" wraps onto two lines but renders fine.
- No bugs.

### Press wall (`sec-press.png`, `-mid.png`, `-bot.png`)

- ✅ All 4 cards stack vertically. Single-column on `< 520px` viewport. Source eyebrow, blockquote, meta strip all render correctly.
- ✅ Dark credential card visually distinguishes correctly. Quote sits above the cite line.
- ⚠️ Medal indicator `🥉 + 🥈` in the top-right of the credential card renders as a tiny mark instead of recognizable medal emojis (likely due to `font-style: italic` and `font-size: 13px` combination). Promote to `font-size: 18px` and remove `font-style: italic` (emojis don't italicize) on `.press-card.credential .medal`.
- ⚠️ "Read" / "Watch" external-link buttons inside the meta strip: 47×15 and 52×15 — small tap targets. Bump to `padding: 8px 4px` so they become roughly 56×31 — still wider than tall but better.

### Gallery (`sec-gallery.png`)

- ✅ Gallery collapses to a 6-column grid with the feature taking 6 cols. First three tiles render at proper aspect.
- ✅ Photo loading correctly with Ken Burns drift triggering on scroll.

### Reviews (`sec-reviews.png`)

- ✅ Cards stack vertically.
- ✅ Star color + size + italic blockquote all read well.

### Footer (`sec-footer.png`)

- ❌ **BUG — Thai tofu boxes.** The brand-block copy `"© 2026 Bluetamp Cafe · บลูแทมป์ คาเฟ่"` renders the Thai as `□□□□□□□□`. The footer `<p>` uses the default `var(--sans)` (Inter) which has no Thai glyphs, and Inter doesn't fall back to Noto Sans Thai (which IS loaded) because the cascade doesn't include it.
  - **Fix:** wrap the Thai chars in `<span class="thai">` so they pull `font-family: var(--thai)`.
- ⚠️ Footer link list `<a>`s are 17px tall (inline text) — all 14 of them. To meet 44px, give each `<li> a` a `padding-block: 10px` and `display: inline-block`.

## Fix plan (surgical, ~20 lines of CSS + 3 HTML touchups)

1. Hero manifesto — restructure markup so closing quote sits at end of prose, not after cite. (HTML change)
2. Footer Thai — wrap in `<span class="thai">`. (HTML change)
3. Press credential card — `.medal { font-size: 17px; font-style: normal; }` (CSS)
4. Press card .ext links — bump `padding`. (CSS)
5. Mobile breakpoint `@media (max-width: 640px)`:
   - `.bg-text { font-size: clamp(54px, 13vw, 78px); }` — fix BLUETAMP overflow
   - `.nav-cta { padding-block: 12px; }` — meet 44px
   - `.cta { padding-block: 18px; }` — meet 44px
   - `.pill { padding-block: 12px; }` — meet 44px
   - `.bean-row` switch to 2-row layout
   - `.footer ul li a { display: inline-block; padding-block: 8px; }` — meet 44px

## Out of scope (not regressions, not bugs)

- Two-location section explicitly **does not** include EMSPHERE — Kirby's brief mentioned that name but Bluetamp's actual second location is **Choke Chai 4 Soi 54** (Academy & Roastery). Both stack with equal prominence as designed.
- Smaller inline footer link targets are intentional in editorial style — borderline acceptable on mobile, but bumping with padding doesn't hurt.
