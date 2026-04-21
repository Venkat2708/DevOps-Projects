<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>NexusShop — Premium Collection</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700;800&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous"/>
  <style>
    :root {
      --bg: #0c0d0f;
      --bg2: #111316;
      --bg3: #181a1f;
      --card: #15171c;
      --border: rgba(255,255,255,0.07);
      --primary: #f0ece4;
      --muted: #7a7d87;
      --accent: #c9a96e;
      --accent2: #e8c98a;
      --danger: #e05252;
      --success: #4ade80;
      --radius: 16px;
      --radius-sm: 10px;
      --container: 1280px;
      --transition: 0.3s cubic-bezier(0.4,0,0.2,1);
    }
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; }
    body {
      font-family: 'DM Sans', system-ui, sans-serif;
      background: var(--bg);
      color: var(--primary);
      -webkit-font-smoothing: antialiased;
      overflow-x: hidden;
    }
    a { color: inherit; text-decoration: none; }
    img { display: block; }

    /* ── Scrollbar ── */
    ::-webkit-scrollbar { width: 6px; height: 6px; }
    ::-webkit-scrollbar-track { background: var(--bg2); }
    ::-webkit-scrollbar-thumb { background: var(--accent); border-radius: 99px; }

    /* ── Container ── */
    .container { width: 100%; max-width: var(--container); margin: 0 auto; padding: 0 24px; }

    /* ── Noise texture overlay ── */
    body::before {
      content: '';
      position: fixed; inset: 0; z-index: 0; pointer-events: none;
      background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.04'/%3E%3C/svg%3E");
      opacity: 0.3;
    }

    /* ══════════════════════════════════
       HEADER
    ══════════════════════════════════ */
    header {
      position: sticky; top: 0; z-index: 100;
      background: rgba(12,13,15,0.88);
      backdrop-filter: blur(20px) saturate(1.4);
      border-bottom: 1px solid var(--border);
    }
    .header-inner {
      display: flex; align-items: center;
      justify-content: space-between; gap: 20px;
      padding: 16px 0;
    }
    .brand {
      font-family: 'Playfair Display', serif;
      font-size: 22px; font-weight: 800;
      letter-spacing: -0.02em;
      background: linear-gradient(135deg, var(--accent2), var(--accent));
      -webkit-background-clip: text; -webkit-text-fill-color: transparent;
      white-space: nowrap;
    }
    .brand span { color: var(--primary); -webkit-text-fill-color: var(--primary); opacity: 0.45; }
    nav.main-nav ul {
      display: flex; gap: 4px; list-style: none; align-items: center;
    }
    nav.main-nav li a {
      display: flex; align-items: center; gap: 7px;
      padding: 8px 14px; border-radius: var(--radius-sm);
      font-size: 14px; font-weight: 500; color: var(--muted);
      transition: color var(--transition), background var(--transition);
    }
    nav.main-nav li a:hover { color: var(--primary); background: var(--bg3); }
    nav.main-nav li a i { font-size: 13px; color: var(--accent); }

    .search-wrap {
      display: flex; align-items: center; gap: 10px;
      background: var(--bg3); border: 1px solid var(--border);
      padding: 9px 16px; border-radius: 999px;
      min-width: 260px; transition: border-color var(--transition);
    }
    .search-wrap:focus-within { border-color: var(--accent); }
    .search-wrap input {
      border: 0; background: transparent; outline: none;
      width: 100%; font-size: 14px; color: var(--primary);
      font-family: 'DM Sans', sans-serif;
    }
    .search-wrap input::placeholder { color: var(--muted); }
    .search-wrap button {
      background: none; border: 0; cursor: pointer;
      color: var(--accent); font-size: 14px;
    }
    .header-actions { display: flex; align-items: center; gap: 6px; }
    .icon-btn {
      width: 40px; height: 40px; display: inline-flex;
      align-items: center; justify-content: center;
      border-radius: var(--radius-sm); border: 1px solid var(--border);
      color: var(--muted); font-size: 15px; cursor: pointer;
      background: var(--bg3); transition: all var(--transition);
    }
    .icon-btn:hover { color: var(--primary); border-color: var(--accent); }
    .cart-btn {
      position: relative;
      background: linear-gradient(135deg, var(--accent2), var(--accent));
      color: #1a1200 !important; border: 0 !important;
      font-weight: 600;
    }
    .cart-btn:hover { transform: scale(1.06); }
    .cart-count {
      position: absolute; top: -7px; right: -7px;
      background: var(--danger); color: white;
      font-size: 10px; font-weight: 700;
      width: 18px; height: 18px; border-radius: 50%;
      display: inline-grid; place-items: center;
      border: 2px solid var(--bg);
    }
    .mobile-toggle {
      display: none; background: var(--bg3); border: 1px solid var(--border);
      color: var(--primary); font-size: 16px; cursor: pointer;
      width: 40px; height: 40px; border-radius: var(--radius-sm);
      align-items: center; justify-content: center;
    }
    #mobileMenu {
      display: none; background: var(--bg2);
      border-top: 1px solid var(--border);
      padding: 16px 0;
    }
    #mobileMenu ul { list-style: none; display: flex; flex-direction: column; gap: 4px; }
    #mobileMenu li a {
      display: block; padding: 10px 16px; border-radius: var(--radius-sm);
      color: var(--muted); font-size: 15px; font-weight: 500;
      transition: all var(--transition);
    }
    #mobileMenu li a:hover { color: var(--primary); background: var(--bg3); }

    /* ══════════════════════════════════
       HERO
    ══════════════════════════════════ */
    .hero {
      position: relative; overflow: hidden;
      min-height: 540px;
      display: flex; align-items: center;
    }
    .hero-bg {
      position: absolute; inset: 0;
      background: url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1600&q=80') center/cover no-repeat;
    }
    .hero-bg::after {
      content: '';
      position: absolute; inset: 0;
      background: linear-gradient(105deg, rgba(12,13,15,0.92) 0%, rgba(12,13,15,0.7) 50%, rgba(12,13,15,0.45) 100%);
    }
    .hero-content {
      position: relative; z-index: 2;
      max-width: 680px; padding: 80px 0;
    }
    .hero-eyebrow {
      display: inline-flex; align-items: center; gap: 8px;
      background: rgba(201,169,110,0.12); border: 1px solid rgba(201,169,110,0.25);
      color: var(--accent); font-size: 12px; font-weight: 600;
      letter-spacing: 0.12em; text-transform: uppercase;
      padding: 6px 14px; border-radius: 999px; margin-bottom: 24px;
    }
    .hero-eyebrow::before { content: ''; width: 6px; height: 6px; border-radius: 50%; background: var(--accent); }
    .hero h1 {
      font-family: 'Playfair Display', serif;
      font-size: clamp(36px, 5vw, 64px);
      font-weight: 800; line-height: 1.1;
      letter-spacing: -0.03em; margin-bottom: 20px;
    }
    .hero h1 em {
      font-style: italic;
      background: linear-gradient(135deg, var(--accent2), var(--accent));
      -webkit-background-clip: text; -webkit-text-fill-color: transparent;
    }
    .hero p {
      font-size: 16px; color: rgba(240,236,228,0.7);
      line-height: 1.7; margin-bottom: 36px; max-width: 520px;
    }
    .hero-actions { display: flex; gap: 14px; flex-wrap: wrap; }
    .btn {
      display: inline-flex; align-items: center; gap: 10px;
      padding: 13px 24px; border-radius: 999px;
      font-weight: 600; font-size: 14px; cursor: pointer; border: 0;
      transition: all var(--transition); font-family: 'DM Sans', sans-serif;
    }
    .btn-gold {
      background: linear-gradient(135deg, var(--accent2), var(--accent));
      color: #1a1200;
    }
    .btn-gold:hover { transform: translateY(-2px); box-shadow: 0 12px 32px rgba(201,169,110,0.35); }
    .btn-outline {
      background: transparent;
      border: 1px solid rgba(240,236,228,0.2) !important;
      color: var(--primary);
    }
    .btn-outline:hover { border-color: var(--accent) !important; color: var(--accent); background: rgba(201,169,110,0.08); }
    .hero-stats {
      display: flex; gap: 36px; margin-top: 52px;
    }
    .stat-item { text-align: center; }
    .stat-num {
      font-family: 'Playfair Display', serif;
      font-size: 28px; font-weight: 700; color: var(--accent2);
      line-height: 1;
    }
    .stat-label { font-size: 12px; color: var(--muted); margin-top: 4px; letter-spacing: 0.06em; }

    /* ══════════════════════════════════
       SECTIONS
    ══════════════════════════════════ */
    .section { padding: 72px 0; }
    .section-header { text-align: center; margin-bottom: 48px; }
    .section-eyebrow {
      display: inline-block;
      font-size: 11px; font-weight: 600; letter-spacing: 0.15em;
      text-transform: uppercase; color: var(--accent);
      margin-bottom: 12px;
    }
    .section-header h2 {
      font-family: 'Playfair Display', serif;
      font-size: clamp(28px, 3vw, 42px); font-weight: 700;
      letter-spacing: -0.02em; margin-bottom: 12px;
    }
    .section-header p { color: var(--muted); font-size: 15px; }

    /* ── Category Pills ── */
    .cat-filter {
      display: flex; gap: 10px; justify-content: center;
      flex-wrap: wrap; margin-bottom: 40px;
    }
    .cat-pill {
      display: flex; align-items: center; gap: 8px;
      padding: 10px 20px; border-radius: 999px;
      border: 1px solid var(--border); background: var(--card);
      color: var(--muted); font-size: 13px; font-weight: 500;
      cursor: pointer; transition: all var(--transition);
    }
    .cat-pill i { color: var(--accent); font-size: 13px; }
    .cat-pill:hover, .cat-pill.active {
      border-color: var(--accent); color: var(--primary);
      background: rgba(201,169,110,0.1);
    }

    /* ── Product Grid ── */
    .products-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 20px;
    }

    /* ── Product Card ── */
    .product-card {
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: var(--radius);
      overflow: hidden; display: flex; flex-direction: column;
      transition: transform var(--transition), border-color var(--transition), box-shadow var(--transition);
      position: relative;
    }
    .product-card:hover {
      transform: translateY(-6px);
      border-color: rgba(201,169,110,0.3);
      box-shadow: 0 24px 60px rgba(0,0,0,0.4), 0 0 0 1px rgba(201,169,110,0.1);
    }
    .product-img-wrap { position: relative; overflow: hidden; }
    .product-card img {
      width: 100%; height: 210px; object-fit: cover;
      transition: transform 0.5s cubic-bezier(0.4,0,0.2,1);
    }
    .product-card:hover img { transform: scale(1.07); }
    .product-badge {
      position: absolute; top: 12px; left: 12px; z-index: 2;
      padding: 4px 10px; border-radius: 6px;
      font-size: 11px; font-weight: 700; letter-spacing: 0.04em;
    }
    .badge-new { background: var(--success); color: #0a1a0a; }
    .badge-sale { background: var(--danger); color: white; }
    .wish-overlay {
      position: absolute; top: 12px; right: 12px; z-index: 2;
      width: 34px; height: 34px; border-radius: 50%;
      background: rgba(12,13,15,0.75); backdrop-filter: blur(8px);
      border: 1px solid var(--border);
      display: flex; align-items: center; justify-content: center;
      cursor: pointer; color: var(--muted); font-size: 13px;
      transition: all var(--transition);
    }
    .wish-overlay:hover, .wish-overlay.active { color: var(--danger); border-color: var(--danger); }
    .product-body { padding: 16px; flex: 1; display: flex; flex-direction: column; gap: 10px; }
    .product-category {
      font-size: 11px; font-weight: 600; letter-spacing: 0.1em;
      text-transform: uppercase; color: var(--accent); opacity: 0.8;
    }
    .product-title {
      font-size: 15px; font-weight: 600; line-height: 1.35;
      color: var(--primary);
    }
    .product-rating { display: flex; align-items: center; gap: 6px; }
    .stars { color: var(--accent2); font-size: 12px; letter-spacing: 1px; }
    .review-count { font-size: 12px; color: var(--muted); }
    .price-row { display: flex; align-items: baseline; gap: 8px; margin-top: auto; }
    .price { font-size: 18px; font-weight: 700; color: var(--accent2); }
    .old-price { font-size: 13px; color: var(--muted); text-decoration: line-through; }
    .product-footer { padding: 0 16px 16px; display: flex; gap: 10px; }
    .add-btn {
      flex: 1; background: var(--bg3); border: 1px solid var(--border);
      color: var(--primary); padding: 10px 14px; border-radius: var(--radius-sm);
      font-size: 13px; font-weight: 600; cursor: pointer;
      display: flex; align-items: center; justify-content: center; gap: 8px;
      transition: all var(--transition); font-family: 'DM Sans', sans-serif;
    }
    .add-btn:hover { background: linear-gradient(135deg, var(--accent2), var(--accent)); color: #1a1200; border-color: transparent; }
    .add-btn:disabled { opacity: 0.6; cursor: default; background: rgba(74,222,128,0.12); border-color: var(--success); color: var(--success); }

    /* ══════════════════════════════════
       DEAL SECTION
    ══════════════════════════════════ */
    #deals { background: var(--bg2); }
    .deal-card {
      display: grid; grid-template-columns: 1fr 1fr;
      background: var(--card); border: 1px solid var(--border);
      border-radius: 20px; overflow: hidden;
    }
    .deal-img-side { position: relative; overflow: hidden; min-height: 400px; }
    .deal-img-side img { width: 100%; height: 100%; object-fit: cover; }
    .deal-img-side::after {
      content: '';
      position: absolute; inset: 0;
      background: linear-gradient(90deg, transparent 60%, rgba(21,23,28,0.8));
    }
    .deal-content { padding: 48px 44px; display: flex; flex-direction: column; justify-content: center; gap: 20px; }
    .deal-tag {
      display: inline-flex; align-items: center; gap: 8px;
      background: rgba(224,82,82,0.12); border: 1px solid rgba(224,82,82,0.3);
      color: #ff7b7b; font-size: 12px; font-weight: 700;
      letter-spacing: 0.1em; text-transform: uppercase;
      padding: 6px 14px; border-radius: 999px; width: fit-content;
    }
    .deal-tag::before { content: ''; width: 6px; height: 6px; border-radius: 50%; background: #ff7b7b; animation: pulse 1.5s infinite; }
    @keyframes pulse { 0%, 100% { opacity: 1; } 50% { opacity: 0.3; } }
    .deal-title {
      font-family: 'Playfair Display', serif;
      font-size: 36px; font-weight: 800; line-height: 1.15;
      letter-spacing: -0.02em;
    }
    .deal-subtitle { color: var(--muted); font-size: 15px; line-height: 1.6; }
    .timer { display: flex; gap: 12px; }
    .time-box {
      background: var(--bg3); border: 1px solid var(--border);
      border-radius: 12px; padding: 14px 18px;
      text-align: center; min-width: 72px;
    }
    .time-num {
      font-family: 'Playfair Display', serif;
      font-size: 28px; font-weight: 700; color: var(--accent2);
      line-height: 1;
    }
    .time-label { font-size: 10px; color: var(--muted); text-transform: uppercase; letter-spacing: 0.1em; margin-top: 4px; }
    .deal-pricing { display: flex; align-items: center; gap: 16px; }
    .deal-price { font-family: 'Playfair Display', serif; font-size: 36px; font-weight: 700; color: var(--accent2); }
    .deal-old { font-size: 18px; color: var(--muted); text-decoration: line-through; }
    .deal-badge { background: var(--danger); color: white; padding: 6px 12px; border-radius: 8px; font-size: 14px; font-weight: 700; }
    .deal-stock { font-size: 13px; color: var(--muted); }
    .deal-stock strong { color: #ff9a9a; }

    /* ══════════════════════════════════
       TESTIMONIALS
    ══════════════════════════════════ */
    .testimonials-track {
      display: flex; gap: 16px; overflow-x: auto;
      padding: 8px 4px 16px; scrollbar-width: none;
    }
    .testimonials-track::-webkit-scrollbar { display: none; }
    .testimonial-card {
      min-width: 300px; flex-shrink: 0;
      background: var(--card); border: 1px solid var(--border);
      border-radius: var(--radius); padding: 24px;
      transition: border-color var(--transition);
    }
    .testimonial-card:hover { border-color: rgba(201,169,110,0.3); }
    .t-stars { color: var(--accent2); font-size: 14px; margin-bottom: 12px; }
    .t-text { color: rgba(240,236,228,0.75); font-size: 14px; line-height: 1.7; margin-bottom: 20px; }
    .t-author { display: flex; align-items: center; gap: 12px; }
    .t-avatar { width: 44px; height: 44px; border-radius: 50%; object-fit: cover; border: 2px solid rgba(201,169,110,0.3); }
    .t-name { font-weight: 600; font-size: 14px; }
    .t-role { font-size: 12px; color: var(--muted); }

    /* ══════════════════════════════════
       NEWSLETTER
    ══════════════════════════════════ */
    .newsletter-section {
      background: linear-gradient(135deg, #1a1400, #0c0d0f);
      border: 1px solid rgba(201,169,110,0.15);
      border-radius: 24px; padding: 60px;
      text-align: center; position: relative; overflow: hidden;
    }
    .newsletter-section::before {
      content: '';
      position: absolute; top: -80px; left: 50%; transform: translateX(-50%);
      width: 400px; height: 400px; border-radius: 50%;
      background: radial-gradient(circle, rgba(201,169,110,0.12), transparent 70%);
      pointer-events: none;
    }
    .newsletter-section h3 {
      font-family: 'Playfair Display', serif;
      font-size: 36px; font-weight: 700; margin-bottom: 12px;
    }
    .newsletter-section p { color: var(--muted); font-size: 15px; margin-bottom: 32px; }
    .newsletter-form {
      display: flex; justify-content: center; gap: 12px; flex-wrap: wrap;
    }
    .newsletter-input {
      padding: 14px 20px; border-radius: 999px;
      background: rgba(255,255,255,0.06); border: 1px solid var(--border);
      color: var(--primary); font-size: 14px; font-family: 'DM Sans', sans-serif;
      min-width: 300px; max-width: 100%; outline: none;
      transition: border-color var(--transition);
    }
    .newsletter-input:focus { border-color: var(--accent); }
    .newsletter-input::placeholder { color: var(--muted); }
    #newsletterMsg {
      font-size: 14px; margin-top: 16px; display: none;
    }

    /* ══════════════════════════════════
       FOOTER
    ══════════════════════════════════ */
    footer {
      margin-top: 0; padding: 56px 0 32px;
      border-top: 1px solid var(--border);
    }
    .footer-inner { display: grid; grid-template-columns: 1.4fr 1fr 1fr; gap: 60px; margin-bottom: 48px; }
    .footer-brand {
      font-family: 'Playfair Display', serif;
      font-size: 20px; font-weight: 800;
      background: linear-gradient(135deg, var(--accent2), var(--accent));
      -webkit-background-clip: text; -webkit-text-fill-color: transparent;
      margin-bottom: 14px;
    }
    .footer-desc { color: var(--muted); font-size: 14px; line-height: 1.7; margin-bottom: 20px; }
    .social-links { display: flex; gap: 8px; }
    .social-link {
      width: 38px; height: 38px; border-radius: var(--radius-sm);
      border: 1px solid var(--border); background: var(--bg3);
      display: flex; align-items: center; justify-content: center;
      color: var(--muted); font-size: 14px; transition: all var(--transition);
    }
    .social-link:hover { border-color: var(--accent); color: var(--accent); }
    .footer-col h4 { font-size: 14px; font-weight: 600; margin-bottom: 16px; color: var(--primary); }
    .footer-links { display: flex; flex-direction: column; gap: 10px; }
    .footer-links a { color: var(--muted); font-size: 14px; transition: color var(--transition); }
    .footer-links a:hover { color: var(--accent); }
    .footer-bottom {
      border-top: 1px solid var(--border); padding-top: 24px;
      text-align: center; color: var(--muted); font-size: 13px;
    }

    /* ══════════════════════════════════
       FAVORITES DRAWER
    ══════════════════════════════════ */
    .fav-btn {
      position: relative;
    }
    .fav-badge {
      position: absolute; top: -7px; right: -7px;
      background: #e05252; color: white;
      font-size: 10px; font-weight: 700;
      width: 18px; height: 18px; border-radius: 50%;
      display: none; place-items: center;
      border: 2px solid var(--bg);
    }
    .fav-badge.visible { display: inline-grid; }

    .drawer-overlay {
      position: fixed; inset: 0; z-index: 200;
      background: rgba(0,0,0,0.6);
      backdrop-filter: blur(4px);
      opacity: 0; pointer-events: none;
      transition: opacity 0.35s ease;
    }
    .drawer-overlay.open { opacity: 1; pointer-events: all; }

    .fav-drawer {
      position: fixed; top: 0; right: 0; bottom: 0; z-index: 201;
      width: 400px; max-width: 95vw;
      background: var(--bg2);
      border-left: 1px solid var(--border);
      display: flex; flex-direction: column;
      transform: translateX(100%);
      transition: transform 0.38s cubic-bezier(0.4,0,0.2,1);
      box-shadow: -20px 0 60px rgba(0,0,0,0.5);
    }
    .fav-drawer.open { transform: translateX(0); }

    .drawer-header {
      display: flex; align-items: center; justify-content: space-between;
      padding: 22px 24px;
      border-bottom: 1px solid var(--border);
      flex-shrink: 0;
    }
    .drawer-title {
      font-family: 'Playfair Display', serif;
      font-size: 20px; font-weight: 700;
      display: flex; align-items: center; gap: 10px;
    }
    .drawer-title i { color: var(--danger); font-size: 18px; }
    .drawer-close {
      width: 36px; height: 36px; border-radius: var(--radius-sm);
      background: var(--bg3); border: 1px solid var(--border);
      color: var(--muted); cursor: pointer; font-size: 15px;
      display: flex; align-items: center; justify-content: center;
      transition: all var(--transition);
    }
    .drawer-close:hover { color: var(--primary); border-color: var(--accent); }

    .drawer-body {
      flex: 1; overflow-y: auto; padding: 20px 24px;
      display: flex; flex-direction: column; gap: 14px;
    }

    .drawer-empty {
      flex: 1; display: flex; flex-direction: column;
      align-items: center; justify-content: center;
      gap: 16px; color: var(--muted); text-align: center;
      padding: 40px 0;
    }
    .drawer-empty i { font-size: 48px; opacity: 0.25; }
    .drawer-empty p { font-size: 15px; }

    .fav-item {
      display: flex; gap: 14px; align-items: center;
      background: var(--card); border: 1px solid var(--border);
      border-radius: var(--radius-sm); padding: 12px;
      transition: border-color var(--transition);
      animation: fadeUp 0.3s ease both;
    }
    .fav-item:hover { border-color: rgba(201,169,110,0.3); }
    .fav-item img {
      width: 64px; height: 64px; border-radius: 8px; object-fit: cover; flex-shrink: 0;
    }
    .fav-item-info { flex: 1; min-width: 0; }
    .fav-item-name {
      font-size: 14px; font-weight: 600; color: var(--primary);
      white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
    }
    .fav-item-cat { font-size: 11px; color: var(--accent); text-transform: uppercase; letter-spacing: 0.08em; margin: 2px 0 6px; }
    .fav-item-price { font-size: 15px; font-weight: 700; color: var(--accent2); }
    .fav-item-actions { display: flex; flex-direction: column; gap: 6px; flex-shrink: 0; }
    .fav-add-btn {
      background: linear-gradient(135deg, var(--accent2), var(--accent));
      border: 0; color: #1a1200; font-size: 11px; font-weight: 700;
      padding: 6px 10px; border-radius: 7px; cursor: pointer;
      white-space: nowrap; font-family: 'DM Sans', sans-serif;
      transition: opacity var(--transition);
    }
    .fav-add-btn:hover { opacity: 0.85; }
    .fav-remove-btn {
      background: transparent; border: 1px solid var(--border);
      color: var(--muted); font-size: 11px; font-weight: 600;
      padding: 6px 10px; border-radius: 7px; cursor: pointer;
      font-family: 'DM Sans', sans-serif; transition: all var(--transition);
    }
    .fav-remove-btn:hover { border-color: var(--danger); color: var(--danger); }

    .drawer-footer {
      padding: 16px 24px;
      border-top: 1px solid var(--border);
      flex-shrink: 0;
    }
    .clear-fav-btn {
      width: 100%; background: transparent;
      border: 1px solid var(--border); color: var(--muted);
      padding: 11px; border-radius: var(--radius-sm);
      font-size: 13px; font-weight: 600; cursor: pointer;
      font-family: 'DM Sans', sans-serif; transition: all var(--transition);
    }
    .clear-fav-btn:hover { border-color: var(--danger); color: var(--danger); }

    /* ══════════════════════════════════
       TOAST NOTIFICATION
    ══════════════════════════════════ */
    .toast {
      position: fixed; bottom: 24px; right: 24px; z-index: 999;
      background: var(--card); border: 1px solid var(--border);
      border-left: 3px solid var(--success);
      padding: 14px 20px; border-radius: 12px;
      display: flex; align-items: center; gap: 12px;
      font-size: 14px; font-weight: 500;
      box-shadow: 0 20px 60px rgba(0,0,0,0.5);
      transform: translateX(120%); transition: transform 0.4s cubic-bezier(0.4,0,0.2,1);
    }
    .toast.show { transform: translateX(0); }
    .toast i { color: var(--success); font-size: 16px; }

    /* ══════════════════════════════════
       ANIMATIONS
    ══════════════════════════════════ */
    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(24px); }
      to { opacity: 1; transform: translateY(0); }
    }
    .fade-up { animation: fadeUp 0.6s cubic-bezier(0.4,0,0.2,1) both; }
    .delay-1 { animation-delay: 0.1s; }
    .delay-2 { animation-delay: 0.2s; }
    .delay-3 { animation-delay: 0.3s; }

    /* ══════════════════════════════════
       RESPONSIVE
    ══════════════════════════════════ */
    @media (max-width: 1100px) {
      .products-grid { grid-template-columns: repeat(3,1fr); }
    }
    @media (max-width: 900px) {
      nav.main-nav { display: none; }
      .mobile-toggle { display: inline-flex; }
      .products-grid { grid-template-columns: repeat(2,1fr); }
      .deal-card { grid-template-columns: 1fr; }
      .deal-img-side { min-height: 280px; }
      .footer-inner { grid-template-columns: 1fr 1fr; }
      .hero-stats { gap: 24px; }
      .newsletter-section { padding: 40px 24px; }
    }
    @media (max-width: 600px) {
      .products-grid { grid-template-columns: 1fr; }
      .cat-filter { gap: 8px; }
      .footer-inner { grid-template-columns: 1fr; gap: 32px; }
      .hero h1 { font-size: 32px; }
      .hero-stats { flex-wrap: wrap; gap: 20px; }
      .deal-content { padding: 28px 24px; }
      .deal-title { font-size: 26px; }
      .search-wrap { min-width: 160px; }
    }
    /* ══════════════════════════════════
       AUTH MODAL
    ══════════════════════════════════ */
    .auth-overlay {
      position: fixed; inset: 0; z-index: 300;
      background: rgba(0,0,0,0.75);
      backdrop-filter: blur(6px);
      display: flex; align-items: center; justify-content: center;
      padding: 20px;
      opacity: 0; pointer-events: none;
      transition: opacity 0.3s ease;
    }
    .auth-overlay.open { opacity: 1; pointer-events: all; }

    .auth-modal {
      background: var(--bg2);
      border: 1px solid var(--border);
      border-radius: 24px;
      width: 100%; max-width: 440px;
      box-shadow: 0 40px 100px rgba(0,0,0,0.7);
      transform: translateY(24px) scale(0.97);
      transition: transform 0.35s cubic-bezier(0.4,0,0.2,1);
      overflow: hidden;
    }
    .auth-overlay.open .auth-modal { transform: translateY(0) scale(1); }

    .auth-modal-top {
      position: relative;
      padding: 32px 32px 0;
      text-align: center;
    }
    .auth-modal-close {
      position: absolute; top: 18px; right: 18px;
      width: 34px; height: 34px; border-radius: 8px;
      background: var(--bg3); border: 1px solid var(--border);
      color: var(--muted); cursor: pointer; font-size: 14px;
      display: flex; align-items: center; justify-content: center;
      transition: all var(--transition);
    }
    .auth-modal-close:hover { color: var(--primary); border-color: var(--accent); }

    .auth-logo {
      font-family: 'Playfair Display', serif;
      font-size: 22px; font-weight: 800;
      background: linear-gradient(135deg, var(--accent2), var(--accent));
      -webkit-background-clip: text; -webkit-text-fill-color: transparent;
      margin-bottom: 6px;
    }
    .auth-subtitle { color: var(--muted); font-size: 14px; margin-bottom: 24px; }

    /* Tabs */
    .auth-tabs {
      display: flex; background: var(--bg3);
      border: 1px solid var(--border);
      border-radius: 10px; padding: 4px;
      margin: 0 32px 24px;
    }
    .auth-tab {
      flex: 1; padding: 9px;
      border-radius: 7px; border: 0;
      font-size: 14px; font-weight: 600;
      cursor: pointer; font-family: 'DM Sans', sans-serif;
      background: transparent; color: var(--muted);
      transition: all var(--transition);
    }
    .auth-tab.active { background: var(--card); color: var(--primary); box-shadow: 0 2px 8px rgba(0,0,0,0.3); }

    /* Forms */
    .auth-form-wrap { padding: 0 32px 32px; }
    .auth-form { display: flex; flex-direction: column; gap: 14px; }
    .auth-form.hidden { display: none; }

    .form-group { display: flex; flex-direction: column; gap: 6px; }
    .form-label { font-size: 12px; font-weight: 600; color: var(--muted); letter-spacing: 0.06em; text-transform: uppercase; }
    .form-input {
      background: var(--bg3); border: 1px solid var(--border);
      border-radius: var(--radius-sm); padding: 12px 16px;
      color: var(--primary); font-size: 14px;
      font-family: 'DM Sans', sans-serif; outline: none;
      transition: border-color var(--transition);
    }
    .form-input:focus { border-color: var(--accent); }
    .form-input::placeholder { color: var(--muted); }
    .form-input.error { border-color: var(--danger); }

    .input-wrap { position: relative; }
    .input-wrap .form-input { padding-right: 44px; width: 100%; }
    .toggle-pw {
      position: absolute; right: 14px; top: 50%; transform: translateY(-50%);
      background: none; border: 0; color: var(--muted); cursor: pointer;
      font-size: 14px; transition: color var(--transition);
    }
    .toggle-pw:hover { color: var(--accent); }

    .form-error {
      font-size: 12px; color: var(--danger); margin-top: -6px;
      display: none;
    }
    .form-error.show { display: block; }

    .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }

    .auth-divider {
      display: flex; align-items: center; gap: 12px;
      color: var(--muted); font-size: 12px; margin: 4px 0;
    }
    .auth-divider::before, .auth-divider::after {
      content: ''; flex: 1; height: 1px; background: var(--border);
    }

    .social-auth { display: flex; gap: 10px; }
    .social-auth-btn {
      flex: 1; display: flex; align-items: center; justify-content: center; gap: 8px;
      padding: 11px; border-radius: var(--radius-sm);
      border: 1px solid var(--border); background: var(--bg3);
      color: var(--primary); font-size: 13px; font-weight: 600;
      cursor: pointer; font-family: 'DM Sans', sans-serif;
      transition: all var(--transition);
    }
    .social-auth-btn:hover { border-color: var(--accent); background: rgba(201,169,110,0.08); }
    .social-auth-btn i { font-size: 15px; }

    .btn-auth {
      width: 100%; padding: 13px;
      background: linear-gradient(135deg, var(--accent2), var(--accent));
      color: #1a1200; border: 0; border-radius: var(--radius-sm);
      font-size: 15px; font-weight: 700; cursor: pointer;
      font-family: 'DM Sans', sans-serif;
      transition: opacity var(--transition), transform var(--transition);
      margin-top: 4px;
    }
    .btn-auth:hover { opacity: 0.9; transform: translateY(-1px); }
    .btn-auth:active { transform: translateY(0); }

    .auth-footer-text {
      text-align: center; font-size: 13px; color: var(--muted); margin-top: 16px;
    }
    .auth-footer-text a {
      color: var(--accent); font-weight: 600; cursor: pointer;
      text-decoration: underline; text-underline-offset: 3px;
    }
    .forgot-link {
      text-align: right; font-size: 12px; color: var(--accent);
      cursor: pointer; font-weight: 600; margin-top: -8px;
    }
    .forgot-link:hover { text-decoration: underline; }

    /* Checkbox */
    .check-row { display: flex; align-items: center; gap: 10px; font-size: 13px; color: var(--muted); }
    .check-row input[type=checkbox] { accent-color: var(--accent); width: 15px; height: 15px; }

    /* User avatar in header (logged in state) */
    .user-avatar-btn {
      width: 40px; height: 40px; border-radius: var(--radius-sm);
      border: 1px solid rgba(201,169,110,0.4);
      background: linear-gradient(135deg, rgba(201,169,110,0.2), rgba(201,169,110,0.08));
      color: var(--accent2); font-size: 14px; font-weight: 700;
      cursor: pointer; display: inline-flex; align-items: center; justify-content: center;
      font-family: 'Playfair Display', serif;
      transition: all var(--transition); position: relative;
    }
    .user-avatar-btn:hover { border-color: var(--accent); box-shadow: 0 0 0 3px rgba(201,169,110,0.15); }

    /* User dropdown */
    .user-dropdown {
      position: absolute; top: calc(100% + 10px); right: 0;
      min-width: 220px; background: var(--bg2);
      border: 1px solid var(--border); border-radius: var(--radius);
      box-shadow: 0 20px 60px rgba(0,0,0,0.5);
      overflow: hidden; z-index: 150;
      opacity: 0; pointer-events: none; transform: translateY(-8px);
      transition: all 0.22s ease;
    }
    .user-dropdown.open { opacity: 1; pointer-events: all; transform: translateY(0); }

    .dropdown-header {
      padding: 16px; border-bottom: 1px solid var(--border);
      display: flex; align-items: center; gap: 12px;
    }
    .dropdown-avatar {
      width: 40px; height: 40px; border-radius: 10px;
      background: linear-gradient(135deg, var(--accent2), var(--accent));
      display: flex; align-items: center; justify-content: center;
      font-family: 'Playfair Display', serif; font-size: 16px; font-weight: 700;
      color: #1a1200; flex-shrink: 0;
    }
    .dropdown-name { font-size: 14px; font-weight: 600; }
    .dropdown-email { font-size: 12px; color: var(--muted); margin-top: 2px; }

    .dropdown-item {
      display: flex; align-items: center; gap: 10px;
      padding: 11px 16px; font-size: 13px; font-weight: 500;
      color: var(--muted); cursor: pointer; transition: all var(--transition);
      border: 0; background: none; width: 100%; text-align: left;
      font-family: 'DM Sans', sans-serif;
    }
    .dropdown-item i { width: 16px; color: var(--accent); font-size: 13px; }
    .dropdown-item:hover { color: var(--primary); background: var(--bg3); }
    .dropdown-item.danger:hover { color: var(--danger); }
    .dropdown-item.danger i { color: var(--danger); }
    .dropdown-divider { height: 1px; background: var(--border); }
  </style>
</head>
<body>

<!-- ── HEADER ── -->
<header>
  <div class="container header-inner">
    <div style="display:flex;align-items:center;gap:14px;">
      <button class="mobile-toggle" id="mobileToggle" aria-label="Open menu">
        <i class="fas fa-bars"></i>
      </button>
      <a class="brand" href="#">Nexus<span>Shop</span></a>
    </div>

    <nav class="main-nav" id="mainNav">
      <ul>
        <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
        <li><a href="#products-section"><i class="fas fa-fire"></i> Trending</a></li>
        <li><a href="#deals"><i class="fas fa-tag"></i> Deals</a></li>
      </ul>
    </nav>

    <div style="display:flex;align-items:center;gap:12px;">
      <div class="search-wrap">
        <i class="fas fa-search" style="color:var(--muted);font-size:13px;"></i>
        <input type="search" id="searchInput" placeholder="Search products..." aria-label="Search products"/>
        <button id="searchBtn" aria-label="Search"><i class="fas fa-arrow-right"></i></button>
      </div>
      <div class="header-actions">
        <div style="position:relative;" id="authBtnWrap">
          <a class="icon-btn" id="authBtn" title="Account" href="#" aria-label="Account"><i class="far fa-user"></i></a>
          <div class="user-dropdown" id="userDropdown">
            <div class="dropdown-header">
              <div class="dropdown-avatar" id="dropdownAvatar">?</div>
              <div>
                <div class="dropdown-name" id="dropdownName">—</div>
                <div class="dropdown-email" id="dropdownEmail">—</div>
              </div>
            </div>
            <button class="dropdown-item"><i class="fas fa-user-circle"></i> My Profile</button>
            <button class="dropdown-item"><i class="fas fa-box"></i> My Orders</button>
            <button class="dropdown-item"><i class="fas fa-cog"></i> Settings</button>
            <div class="dropdown-divider"></div>
            <button class="dropdown-item danger" id="logoutBtn"><i class="fas fa-sign-out-alt"></i> Sign Out</button>
          </div>
        </div>
        <button class="icon-btn fav-btn" id="favDrawerBtn" title="Favorites" aria-label="Open favorites">
          <i class="far fa-heart"></i>
          <span class="fav-badge" id="favBadge">0</span>
        </button>
        <a class="icon-btn cart-btn" href="#" id="cartBtn" title="Cart" aria-label="Cart">
          <i class="fas fa-shopping-bag"></i>
          <span class="cart-count" id="cartCount">0</span>
        </a>
      </div>
    </div>
  </div>
  <div id="mobileMenu">
    <div class="container">
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#categories">Categories</a></li>
        <li><a href="#products-section">Trending</a></li>
        <li><a href="#deals">Deals</a></li>
      </ul>
    </div>
  </div>
</header>

<main>

  <!-- ── HERO ── -->
  <section class="hero">
    <div class="hero-bg"></div>
    <div class="container">
      <div class="hero-content">
        <div class="hero-eyebrow fade-up">Summer Collection 2025</div>
        <h1 class="fade-up delay-1">Premium Picks,<br><em>Curated For You</em></h1>
        <p class="fade-up delay-2">Discover the latest trends in fashion, technology and accessories. Enjoy limited-time deals and free shipping on selected items.</p>
        <div class="hero-actions fade-up delay-3">
          <button class="btn btn-gold" id="shopNow">Shop Now <i class="fas fa-arrow-right"></i></button>
          <button class="btn btn-outline" id="exploreDeals">Explore Deals</button>
        </div>
        <div class="hero-stats fade-up delay-3">
          <div class="stat-item">
            <div class="stat-num">12K+</div>
            <div class="stat-label">Products</div>
          </div>
          <div class="stat-item">
            <div class="stat-num">98%</div>
            <div class="stat-label">Satisfaction</div>
          </div>
          <div class="stat-item">
            <div class="stat-num">Free</div>
            <div class="stat-label">Shipping</div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ── CATEGORIES ── -->
  <section class="section" id="categories" aria-labelledby="cat-title">
    <div class="container">
      <div class="section-header">
        <div class="section-eyebrow">Browse</div>
        <h2 id="cat-title">Shop by Category</h2>
        <p>Explore our wide range of curated categories</p>
      </div>
      <div class="cat-filter" id="categoriesGrid" aria-live="polite"></div>
    </div>
  </section>

  <!-- ── PRODUCTS ── -->
  <section class="section" id="products-section" aria-labelledby="prod-title" style="padding-top:0;">
    <div class="container">
      <div class="section-header">
        <div class="section-eyebrow">Trending Now</div>
        <h2 id="prod-title">Popular Products</h2>
        <p>Popular picks based on recent activity</p>
      </div>
      <div class="products-grid" id="productsGrid" aria-live="polite"></div>
    </div>
  </section>

  <!-- ── DEAL ── -->
  <section id="deals" class="section" aria-labelledby="deals-title">
    <div class="container">
      <div class="section-header">
        <div class="section-eyebrow">Limited Time</div>
        <h2 id="deals-title">Flash Sale</h2>
        <p>Don't miss these exclusive offers</p>
      </div>
      <div class="deal-card">
        <div class="deal-img-side">
          <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=1200&q=80" alt="MacBook Air M2"/>
        </div>
        <div class="deal-content">
          <div class="deal-tag">Flash Sale — Ends Soon</div>
          <div class="deal-title">MacBook Air M2</div>
          <p class="deal-subtitle">Thin, light and extraordinarily powerful — the M2 chip delivers a huge leap in performance and up to 18 hours of battery life.</p>
          <div class="timer">
            <div class="time-box">
              <div class="time-num" id="dealDays">0</div>
              <div class="time-label">Days</div>
            </div>
            <div class="time-box">
              <div class="time-num" id="dealHours">00</div>
              <div class="time-label">Hrs</div>
            </div>
            <div class="time-box">
              <div class="time-num" id="dealMinutes">00</div>
              <div class="time-label">Mins</div>
            </div>
            <div class="time-box">
              <div class="time-num" id="dealSeconds">00</div>
              <div class="time-label">Secs</div>
            </div>
          </div>
          <div class="deal-pricing">
            <div class="deal-price">$999</div>
            <div class="deal-old">$1,199</div>
            <div class="deal-badge">-17%</div>
          </div>
          <p class="deal-stock">Only <strong>12 items</strong> left at this price!</p>
          <div>
            <button class="btn btn-gold" id="buyDeal"><i class="fas fa-bolt"></i> Buy Now</button>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ── TESTIMONIALS ── -->
  <section class="section" aria-labelledby="test-title" style="padding-top:0;">
    <div class="container">
      <div class="section-header">
        <div class="section-eyebrow">Reviews</div>
        <h2 id="test-title">What Customers Say</h2>
        <p>Real reviews from verified buyers</p>
      </div>
      <div class="testimonials-track" id="testimonials">
        <div class="testimonial-card">
          <div class="t-stars">★★★★★</div>
          <p class="t-text">"Fast shipping and excellent customer support. The product exceeded my expectations — I'll definitely be ordering again!"</p>
          <div class="t-author">
            <img class="t-avatar" src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80" alt="Ava Martin"/>
            <div><div class="t-name">Ava Martin</div><div class="t-role">Verified Buyer</div></div>
          </div>
        </div>
        <div class="testimonial-card">
          <div class="t-stars">★★★★☆</div>
          <p class="t-text">"Great selection and the checkout was smooth and intuitive. The packaging was premium too. Will definitely shop again."</p>
          <div class="t-author">
            <img class="t-avatar" src="https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=80&q=80" alt="Michael Lee"/>
            <div><div class="t-name">Michael Lee</div><div class="t-role">Frequent Buyer</div></div>
          </div>
        </div>
        <div class="testimonial-card">
          <div class="t-stars">★★★★★</div>
          <p class="t-text">"Absolutely love this store! Found exactly what I was looking for at a price better than anywhere else. Highly recommend."</p>
          <div class="t-author">
            <img class="t-avatar" src="https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?auto=format&fit=crop&w=80&q=80" alt="Sara Chen"/>
            <div><div class="t-name">Sara Chen</div><div class="t-role">New Customer</div></div>
          </div>
        </div>
        <div class="testimonial-card">
          <div class="t-stars">★★★★★</div>
          <p class="t-text">"The product quality is exceptional. Received my order two days ahead of schedule. Will be my go-to shop from now on."</p>
          <div class="t-author">
            <img class="t-avatar" src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=80&q=80" alt="James Wilson"/>
            <div><div class="t-name">James Wilson</div><div class="t-role">Verified Buyer</div></div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ── NEWSLETTER ── -->
  <section class="section" aria-labelledby="news-title" style="padding-top:0;">
    <div class="container">
      <div class="newsletter-section">
        <div class="section-eyebrow">Newsletter</div>
        <h3 id="news-title">Stay in the Loop</h3>
        <p>Subscribe to get exclusive offers, early access to sales & new arrivals</p>
        <form class="newsletter-form" id="newsletterForm" onsubmit="return false;">
          <input class="newsletter-input" id="newsletterEmail" type="email" placeholder="Enter your email address" aria-label="Email address" required/>
          <button class="btn btn-gold" id="subscribeBtn">Subscribe <i class="fas fa-paper-plane"></i></button>
        </form>
        <div id="newsletterMsg"></div>
      </div>
    </div>
  </section>

</main>

<!-- ── AUTH MODAL ── -->
<div class="auth-overlay" id="authOverlay" role="dialog" aria-modal="true" aria-label="Sign in or create account">
  <div class="auth-modal" id="authModal">
    <div class="auth-modal-top">
      <button class="auth-modal-close" id="authModalClose" aria-label="Close"><i class="fas fa-times"></i></button>
      <div class="auth-logo">NexusShop</div>
      <div class="auth-subtitle" id="authSubtitle">Sign in to your account</div>
    </div>

    <!-- Tabs -->
    <div class="auth-tabs" role="tablist">
      <button class="auth-tab active" id="tabLogin" role="tab" aria-selected="true">Sign In</button>
      <button class="auth-tab" id="tabSignup" role="tab" aria-selected="false">Create Account</button>
    </div>

    <div class="auth-form-wrap">

      <!-- LOGIN FORM -->
      <div class="auth-form" id="loginForm">
        <div class="social-auth">
          <button class="social-auth-btn" id="googleLoginBtn"><i class="fab fa-google"></i> Google</button>
          <button class="social-auth-btn" id="githubLoginBtn"><i class="fab fa-github"></i> GitHub</button>
        </div>
        <div class="auth-divider">or continue with email</div>

        <div class="form-group">
          <label class="form-label">Email Address</label>
          <input class="form-input" id="loginEmail" type="email" placeholder="you@example.com" autocomplete="email"/>
          <span class="form-error" id="loginEmailErr">Please enter a valid email.</span>
        </div>
        <div class="form-group">
          <label class="form-label">Password</label>
          <div class="input-wrap">
            <input class="form-input" id="loginPassword" type="password" placeholder="Enter your password" autocomplete="current-password"/>
            <button class="toggle-pw" type="button" data-target="loginPassword" aria-label="Toggle password"><i class="far fa-eye"></i></button>
          </div>
          <span class="form-error" id="loginPasswordErr">Password must be at least 6 characters.</span>
        </div>
        <div style="display:flex;align-items:center;justify-content:space-between;">
          <label class="check-row">
            <input type="checkbox" id="rememberMe"/> Remember me
          </label>
          <span class="forgot-link" id="forgotLink">Forgot password?</span>
        </div>
        <button class="btn-auth" id="loginSubmit">Sign In <i class="fas fa-arrow-right"></i></button>
        <p class="auth-footer-text">Don't have an account? <a id="switchToSignup">Create one</a></p>
      </div>

      <!-- SIGNUP FORM -->
      <div class="auth-form hidden" id="signupForm">
        <div class="social-auth">
          <button class="social-auth-btn" id="googleSignupBtn"><i class="fab fa-google"></i> Google</button>
          <button class="social-auth-btn" id="githubSignupBtn"><i class="fab fa-github"></i> GitHub</button>
        </div>
        <div class="auth-divider">or sign up with email</div>

        <div class="form-row">
          <div class="form-group">
            <label class="form-label">First Name</label>
            <input class="form-input" id="signupFirst" type="text" placeholder="Jane" autocomplete="given-name"/>
            <span class="form-error" id="signupFirstErr">Required.</span>
          </div>
          <div class="form-group">
            <label class="form-label">Last Name</label>
            <input class="form-input" id="signupLast" type="text" placeholder="Doe" autocomplete="family-name"/>
            <span class="form-error" id="signupLastErr">Required.</span>
          </div>
        </div>
        <div class="form-group">
          <label class="form-label">Email Address</label>
          <input class="form-input" id="signupEmail" type="email" placeholder="you@example.com" autocomplete="email"/>
          <span class="form-error" id="signupEmailErr">Please enter a valid email.</span>
        </div>
        <div class="form-group">
          <label class="form-label">Password</label>
          <div class="input-wrap">
            <input class="form-input" id="signupPassword" type="password" placeholder="Min. 6 characters" autocomplete="new-password"/>
            <button class="toggle-pw" type="button" data-target="signupPassword" aria-label="Toggle password"><i class="far fa-eye"></i></button>
          </div>
          <span class="form-error" id="signupPasswordErr">Password must be at least 6 characters.</span>
        </div>
        <div class="form-group">
          <label class="form-label">Confirm Password</label>
          <div class="input-wrap">
            <input class="form-input" id="signupConfirm" type="password" placeholder="Repeat your password" autocomplete="new-password"/>
            <button class="toggle-pw" type="button" data-target="signupConfirm" aria-label="Toggle confirm password"><i class="far fa-eye"></i></button>
          </div>
          <span class="form-error" id="signupConfirmErr">Passwords do not match.</span>
        </div>
        <label class="check-row">
          <input type="checkbox" id="agreeTerms"/>
          I agree to the <a href="#" style="color:var(--accent);">Terms &amp; Privacy Policy</a>
        </label>
        <span class="form-error" id="agreeErr">You must agree to the terms.</span>
        <button class="btn-auth" id="signupSubmit">Create Account <i class="fas fa-user-plus"></i></button>
        <p class="auth-footer-text">Already have an account? <a id="switchToLogin">Sign in</a></p>
      </div>

      <!-- FORGOT PASSWORD FORM -->
      <div class="auth-form hidden" id="forgotForm">
        <p style="font-size:14px;color:var(--muted);margin-bottom:8px;">Enter your email and we'll send you a reset link.</p>
        <div class="form-group">
          <label class="form-label">Email Address</label>
          <input class="form-input" id="forgotEmail" type="email" placeholder="you@example.com"/>
          <span class="form-error" id="forgotEmailErr">Please enter a valid email.</span>
        </div>
        <button class="btn-auth" id="forgotSubmit">Send Reset Link <i class="fas fa-paper-plane"></i></button>
        <p class="auth-footer-text"><a id="backToLogin"><i class="fas fa-arrow-left"></i> Back to Sign In</a></p>
      </div>

    </div>
  </div>
</div>

<!-- ── FAVORITES DRAWER ── -->
<div class="drawer-overlay" id="drawerOverlay"></div>
<aside class="fav-drawer" id="favDrawer" aria-label="Favorites panel">
  <div class="drawer-header">
    <div class="drawer-title"><i class="fas fa-heart"></i> My Favorites</div>
    <button class="drawer-close" id="drawerClose" aria-label="Close favorites"><i class="fas fa-times"></i></button>
  </div>
  <div class="drawer-body" id="drawerBody"></div>
  <div class="drawer-footer" id="drawerFooter" style="display:none;">
    <button class="clear-fav-btn" id="clearFavBtn"><i class="fas fa-trash-alt"></i> Clear All Favorites</button>
  </div>
</aside>

<!-- ── FOOTER ── -->
<footer>
  <div class="container">
    <div class="footer-inner">
      <div>
        <div class="footer-brand">NexusShop</div>
        <p class="footer-desc">A modern premium e-commerce experience built with HTML, CSS & JavaScript. Crafted with attention to every detail.</p>
        <div class="social-links">
          <a class="social-link" href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
          <a class="social-link" href="#" title="Twitter"><i class="fab fa-twitter"></i></a>
          <a class="social-link" href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
        </div>
      </div>
      <div class="footer-col">
        <h4>Company</h4>
        <div class="footer-links">
          <a href="#">About Us</a>
          <a href="#">Careers</a>
          <a href="#">Press</a>
          <a href="#">Blog</a>
        </div>
      </div>
      <div class="footer-col">
        <h4>Support</h4>
        <div class="footer-links">
          <a href="#">Help Center</a>
          <a href="#">Shipping & Returns</a>
          <a href="#">Contact Us</a>
          <a href="#">Privacy Policy</a>
        </div>
      </div>
    </div>
    <div class="footer-bottom">© <span id="year"></span> NexusShop. All rights reserved.</div>
  </div>
</footer>

<!-- ── TOAST ── -->
<div class="toast" id="toast">
  <i class="fas fa-check-circle"></i>
  <span id="toastMsg">Added to cart!</span>
</div>

<script>
  // ─── Data ───────────────────────────────────────
  const CATEGORIES = [
    { id:'phones',      name:'Smartphones',  icon:'fa-mobile-alt' },
    { id:'laptops',     name:'Laptops',      icon:'fa-laptop' },
    { id:'clothing',    name:'Clothing',     icon:'fa-tshirt' },
    { id:'gadgets',     name:'Gadgets',      icon:'fa-headphones' },
    { id:'footwear',    name:'Footwear',     icon:'fa-shoe-prints' },
    { id:'accessories', name:'Accessories',  icon:'fa-watch' },
  ];
  const PRODUCTS = [
    { id:1, title:'iPhone 14 Pro Max', price:1099, oldPrice:1199, rating:5, reviews:128, badge:'New',  img:'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80', category:'phones' },
    { id:2, title:'MacBook Pro 14"',   price:1999, rating:4, reviews:86,  img:'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80', category:'laptops' },
    { id:3, title:'Apple Watch Series 8', price:349, oldPrice:399, rating:5, reviews:214, badge:'-25%', img:'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80', category:'accessories' },
    { id:4, title:'Nike Air Max 270',  price:150, rating:4, reviews:53,  img:'https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80', category:'footwear' },
    { id:5, title:'Sony A7 IV Camera', price:2499, rating:5, reviews:42, img:'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80', category:'gadgets' },
    { id:6, title:'Chanel No. 5',      price:120, rating:5, reviews:189, img:'https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80', category:'accessories' },
    { id:7, title:'Travel Backpack',   price:79, oldPrice:99, rating:4, reviews:67, img:'https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80', category:'accessories' },
    { id:8, title:'Sony WH-1000XM5',   price:399, rating:5, reviews:156, img:'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80', category:'gadgets' },
  ];

  // ─── State ──────────────────────────────────────
  let cartCount = 0;
  let activeCategory = 'all';
  let favorites = {}; // { [productId]: true }

  // ─── Elements ───────────────────────────────────
  const catGrid      = document.getElementById('categoriesGrid');
  const prodGrid     = document.getElementById('productsGrid');
  const cartCountEl  = document.getElementById('cartCount');
  const searchInput  = document.getElementById('searchInput');
  const toast        = document.getElementById('toast');
  const toastMsg     = document.getElementById('toastMsg');
  const favBadge     = document.getElementById('favBadge');
  const favDrawer    = document.getElementById('favDrawer');
  const drawerOverlay= document.getElementById('drawerOverlay');
  const drawerBody   = document.getElementById('drawerBody');
  const drawerFooter = document.getElementById('drawerFooter');

  // ─── Helpers ────────────────────────────────────
  function esc(t) {
    return String(t).replace(/[&<>"']/g, s => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[s]));
  }
  function stars(n) {
    return '★'.repeat(Math.min(5, Math.round(n))) + '☆'.repeat(Math.max(0, 5 - Math.round(n)));
  }
  function showToast(msg) {
    toastMsg.textContent = msg;
    toast.classList.add('show');
    clearTimeout(toast._t);
    toast._t = setTimeout(() => toast.classList.remove('show'), 2800);
  }
  function updateCartBadge() {
    cartCountEl.textContent = cartCount;
    cartCountEl.style.display = cartCount > 0 ? 'inline-grid' : 'none';
  }

  // ─── Render Categories ──────────────────────────
  function renderCategories() {
    catGrid.innerHTML = '';
    // "All" pill
    const allPill = document.createElement('button');
    allPill.className = 'cat-pill' + (activeCategory === 'all' ? ' active' : '');
    allPill.innerHTML = '<i class="fas fa-th"></i> All';
    allPill.addEventListener('click', () => {
      activeCategory = 'all';
      renderCategories();
      renderProducts(PRODUCTS);
    });
    catGrid.appendChild(allPill);

    CATEGORIES.forEach(cat => {
      const pill = document.createElement('button');
      pill.className = 'cat-pill' + (activeCategory === cat.id ? ' active' : '');
      pill.innerHTML = `<i class="fas ${cat.icon}"></i> ${cat.name}`;
      pill.addEventListener('click', () => {
        activeCategory = cat.id;
        searchInput.value = '';
        renderCategories();
        filterProducts(cat.id);
        document.getElementById('products-section').scrollIntoView({ behavior:'smooth', block:'start' });
      });
      catGrid.appendChild(pill);
    });
  }

  // ─── Render Products ────────────────────────────
  function renderProducts(list) {
    prodGrid.innerHTML = '';
    if (list.length === 0) {
      prodGrid.innerHTML = `<div style="grid-column:1/-1;text-align:center;padding:60px 0;color:var(--muted);">
        <i class="fas fa-search" style="font-size:36px;margin-bottom:16px;display:block;opacity:0.4;"></i>
        <p style="font-size:16px;">No products found. Try a different search.</p>
      </div>`;
      return;
    }
    list.forEach((p, i) => {
      const card = document.createElement('article');
      card.className = 'product-card';
      card.style.animationDelay = `${i * 0.07}s`;
      let badgeHtml = '';
      if (p.badge) {
        const cls = p.badge.startsWith('-') ? 'badge-sale' : 'badge-new';
        badgeHtml = `<span class="product-badge ${cls}">${esc(p.badge)}</span>`;
      }
      card.innerHTML = `
        <div class="product-img-wrap">
          ${badgeHtml}
          <button class="wish-overlay" aria-label="Wishlist" data-wish="${p.id}">
            <i class="far fa-heart"></i>
          </button>
          <img src="${p.img}" alt="${esc(p.title)}" loading="lazy"/>
        </div>
        <div class="product-body">
          <div class="product-category">${esc(p.category)}</div>
          <div class="product-title">${esc(p.title)}</div>
          <div class="product-rating">
            <span class="stars">${stars(p.rating)}</span>
            <span class="review-count">(${p.reviews})</span>
          </div>
          <div class="price-row">
            <span class="price">$${p.price.toLocaleString()}</span>
            ${p.oldPrice ? `<span class="old-price">$${p.oldPrice.toLocaleString()}</span>` : ''}
          </div>
        </div>
        <div class="product-footer">
          <button class="add-btn" data-id="${p.id}">
            <i class="fas fa-cart-plus"></i> Add to Cart
          </button>
        </div>
      `;
      prodGrid.appendChild(card);
    });

    // Add-to-cart listeners
    prodGrid.querySelectorAll('.add-btn').forEach(btn => {
      btn.addEventListener('click', () => addToCart(Number(btn.dataset.id), btn));
    });

    // Wishlist toggle → favorites
    prodGrid.querySelectorAll('.wish-overlay').forEach(btn => {
      const pid = Number(btn.dataset.wish);
      // restore state
      if (favorites[pid]) {
        btn.classList.add('active');
        btn.querySelector('i').className = 'fas fa-heart';
      }
      btn.addEventListener('click', () => toggleFavorite(pid));
    });
  }

  // ─── Favorites ──────────────────────────────────
  function toggleFavorite(pid) {
    const p = PRODUCTS.find(x => x.id === pid);
    if (!p) return;
    if (favorites[pid]) {
      delete favorites[pid];
      showToast('Removed from favorites');
    } else {
      favorites[pid] = true;
      showToast('❤️ Added to favorites!');
    }
    updateFavBadge();
    // Update all heart buttons for this product
    document.querySelectorAll(`.wish-overlay[data-wish="${pid}"]`).forEach(btn => {
      btn.classList.toggle('active', !!favorites[pid]);
      btn.querySelector('i').className = favorites[pid] ? 'fas fa-heart' : 'far fa-heart';
    });
  }

  function updateFavBadge() {
    const count = Object.keys(favorites).length;
    favBadge.textContent = count;
    favBadge.classList.toggle('visible', count > 0);
  }

  function openFavDrawer() {
    renderDrawer();
    favDrawer.classList.add('open');
    drawerOverlay.classList.add('open');
    document.body.style.overflow = 'hidden';
  }
  function closeFavDrawer() {
    favDrawer.classList.remove('open');
    drawerOverlay.classList.remove('open');
    document.body.style.overflow = '';
  }

  function renderDrawer() {
    drawerBody.innerHTML = '';
    const ids = Object.keys(favorites).map(Number);
    if (ids.length === 0) {
      drawerBody.innerHTML = `
        <div class="drawer-empty">
          <i class="far fa-heart"></i>
          <p>No favorites yet.<br>Tap the ♡ on any product to save it here.</p>
        </div>`;
      drawerFooter.style.display = 'none';
      return;
    }
    drawerFooter.style.display = 'block';
    ids.forEach(pid => {
      const p = PRODUCTS.find(x => x.id === pid);
      if (!p) return;
      const item = document.createElement('div');
      item.className = 'fav-item';
      item.dataset.favId = pid;
      item.innerHTML = `
        <img src="${p.img}" alt="${esc(p.title)}"/>
        <div class="fav-item-info">
          <div class="fav-item-name">${esc(p.title)}</div>
          <div class="fav-item-cat">${esc(p.category)}</div>
          <div class="fav-item-price">$${p.price.toLocaleString()}</div>
        </div>
        <div class="fav-item-actions">
          <button class="fav-add-btn" data-id="${p.id}"><i class="fas fa-cart-plus"></i> Add</button>
          <button class="fav-remove-btn" data-id="${p.id}"><i class="fas fa-times"></i> Remove</button>
        </div>
      `;
      drawerBody.appendChild(item);
    });

    // Drawer add-to-cart
    drawerBody.querySelectorAll('.fav-add-btn').forEach(btn => {
      btn.addEventListener('click', () => {
        addToCart(Number(btn.dataset.id), null);
      });
    });
    // Drawer remove from favorites
    drawerBody.querySelectorAll('.fav-remove-btn').forEach(btn => {
      btn.addEventListener('click', () => {
        const pid = Number(btn.dataset.id);
        toggleFavorite(pid);
        // Animate removal
        const item = drawerBody.querySelector(`.fav-item[data-fav-id="${pid}"]`);
        if (item) {
          item.style.transition = 'opacity 0.25s, transform 0.25s';
          item.style.opacity = '0'; item.style.transform = 'translateX(20px)';
          setTimeout(() => renderDrawer(), 270);
        }
      });
    });
  }

  // ─── Cart ───────────────────────────────────────
  function addToCart(productId, btn) {
    const p = PRODUCTS.find(x => x.id === productId);
    if (!p) return;
    cartCount++;
    updateCartBadge();
    showToast(`✓ ${p.title} added to cart`);
    if (btn) {
      const orig = btn.innerHTML;
      btn.innerHTML = '<i class="fas fa-check"></i> Added!';
      btn.disabled = true;
      setTimeout(() => { btn.innerHTML = orig; btn.disabled = false; }, 1500);
    }
  }

  // ─── Filter ─────────────────────────────────────
  function filterProducts(query) {
    const q = String(query || '').trim().toLowerCase();
    if (!q || q === 'all') { renderProducts(PRODUCTS); return; }
    const filtered = PRODUCTS.filter(p =>
      p.title.toLowerCase().includes(q) || p.category.toLowerCase().includes(q)
    );
    renderProducts(filtered);
  }

  // ─── Search ─────────────────────────────────────
  document.getElementById('searchBtn').addEventListener('click', () => {
    activeCategory = 'all';
    renderCategories();
    filterProducts(searchInput.value);
    document.getElementById('products-section').scrollIntoView({ behavior:'smooth', block:'start' });
  });
  searchInput.addEventListener('keydown', e => {
    if (e.key === 'Enter') {
      activeCategory = 'all';
      renderCategories();
      filterProducts(e.target.value);
      document.getElementById('products-section').scrollIntoView({ behavior:'smooth', block:'start' });
    }
  });

  // ─── Mobile menu ────────────────────────────────
  const mobileMenu = document.getElementById('mobileMenu');
  document.getElementById('mobileToggle').addEventListener('click', () => {
    mobileMenu.style.display = mobileMenu.style.display === 'block' ? 'none' : 'block';
  });

  // ─── Newsletter ─────────────────────────────────
  document.getElementById('newsletterForm').addEventListener('submit', e => {
    e.preventDefault();
    const email = document.getElementById('newsletterEmail').value.trim();
    const msg   = document.getElementById('newsletterMsg');
    if (!email || !email.includes('@')) {
      msg.style.cssText = 'display:block;color:#ff9a9a;font-size:14px;margin-top:14px;';
      msg.textContent = 'Please enter a valid email address.';
      return;
    }
    msg.style.cssText = 'display:block;color:var(--accent2);font-size:14px;margin-top:14px;';
    msg.textContent = '🎉 You\'re subscribed! Check your inbox for a welcome gift.';
    document.getElementById('newsletterEmail').value = '';
    setTimeout(() => { msg.style.display = 'none'; }, 4000);
  });

  // ─── Deal timer ─────────────────────────────────
  (function setupTimer() {
    const target = new Date(Date.now() + (24 * 60 + 36) * 60 * 1000);
    function tick() {
      const diff = Math.max(0, target - Date.now());
      const d = Math.floor(diff / 86400000);
      const h = Math.floor((diff % 86400000) / 3600000);
      const m = Math.floor((diff % 3600000) / 60000);
      const s = Math.floor((diff % 60000) / 1000);
      document.getElementById('dealDays').textContent    = d;
      document.getElementById('dealHours').textContent   = String(h).padStart(2,'0');
      document.getElementById('dealMinutes').textContent = String(m).padStart(2,'0');
      document.getElementById('dealSeconds').textContent = String(s).padStart(2,'0');
      if (diff <= 0) clearInterval(tid);
    }
    tick();
    const tid = setInterval(tick, 1000);
  })();

  // ─── Favorites Drawer events ─────────────────────
  document.getElementById('favDrawerBtn').addEventListener('click', openFavDrawer);
  document.getElementById('drawerClose').addEventListener('click', closeFavDrawer);
  drawerOverlay.addEventListener('click', closeFavDrawer);
  document.getElementById('clearFavBtn').addEventListener('click', () => {
    Object.keys(favorites).forEach(pid => {
      delete favorites[Number(pid)];
      document.querySelectorAll(`.wish-overlay[data-wish="${pid}"]`).forEach(btn => {
        btn.classList.remove('active');
        btn.querySelector('i').className = 'far fa-heart';
      });
    });
    updateFavBadge();
    renderDrawer();
  });
  document.addEventListener('keydown', e => { if (e.key === 'Escape') closeFavDrawer(); });

  // ─── Scroll actions ─────────────────────────────
  document.getElementById('shopNow').addEventListener('click', () =>
    document.getElementById('products-section').scrollIntoView({ behavior:'smooth', block:'start' })
  );
  document.getElementById('exploreDeals').addEventListener('click', () =>
    document.getElementById('deals').scrollIntoView({ behavior:'smooth', block:'start' })
  );
  document.getElementById('buyDeal').addEventListener('click', () => {
    cartCount++;
    updateCartBadge();
    showToast('⚡ MacBook Air M2 added to cart!');
  });

  // ─── Init ───────────────────────────────────────
  (function init() {
    renderCategories();
    renderProducts(PRODUCTS);
    updateCartBadge();
    document.getElementById('year').textContent = new Date().getFullYear();
  })();
  // ══════════════════════════════════
  //  AUTH SYSTEM
  // ══════════════════════════════════
  let currentUser = null; // { firstName, lastName, email }

  const authOverlay    = document.getElementById('authOverlay');
  const authModalClose = document.getElementById('authModalClose');
  const authBtn        = document.getElementById('authBtn');
  const userDropdown   = document.getElementById('userDropdown');
  const tabLogin       = document.getElementById('tabLogin');
  const tabSignup      = document.getElementById('tabSignup');
  const loginForm      = document.getElementById('loginForm');
  const signupForm     = document.getElementById('signupForm');
  const forgotForm     = document.getElementById('forgotForm');
  const authSubtitle   = document.getElementById('authSubtitle');

  // ── Open / Close modal ──
  function openAuthModal(tab) {
    switchTab(tab || 'login');
    authOverlay.classList.add('open');
    document.body.style.overflow = 'hidden';
    // focus first input
    setTimeout(() => {
      const first = authOverlay.querySelector('.auth-form:not(.hidden) .form-input');
      if (first) first.focus();
    }, 350);
  }
  function closeAuthModal() {
    authOverlay.classList.remove('open');
    document.body.style.overflow = '';
    clearAllErrors();
  }

  // ── Tab switching ──
  function switchTab(tab) {
    loginForm.classList.add('hidden');
    signupForm.classList.add('hidden');
    forgotForm.classList.add('hidden');
    tabLogin.classList.remove('active');
    tabSignup.classList.remove('active');
    clearAllErrors();
    if (tab === 'login') {
      loginForm.classList.remove('hidden');
      tabLogin.classList.add('active');
      authSubtitle.textContent = 'Sign in to your account';
    } else if (tab === 'signup') {
      signupForm.classList.remove('hidden');
      tabSignup.classList.add('active');
      authSubtitle.textContent = 'Create your free account';
    } else if (tab === 'forgot') {
      forgotForm.classList.remove('hidden');
      authSubtitle.textContent = 'Reset your password';
    }
  }

  // ── Validation helpers ──
  function showErr(id, show) {
    const el = document.getElementById(id);
    if (el) el.classList.toggle('show', show);
    const input = el && el.previousElementSibling && el.previousElementSibling.classList.contains('form-input')
      ? el.previousElementSibling
      : el && el.closest('.form-group') && el.closest('.form-group').querySelector('.form-input');
    if (input) input.classList.toggle('error', show);
  }
  function clearAllErrors() {
    document.querySelectorAll('.form-error').forEach(e => e.classList.remove('show'));
    document.querySelectorAll('.form-input').forEach(e => e.classList.remove('error'));
  }
  function isValidEmail(v) { return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v.trim()); }

  // ── Login submit ──
  document.getElementById('loginSubmit').addEventListener('click', () => {
    const email = document.getElementById('loginEmail').value.trim();
    const pw    = document.getElementById('loginPassword').value;
    let ok = true;
    clearAllErrors();
    if (!isValidEmail(email))  { showErr('loginEmailErr', true);    ok = false; }
    if (pw.length < 6)         { showErr('loginPasswordErr', true); ok = false; }
    if (!ok) return;

    // Demo: accept any valid-format credentials
    const stored = JSON.parse(localStorage.getItem('nexus_users') || '{}');
    const user   = stored[email.toLowerCase()];
    if (user && user.password === pw) {
      loginSuccess(user);
    } else if (!user) {
      // Demo: auto-create on first login attempt
      showToast('No account found. Please sign up first.');
      switchTab('signup');
      document.getElementById('signupEmail').value = email;
    } else {
      document.getElementById('loginPasswordErr').textContent = 'Incorrect password.';
      showErr('loginPasswordErr', true);
    }
  });

  // ── Signup submit ──
  document.getElementById('signupSubmit').addEventListener('click', () => {
    const first   = document.getElementById('signupFirst').value.trim();
    const last    = document.getElementById('signupLast').value.trim();
    const email   = document.getElementById('signupEmail').value.trim();
    const pw      = document.getElementById('signupPassword').value;
    const confirm = document.getElementById('signupConfirm').value;
    const agreed  = document.getElementById('agreeTerms').checked;
    let ok = true;
    clearAllErrors();
    if (!first)               { showErr('signupFirstErr', true);    ok = false; }
    if (!last)                { showErr('signupLastErr', true);     ok = false; }
    if (!isValidEmail(email)) { showErr('signupEmailErr', true);    ok = false; }
    if (pw.length < 6)        { showErr('signupPasswordErr', true); ok = false; }
    if (pw !== confirm)       { showErr('signupConfirmErr', true);  ok = false; }
    if (!agreed)              { showErr('agreeErr', true);          ok = false; }
    if (!ok) return;

    const stored = JSON.parse(localStorage.getItem('nexus_users') || '{}');
    if (stored[email.toLowerCase()]) {
      document.getElementById('signupEmailErr').textContent = 'An account with this email already exists.';
      showErr('signupEmailErr', true);
      return;
    }
    const user = { firstName: first, lastName: last, email: email.toLowerCase(), password: pw };
    stored[email.toLowerCase()] = user;
    localStorage.setItem('nexus_users', JSON.stringify(stored));
    loginSuccess(user);
  });

  // ── Forgot password ──
  document.getElementById('forgotSubmit').addEventListener('click', () => {
    const email = document.getElementById('forgotEmail').value.trim();
    clearAllErrors();
    if (!isValidEmail(email)) { showErr('forgotEmailErr', true); return; }
    closeAuthModal();
    showToast(`📧 Reset link sent to ${email}`);
  });

  // ── Social auth (demo) ──
  ['googleLoginBtn','googleSignupBtn'].forEach(id => {
    document.getElementById(id).addEventListener('click', () => {
      loginSuccess({ firstName: 'Google', lastName: 'User', email: 'google@demo.com', password: '' });
    });
  });
  ['githubLoginBtn','githubSignupBtn'].forEach(id => {
    document.getElementById(id).addEventListener('click', () => {
      loginSuccess({ firstName: 'GitHub', lastName: 'User', email: 'github@demo.com', password: '' });
    });
  });

  // ── Login success ──
  function loginSuccess(user) {
    currentUser = user;
    localStorage.setItem('nexus_session', JSON.stringify(user));
    closeAuthModal();
    updateAuthUI();
    showToast(`👋 Welcome back, ${user.firstName}!`);
  }

  // ── Logout ──
  document.getElementById('logoutBtn').addEventListener('click', () => {
    currentUser = null;
    localStorage.removeItem('nexus_session');
    updateAuthUI();
    userDropdown.classList.remove('open');
    showToast('You have been signed out.');
  });

  // ── Update header UI based on auth state ──
  function updateAuthUI() {
    const btn = document.getElementById('authBtn');
    if (currentUser) {
      const initials = (currentUser.firstName[0] + currentUser.lastName[0]).toUpperCase();
      btn.outerHTML = `<button class="user-avatar-btn" id="authBtn" title="${currentUser.firstName} ${currentUser.lastName}" aria-label="Account menu">${initials}</button>`;
    } else {
      btn.outerHTML = `<a class="icon-btn" id="authBtn" title="Sign In" href="#" aria-label="Sign in"><i class="far fa-user"></i></a>`;
    }
    // Re-attach click listener
    document.getElementById('authBtn').addEventListener('click', handleAuthBtnClick);
    // Update dropdown info
    if (currentUser) {
      document.getElementById('dropdownName').textContent  = `${currentUser.firstName} ${currentUser.lastName}`;
      document.getElementById('dropdownEmail').textContent = currentUser.email;
      document.getElementById('dropdownAvatar').textContent = (currentUser.firstName[0] + currentUser.lastName[0]).toUpperCase();
    }
  }

  // ── Auth button click handler ──
  function handleAuthBtnClick(e) {
    e.preventDefault();
    if (currentUser) {
      userDropdown.classList.toggle('open');
    } else {
      openAuthModal('login');
    }
  }

  // ── Close dropdown on outside click ──
  document.addEventListener('click', e => {
    const wrap = document.getElementById('authBtnWrap');
    if (wrap && !wrap.contains(e.target)) userDropdown.classList.remove('open');
  });

  // ── Tab events ──
  tabLogin.addEventListener('click',  () => switchTab('login'));
  tabSignup.addEventListener('click', () => switchTab('signup'));
  document.getElementById('switchToSignup').addEventListener('click', () => switchTab('signup'));
  document.getElementById('switchToLogin').addEventListener('click',  () => switchTab('login'));
  document.getElementById('forgotLink').addEventListener('click',     () => switchTab('forgot'));
  document.getElementById('backToLogin').addEventListener('click',    () => switchTab('login'));

  // ── Close modal ──
  authModalClose.addEventListener('click', closeAuthModal);
  authOverlay.addEventListener('click', e => { if (e.target === authOverlay) closeAuthModal(); });
  document.addEventListener('keydown', e => {
    if (e.key === 'Escape') { closeAuthModal(); closeFavDrawer(); }
  });

  // ── Password visibility toggle ──
  document.querySelectorAll('.toggle-pw').forEach(btn => {
    btn.addEventListener('click', () => {
      const inp = document.getElementById(btn.dataset.target);
      const icon = btn.querySelector('i');
      if (inp.type === 'password') {
        inp.type = 'text'; icon.className = 'far fa-eye-slash';
      } else {
        inp.type = 'password'; icon.className = 'far fa-eye';
      }
    });
  });

  // ── Enter key submits active form ──
  document.getElementById('loginPassword').addEventListener('keydown',  e => { if (e.key === 'Enter') document.getElementById('loginSubmit').click(); });
  document.getElementById('signupConfirm').addEventListener('keydown',  e => { if (e.key === 'Enter') document.getElementById('signupSubmit').click(); });
  document.getElementById('forgotEmail').addEventListener('keydown',    e => { if (e.key === 'Enter') document.getElementById('forgotSubmit').click(); });

  // ── Restore session on load ──
  (function restoreSession() {
    const session = localStorage.getItem('nexus_session');
    if (session) {
      try { currentUser = JSON.parse(session); updateAuthUI(); } catch(e) {}
    } else {
      // Attach initial listener (logged-out state)
      document.getElementById('authBtn').addEventListener('click', handleAuthBtnClick);
    }
  })();

</script>
</body>
</html>
