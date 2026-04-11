<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Implant Initiative — PM</title>
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,300;0,400;0,500;0,600;1,400&family=DM+Mono:wght@400;500&display=swap" rel="stylesheet">
<style>
:root{
  --bg:#f7f6f3;--surface:#fff;--surface2:#f2f1ee;--surface3:#eceae6;
  --border:rgba(0,0,0,.08);--border-md:rgba(0,0,0,.14);--border-strong:rgba(0,0,0,.2);
  --text:#1a1a18;--text2:#5a5a56;--text3:#9a9a94;
  --blue:#2563eb;--blue-bg:#eff6ff;--blue-text:#1d4ed8;
  --green:#16a34a;--green-bg:#f0fdf4;--green-text:#15803d;
  --amber:#d97706;--amber-bg:#fffbeb;--amber-text:#b45309;
  --red:#dc2626;--red-bg:#fef2f2;--red-text:#b91c1c;
  --teal:#0d9488;--teal-bg:#f0fdfa;--teal-text:#0f766e;
  --r:8px;--rl:12px;
}
*{box-sizing:border-box;margin:0;padding:0}
body{font-family:'DM Sans',sans-serif;background:var(--bg);color:var(--text);min-height:100vh;font-size:14px}


/* ── LOGIN SCREEN ── */
#screen-login{display:flex;flex-direction:column;align-items:center;justify-content:center;min-height:100vh;background:var(--bg)}
.login-box{background:var(--surface);border:1px solid var(--border);border-radius:var(--rl);padding:36px 40px;width:380px;max-width:92vw;box-shadow:0 8px 40px rgba(0,0,0,.08)}
.login-brand{text-align:center;margin-bottom:28px}
.login-brand-name{font-size:18px;font-weight:700;color:var(--text);margin-bottom:4px}
.login-brand-sub{font-size:12px;color:var(--text3)}
.login-error{font-size:12px;color:var(--red-text);background:var(--red-bg);border:1px solid #fecaca;border-radius:var(--r);padding:8px 12px;margin-bottom:14px;display:none}
.login-error.show{display:block}
.login-footer{text-align:center;font-size:11px;color:var(--text3);margin-top:20px}

/* ── SETTINGS MODAL ── */
.settings-user-row{display:flex;align-items:center;gap:10px;padding:9px 12px;border:1px solid var(--border);border-radius:var(--r);margin-bottom:6px;background:var(--surface2)}
.settings-user-avatar{width:28px;height:28px;border-radius:50%;background:var(--text);display:flex;align-items:center;justify-content:center;font-size:11px;font-weight:700;color:#fff;flex-shrink:0}
.settings-user-name{flex:1;font-size:13px;font-weight:500}
.settings-user-role{font-size:11px;color:var(--text3)}
.settings-section-title{font-size:11px;font-weight:600;letter-spacing:.06em;text-transform:uppercase;color:var(--text3);margin-bottom:8px;margin-top:16px}

/* ── SCREENS ── */
#screen-home{display:none;flex-direction:column;min-height:100vh}
#screen-app{display:none;height:100vh;overflow:hidden;flex-direction:row}

/* ── HOME TOPBAR ── */
.home-topbar{display:flex;align-items:center;gap:0;padding:0 32px;background:var(--surface);border-bottom:1px solid var(--border);height:56px}
.brand{margin-right:32px;flex-shrink:0}
.brand-mark{font-size:10px;font-weight:600;letter-spacing:.14em;text-transform:uppercase;color:var(--text3);line-height:1}
.brand-name{font-size:16px;font-weight:700;color:var(--text);line-height:1.2}
.home-tabs{display:flex;gap:0;height:100%;align-items:stretch}
.home-tab{display:flex;align-items:center;gap:7px;padding:0 18px;font-size:13px;font-weight:500;color:var(--text3);cursor:pointer;border-bottom:2px solid transparent;transition:all .15s;white-space:nowrap}
.home-tab:hover{color:var(--text2)}
.home-tab.active{color:var(--text);border-bottom-color:var(--text)}
.home-tab-icon{font-size:14px}
.home-topbar-right{margin-left:auto;display:flex;align-items:center;gap:10px}

/* ── HOME BODY ── */
.home-body{flex:1;overflow-y:auto}
.home-panel{display:none;padding:28px 32px}
.home-panel.active{display:block}

/* ── CLIENTS PANEL ── */
.panel-heading{font-size:20px;font-weight:700;margin-bottom:4px}
.panel-sub{font-size:13px;color:var(--text2);margin-bottom:24px}
.clients-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(260px,1fr));gap:14px}
.client-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--rl);padding:20px;cursor:pointer;transition:all .15s;position:relative}
.client-card:hover{border-color:var(--border-strong);box-shadow:0 4px 20px rgba(0,0,0,.07);transform:translateY(-1px)}
.client-card-avatar{width:40px;height:40px;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:15px;font-weight:700;color:#fff;margin-bottom:12px}
.client-card-name{font-size:14px;font-weight:600;margin-bottom:2px}
.client-card-meta{font-size:11px;color:var(--text3);margin-bottom:10px}
.client-card-stats{display:flex;gap:12px}
.client-stat{font-size:11px;color:var(--text2)}
.client-stat-val{font-weight:600;color:var(--text)}
.client-card-actions{position:absolute;top:12px;right:12px;display:flex;gap:5px;opacity:0;transition:opacity .15s}
.client-card:hover .client-card-actions{opacity:1}
.client-card-bar{height:3px;background:var(--border);border-radius:2px;overflow:hidden;margin-top:10px}
.client-card-bar-fill{height:100%;border-radius:2px;transition:width .4s}
.add-client-card{background:transparent;border:1.5px dashed var(--border-md);border-radius:var(--rl);padding:20px;cursor:pointer;transition:all .15s;display:flex;flex-direction:column;align-items:center;justify-content:center;min-height:150px;gap:8px;color:var(--text3)}
.add-client-card:hover{border-color:var(--border-strong);color:var(--text2);background:var(--surface)}
.add-icon{width:34px;height:34px;border-radius:50%;border:1.5px dashed var(--border-md);display:flex;align-items:center;justify-content:center;font-size:20px;font-weight:300}

/* ── MASTER CALENDAR ── */
.master-cal-topbar{display:flex;align-items:center;gap:12px;margin-bottom:20px}
.master-cal-title{font-size:18px;font-weight:700;flex:1}
.cal-nav-btn{width:32px;height:32px;border:1px solid var(--border-strong);border-radius:var(--r);background:var(--surface);cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;transition:background .12s;color:var(--text2);line-height:1}
.cal-nav-btn:hover{background:var(--bg);color:var(--text)}
.cal-legend{display:flex;gap:10px;align-items:center;flex-wrap:wrap}
.cal-legend-item{display:flex;align-items:center;gap:5px;font-size:11px;color:var(--text2);background:var(--surface);border:1px solid var(--border);border-radius:20px;padding:3px 8px}
.cal-legend-dot{width:8px;height:8px;border-radius:50%;flex-shrink:0}
.cal-grid{display:grid;grid-template-columns:repeat(7,1fr);border:1px solid var(--border);border-radius:var(--rl);overflow:hidden;background:var(--surface2)}
.cal-dow{padding:8px 6px;font-size:10px;font-weight:600;letter-spacing:.06em;text-transform:uppercase;color:var(--text3);background:var(--surface2);border-bottom:1px solid var(--border);text-align:center;border-right:1px solid var(--border)}
.cal-dow:last-child{border-right:none}
.cal-cell{min-height:120px;padding:6px 6px 4px;border-right:1px solid var(--border);border-bottom:1px solid var(--border);background:var(--surface);position:relative}
.cal-cell:nth-child(7n){border-right:none}
.cal-cell.other-month{background:var(--bg)}
.cal-cell.today-cell{background:#fffef5}
.cal-date-num{font-size:11px;font-weight:600;color:var(--text3);margin-bottom:4px;width:20px;height:20px;display:flex;align-items:center;justify-content:center;border-radius:50%}
.cal-cell.today-cell .cal-date-num{background:var(--text);color:#fff}
.cal-ev{font-size:10px;padding:2px 5px;border-radius:3px;margin-bottom:2px;cursor:pointer;line-height:1.35;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;transition:opacity .12s;display:flex;align-items:center;gap:3px}
.cal-ev:hover{opacity:.75}
.cal-ev-dot{width:6px;height:6px;border-radius:50%;flex-shrink:0}
.cal-ev.ev-weekly{background:#eff6ff;color:#1e40af}
.cal-ev.ev-monthly{background:#f0fdfa;color:#065f46}
.cal-ev.ev-done{opacity:.35;text-decoration:line-through}
.cal-more{font-size:10px;color:var(--text3);cursor:pointer;padding:1px 4px;margin-top:1px}
.cal-more:hover{color:var(--blue)}

/* ── MASTER TASK LIST ── */
.master-filters{display:flex;gap:10px;align-items:center;margin-bottom:20px;flex-wrap:wrap}
.master-filter-group{display:flex;gap:0;border:1px solid var(--border);border-radius:var(--r);overflow:hidden}
.master-filter-btn{font-family:'DM Sans',sans-serif;font-size:12px;font-weight:500;padding:6px 14px;cursor:pointer;color:var(--text3);background:var(--surface2);border:none;border-right:1px solid var(--border);transition:all .12s}
.master-filter-btn:last-child{border-right:none}
.master-filter-btn.active{background:var(--surface);color:var(--text);font-weight:600}
.master-search{font-family:'DM Sans',sans-serif;font-size:13px;padding:7px 12px;border:1px solid var(--border-strong);border-radius:var(--r);background:var(--surface);color:var(--text);outline:none;min-width:200px}
.master-search:focus{border-color:var(--text)}
.master-search::placeholder{color:var(--text3)}
.master-stats{display:grid;grid-template-columns:repeat(5,1fr);gap:10px;margin-bottom:20px}
.mstat{background:var(--surface);border:1px solid var(--border);border-radius:var(--rl);padding:12px 14px}
.mstat-val{font-size:22px;font-weight:700;line-height:1;margin-bottom:3px}
.mstat-lbl{font-size:11px;color:var(--text3);font-weight:500}
.mstat-red .mstat-val{color:var(--red)}
.mstat-amber .mstat-val{color:var(--amber)}
.mstat-green .mstat-val{color:var(--green)}
.master-section{margin-bottom:28px}
.master-section-header{display:flex;align-items:center;gap:10px;padding:10px 14px;background:var(--surface2);border:1px solid var(--border);border-radius:var(--r) var(--r) 0 0;cursor:pointer;user-select:none}
.master-section-avatar{width:24px;height:24px;border-radius:6px;display:flex;align-items:center;justify-content:center;font-size:10px;font-weight:700;color:#fff;flex-shrink:0}
.master-section-name{font-size:13px;font-weight:600;flex:1}
.master-section-meta{font-size:11px;color:var(--text3)}
.master-section-chev{font-size:11px;color:var(--text3)}
.master-table{width:100%;border-collapse:collapse;background:var(--surface);border:1px solid var(--border);border-top:none;border-radius:0 0 var(--r) var(--r);overflow:hidden}
.master-table th{font-size:10px;font-weight:600;letter-spacing:.06em;text-transform:uppercase;color:var(--text3);text-align:left;padding:8px 12px;background:var(--surface);border-bottom:1px solid var(--border)}
.master-table td{padding:9px 12px;font-size:12px;border-bottom:1px solid var(--border);vertical-align:middle}
.master-table tr:last-child td{border-bottom:none}
.master-table tbody tr:hover td{background:var(--bg)}
.task-name-cell{display:flex;align-items:flex-start;gap:8px}
.check-box{width:15px;height:15px;border-radius:3px;border:1.5px solid var(--border-strong);cursor:pointer;flex-shrink:0;display:flex;align-items:center;justify-content:center;transition:all .15s;margin-top:1px}
.check-box.done{border-color:var(--text)}
.check-box.done::after{content:'✓';font-size:9px;font-weight:700;color:var(--text)}
.task-label{cursor:pointer;flex:1;line-height:1.4}
.task-label.striked{text-decoration:line-through;color:var(--text3)}
.phase-chip{font-size:10px;padding:2px 7px;border-radius:10px;font-weight:500;white-space:nowrap}
.badge{display:inline-flex;align-items:center;font-size:10px;font-weight:500;padding:2px 8px;border-radius:10px;white-space:nowrap}
.badge-todo{background:var(--surface2);color:var(--text3);border:1px solid var(--border)}
.badge-inprog{background:var(--blue-bg);color:var(--blue-text)}
.badge-done{background:var(--green-bg);color:var(--green-text)}
.badge-blocked{background:var(--red-bg);color:var(--red-text)}
.pri-high{color:var(--red);font-weight:600;font-size:11px}
.pri-med{color:var(--amber);font-weight:600;font-size:11px}
.pri-low{color:var(--text3);font-size:11px}
.client-pill{display:inline-flex;align-items:center;gap:5px;font-size:11px;padding:2px 8px;border-radius:10px;white-space:nowrap}
.client-pill-dot{width:6px;height:6px;border-radius:50%;flex-shrink:0}
.go-client-btn{font-family:'DM Sans',sans-serif;font-size:10px;padding:3px 8px;border:1px solid var(--border-md);border-radius:var(--r);cursor:pointer;background:transparent;color:var(--text3);transition:all .12s;white-space:nowrap}
.go-client-btn:hover{background:var(--bg);color:var(--text);border-color:var(--border-strong)}
.empty-state{padding:40px;text-align:center;font-size:13px;color:var(--text3)}

/* ── APP SHELL ── */
.sidebar{width:230px;flex-shrink:0;background:var(--surface);border-right:1px solid var(--border);display:flex;flex-direction:column;overflow-y:auto}
.sidebar-header{padding:16px 18px;border-bottom:1px solid var(--border)}
.back-btn{display:flex;align-items:center;gap:6px;font-size:11px;color:var(--text3);cursor:pointer;margin-bottom:10px;transition:color .12s}
.back-btn:hover{color:var(--text)}
.sb-client-name{font-size:15px;font-weight:700;line-height:1.2}
.sb-client-sub{font-size:11px;color:var(--text3);margin-top:2px}
.sidebar-section{padding:6px 0}
.sidebar-label{font-size:10px;font-weight:600;letter-spacing:.1em;text-transform:uppercase;color:var(--text3);padding:8px 18px 4px}
.nav-item{display:flex;align-items:center;gap:9px;padding:8px 18px;font-size:13px;font-weight:400;color:var(--text2);cursor:pointer;transition:all .12s;border-left:2px solid transparent}
.nav-item:hover{background:var(--bg);color:var(--text)}
.nav-item.active{background:var(--bg);color:var(--text);font-weight:500;border-left-color:var(--text)}
.nav-dot{width:8px;height:8px;border-radius:50%;flex-shrink:0}
.sidebar-divider{height:1px;background:var(--border);margin:8px 18px}
.main{flex:1;overflow:hidden;display:flex;flex-direction:column}
.topbar{display:flex;align-items:center;gap:10px;padding:13px 24px;background:var(--surface);border-bottom:1px solid var(--border)}
.topbar-title{font-size:15px;font-weight:600;flex:1}
.content{flex:1;overflow-y:auto;padding:24px}

/* ── BUTTONS ── */
.btn{font-family:'DM Sans',sans-serif;font-size:12px;font-weight:500;padding:7px 14px;border:1px solid var(--border-strong);border-radius:var(--r);cursor:pointer;background:var(--surface);color:var(--text2);transition:all .12s;white-space:nowrap}
.btn:hover{background:var(--bg);color:var(--text)}
.btn-primary{background:var(--text);color:#fff;border-color:var(--text)}
.btn-primary:hover{opacity:.85}
.btn-danger{color:var(--red-text);border-color:#fecaca}
.btn-danger:hover{background:var(--red-bg)}
.btn-ghost{border-color:transparent;background:transparent;color:var(--text3);padding:5px 8px}
.btn-ghost:hover{background:var(--surface2);color:var(--text)}
.btn-sm{font-size:11px;padding:4px 9px}

/* ── CLIENT BOARD ── */
.stats-row{display:grid;grid-template-columns:repeat(4,1fr);gap:12px;margin-bottom:22px}
.stat-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--rl);padding:14px 16px}
.stat-val{font-size:26px;font-weight:700;line-height:1;margin-bottom:4px}
.stat-lbl{font-size:11px;color:var(--text3);font-weight:500;letter-spacing:.04em}
.stat-red .stat-val{color:var(--red)}
.progress-wrap{margin-bottom:22px}
.progress-meta{display:flex;justify-content:space-between;font-size:12px;color:var(--text3);margin-bottom:6px}
.progress-bar{height:5px;background:var(--border);border-radius:3px;overflow:hidden}
.progress-fill{height:100%;background:var(--text);border-radius:3px;transition:width .4s}
.phase-block{margin-bottom:24px}
.phase-header{display:flex;align-items:center;gap:10px;margin-bottom:10px;cursor:pointer;user-select:none}
.phase-stripe{width:12px;height:12px;border-radius:3px;flex-shrink:0}
.phase-name{font-size:13px;font-weight:600}
.phase-count{font-size:12px;color:var(--text3)}
.phase-chevron{font-size:11px;color:var(--text3);margin-left:auto}
.task-table{width:100%;border-collapse:collapse;background:var(--surface);border:1px solid var(--border);border-radius:var(--rl);overflow:hidden}
.task-table th{font-size:11px;font-weight:600;letter-spacing:.05em;text-transform:uppercase;color:var(--text3);text-align:left;padding:9px 14px;background:var(--surface2);border-bottom:1px solid var(--border)}
.task-table td{padding:10px 14px;font-size:13px;border-bottom:1px solid var(--border);vertical-align:middle}
.task-table tr:last-child td{border-bottom:none}
.task-table tbody tr:hover td{background:var(--bg)}
.task-name-cell-lg{display:flex;align-items:flex-start;gap:10px}
.check-box-lg{width:16px;height:16px;border-radius:4px;border:1.5px solid var(--border-strong);cursor:pointer;flex-shrink:0;display:flex;align-items:center;justify-content:center;transition:all .15s;margin-top:1px}
.check-box-lg.done{background:var(--text);border-color:var(--text)}
.check-box-lg.done::after{content:'✓';color:#fff;font-size:10px;font-weight:700}
.task-label-lg{cursor:pointer;flex:1;line-height:1.4}
.task-label-lg.striked{text-decoration:line-through;color:var(--text3)}
.notes-hint{font-size:11px;color:var(--text3);font-style:italic;margin-top:2px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;max-width:340px}
.add-row td{padding:7px 14px}
.add-row input{background:transparent;border:none;font-family:'DM Sans',sans-serif;font-size:12px;color:var(--text3);width:100%;outline:none}
.add-row input::placeholder{color:var(--text3)}
.owner-chip{font-size:11px;color:var(--text2);background:var(--surface2);border:1px solid var(--border);padding:3px 9px;border-radius:20px;white-space:nowrap}
.pri-high-lg{color:var(--red);font-weight:600;font-size:12px}
.pri-med-lg{color:var(--amber);font-weight:600;font-size:12px}
.pri-low-lg{color:var(--text3);font-size:12px}

/* ── CALENDAR (client) ── */
.cal-topbar{display:flex;align-items:center;gap:12px;margin-bottom:18px}
.cal-month-label{font-size:16px;font-weight:700;flex:1}
.cal-grid-c{display:grid;grid-template-columns:repeat(7,1fr);border:1px solid var(--border);border-radius:var(--rl);overflow:hidden;background:var(--surface2)}
.cal-dow-c{padding:8px 10px;font-size:11px;font-weight:600;letter-spacing:.05em;text-transform:uppercase;color:var(--text3);background:var(--surface2);border-bottom:1px solid var(--border);text-align:center;border-right:1px solid var(--border)}
.cal-dow-c:last-child{border-right:none}
.cal-cell-c{min-height:110px;padding:6px 8px;border-right:1px solid var(--border);border-bottom:1px solid var(--border);background:var(--surface)}
.cal-cell-c:nth-child(7n){border-right:none}
.cal-cell-c.other-month{background:var(--bg)}
.cal-cell-c.today{background:#fffbf0}
.cal-date-c{font-size:12px;font-weight:600;color:var(--text2);margin-bottom:5px;width:22px;height:22px;display:flex;align-items:center;justify-content:center;border-radius:50%}
.cal-cell-c.today .cal-date-c{background:var(--text);color:#fff}
.cal-event-c{font-size:11px;padding:3px 6px;border-radius:4px;margin-bottom:3px;cursor:pointer;line-height:1.3;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;transition:opacity .12s;border-left:3px solid}
.cal-event-c:hover{opacity:.75}
.cal-event-c.weekly{background:#eff6ff;color:#1d4ed8;border-left-color:#2563eb}
.cal-event-c.monthly{background:#f0fdfa;color:#0f766e;border-left-color:#0d9488}
.cal-event-c.done-ev{opacity:.45;text-decoration:line-through}
.cal-more-c{font-size:10px;color:var(--text3);cursor:pointer;padding:2px 4px;margin-top:2px}
.recur-section{margin-top:20px}
.recur-tabs{display:flex;gap:0;border:1px solid var(--border);border-radius:var(--r);overflow:hidden;width:fit-content;margin-bottom:16px}
.recur-tab{font-size:12px;font-weight:500;padding:6px 16px;cursor:pointer;color:var(--text3);background:var(--surface2);border-right:1px solid var(--border);transition:all .12s}
.recur-tab:last-child{border-right:none}
.recur-tab.active{background:var(--surface);color:var(--text);font-weight:600}
.recur-list{display:grid;grid-template-columns:repeat(auto-fill,minmax(280px,1fr));gap:10px}
.recur-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--r);padding:12px 14px;cursor:pointer;border-left:3px solid;transition:background .12s}
.recur-card:hover{background:var(--bg)}
.recur-card-name{font-size:13px;line-height:1.4;margin-bottom:6px}
.recur-card-meta{display:flex;gap:8px;align-items:center;flex-wrap:wrap}

/* ── KPI ── */
.kpi-section{background:var(--surface);border:1px solid var(--border);border-radius:var(--rl);overflow:hidden;margin-bottom:20px}
.kpi-section-header{padding:12px 16px;background:var(--surface2);border-bottom:1px solid var(--border);font-size:13px;font-weight:600}
.kpi-table{width:100%;border-collapse:collapse}
.kpi-table th{font-size:11px;font-weight:600;letter-spacing:.05em;text-transform:uppercase;color:var(--text3);text-align:left;padding:10px 14px;border-bottom:1px solid var(--border)}
.kpi-table td{padding:10px 14px;font-size:13px;border-bottom:1px solid var(--border)}
.kpi-table tr:last-child td{border-bottom:none}
.kpi-table input{background:transparent;border:none;font-family:'DM Sans',sans-serif;font-size:13px;color:var(--text);outline:none;width:100%}
.kpi-table input::placeholder{color:var(--text3)}
.status-on{color:var(--green);font-weight:600;font-size:12px}
.status-off{color:var(--red);font-weight:600;font-size:12px}
.status-na{color:var(--text3);font-size:12px}
.calc-box{background:var(--surface);border:1px solid var(--border);border-radius:var(--rl);padding:20px;margin-top:20px}
.calc-title{font-size:13px;font-weight:600;margin-bottom:14px}
.calc-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:14px}
.calc-result{font-size:28px;font-weight:700;padding-top:8px;color:var(--green)}

/* ── SPRINT ── */
.sprint-grid{display:grid;grid-template-columns:1fr 1fr;gap:16px;margin-bottom:20px}
.sprint-order-item{display:flex;align-items:center;gap:12px;padding:10px 0;border-bottom:1px solid var(--border);font-size:13px}
.sprint-num{width:26px;height:26px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:11px;font-weight:700;color:#fff;flex-shrink:0}
.week-cards{display:grid;grid-template-columns:repeat(4,1fr);gap:12px;margin-bottom:20px}
.week-card{border:1px solid var(--border);border-radius:var(--rl);overflow:hidden;background:var(--surface)}
.week-card-head{padding:10px 12px;background:var(--surface2);border-bottom:1px solid var(--border);font-size:12px;font-weight:600}
.week-card-body{padding:10px}
.week-card-desc{font-size:12px;color:var(--text2);margin-bottom:8px}
.week-card textarea{width:100%;border:1px solid var(--border);border-radius:var(--r);padding:7px 9px;font-family:'DM Sans',sans-serif;font-size:12px;background:var(--bg);color:var(--text);resize:vertical;min-height:80px;outline:none}
.copy-textarea{width:100%;border:1px solid var(--border-strong);border-radius:var(--r);padding:10px 12px;font-family:'DM Mono',monospace;font-size:12px;background:var(--bg);color:var(--text);min-height:220px;resize:vertical;outline:none;margin-bottom:13px}

/* ── MODAL ── */
.overlay{position:fixed;inset:0;background:rgba(0,0,0,.45);display:flex;align-items:center;justify-content:center;z-index:300}
.modal{background:var(--surface);border:1px solid var(--border);border-radius:var(--rl);padding:26px;width:520px;max-width:93vw;max-height:90vh;overflow-y:auto;box-shadow:0 24px 64px rgba(0,0,0,.18)}
.modal-title{font-size:15px;font-weight:700;margin-bottom:18px}
.field-label{font-size:11px;font-weight:600;letter-spacing:.05em;text-transform:uppercase;color:var(--text3);margin-bottom:5px}
.field-input,.field-select,.field-textarea{width:100%;border:1px solid var(--border-strong);border-radius:var(--r);padding:9px 11px;font-family:'DM Sans',sans-serif;font-size:13px;background:var(--surface);color:var(--text);margin-bottom:13px;outline:none;transition:border-color .15s}
.field-input:focus,.field-select:focus,.field-textarea:focus{border-color:var(--text)}
.field-textarea{min-height:80px;resize:vertical}
.modal-actions{display:flex;gap:8px;justify-content:flex-end;margin-top:6px}
.form-grid{display:grid;grid-template-columns:1fr 1fr;gap:12px}
.color-swatches{display:flex;gap:8px;margin-bottom:13px;flex-wrap:wrap}
.swatch{width:28px;height:28px;border-radius:6px;cursor:pointer;border:2px solid transparent;transition:all .12s}
.swatch.selected{border-color:var(--text);transform:scale(1.15)}


/* ── HUB DASHBOARD ── */
.hub-kpi-row{display:grid;grid-template-columns:repeat(5,1fr);gap:12px;margin-bottom:24px}
.hub-kpi{background:var(--surface);border:1px solid var(--border);border-radius:var(--rl);padding:16px 18px;position:relative;overflow:hidden}
.hub-kpi::before{content:'';position:absolute;top:0;left:0;right:0;height:3px;border-radius:var(--rl) var(--rl) 0 0}
.hub-kpi.kpi-green::before{background:var(--green)}
.hub-kpi.kpi-blue::before{background:var(--blue)}
.hub-kpi.kpi-amber::before{background:var(--amber)}
.hub-kpi.kpi-red::before{background:var(--red)}
.hub-kpi.kpi-purple::before{background:#7c3aed}
.hub-kpi-val{font-size:28px;font-weight:700;line-height:1;margin-bottom:4px}
.hub-kpi-lbl{font-size:11px;color:var(--text3);font-weight:500;letter-spacing:.04em;text-transform:uppercase}
.hub-kpi-sub{font-size:11px;color:var(--text3);margin-top:4px}
.hub-kpi.kpi-green .hub-kpi-val{color:var(--green)}
.hub-kpi.kpi-red .hub-kpi-val{color:var(--red)}
.hub-kpi.kpi-amber .hub-kpi-val{color:var(--amber)}
.hub-kpi.kpi-blue .hub-kpi-val{color:var(--blue)}
.hub-kpi.kpi-purple .hub-kpi-val{color:#7c3aed}
.hub-section-title{font-size:13px;font-weight:600;color:var(--text2);margin-bottom:12px;display:flex;align-items:center;gap:10px}
.hub-section-title-line{flex:1;height:1px;background:var(--border)}
.status-badge{display:inline-flex;align-items:center;font-size:10px;font-weight:600;padding:2px 8px;border-radius:10px;white-space:nowrap;text-transform:uppercase;letter-spacing:.04em}
.status-active{background:#dcfce7;color:#15803d}
.status-paused{background:#fef9c3;color:#a16207}
.status-cancelled{background:#fee2e2;color:#b91c1c}

/* ── TEAM MEMBERS ── */
.team-modal-list{display:flex;flex-direction:column;gap:6px;margin-bottom:16px;max-height:200px;overflow-y:auto}
.team-member-row{display:flex;align-items:center;gap:10px;padding:8px 10px;border:1px solid var(--border);border-radius:var(--r);background:var(--surface2)}
.team-member-avatar{width:28px;height:28px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:10px;font-weight:700;color:#fff;flex-shrink:0}
.team-member-name{flex:1;font-size:13px}
.team-member-role{font-size:11px;color:var(--text3)}
.owner-select{font-family:'DM Sans',sans-serif;font-size:13px;padding:8px 10px;border:1px solid var(--border-strong);border-radius:var(--r);background:var(--surface);color:var(--text);outline:none;width:100%;margin-bottom:13px;cursor:pointer}
.owner-select:focus{border-color:var(--text)}

/* ── DATE / DUE ── */
.due-chip{display:inline-flex;align-items:center;gap:4px;font-size:11px;font-weight:500;padding:2px 8px;border-radius:10px;white-space:nowrap}
.due-chip.overdue{background:#fee2e2;color:#b91c1c}
.due-chip.today{background:#fef9c3;color:#a16207}
.due-chip.upcoming{background:var(--surface2);color:var(--text3)}
.due-chip.done{background:var(--green-bg);color:var(--green-text);opacity:.6;text-decoration:line-through}
.due-chip.recurring{background:#eff6ff;color:#1d4ed8}
.task-type-tabs{display:flex;gap:0;border:1px solid var(--border);border-radius:var(--r);overflow:hidden;margin-bottom:10px;width:fit-content}
.task-type-tab{font-family:'DM Sans',sans-serif;font-size:11px;font-weight:600;letter-spacing:.04em;text-transform:uppercase;padding:5px 14px;cursor:pointer;color:var(--text3);background:var(--surface2);border:none;border-right:1px solid var(--border);transition:all .12s}
.task-type-tab:last-child{border-right:none}
.task-type-tab.active{background:var(--surface);color:var(--text)}

/* ── CAL FILTER BAR ── */
.cal-filter-bar{display:flex;align-items:center;gap:8px;flex-wrap:wrap;margin-top:10px;margin-bottom:4px}
.cal-filter-chip{display:flex;align-items:center;gap:5px;font-size:11px;font-weight:500;padding:4px 10px;border-radius:20px;cursor:pointer;border:1px solid var(--border);background:var(--surface);color:var(--text2);transition:all .12s;white-space:nowrap}
.cal-filter-chip:hover{border-color:var(--border-strong);color:var(--text)}
.cal-filter-chip.active{background:var(--text);color:#fff;border-color:var(--text)}
.cal-filter-chip-dot{width:7px;height:7px;border-radius:50%;flex-shrink:0}
.cal-ev.ev-oneoff{background:#f5f3ff;color:#4c1d95;border-left:3px solid #7c3aed}
.cal-event-c.oneoff{background:#f5f3ff;color:#6d28d9;border-left-color:#7c3aed}
::-webkit-scrollbar{width:6px;height:6px}
::-webkit-scrollbar-track{background:transparent}
::-webkit-scrollbar-thumb{background:var(--border-strong);border-radius:3px}
</style>
</head>
<body>

<!-- ══ LOGIN SCREEN ══ -->
<div id="screen-login">
  <div class="login-box">
    <div class="login-brand">
      <div class="login-brand-name">The Implant Initiative</div>
      <div class="login-brand-sub">Practice PM — Team Access</div>
    </div>
    <div class="login-error" id="login-error">Incorrect username or password.</div>
    <div class="field-label" style="margin-bottom:5px">Username</div>
    <input class="field-input" id="login-user" placeholder="Enter your username" autocomplete="username" onkeydown="if(event.key==='Enter')document.getElementById('login-pass').focus()">
    <div class="field-label" style="margin-bottom:5px;margin-top:4px">Password</div>
    <div style="position:relative;margin-bottom:18px">
      <input class="field-input" id="login-pass" type="password" placeholder="Enter your password" autocomplete="current-password" style="margin-bottom:0;padding-right:40px" onkeydown="if(event.key==='Enter')doLogin()">
      <button onclick="togglePw()" style="position:absolute;right:10px;top:50%;transform:translateY(-50%);background:none;border:none;cursor:pointer;font-size:13px;color:var(--text3);padding:4px">👁</button>
    </div>
    <button class="btn btn-primary" style="width:100%;padding:10px;font-size:13px" onclick="doLogin()">Sign in</button>
    <div class="login-footer">The Implant Initiative · Internal tool</div>
  </div>
</div>

<!-- ══ HOME SCREEN ══ -->
<div id="screen-home">
  <div class="home-topbar">
    <div class="brand">
      <div class="brand-name" style="font-size:17px">The Implant Initiative</div>
    </div>
    <div class="home-tabs">
      <div class="home-tab active" id="htab-clients" onclick="switchHomeTab('clients')">
        <span class="home-tab-icon">&#9783;</span> Clients
      </div>
      <div class="home-tab" id="htab-mastercal" onclick="switchHomeTab('mastercal')">
        <span class="home-tab-icon">&#128197;</span> Master Calendar
      </div>
      <div class="home-tab" id="htab-mastertasks" onclick="switchHomeTab('mastertasks')">
        <span class="home-tab-icon">&#9776;</span> All Tasks
      </div>
      <div class="home-tab" id="htab-intake" onclick="switchHomeTab('intake')">
        <span class="home-tab-icon">&#128196;</span> Intake Form
      </div>
    </div>
    <div class="home-topbar-right">
      <button class="btn" onclick="openTeamManager()">&#128101; Team</button>
      <button class="btn" onclick="openUserSettings()" id="user-avatar-btn" style="display:flex;align-items:center;gap:7px">
        <span id="topbar-user-avatar" style="width:20px;height:20px;border-radius:50%;background:var(--text);display:inline-flex;align-items:center;justify-content:center;font-size:9px;font-weight:700;color:#fff"></span>
        <span id="topbar-user-name" style="font-size:12px"></span>
      </button>
      <button class="btn btn-primary" onclick="clientFormModal(null)">+ Add client</button>
    </div>
  </div>
  <div class="home-body">
    <div class="home-panel active" id="panel-clients">
      <div id="hub-kpi-wrapper"></div>
      <div id="clients-grid"></div>
    </div>
    <div class="home-panel" id="panel-mastercal">
      <div id="master-cal-content"></div>
    </div>
    <div class="home-panel" id="panel-mastertasks">
      <div id="master-tasks-content"></div>
    </div>
    <div class="home-panel" id="panel-intake">
      <div id="intake-content"></div>
    </div>
  </div>
</div>

<!-- ══ CLIENT APP ══ -->
<div id="screen-app">
  <div class="sidebar">
    <div class="sidebar-header">
      <div class="back-btn" onclick="goHome()">← All clients</div>
      <div class="sb-client-name" id="sb-client-name">—</div>
      <div class="sb-client-sub" id="sb-client-sub">—</div>
    </div>
    <div class="sidebar-divider"></div>
    <div class="sidebar-section">
      <div class="sidebar-label">Workspaces</div>
      <div class="nav-item active" onclick="switchView('board')" id="nav-board">
        <div class="nav-dot" style="background:#2563eb"></div> All Tasks
      </div>
      <div class="nav-item" onclick="switchView('calendar')" id="nav-calendar">
        <div class="nav-dot" style="background:#d97706"></div> Calendar
      </div>
      <div class="nav-item" onclick="switchView('kpis')" id="nav-kpis">
        <div class="nav-dot" style="background:#d4537e"></div> KPI Tracker
      </div>
      <div class="nav-item" onclick="switchView('sprints')" id="nav-sprints">
        <div class="nav-dot" style="background:#0d9488"></div> Sprint Planner
      </div>
    </div>
    <div class="sidebar-divider"></div>
    <div class="sidebar-section">
      <div class="sidebar-label">Phases</div>
      <div id="phase-nav"></div>
    </div>
  </div>
  <div class="main">
    <div class="topbar">
      <div class="topbar-title" id="view-title">Onboarding Playbook</div>
      <button class="btn" onclick="openEditClient()">Edit client</button>
      <button class="btn" onclick="openTeamManager()">Team</button>
      <button class="btn" onclick="exportJSON()">Export JSON</button>
      <button class="btn btn-primary" onclick="openAddTask()">+ Add task</button>
    </div>
    <div class="content" id="main-content"></div>
  </div>
</div>

<div id="modal-root"></div>

<script>
// ══ CONSTANTS ══
const PHASES=[
  {id:'onboarding',name:'Initial Onboarding',color:'#2563eb'},
  {id:'week1',name:'Week 1 – Indoctrination',color:'#16a34a'},
  {id:'week2',name:'Week 2 – Auditing',color:'#d4537e'},
  {id:'weekly_ops',name:'Weekly Operations',color:'#d97706'},
  {id:'monthly',name:'Monthly Sprint Cycle',color:'#0d9488'},
];
const AVATAR_COLORS=['#2563eb','#16a34a','#d97706','#d4537e','#7c3aed','#0d9488','#dc2626','#1e40af','#065f46','#92400e'];

// ── TEAM MEMBERS (global, shared across all clients) ──
function loadTeam(){try{return JSON.parse(localStorage.getItem('pm_team')||'null')||[{id:'tm_1',name:'Devyn',role:'Account Manager',color:'#2563eb'}];}catch(e){return[{id:'tm_1',name:'Devyn',role:'Account Manager',color:'#2563eb'}];}}
function saveTeam(t){try{localStorage.setItem('pm_team',JSON.stringify(t));}catch(e){}}
let teamMembers=loadTeam();
function teamOwnerOptions(selectedName){
  const opts=teamMembers.map(m=>`<option value="${m.name}" ${m.name===selectedName?'selected':''}>${m.name}${m.role?' ('+m.role+')':''}</option>`).join('');
  return`<option value="">Unassigned</option>`+opts;
}
function openTeamManager(){
  teamMembers=loadTeam();
  renderTeamModal();
}
function renderTeamModal(){
  const rows=teamMembers.map((m,i)=>`
    <div class="team-member-row">
      <div class="team-member-avatar" style="background:${m.color||'#888'}">${m.name[0]||'?'}</div>
      <div style="flex:1">
        <div class="team-member-name">${m.name}</div>
        <div class="team-member-role">${m.role||'No role'}</div>
      </div>
      <button class="btn btn-ghost btn-sm" onclick="editTeamMember(${i})">Edit</button>
      <button class="btn btn-ghost btn-sm" style="color:var(--red-text)" onclick="removeTeamMember(${i})">✕</button>
    </div>`).join('');
  document.getElementById('modal-root').innerHTML=`<div class="overlay" onclick="closeModalBg(event)">
    <div class="modal">
      <div class="modal-title">Team members</div>
      <div style="font-size:12px;color:var(--text3);margin-bottom:14px">Team members appear as owner options when assigning tasks.</div>
      <div class="team-modal-list">${rows||'<div style="font-size:13px;color:var(--text3);padding:8px">No team members yet.</div>'}</div>
      <div style="border-top:1px solid var(--border);padding-top:14px;margin-top:4px">
        <div style="font-size:13px;font-weight:600;margin-bottom:10px">Add team member</div>
        <div class="form-grid">
          <div><div class="field-label">Name</div><input class="field-input" id="tm-name" placeholder="e.g. Sarah"></div>
          <div><div class="field-label">Role</div><input class="field-input" id="tm-role" placeholder="e.g. Coordinator"></div>
        </div>
        <div class="field-label">Avatar color</div>
        <div class="color-swatches" id="tm-swatches">${AVATAR_COLORS.map((col,i)=>`<div class="swatch ${i===0?'selected':''}" style="background:${col}" data-color="${col}" onclick="selectTmSwatch(this)"></div>`).join('')}</div>
        <input type="hidden" id="tm-color" value="${AVATAR_COLORS[0]}">
      </div>
      <div class="modal-actions">
        <button class="btn" onclick="closeModal()">Done</button>
        <button class="btn btn-primary" onclick="addTeamMember()">Add member</button>
      </div>
    </div>
  </div>`;
}
function selectTmSwatch(el){document.querySelectorAll('#tm-swatches .swatch').forEach(s=>s.classList.remove('selected'));el.classList.add('selected');document.getElementById('tm-color').value=el.dataset.color;}
function addTeamMember(){
  const name=document.getElementById('tm-name')?.value?.trim();
  if(!name)return;
  teamMembers.push({id:'tm_'+Date.now(),name,role:document.getElementById('tm-role')?.value?.trim()||'',color:document.getElementById('tm-color')?.value||AVATAR_COLORS[0]});
  saveTeam(teamMembers);renderTeamModal();
}
function removeTeamMember(i){if(!confirm('Remove this team member?'))return;teamMembers.splice(i,1);saveTeam(teamMembers);renderTeamModal();}
function editTeamMember(i){
  const m=teamMembers[i];
  const sw=AVATAR_COLORS.map(col=>`<div class="swatch ${col===m.color?'selected':''}" style="background:${col}" data-color="${col}" onclick="selectTmSwatch2(this)"></div>`).join('');
  document.getElementById('modal-root').innerHTML=`<div class="overlay" onclick="closeModalBg(event)">
    <div class="modal">
      <div class="modal-title">Edit team member</div>
      <div class="field-label">Name</div><input class="field-input" id="tm-edit-name" value="${m.name}">
      <div class="field-label">Role</div><input class="field-input" id="tm-edit-role" value="${m.role||''}">
      <div class="field-label">Avatar color</div>
      <div class="color-swatches" id="tm-edit-swatches">${sw}</div>
      <input type="hidden" id="tm-edit-color" value="${m.color||AVATAR_COLORS[0]}">
      <div class="modal-actions">
        <button class="btn" onclick="openTeamManager()">Cancel</button>
        <button class="btn btn-primary" onclick="saveTeamMember(${i})">Save</button>
      </div>
    </div>
  </div>`;
}
function selectTmSwatch2(el){document.querySelectorAll('#tm-edit-swatches .swatch').forEach(s=>s.classList.remove('selected'));el.classList.add('selected');document.getElementById('tm-edit-color').value=el.dataset.color;}
function saveTeamMember(i){
  teamMembers[i].name=document.getElementById('tm-edit-name')?.value?.trim()||teamMembers[i].name;
  teamMembers[i].role=document.getElementById('tm-edit-role')?.value?.trim()||'';
  teamMembers[i].color=document.getElementById('tm-edit-color')?.value||AVATAR_COLORS[0];
  saveTeam(teamMembers);openTeamManager();
}
const DOW_MAP={Monday:1,Tuesday:2,Wednesday:3,Thursday:4,Friday:5};

// ── DATE HELPERS ──
// Returns a Date if the task has a concrete dueDate, null otherwise
function getTaskDate(t){
  if(!t.dueDate) return null;
  const d=new Date(t.dueDate+'T00:00:00');
  return isNaN(d)?null:d;
}
// Returns DOW index if task is weekly recurring, null otherwise
function getTaskDow(t){
  if(t.recurrence==='weekly'&&DOW_MAP[t.day]!==undefined) return DOW_MAP[t.day];
  // Legacy: no recurrence field but phase=weekly_ops and DOW-named day
  if(!t.recurrence&&t.phase==='weekly_ops'&&DOW_MAP[t.day]!==undefined) return DOW_MAP[t.day];
  return null;
}
// Returns day-of-month if task is monthly-fixed recurring, null otherwise
function getTaskMonthDay(t,daysInMonth){
  if(t.day==='1st') return 1;
  if(t.day==='14th') return 14;
  if(t.day==='26th') return 26;
  if(t.day==='End') return daysInMonth;
  return null;
}
function formatDate(d){
  if(!d) return '';
  return d.toLocaleDateString('en-US',{month:'short',day:'numeric',year:'numeric'});
}
function dateStr(d){
  // YYYY-MM-DD for <input type=date>
  return d.getFullYear()+'-'+String(d.getMonth()+1).padStart(2,'0')+'-'+String(d.getDate()).padStart(2,'0');
}
function dueBadge(t){
  if(t.recurrence==='weekly'||(t.phase==='weekly_ops'&&!t.recurrence)){
    return`<span class="due-chip recurring">Every ${t.day||'week'}</span>`;
  }
  if(t.recurrence==='monthly'||t.phase==='monthly'){
    const lbl={1:'1st','1st':'1st',14:'14th','14th':'14th',26:'26th','26th':'26th','End':'End of month'};
    return`<span class="due-chip recurring">Monthly · ${lbl[t.day]||t.day||''}</span>`;
  }
  const d=getTaskDate(t);
  if(!d) return t.day?`<span class="due-chip upcoming">${t.day}</span>`:'';
  const now=new Date(); now.setHours(0,0,0,0);
  const diff=Math.round((d-now)/86400000);
  if(t.status==='done') return`<span class="due-chip done">${formatDate(d)}</span>`;
  if(diff<0) return`<span class="due-chip overdue">Overdue · ${formatDate(d)}</span>`;
  if(diff===0) return`<span class="due-chip today">Today</span>`;
  if(diff===1) return`<span class="due-chip today">Tomorrow</span>`;
  return`<span class="due-chip upcoming">${formatDate(d)}</span>`;
}

const MONTHS_FULL=['January','February','March','April','May','June','July','August','September','October','November','December'];
const DOWS=['Sun','Mon','Tue','Wed','Thu','Fri','Sat'];

const DEFAULT_TASKS=()=>([
  {id:1,phase:'onboarding',name:'Create Slack channels (dr-[name]-chat, dr-[name]-feed, dr-[name]-reporting)',owner:'Devyn',status:'todo',day:'Day 1',priority:'High',notes:'Add view-only permissions on feed + reporting channels'},
  {id:2,phase:'onboarding',name:'Send Slack email invite to all onboarding form contacts',owner:'Devyn',status:'todo',day:'Day 1',priority:'High',notes:''},
  {id:3,phase:'onboarding',name:'Add whole team to all Slack channels',owner:'Devyn',status:'todo',day:'Day 1',priority:'High',notes:''},
  {id:4,phase:'onboarding',name:'Send @channel welcome message with onboarding video + next steps',owner:'Devyn',status:'todo',day:'Day 1',priority:'High',notes:'Include expectations and To Do list in message'},
  {id:5,phase:'onboarding',name:'Schedule 1-1 meet & greet calls with each key staff member',owner:'Devyn',status:'todo',day:'Day 1',priority:'Med',notes:''},
  {id:6,phase:'onboarding',name:'CC office manager with ConversionLens team (harsh@getconvertlens.com)',owner:'Devyn',status:'todo',day:'Day 1',priority:'High',notes:'7 days to go live. Ensure new consult, tx plan, shown consult triggers alerts@'},
  {id:7,phase:'onboarding',name:'Setup Zapier Slack alerts – duplicate template zaps, update office name + channel',owner:'Devyn',status:'todo',day:'Day 2',priority:'High',notes:''},
  {id:8,phase:'onboarding',name:'Request dentist move ads + CRM in-house into practice-owned account',owner:'Devyn',status:'todo',day:'Day 2',priority:'Med',notes:'Use the agency outreach script template'},
  {id:9,phase:'onboarding',name:'Export all implant production reports from PMS',owner:'Devyn',status:'todo',day:'Day 3',priority:'High',notes:''},
  {id:10,phase:'onboarding',name:'Run reports through AI – find bottlenecks, create 1-2 key optimizations list',owner:'Devyn',status:'todo',day:'Day 3',priority:'High',notes:''},
  {id:11,phase:'onboarding',name:'Record 10-15 min loom audit video – share in Slack',owner:'Devyn',status:'todo',day:'Day 4',priority:'High',notes:'Identify the $100k being lost – deliver on guarantee'},
  {id:12,phase:'onboarding',name:'Upload cheat sheet docs to Slack folder (Treatment Blueprint, Call Scripts, DIY Reactivation SOP)',owner:'Devyn',status:'todo',day:'Day 5',priority:'Med',notes:''},
  {id:13,phase:'onboarding',name:'Create Slack Canvas with practice vendors, software, logins, contact info',owner:'Devyn',status:'todo',day:'Day 5',priority:'Med',notes:''},
  {id:14,phase:'onboarding',name:'Call/email vendors and introduce yourself',owner:'Devyn',status:'todo',day:'Day 5',priority:'Low',notes:''},
  {id:15,phase:'onboarding',name:'Set up Claude folder – upload bookkeeping/production reports, input detailed prompt',owner:'Devyn',status:'todo',day:'Day 5',priority:'Med',notes:'Connect live data spreadsheet if possible'},
  {id:16,phase:'week1',name:'Post Day 1 welcome message in Slack with onboarding video',owner:'Devyn',status:'todo',day:'Day 1',priority:'High',notes:'See welcome message template'},
  {id:17,phase:'week1',name:'Send onboarding form – follow up if not completed by Day 2',owner:'Devyn',status:'todo',day:'Day 1',priority:'High',notes:''},
  {id:18,phase:'week1',name:'Hold 45-min kickoff call on Day 3',owner:'Devyn',status:'todo',day:'Day 3',priority:'High',notes:'Use Kickoff Call v3 agenda'},
  {id:19,phase:'week1',name:'Confirm access to PMS, marketing tools, call tracking',owner:'Client',status:'todo',day:'Day 1',priority:'High',notes:'Dentrix, QuickBooks, any marketing software'},
  {id:20,phase:'week1',name:'Confirm team roles (front desk, TC, etc.) and set weekly call time',owner:'Client',status:'todo',day:'Day 1',priority:'High',notes:''},
  {id:21,phase:'week2',name:'Record Loom: implant revenue breakdown (leads → booking → show → acceptance → case value)',owner:'Devyn',status:'todo',day:'Day 6',priority:'High',notes:'Include $120k–$300k opportunity framing'},
  {id:22,phase:'week2',name:'Post Day 7 pipeline report + biggest leak + next 30-day focus in Slack',owner:'Devyn',status:'todo',day:'Day 7',priority:'High',notes:''},
  {id:23,phase:'week2',name:'Export outstanding tx plans (2+ weeks old) from PMS with consult notes',owner:'Devyn',status:'todo',day:'Day 7',priority:'High',notes:''},
  {id:24,phase:'week2',name:'Run tx plan list through AI – generate top 3 patient follow-up opportunities',owner:'Devyn',status:'todo',day:'Day 7',priority:'High',notes:'Post formatted results in #revenue-opportunities tagging TX coordinator'},
  {id:25,phase:'week2',name:'Verify ConversionLens dashboard is live + all team members joined',owner:'Devyn',status:'todo',day:'Day 7',priority:'High',notes:''},
  {id:26,phase:'weekly_ops',name:'Post revenue opportunities (top 3 tx plans) in #revenue-opportunities',owner:'Devyn',status:'todo',day:'Monday',priority:'High',notes:'Tag TX coordinator. Show case value, status, last contact, recommended action'},
  {id:27,phase:'weekly_ops',name:'Post weekly focus + current KPI objective in #weekly-focus',owner:'Devyn',status:'todo',day:'Monday',priority:'High',notes:''},
  {id:28,phase:'weekly_ops',name:'Post value drop signal in #general-chat (tie to a KPI)',owner:'Devyn',status:'todo',day:'Tuesday',priority:'Med',notes:'Rotate messaging so it does not feel canned'},
  {id:29,phase:'weekly_ops',name:'Post micro win / check-in update in #general-chat',owner:'Devyn',status:'todo',day:'Wednesday',priority:'Med',notes:'Follow up with TX coordinator on Monday patients'},
  {id:30,phase:'weekly_ops',name:'Post second value drop in #general-chat (different angle than Tuesday)',owner:'Devyn',status:'todo',day:'Thursday',priority:'Med',notes:''},
  {id:31,phase:'weekly_ops',name:'Post EOW update in #weekly-focus (snapshot + this week + next)',owner:'Devyn',status:'todo',day:'Friday',priority:'High',notes:'Include current KPI metrics'},
  {id:32,phase:'monthly',name:'Identify 30-day constraint sprint focus KPI (fix lowest funnel first)',owner:'Devyn',status:'todo',day:'1st',priority:'High',notes:'Order: Case Acceptance → Show Rate → Booking Rate → Lead Flow → Case Value → Capacity'},
  {id:33,phase:'monthly',name:'Post 30-day sprint announcement in Slack with roadmap + revenue opportunity',owner:'Devyn',status:'todo',day:'1st',priority:'High',notes:''},
  {id:34,phase:'monthly',name:'Post 14-day video update via Slack (lead flow, CPL, consult opportunities)',owner:'Devyn',status:'todo',day:'14th',priority:'High',notes:''},
  {id:35,phase:'monthly',name:'Hold Zoom call – month review, production $, next bottleneck selection',owner:'Devyn',status:'todo',day:'26th',priority:'High',notes:''},
  {id:36,phase:'monthly',name:'Post monthly performance review (KPI snapshot, execution, pipeline, next focus)',owner:'Devyn',status:'todo',day:'End',priority:'High',notes:''},
]);

const DEFAULT_KPIS=()=>([
  {name:'Leads (total/month)',before:'',current:'',target:''},
  {name:'Booking Rate',before:'',current:'',target:'30'},
  {name:'Show Rate',before:'',current:'',target:'70'},
  {name:'Case Acceptance',before:'',current:'',target:'35'},
  {name:'Avg Case Value ($)',before:'',current:'',target:''},
  {name:'Total Cases Completed',before:'',current:'',target:''},
  {name:'Total Production ($)',before:'',current:'',target:''},
  {name:'Cost Per Lead',before:'',current:'',target:''},
  {name:'Cost Per Booked Consult',before:'',current:'',target:''},
]);

// ══ STATE ══
let clients=[],activeClientId=null,currentView='board',collapsed={};
let tasks=[],kpiData=[],nextId=100;
let masterCalYear,masterCalMonth;
let masterTaskFilter='all',masterTaskSearch='',masterSectionCollapsed={};
let masterCalOwnerFilter='all';
let clientCalYear,clientCalMonth,clientCalRecurTab='weekly';

// ══ STORAGE ══
function loadClients(){try{clients=JSON.parse(localStorage.getItem('pm_clients')||'[]');}catch(e){clients=[];}}
function saveClients(){try{localStorage.setItem('pm_clients',JSON.stringify(clients));}catch(e){}}
function getClient(id){return clients.find(c=>c.id===id);}
function getActiveClient(){return getClient(activeClientId);}
function clientKey(id,t){return`pm_${id}_${t}`;}
function loadClientTasks(id){try{const s=localStorage.getItem(clientKey(id,'tasks'));return s?JSON.parse(s):DEFAULT_TASKS();}catch(e){return DEFAULT_TASKS();}}
function saveClientTasks(id,t){try{localStorage.setItem(clientKey(id,'tasks'),JSON.stringify(t));}catch(e){}}
function loadClientKPIs(id){try{const s=localStorage.getItem(clientKey(id,'kpis'));return s?JSON.parse(s):DEFAULT_KPIS();}catch(e){return DEFAULT_KPIS();}}
function saveClientKPIs(id,k){try{localStorage.setItem(clientKey(id,'kpis'),JSON.stringify(k));}catch(e){}}
function deleteClientData(id){try{localStorage.removeItem(clientKey(id,'tasks'));localStorage.removeItem(clientKey(id,'kpis'));}catch(e){}}
function loadClientIntoState(id){tasks=loadClientTasks(id);kpiData=loadClientKPIs(id);nextId=tasks.length?Math.max(...tasks.map(t=>t.id))+1:100;}
function persistTasks(){saveClientTasks(activeClientId,tasks);}
function persistKPIs(){saveClientKPIs(activeClientId,kpiData);}
function initials(name){return name.split(' ').map(w=>w[0]).join('').slice(0,2).toUpperCase();}

// ══ HOME TABS ══
let homeTab='clients';
function switchHomeTab(tab){
  homeTab=tab;
  ['clients','mastercal','mastertasks','intake'].forEach(t=>{
    document.getElementById('htab-'+t)?.classList.remove('active');
    document.getElementById('panel-'+t)?.classList.remove('active');
  });
  document.getElementById('htab-'+tab)?.classList.add('active');
  document.getElementById('panel-'+tab)?.classList.add('active');
  if(tab==='mastercal') renderMasterCal();
  if(tab==='mastertasks') renderMasterTasks();
  if(tab==='intake') renderIntake();
}

// ══ INTAKE FORM ══
function renderIntake(){
  const submissions=loadIntakeSubmissions();

  let subRows='';
  if(submissions.length){
    subRows=submissions.map((s,i)=>{
      const linked=clients.find(c=>c.intakeId===s.id);
      const date=s.submittedAt?new Date(s.submittedAt).toLocaleDateString():'—';
      return`<tr style="border-bottom:1px solid var(--border)">
        <td style="padding:10px 12px;font-size:13px;font-weight:500">${s.doctorName||'—'}</td>
        <td style="padding:10px 12px;font-size:12px;color:var(--text2)">${s.practiceName||'—'}</td>
        <td style="padding:10px 12px;font-size:12px;color:var(--text2)">${s.email||'—'}</td>
        <td style="padding:10px 12px;font-size:12px;color:var(--text3)">${date}</td>
        <td style="padding:10px 12px">${linked?`<span class="status-badge status-active">Client created</span>`:`<span class="status-badge status-paused">Pending</span>`}</td>
        <td style="padding:10px 12px;display:flex;gap:6px">
          ${linked?`<button class="btn btn-sm" onclick="openClient('${linked.id}')">Open client →</button>`:`<button class="btn btn-sm btn-primary" onclick="createClientFromIntake(${i})">Create client</button>`}
          <button class="btn btn-sm" onclick="viewIntakeSubmission(${i})">View</button>
          <button class="btn btn-sm" style="color:var(--red-text);border-color:#fecaca" onclick="deleteIntakeSubmission(${i})">✕</button>
        </td>
      </tr>`;
    }).join('');
  }

  document.getElementById('intake-content').innerHTML=`
    <div style="margin-bottom:20px">
      <div style="font-size:18px;font-weight:700;margin-bottom:4px">Client Intake Submissions</div>
      <div style="font-size:13px;color:var(--text2)">Submissions come from the separate intake form file (<strong>implant_intake_form.html</strong>). Open both files in the same browser — submissions will appear here automatically. Click "Create client" to auto-populate a client profile from any submission.</div>
    </div>

    <div style="background:var(--surface);border:1px solid var(--border);border-radius:var(--rl);overflow:hidden;margin-bottom:20px">
      <div style="padding:12px 16px;background:var(--surface2);border-bottom:1px solid var(--border);display:flex;align-items:center;gap:10px">
        <div style="font-size:13px;font-weight:600;flex:1">${submissions.length} submission${submissions.length!==1?'s':''}</div>
        <button class="btn btn-sm" onclick="renderIntake()">Refresh</button>
      </div>
      ${submissions.length?`
        <div style="overflow-x:auto">
          <table style="width:100%;border-collapse:collapse;min-width:700px">
            <thead><tr style="background:var(--surface2);border-bottom:1px solid var(--border)">
              <th style="font-size:10px;font-weight:600;text-transform:uppercase;letter-spacing:.05em;color:var(--text3);text-align:left;padding:9px 12px">Doctor</th>
              <th style="font-size:10px;font-weight:600;text-transform:uppercase;letter-spacing:.05em;color:var(--text3);text-align:left;padding:9px 12px">Practice</th>
              <th style="font-size:10px;font-weight:600;text-transform:uppercase;letter-spacing:.05em;color:var(--text3);text-align:left;padding:9px 12px">Email</th>
              <th style="font-size:10px;font-weight:600;text-transform:uppercase;letter-spacing:.05em;color:var(--text3);text-align:left;padding:9px 12px">Submitted</th>
              <th style="font-size:10px;font-weight:600;text-transform:uppercase;letter-spacing:.05em;color:var(--text3);text-align:left;padding:9px 12px">Status</th>
              <th style="padding:9px 12px"></th>
            </tr></thead>
            <tbody>${subRows}</tbody>
          </table>
        </div>`
      :`<div style="padding:40px;text-align:center;color:var(--text3);font-size:13px">
          <div style="font-size:28px;margin-bottom:10px">📋</div>
          No submissions yet.
          <div style="margin-top:8px;font-size:12px">Open <strong>implant_intake_form.html</strong> in this same browser and submit a form — it will appear here.</div>
        </div>`}
    </div>

    <div style="background:var(--surface2);border:1px solid var(--border);border-radius:var(--rl);padding:16px;font-size:13px;color:var(--text2)">
      <strong>How it works:</strong> Both files use your browser's localStorage to share data. Keep both files on the same computer and open them in the same browser profile. When a client fills out the intake form, their data will appear in this list within seconds — just refresh this tab.
    </div>`;
}

function loadIntakeSubmissions(){try{return JSON.parse(localStorage.getItem('pm_intake')||'[]');}catch(e){return[];}}
function saveIntakeSubmissions(s){try{localStorage.setItem('pm_intake',JSON.stringify(s));}catch(e){}}

function deleteIntakeSubmission(idx){
  if(!confirm('Delete this submission?'))return;
  const subs=loadIntakeSubmissions();
  subs.splice(idx,1);
  saveIntakeSubmissions(subs);
  renderIntake();
}

function createClientFromIntake(idx){
  const subs=loadIntakeSubmissions();
  const s=subs[idx];
  if(!s)return;
  createClientFromIntakeData(s);
}

function createClientFromIntakeData(s){
  const usedColors=clients.map(c=>c.color);
  const color=AVATAR_COLORS.find(c=>!usedColors.includes(c))||AVATAR_COLORS[Math.floor(Math.random()*AVATAR_COLORS.length)];

  // Parse contacts and agencies back from JSON strings if needed
  let contactsList='';
  try{
    const kc=typeof s.keyContacts==='string'?JSON.parse(s.keyContacts):s.keyContacts;
    if(kc&&kc.length) contactsList=kc.filter(c=>c.name).map(c=>`  • ${c.name} (${c.role||'?'}) — ${c.email||''} ${c.phone||''}`).join('\n');
  }catch(e){}
  let agencyList='';
  try{
    const ag=typeof s.agencies==='string'?JSON.parse(s.agencies):s.agencies;
    if(ag&&ag.length) agencyList=ag.filter(a=>a.name).map(a=>`  • ${a.name} — ${a.contact||''} / ${a.email||''} (${a.services||''})`).join('\n');
  }catch(e){}

  const intakeNotes=[
    s.phone?`Phone: ${s.phone}`:'',
    s.email?`Email: ${s.email}`:'',
    s.website?`Website: ${s.website}`:'',
    (s.city||s.state)?`Location: ${[s.city,s.state].filter(Boolean).join(', ')}`:'',
    '',
    '── Pipeline ──',
    s.implantExperience?`Implant experience: ${s.implantExperience}`:'',
    s.casesPerMonth?`Cases/month: ${s.casesPerMonth}`:'',
    s.monthlyLeads?`Monthly leads: ${s.monthlyLeads}`:'',
    s.avgCaseValue?`Avg case value: $${Number(s.avgCaseValue).toLocaleString()}`:'',
    s.showRate?`Show rate: ${s.showRate}%`:'',
    s.bookingRate?`Booking rate: ${s.bookingRate}%`:'',
    s.acceptanceRate?`Acceptance rate: ${s.acceptanceRate}%`:'',
    '',
    '── Marketing ──',
    s.leadSources?`Lead sources: ${s.leadSources}`:'',
    s.monthlyAdSpend?`Monthly ad spend: $${Number(s.monthlyAdSpend).toLocaleString()}`:'',
    s.hasAgency?`Has agency: ${s.hasAgency}`:'',
    agencyList?`Agencies:\n${agencyList}`:'',
    s.crm?`PMS/CRM: ${s.crm}`:'',
    '',
    '── Team ──',
    s.hasTC?`Has TC: ${s.hasTC}`:'',
    s.tcName?`TC name: ${s.tcName}`:'',
    s.tcEmail?`TC email: ${s.tcEmail}`:'',
    s.tcPhone?`TC phone: ${s.tcPhone}`:'',
    s.tcTenure?`TC tenure: ${s.tcTenure}`:'',
    contactsList?`Key contacts:\n${contactsList}`:'',
    '',
    '── Goals ──',
    s.goals90Day?`90-day goals: ${s.goals90Day}`:'',
    s.biggestLeak?`Biggest leak: ${s.biggestLeak}`:'',
    s.targetAnnualRevenue?`Revenue target: $${Number(s.targetAnnualRevenue).toLocaleString()}`:'',
    s.heardFrom?`Heard from: ${s.heardFrom}`:'',
    s.notes?`\nNotes: ${s.notes}`:'',
  ].filter(x=>x!=='' || false).join('\n').replace(/\n{3,}/g,'\n\n').trim();

  const nc={
    id:'c_'+Date.now(),
    intakeId:s.id,
    name:s.doctorName,
    practice:s.practiceName,
    startDate:'',
    retainer:'',
    status:'active',
    color,
    notes:intakeNotes,
  };
  clients.push(nc);
  saveClients();
  openClient(nc.id);
}

function viewIntakeSubmission(idx){
  const subs=loadIntakeSubmissions();
  const s=subs[idx];
  if(!s)return;
  const linked=clients.find(c=>c.intakeId===s.id);

  // Parse JSON fields
  let kcHtml='';
  try{
    const kc=typeof s.keyContacts==='string'?JSON.parse(s.keyContacts):s.keyContacts;
    if(kc&&kc.filter(c=>c.name).length){
      kcHtml=kc.filter(c=>c.name).map(c=>`<div style="font-size:12px;padding:4px 0">${c.name} <span style="color:var(--text3)">(${c.role||'—'})</span> ${c.email?'· '+c.email:''} ${c.phone?'· '+c.phone:''}</div>`).join('');
    }
  }catch(e){}
  let agHtml='';
  try{
    const ag=typeof s.agencies==='string'?JSON.parse(s.agencies):s.agencies;
    if(ag&&ag.filter(a=>a.name).length){
      agHtml=ag.filter(a=>a.name).map(a=>`<div style="font-size:12px;padding:4px 0">${a.name} <span style="color:var(--text3)">${a.services?'('+a.services+')':''}</span> ${a.email?'· '+a.email:''}</div>`).join('');
    }
  }catch(e){}

  const row=(label,val)=>val?`<tr><td style="font-size:11px;font-weight:600;color:var(--text2);padding:7px 0;width:40%;vertical-align:top;text-transform:uppercase;letter-spacing:.04em">${label}</td><td style="font-size:13px;padding:7px 0">${val}</td></tr>`:'';

  const tableHtml=`<table style="width:100%;border-collapse:collapse">
    <tr><td colspan="2" style="padding:6px 0;font-size:10px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:var(--text3)">Contact</td></tr>
    ${row('Doctor',s.doctorName)}${row('Practice',s.practiceName)}${row('Email',s.email)}${row('Phone',s.phone)}
    ${row('City/State',[s.city,s.state].filter(Boolean).join(', '))}${row('Website',s.website)}
    ${kcHtml?`<tr><td style="font-size:11px;font-weight:600;color:var(--text2);padding:7px 0;vertical-align:top;text-transform:uppercase;letter-spacing:.04em">Key contacts</td><td style="padding:7px 0">${kcHtml}</td></tr>`:''}
    <tr><td colspan="2" style="padding:10px 0 6px;font-size:10px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:var(--text3);border-top:1px solid var(--border)">Pipeline</td></tr>
    ${row('Experience',s.implantExperience)}${row('Cases/month',s.casesPerMonth)}${row('Leads/month',s.monthlyLeads)}
    ${row('Avg case value',s.avgCaseValue?'$'+Number(s.avgCaseValue).toLocaleString():'')}
    ${row('Show rate',s.showRate?s.showRate+'%':'')}${row('Booking rate',s.bookingRate?s.bookingRate+'%':'')}${row('Acceptance',s.acceptanceRate?s.acceptanceRate+'%':'')}
    <tr><td colspan="2" style="padding:10px 0 6px;font-size:10px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:var(--text3);border-top:1px solid var(--border)">Marketing</td></tr>
    ${row('Lead sources',s.leadSources)}${row('Ad spend',s.monthlyAdSpend?'$'+Number(s.monthlyAdSpend).toLocaleString():'')}
    ${row('Agency',s.hasAgency)}${agHtml?`<tr><td style="font-size:11px;font-weight:600;color:var(--text2);padding:7px 0;vertical-align:top;text-transform:uppercase;letter-spacing:.04em">Agencies</td><td style="padding:7px 0">${agHtml}</td></tr>`:''}
    ${row('PMS/CRM',s.crm)}
    <tr><td colspan="2" style="padding:10px 0 6px;font-size:10px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:var(--text3);border-top:1px solid var(--border)">Team</td></tr>
    ${row('Has TC',s.hasTC)}${row('TC name',s.tcName)}${row('TC email',s.tcEmail)}${row('TC phone',s.tcPhone)}${row('TC tenure',s.tcTenure)}
    <tr><td colspan="2" style="padding:10px 0 6px;font-size:10px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:var(--text3);border-top:1px solid var(--border)">Goals</td></tr>
    ${row('90-day goals',s.goals90Day)}${row('Biggest leak',s.biggestLeak)}
    ${row('Revenue target',s.targetAnnualRevenue?'$'+Number(s.targetAnnualRevenue).toLocaleString():'')}
    ${row('Heard from',s.heardFrom)}${row('Notes',s.notes)}
  </table>`;

  document.getElementById('modal-root').innerHTML=`<div class="overlay" onclick="closeModalBg(event)"><div class="modal" style="width:620px">
    <div class="modal-title">${s.doctorName||'Submission'} — ${s.practiceName||''}</div>
    <div style="font-size:11px;color:var(--text3);margin-bottom:16px">Submitted ${s.submittedAt?new Date(s.submittedAt).toLocaleString():'—'}</div>
    <div style="max-height:60vh;overflow-y:auto">${tableHtml}</div>
    <div class="modal-actions" style="margin-top:16px">
      ${linked
        ?`<button class="btn" onclick="closeModal();openClient('${linked.id}')">Open client →</button>`
        :`<button class="btn btn-primary" onclick="closeModal();createClientFromIntake(${idx})">Create client from this</button>`}
      <button class="btn" onclick="closeModal()">Close</button>
    </div>
  </div></div>`;
}

// ══ CLIENT SCREEN ══
function renderClientsScreen(){
  document.getElementById('screen-home').style.display='flex';
  document.getElementById('screen-app').style.display='none';
  // Update topbar user info
  const uAvatar=document.getElementById('topbar-user-avatar');
  const uName=document.getElementById('topbar-user-name');
  if(uAvatar&&currentUser){uAvatar.textContent=(currentUser.username||'?')[0].toUpperCase();uAvatar.style.background=currentUser.color||'var(--text)';}
  if(uName&&currentUser){uName.textContent=currentUser.username||'';}

  const active=clients.filter(c=>(c.status||'active')==='active');
  const paused=clients.filter(c=>c.status==='paused');
  const cancelled=clients.filter(c=>c.status==='cancelled');
  const mrr=active.reduce((s,c)=>s+(parseFloat(c.retainer)||0),0);
  const churnRate=clients.length?Math.round(cancelled.length/clients.length*100):0;
  const allTasks=clients.flatMap(c=>loadClientTasks(c.id));
  const tasksPct=allTasks.length?Math.round(allTasks.filter(t=>t.status==='done').length/allTasks.length*100):0;

  // KPI row — its own wrapper, NOT inside the cards grid
  const kpiWrapper=document.getElementById('hub-kpi-wrapper');
  if(kpiWrapper) kpiWrapper.innerHTML=`
    <div class="hub-kpi-row">
      <div class="hub-kpi kpi-green">
        <div class="hub-kpi-val">$${mrr.toLocaleString()}</div>
        <div class="hub-kpi-lbl">Monthly MRR</div>
        <div class="hub-kpi-sub">${active.length} active client${active.length!==1?'s':''}</div>
      </div>
      <div class="hub-kpi kpi-blue">
        <div class="hub-kpi-val">${clients.length}</div>
        <div class="hub-kpi-lbl">Total clients</div>
        <div class="hub-kpi-sub">${active.length} active · ${paused.length} paused</div>
      </div>
      <div class="hub-kpi kpi-amber">
        <div class="hub-kpi-val">${paused.length}</div>
        <div class="hub-kpi-lbl">Paused</div>
        <div class="hub-kpi-sub">${paused.length?'$'+paused.reduce((s,c)=>s+(parseFloat(c.retainer)||0),0).toLocaleString()+'/mo':'—'}</div>
      </div>
      <div class="hub-kpi kpi-red">
        <div class="hub-kpi-val">${churnRate}%</div>
        <div class="hub-kpi-lbl">Churn rate</div>
        <div class="hub-kpi-sub">${cancelled.length} cancelled total</div>
      </div>
      <div class="hub-kpi kpi-purple">
        <div class="hub-kpi-val">${tasksPct}%</div>
        <div class="hub-kpi-lbl">Tasks complete</div>
        <div class="hub-kpi-sub">across all clients</div>
      </div>
    </div>`;

  // Client cards in a separate div
  let html='';
  const groups=[{key:'active',label:'Active clients'},{key:'paused',label:'Paused'},{key:'cancelled',label:'Cancelled'}];
  groups.forEach(g=>{
    const gc=clients.filter(c=>(c.status||'active')===g.key);
    if(!gc.length&&g.key!=='active') return;
    html+=`<div class="hub-section-title"><span>${g.label}</span><div class="hub-section-title-line"></div></div>`;
    html+=`<div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(260px,1fr));gap:14px;margin-bottom:24px">`;
    gc.forEach(c=>{
      const t=loadClientTasks(c.id);
      const done=t.filter(x=>x.status==='done').length;
      const pct=t.length?Math.round(done/t.length*100):0;
      const ini=initials(c.name);
      const sb=c.status==='paused'?`<span class="status-badge status-paused">Paused</span>`:c.status==='cancelled'?`<span class="status-badge status-cancelled">Cancelled</span>`:`<span class="status-badge status-active">Active</span>`;
      html+=`<div class="client-card" onclick="openClient('${c.id}')">
        <div class="client-card-actions">
          <button class="btn btn-ghost btn-sm" onclick="event.stopPropagation();clientFormModal('${c.id}')">Edit</button>
          <button class="btn btn-ghost btn-sm" style="color:var(--red-text)" onclick="event.stopPropagation();confirmDeleteClient('${c.id}')">Delete</button>
        </div>
        <div style="display:flex;align-items:flex-start;gap:10px;margin-bottom:10px">
          <div class="client-card-avatar" style="background:${c.color||'#2563eb'};margin-bottom:0">${ini}</div>
          <div style="flex:1;min-width:0">
            <div class="client-card-name">${c.name}</div>
            <div class="client-card-meta" style="margin-bottom:5px">${c.practice||''}</div>
            ${sb}
          </div>
        </div>
        <div class="client-card-stats" style="margin-bottom:6px">
          <div class="client-stat"><span class="client-stat-val">${c.retainer?'$'+Number(c.retainer).toLocaleString()+'/mo':'—'}</span></div>
          <div class="client-stat"><span class="client-stat-val">${done}/${t.length}</span> tasks done</div>
        </div>
        <div class="client-card-bar"><div class="client-card-bar-fill" style="width:${pct}%;background:${c.color||'#2563eb'}"></div></div>
      </div>`;
    });
    if(g.key==='active'){
      html+=`<div class="add-client-card" onclick="clientFormModal(null)">
        <div class="add-icon">+</div>
        <div style="font-size:13px;font-weight:500">Add new client</div>
        <div style="font-size:12px">Start with the default playbook template</div>
      </div>`;
    }
    html+=`</div>`;
  });
  if(!clients.length){
    html+=`<div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(260px,1fr));gap:14px">
      <div class="add-client-card" onclick="clientFormModal(null)"><div class="add-icon">+</div><div style="font-size:13px;font-weight:500">Add new client</div><div style="font-size:12px">Start with the default playbook template</div></div>
    </div>`;
  }
  const grid=document.getElementById('clients-grid');
  if(grid) grid.innerHTML=html;
}

// ══ MASTER CALENDAR ══
function renderMasterCal(){
  const now=new Date();
  if(!masterCalYear){masterCalYear=now.getFullYear();masterCalMonth=now.getMonth();}
  const today={y:now.getFullYear(),m:now.getMonth(),d:now.getDate()};
  const firstDay=new Date(masterCalYear,masterCalMonth,1);
  const daysInMonth=new Date(masterCalYear,masterCalMonth+1,0).getDate();
  const startDow=firstDay.getDay();

  // Gather all tasks across all clients
  const allTasks=[];
  clients.forEach(c=>{
    const ct=loadClientTasks(c.id);
    ct.forEach(t=>allTasks.push({t,c}));
  });

  // Apply owner filter
  function passesOwnerFilter(t){
    if(masterCalOwnerFilter==='all') return true;
    return (t.owner||'').toLowerCase()===(masterCalOwnerFilter||'').toLowerCase();
  }

  // Build cells
  const cells=[];
  for(let i=0;i<startDow;i++){cells.push({date:new Date(masterCalYear,masterCalMonth,-(startDow-1-i)),cur:false});}
  for(let i=1;i<=daysInMonth;i++){cells.push({date:new Date(masterCalYear,masterCalMonth,i),cur:true});}
  const rem=(7-cells.length%7)%7;
  for(let i=1;i<=rem;i++){cells.push({date:new Date(masterCalYear,masterCalMonth+1,i),cur:false});}

  // Owner filter chips
  const allOwners=[...new Set(allTasks.map(({t})=>t.owner).filter(Boolean))].sort();
  const myName=currentUser?.username||'';
  let ownerChips=`<div class="cal-filter-bar">
    <span style="font-size:11px;font-weight:600;color:var(--text3);text-transform:uppercase;letter-spacing:.05em">View:</span>
    <div class="cal-filter-chip ${masterCalOwnerFilter==='all'?'active':''}" onclick="setMasterCalOwner('all')">All tasks</div>
    ${myName?`<div class="cal-filter-chip ${masterCalOwnerFilter===myName?'active':''}" onclick="setMasterCalOwner('${myName}')">Mine (${myName})</div>`:''}
    ${allOwners.filter(o=>o.toLowerCase()!==myName.toLowerCase()).map(o=>`<div class="cal-filter-chip" style="${masterCalOwnerFilter===o?'background:var(--text);color:#fff;border-color:var(--text)':''}" onclick="setMasterCalOwner('${o}')">${o}</div>`).join('')}
  </div>`;

  // Legend: one entry per client
  let legendHtml='';
  clients.forEach(c=>{
    legendHtml+=`<div class="cal-legend-item"><div class="cal-legend-dot" style="background:${c.color||'#2563eb'}"></div>${c.name.split(' ')[0]}</div>`;
  });

  let html=`<div class="master-cal-topbar">
    <button class="cal-nav-btn" onclick="masterCalNav(-1)">&#8249;</button>
    <div class="master-cal-title">${MONTHS_FULL[masterCalMonth]} ${masterCalYear}</div>
    <button class="cal-nav-btn" onclick="masterCalNav(1)">&#8250;</button>
    <button class="btn btn-sm" onclick="masterCalToday()" style="margin-left:4px">Today</button>
    <div style="flex:1"></div>
    <div class="cal-legend">${legendHtml}</div>
  </div>
  ${ownerChips}
  <div class="cal-grid" style="margin-top:12px">`;

  DOWS.forEach(d=>{html+=`<div class="cal-dow">${d}</div>`;});

  cells.forEach(cell=>{
    const d=cell.date;
    const dow=d.getDay();
    const dayNum=d.getDate();
    const isToday=cell.cur&&d.getFullYear()===today.y&&d.getMonth()===today.m&&d.getDate()===today.d;
    const events=[];
    if(cell.cur){
      allTasks.forEach(({t,c})=>{
        if(!passesOwnerFilter(t)) return;
        // Concrete due date
        const td=getTaskDate(t);
        if(td&&td.getFullYear()===masterCalYear&&td.getMonth()===masterCalMonth&&td.getDate()===dayNum){
          events.push({t,c,type:'oneoff'});return;
        }
        // Weekly recurring
        const tdow=getTaskDow(t);
        if(tdow!==null&&tdow===dow){events.push({t,c,type:'weekly'});return;}
        // Monthly recurring
        const tmd=getTaskMonthDay(t,daysInMonth);
        if(tmd!==null&&tmd===dayNum){events.push({t,c,type:'monthly'});return;}
      });
    }
    const MAX=3;
    const shown=events.slice(0,MAX),extra=events.length-MAX;
    html+=`<div class="cal-cell ${!cell.cur?'other-month':''} ${isToday?'today-cell':''}">
      <div class="cal-date-num">${dayNum}</div>`;
    shown.forEach(ev=>{
      const short=ev.t.name.length>28?ev.t.name.slice(0,26)+'…':ev.t.name;
      const cls=ev.type==='oneoff'?'ev-oneoff':ev.type==='weekly'?'ev-weekly':'ev-monthly';
      html+=`<div class="cal-ev ${cls} ${ev.t.status==='done'?'ev-done':''}"
        title="${ev.c.name}: ${ev.t.name}" onclick="openClient('${ev.c.id}')">
        <div class="cal-ev-dot" style="background:${ev.c.color||'#2563eb'}"></div>${short}
      </div>`;
    });
    if(extra>0) html+=`<div class="cal-more" onclick="masterCalDayDetail(${d.getTime()})">+${extra} more</div>`;
    html+=`</div>`;
  });
  html+=`</div>`;

  // summary strip
  html+=`<div style="margin-top:20px;display:grid;grid-template-columns:repeat(auto-fill,minmax(220px,1fr));gap:12px">`;
  clients.forEach(c=>{
    const ct=loadClientTasks(c.id);
    const total=ct.length,done=ct.filter(t=>t.status==='done').length;
    const blocked=ct.filter(t=>t.status==='blocked').length;
    const ini=initials(c.name);
    html+=`<div style="background:var(--surface);border:1px solid var(--border);border-radius:var(--rl);padding:14px;cursor:pointer;border-top:3px solid ${c.color||'#2563eb'}" onclick="openClient('${c.id}')">
      <div style="display:flex;align-items:center;gap:8px;margin-bottom:10px">
        <div style="width:30px;height:30px;border-radius:7px;background:${c.color||'#2563eb'};display:flex;align-items:center;justify-content:center;font-size:11px;font-weight:700;color:#fff;flex-shrink:0">${ini}</div>
        <div><div style="font-size:13px;font-weight:600">${c.name}</div><div style="font-size:11px;color:var(--text3)">${c.practice||''}</div></div>
      </div>
      <div style="display:flex;gap:14px">
        <div style="font-size:12px;color:var(--text2)"><span style="font-weight:700;color:var(--text)">${done}/${total}</span> done</div>
        ${blocked?`<div style="font-size:12px;color:var(--red-text)"><span style="font-weight:700">${blocked}</span> blocked</div>`:''}
      </div>
      <div style="height:3px;background:var(--border);border-radius:2px;overflow:hidden;margin-top:8px">
        <div style="height:100%;background:${c.color||'#2563eb'};width:${total?Math.round(done/total*100):0}%;border-radius:2px"></div>
      </div>
    </div>`;
  });
  if(!clients.length) html+=`<div class="empty-state">No clients yet. Add a client to get started.</div>`;
  html+=`</div>`;

  document.getElementById('master-cal-content').innerHTML=html;
}

function setMasterCalOwner(owner){masterCalOwnerFilter=owner;renderMasterCal();}
function masterCalNav(dir){
  masterCalMonth+=dir;
  if(masterCalMonth>11){masterCalMonth=0;masterCalYear++;}
  if(masterCalMonth<0){masterCalMonth=11;masterCalYear--;}
  renderMasterCal();
}
function masterCalToday(){const n=new Date();masterCalYear=n.getFullYear();masterCalMonth=n.getMonth();renderMasterCal();}

function masterCalDayDetail(ts){
  const d=new Date(ts);
  const dow=d.getDay();
  const dayNum=d.getDate();
  const daysInMonth=new Date(d.getFullYear(),d.getMonth()+1,0).getDate();
  const dateStr=d.toLocaleDateString('en-US',{weekday:'long',month:'long',day:'numeric'});
  let all=[];
  clients.forEach(c=>{
    const ct=loadClientTasks(c.id);
    ct.filter(t=>t.phase==='weekly_ops'&&DOW_MAP[t.day]===dow).forEach(t=>all.push({t,c}));
    ct.filter(t=>{
      if(t.phase!=='monthly')return false;
      if(t.day==='1st'&&dayNum===1)return true;
      if(t.day==='14th'&&dayNum===14)return true;
      if(t.day==='26th'&&dayNum===26)return true;
      if(t.day==='End'&&dayNum===daysInMonth)return true;
      return false;
    }).forEach(t=>all.push({t,c}));
  });
  let html=`<div class="overlay" onclick="closeModalBg(event)"><div class="modal">
    <div class="modal-title">${dateStr}</div>`;
  if(!all.length){html+=`<div style="font-size:13px;color:var(--text3)">No recurring tasks this day.</div>`;}
  all.forEach(({t,c})=>{
    html+=`<div style="padding:10px 12px;border:1px solid var(--border);border-radius:var(--r);margin-bottom:8px;cursor:pointer;border-left:3px solid ${c.color||'#2563eb'}" onclick="closeModal();openClient('${c.id}')">
      <div style="font-size:11px;font-weight:600;color:var(--text3);margin-bottom:3px">${c.name}</div>
      <div style="font-size:13px;font-weight:500;margin-bottom:4px">${t.name}</div>
      <div style="display:flex;gap:8px">${statusBadge(t.status)}<span class="owner-chip">${t.owner}</span></div>
    </div>`;
  });
  html+=`<div class="modal-actions"><button class="btn btn-primary" onclick="closeModal()">Close</button></div></div></div>`;
  document.getElementById('modal-root').innerHTML=html;
}

// ══ MASTER TASK LIST ══
function renderMasterTasks(){
  const allItems=[];
  clients.forEach(c=>{
    const ct=loadClientTasks(c.id);
    ct.forEach(t=>allItems.push({t,c}));
  });

  const total=allItems.length;
  const done=allItems.filter(x=>x.t.status==='done').length;
  const inprog=allItems.filter(x=>x.t.status==='inprog').length;
  const blocked=allItems.filter(x=>x.t.status==='blocked').length;
  const todo=allItems.filter(x=>x.t.status==='todo').length;

  // filter
  let filtered=allItems;
  if(masterTaskFilter!=='all') filtered=filtered.filter(x=>x.t.status===masterTaskFilter);
  if(masterTaskSearch){
    const q=masterTaskSearch.toLowerCase();
    filtered=filtered.filter(x=>x.t.name.toLowerCase().includes(q)||x.c.name.toLowerCase().includes(q)||x.t.owner.toLowerCase().includes(q));
  }

  let html=`<div class="master-stats">
    <div class="mstat"><div class="mstat-val">${total}</div><div class="mstat-lbl">Total tasks</div></div>
    <div class="mstat"><div class="mstat-val">${todo}</div><div class="mstat-lbl">To do</div></div>
    <div class="mstat mstat-amber"><div class="mstat-val">${inprog}</div><div class="mstat-lbl">In progress</div></div>
    <div class="mstat mstat-green"><div class="mstat-val">${done}</div><div class="mstat-lbl">Completed</div></div>
    <div class="mstat mstat-red"><div class="mstat-val">${blocked}</div><div class="mstat-lbl">Blocked</div></div>
  </div>
  <div class="master-filters">
    <div class="master-filter-group">
      <button class="master-filter-btn ${masterTaskFilter==='all'?'active':''}" onclick="setMasterFilter('all')">All</button>
      <button class="master-filter-btn ${masterTaskFilter==='todo'?'active':''}" onclick="setMasterFilter('todo')">To do</button>
      <button class="master-filter-btn ${masterTaskFilter==='inprog'?'active':''}" onclick="setMasterFilter('inprog')">In progress</button>
      <button class="master-filter-btn ${masterTaskFilter==='blocked'?'active':''}" onclick="setMasterFilter('blocked')">Blocked</button>
      <button class="master-filter-btn ${masterTaskFilter==='done'?'active':''}" onclick="setMasterFilter('done')">Done</button>
    </div>
    <input class="master-search" id="master-search-input" placeholder="Search tasks, clients, owners..." value="${masterTaskSearch}" oninput="setMasterSearch(this.value)">
  </div>`;

  if(!clients.length){
    html+=`<div class="empty-state">No clients yet. Add a client to see tasks here.</div>`;
  } else if(!filtered.length){
    html+=`<div class="empty-state">No tasks match your current filter.</div>`;
  } else {
    // group by client
    clients.forEach(c=>{
      const clientItems=filtered.filter(x=>x.c.id===c.id);
      if(!clientItems.length) return;
      const cdone=clientItems.filter(x=>x.t.status==='done').length;
      const cblocked=clientItems.filter(x=>x.t.status==='blocked').length;
      const isOpen=!masterSectionCollapsed[c.id];
      const ini=initials(c.name);
      html+=`<div class="master-section">
        <div class="master-section-header" onclick="toggleMasterSection('${c.id}')">
          <div class="master-section-avatar" style="background:${c.color||'#2563eb'}">${ini}</div>
          <div class="master-section-name">${c.name}</div>
          <div class="master-section-meta">${c.practice||''} &nbsp;·&nbsp; ${cdone}/${clientItems.length} done ${cblocked?`· <span style="color:var(--red-text)">${cblocked} blocked</span>`:''}</div>
          <button class="go-client-btn" onclick="event.stopPropagation();openClient('${c.id}')">Open →</button>
          <div class="master-section-chev">${isOpen?'▾':'▸'}</div>
        </div>`;
      if(isOpen){
        html+=`<table class="master-table"><thead><tr>
          <th style="width:40%">Task</th>
          <th style="width:13%">Phase</th>
          <th style="width:12%">Status</th>
          <th style="width:10%">Owner</th>
          <th style="width:8%">Timing</th>
          <th style="width:8%">Priority</th>
          <th style="width:9%"></th>
        </tr></thead><tbody>`;
        clientItems.forEach(({t})=>{
          const ph=PHASES.find(p=>p.id===t.phase);
          html+=`<tr>
            <td><div class="task-name-cell">
              <div class="check-box ${t.status==='done'?'done':''}" onclick="masterToggleDone('${c.id}',${t.id})"></div>
              <span class="task-label ${t.status==='done'?'striked':''}">${t.name}</span>
            </div></td>
            <td><span class="phase-chip" style="background:${ph?.color||'#ccc'}22;color:${ph?.color||'#888'}">${ph?.name?.split('–')[0].trim()||''}</span></td>
            <td>${statusBadge(t.status)}</td>
            <td style="font-size:11px;color:var(--text2)">${t.owner}</td>
            <td>${dueBadge(t)}</td>
            <td>${priBadge(t.priority)}</td>
            <td><button class="go-client-btn" onclick="openClient('${c.id}')">Open client</button></td>
          </tr>`;
        });
        html+=`</tbody></table>`;
      }
      html+=`</div>`;
    });
  }

  document.getElementById('master-tasks-content').innerHTML=html;
}

function setMasterFilter(f){masterTaskFilter=f;renderMasterTasks();}
function setMasterSearch(v){masterTaskSearch=v;renderMasterTasks();}
function toggleMasterSection(id){masterSectionCollapsed[id]=!masterSectionCollapsed[id];renderMasterTasks();}

function masterToggleDone(clientId,taskId){
  const ct=loadClientTasks(clientId);
  const t=ct.find(t=>t.id===taskId);
  if(!t)return;
  t.status=t.status==='done'?'todo':'done';
  saveClientTasks(clientId,ct);
  // if viewing this client in app, update live state too
  if(activeClientId===clientId){tasks=ct;}
  renderMasterTasks();
}

// ══ OPEN CLIENT ══
function openClient(id){
  activeClientId=id;
  const c=getClient(id);
  loadClientIntoState(id);
  currentView='board';collapsed={};
  const now=new Date();clientCalYear=now.getFullYear();clientCalMonth=now.getMonth();clientCalRecurTab='weekly';
  document.getElementById('sb-client-name').textContent=c.name;
  document.getElementById('sb-client-sub').textContent=c.practice||'Dental Practice';
  document.getElementById('screen-home').style.display='none';
  document.getElementById('screen-app').style.display='flex';
  renderMain();
}

function goHome(){
  activeClientId=null;
  document.getElementById('screen-app').style.display='none';
  document.getElementById('screen-home').style.display='flex';
  renderClientsScreen();
  if(homeTab==='mastercal') renderMasterCal();
  if(homeTab==='mastertasks') renderMasterTasks();
}

// ══ CLIENT FORM ══
function clientFormModal(clientId){
  const c=clientId?getClient(clientId):null;
  const isEdit=!!c;
  const sel=c?.color||AVATAR_COLORS[0];
  const sw=AVATAR_COLORS.map(col=>`<div class="swatch ${col===sel?'selected':''}" style="background:${col}" data-color="${col}" onclick="selectSwatch(this)"></div>`).join('');
  document.getElementById('modal-root').innerHTML=`<div class="overlay" onclick="closeModalBg(event)">
    <div class="modal">
      <div class="modal-title">${isEdit?'Edit client':'Add new client'}</div>
      <div class="field-label">Client / Doctor name *</div>
      <input class="field-input" id="cf-name" placeholder="Dr. Morgan" value="${c?.name||''}">
      <div class="field-label">Practice name</div>
      <input class="field-input" id="cf-practice" placeholder="Grandridge Dental" value="${c?.practice||''}">
      <div class="form-grid">
        <div><div class="field-label">Start date</div><input class="field-input" id="cf-start" type="date" value="${c?.startDate||''}"></div>
        <div><div class="field-label">Monthly retainer ($)</div><input class="field-input" id="cf-retainer" type="number" placeholder="5000" value="${c?.retainer||''}"></div>
      </div>
      <div class="field-label">Client status</div>
      <select class="field-select" id="cf-status">
        <option value="active" ${(c?.status||'active')==='active'?'selected':''}>Active</option>
        <option value="paused" ${c?.status==='paused'?'selected':''}>Paused</option>
        <option value="cancelled" ${c?.status==='cancelled'?'selected':''}>Cancelled</option>
      </select>
      <div class="field-label">Notes / context</div>
      <textarea class="field-textarea" id="cf-notes" placeholder="Key details about this client...">${c?.notes||''}</textarea>
      <div class="field-label">Avatar color</div>
      <div class="color-swatches">${sw}</div>
      <input type="hidden" id="cf-color" value="${sel}">
      ${isEdit?`<div style="margin-bottom:13px"><label style="display:flex;align-items:center;gap:8px;font-size:13px;cursor:pointer"><input type="checkbox" id="cf-reset"> Reset tasks to default template</label></div>`:''}
      <div class="modal-actions">
        ${isEdit?`<button class="btn btn-danger" onclick="confirmDeleteClient('${clientId}')">Delete client</button>`:''}
        <button class="btn" onclick="closeModal()">Cancel</button>
        <button class="btn btn-primary" onclick="saveClientForm('${clientId||''}',${isEdit})">${isEdit?'Save changes':'Create client'}</button>
      </div>
    </div>
  </div>`;
}
function selectSwatch(el){document.querySelectorAll('.swatch').forEach(s=>s.classList.remove('selected'));el.classList.add('selected');document.getElementById('cf-color').value=el.dataset.color;}
function saveClientForm(clientId,isEdit){
  const name=document.getElementById('cf-name')?.value?.trim();
  if(!name){alert('Client name is required.');return;}
  const data={name,practice:document.getElementById('cf-practice')?.value?.trim()||'',startDate:document.getElementById('cf-start')?.value||'',retainer:document.getElementById('cf-retainer')?.value||'',status:document.getElementById('cf-status')?.value||'active',notes:document.getElementById('cf-notes')?.value||'',color:document.getElementById('cf-color')?.value||AVATAR_COLORS[0]};
  if(isEdit){
    const c=getClient(clientId);Object.assign(c,data);
    if(document.getElementById('cf-reset')?.checked){saveClientTasks(clientId,DEFAULT_TASKS());saveClientKPIs(clientId,DEFAULT_KPIS());if(activeClientId===clientId)loadClientIntoState(clientId);}
    saveClients();closeModal();
    if(activeClientId===clientId){document.getElementById('sb-client-name').textContent=c.name;document.getElementById('sb-client-sub').textContent=c.practice||'Dental Practice';}
    else renderClientsScreen();
  } else {
    const nc={id:'c_'+Date.now(),...data};clients.push(nc);saveClients();closeModal();openClient(nc.id);
  }
}
function openEditClient(){clientFormModal(activeClientId);}
function confirmDeleteClient(clientId){
  const c=getClient(clientId);if(!c)return;
  if(!confirm(`Delete "${c.name}" and all their data? This cannot be undone.`))return;
  deleteClientData(clientId);clients=clients.filter(x=>x.id!==clientId);saveClients();closeModal();goHome();
}

// ══ HELPERS ══
function statusBadge(s){
  const m={todo:'badge-todo',inprog:'badge-inprog',done:'badge-done',blocked:'badge-blocked'};
  const l={todo:'To do',inprog:'In progress',done:'Done',blocked:'Blocked'};
  return`<span class="badge ${m[s]||'badge-todo'}">${l[s]||s}</span>`;
}
function priBadge(p){
  if(p==='High')return`<span class="pri-high">High</span>`;
  if(p==='Med')return`<span class="pri-med">Med</span>`;
  return`<span class="pri-low">Low</span>`;
}

// ══ CLIENT VIEWS ══
function renderPhaseNav(){
  document.getElementById('phase-nav').innerHTML=PHASES.map(p=>
    `<div class="nav-item" onclick="jumpPhase('${p.id}')">
      <div class="nav-dot" style="background:${p.color}"></div>
      <span style="font-size:12px;line-height:1.3">${p.name}</span>
    </div>`
  ).join('');
}
function switchView(v){
  currentView=v;
  ['board','calendar','kpis','sprints'].forEach(x=>document.getElementById('nav-'+x)?.classList.remove('active'));
  document.getElementById('nav-'+v)?.classList.add('active');
  renderMain();
}
function jumpPhase(id){
  if(currentView!=='board'){switchView('board');setTimeout(()=>document.getElementById('phase-'+id)?.scrollIntoView({behavior:'smooth'}),80);}
  else document.getElementById('phase-'+id)?.scrollIntoView({behavior:'smooth'});
}
function renderMain(){
  const c=document.getElementById('main-content');
  if(currentView==='board')renderBoard(c);
  else if(currentView==='calendar')renderClientCalendar(c);
  else if(currentView==='kpis')renderKPIs(c);
  else if(currentView==='sprints')renderSprints(c);
  renderPhaseNav();
}

function renderBoard(c){
  document.getElementById('view-title').textContent='Onboarding Playbook';
  const total=tasks.length,done=tasks.filter(t=>t.status==='done').length;
  const inprog=tasks.filter(t=>t.status==='inprog').length,blocked=tasks.filter(t=>t.status==='blocked').length;
  const pct=total?Math.round(done/total*100):0;
  let html=`<div class="stats-row">
    <div class="stat-card"><div class="stat-val">${total}</div><div class="stat-lbl">Total tasks</div></div>
    <div class="stat-card"><div class="stat-val">${done}</div><div class="stat-lbl">Completed</div></div>
    <div class="stat-card"><div class="stat-val">${inprog}</div><div class="stat-lbl">In progress</div></div>
    <div class="stat-card stat-red"><div class="stat-val">${blocked}</div><div class="stat-lbl">Blocked</div></div>
  </div>
  <div class="progress-wrap">
    <div class="progress-meta"><span>Overall progress</span><span>${pct}%</span></div>
    <div class="progress-bar"><div class="progress-fill" style="width:${pct}%"></div></div>
  </div>`;
  PHASES.forEach(p=>{
    const pt=tasks.filter(t=>t.phase===p.id),pd=pt.filter(t=>t.status==='done').length;
    const isOpen=!collapsed[p.id];
    html+=`<div class="phase-block" id="phase-${p.id}">
      <div class="phase-header" onclick="togglePhase('${p.id}')">
        <div class="phase-stripe" style="background:${p.color}"></div>
        <div class="phase-name">${p.name}</div>
        <div class="phase-count">${pd}/${pt.length}</div>
        <div class="phase-chevron">${isOpen?'▾':'▸'}</div>
      </div>`;
    if(isOpen){
      html+=`<table class="task-table"><thead><tr>
        <th style="width:44%">Task</th><th style="width:13%">Status</th>
        <th style="width:14%">Owner</th><th style="width:11%">Timing</th>
        <th style="width:9%">Priority</th><th style="width:9%"></th>
      </tr></thead><tbody>`;
      pt.forEach(t=>{
        const nh=t.notes?`<div class="notes-hint">${t.notes}</div>`:'';
        html+=`<tr>
          <td><div class="task-name-cell-lg">
            <div class="check-box-lg ${t.status==='done'?'done':''}" onclick="toggleDone(${t.id})"></div>
            <div><div class="task-label-lg ${t.status==='done'?'striked':''}" onclick="openEdit(${t.id})">${t.name}</div>${nh}</div>
          </div></td>
          <td>${statusBadge(t.status)}</td>
          <td><span class="owner-chip">${t.owner}</span></td>
          <td>${dueBadge(t)}</td>
          <td>${priBadge(t.priority)}</td>
          <td><button class="btn btn-sm" onclick="openEdit(${t.id})">Edit</button></td>
        </tr>`;
      });
      html+=`<tr class="add-row"><td colspan="6"><input placeholder="+ Add task to ${p.name}..." onkeydown="quickAdd(event,'${p.id}',this)"></td></tr></tbody></table>`;
    }
    html+=`</div>`;
  });
  c.innerHTML=html;
}

function renderClientCalendar(c){
  document.getElementById('view-title').textContent='Calendar';
  const now=new Date(),today={y:now.getFullYear(),m:now.getMonth(),d:now.getDate()};
  const firstDay=new Date(clientCalYear,clientCalMonth,1);
  const daysInMonth=new Date(clientCalYear,clientCalMonth+1,0).getDate();
  const startDow=firstDay.getDay();
  const weeklyTasks=tasks.filter(t=>t.phase==='weekly_ops');
  const monthlyTasks=tasks.filter(t=>t.phase==='monthly');
  const oneoffTasks=tasks.filter(t=>t.dueDate&&t.phase!=='weekly_ops'&&t.phase!=='monthly');
  const cells=[];
  for(let i=0;i<startDow;i++){cells.push({date:new Date(clientCalYear,clientCalMonth,-(startDow-1-i)),cur:false});}
  for(let i=1;i<=daysInMonth;i++){cells.push({date:new Date(clientCalYear,clientCalMonth,i),cur:true});}
  const rem=(7-cells.length%7)%7;
  for(let i=1;i<=rem;i++){cells.push({date:new Date(clientCalYear,clientCalMonth+1,i),cur:false});}

  let html=`<div class="cal-topbar">
    <button class="cal-nav-btn" onclick="clientCalNav(-1)">&#8249;</button>
    <div class="cal-month-label">${MONTHS_FULL[clientCalMonth]} ${clientCalYear}</div>
    <button class="cal-nav-btn" onclick="clientCalNav(1)">&#8250;</button>
    <button class="btn btn-sm" onclick="clientCalToday()" style="margin-left:4px">Today</button>
    <div style="flex:1"></div>
    <div style="display:flex;gap:12px;font-size:11px;color:var(--text2);align-items:center">
      <span style="display:inline-flex;align-items:center;gap:4px"><span style="width:10px;height:10px;border-radius:2px;background:#bfdbfe;display:inline-block"></span>Weekly recurring</span>
      <span style="display:inline-flex;align-items:center;gap:4px"><span style="width:10px;height:10px;border-radius:2px;background:#99f6e4;display:inline-block"></span>Monthly milestone</span>
    </div>
  </div>
  <div class="cal-grid-c">`;
  DOWS.forEach(d=>{html+=`<div class="cal-dow-c">${d}</div>`;});
  cells.forEach(cell=>{
    const d=cell.date;const dow=d.getDay();
    const isToday=cell.cur&&d.getFullYear()===today.y&&d.getMonth()===today.m&&d.getDate()===today.d;
    const dayNum=d.getDate();
    let events=[];
    if(cell.cur){
      oneoffTasks.forEach(t=>{const td=getTaskDate(t);if(td&&td.getFullYear()===clientCalYear&&td.getMonth()===clientCalMonth&&td.getDate()===dayNum)events.push({t,type:'oneoff'});});
      weeklyTasks.forEach(t=>{if(getTaskDow(t)===dow)events.push({t,type:'weekly'});});
      monthlyTasks.forEach(t=>{if(getTaskMonthDay(t,daysInMonth)===dayNum)events.push({t,type:'monthly'});});
    }
    const shown=events.slice(0,3),extra=events.length-3;
    html+=`<div class="cal-cell-c ${!cell.cur?'other-month':''} ${isToday?'today':''}">
      <div class="cal-date-c">${d.getDate()}</div>`;
    shown.forEach(ev=>{
      const short=ev.t.name.length>30?ev.t.name.slice(0,28)+'…':ev.t.name;
      const ecls=ev.type==='oneoff'?'oneoff':ev.type;
      html+=`<div class="cal-event-c ${ecls} ${ev.t.status==='done'?'done-ev':''}" title="${ev.t.name}" onclick="openEdit(${ev.t.id})">${short}</div>`;
    });
    if(extra>0)html+=`<div class="cal-more-c">+${extra} more</div>`;
    html+=`</div>`;
  });
  html+=`</div>
  <div class="recur-section">
    <div class="recur-tabs">
      <div class="recur-tab ${clientCalRecurTab==='weekly'?'active':''}" onclick="setClientRecurTab('weekly')">Weekly operations</div>
      <div class="recur-tab ${clientCalRecurTab==='monthly'?'active':''}" onclick="setClientRecurTab('monthly')">Monthly milestones</div>
    </div>
    <div class="recur-list">`;
  const recurTasks=clientCalRecurTab==='weekly'?tasks.filter(t=>t.phase==='weekly_ops'):tasks.filter(t=>t.phase==='monthly');
  if(clientCalRecurTab==='weekly'){
    ['Monday','Tuesday','Wednesday','Thursday','Friday'].forEach(day=>{
      recurTasks.filter(t=>t.day===day).forEach(t=>{
        html+=`<div class="recur-card" style="border-left-color:#d97706" onclick="openEdit(${t.id})">
          <div style="font-size:10px;font-weight:600;text-transform:uppercase;letter-spacing:.05em;color:#b45309;margin-bottom:4px">${t.day}</div>
          <div class="recur-card-name ${t.status==='done'?'striked':''}">${t.name}</div>
          <div class="recur-card-meta">${statusBadge(t.status)}<span class="owner-chip">${t.owner}</span>${priBadge(t.priority)}</div>
        </div>`;
      });
    });
  } else {
    const dayLabels={'1st':'1st of month','14th':'14th of month','26th':'26th of month','End':'End of month'};
    ['1st','14th','26th','End'].forEach(key=>{
      recurTasks.filter(t=>t.day===key).forEach(t=>{
        html+=`<div class="recur-card" style="border-left-color:#0d9488" onclick="openEdit(${t.id})">
          <div style="font-size:10px;font-weight:600;text-transform:uppercase;letter-spacing:.05em;color:#0f766e;margin-bottom:4px">${dayLabels[key]||key}</div>
          <div class="recur-card-name ${t.status==='done'?'striked':''}">${t.name}</div>
          <div class="recur-card-meta">${statusBadge(t.status)}<span class="owner-chip">${t.owner}</span>${priBadge(t.priority)}</div>
        </div>`;
      });
    });
  }
  html+=`</div></div>`;
  c.innerHTML=html;
}
function clientCalNav(dir){clientCalMonth+=dir;if(clientCalMonth>11){clientCalMonth=0;clientCalYear++;}if(clientCalMonth<0){clientCalMonth=11;clientCalYear--;}renderMain();}
function clientCalToday(){const n=new Date();clientCalYear=n.getFullYear();clientCalMonth=n.getMonth();renderMain();}
function setClientRecurTab(t){clientCalRecurTab=t;renderMain();}

function renderKPIs(c){
  document.getElementById('view-title').textContent='KPI Tracker';
  let html=`<div class="kpi-section">
    <div class="kpi-section-header">Performance KPIs — Before vs. Current vs. Target</div>
    <table class="kpi-table"><thead><tr>
      <th style="width:30%">KPI</th><th style="width:20%">Before start</th>
      <th style="width:20%">Current</th><th style="width:20%">Target</th><th style="width:10%">Status</th>
    </tr></thead><tbody>`;
  kpiData.forEach((k,i)=>{
    const cur=parseFloat(k.current),tgt=parseFloat(k.target);
    let st=`<span class="status-na">—</span>`;
    if(k.current&&k.target)st=cur>=tgt?`<span class="status-on">On track</span>`:`<span class="status-off">Below</span>`;
    html+=`<tr>
      <td style="font-weight:500">${k.name}</td>
      <td><input value="${k.before}" placeholder="—" oninput="updateKPI(${i},'before',this.value)"></td>
      <td><input value="${k.current}" placeholder="—" oninput="updateKPI(${i},'current',this.value)"></td>
      <td><input value="${k.target}" placeholder="—" oninput="updateKPI(${i},'target',this.value)"></td>
      <td>${st}</td>
    </tr>`;
  });
  html+=`</tbody></table></div>
  <div class="calc-box">
    <div class="calc-title">Revenue opportunity calculator</div>
    <div class="calc-grid">
      <div><div class="field-label">Monthly leads</div><input class="field-input" id="cl" type="number" placeholder="180" oninput="calc()"></div>
      <div><div class="field-label">Booking rate (%)</div><input class="field-input" id="cb" type="number" placeholder="25" oninput="calc()"></div>
      <div><div class="field-label">Show rate (%)</div><input class="field-input" id="cs" type="number" placeholder="60" oninput="calc()"></div>
      <div><div class="field-label">Case acceptance (%)</div><input class="field-input" id="ca" type="number" placeholder="25" oninput="calc()"></div>
      <div><div class="field-label">Avg case value ($)</div><input class="field-input" id="cv" type="number" placeholder="25000" oninput="calc()"></div>
      <div><div class="field-label">Monthly production</div><div class="calc-result" id="cr">—</div></div>
    </div>
  </div>`;
  c.innerHTML=html;
}
function updateKPI(i,field,val){kpiData[i][field]=val;persistKPIs();const rows=document.querySelectorAll('.kpi-table tbody tr');if(rows[i]){const cur=parseFloat(kpiData[i].current),tgt=parseFloat(kpiData[i].target);const sc=rows[i].querySelector('td:last-child');if(sc){if(kpiData[i].current&&kpiData[i].target)sc.innerHTML=cur>=tgt?`<span class="status-on">On track</span>`:`<span class="status-off">Below</span>`;else sc.innerHTML=`<span class="status-na">—</span>`;}}}
function calc(){const l=parseFloat(document.getElementById('cl')?.value)||0,b=parseFloat(document.getElementById('cb')?.value)||0,s=parseFloat(document.getElementById('cs')?.value)||0,a=parseFloat(document.getElementById('ca')?.value)||0,v=parseFloat(document.getElementById('cv')?.value)||0,el=document.getElementById('cr');if(el)el.textContent=l&&b&&s&&a&&v?'$'+Math.round(l*(b/100)*(s/100)*(a/100)*v).toLocaleString():'—';}

function renderSprints(c){
  document.getElementById('view-title').textContent='30-Day Sprint Planner';
  const order=[{label:'Case Acceptance',color:'#dc2626'},{label:'Show Rate',color:'#d4537e'},{label:'Booking Rate',color:'#d97706'},{label:'Lead Flow',color:'#2563eb'},{label:'Case Value',color:'#16a34a'},{label:'Capacity',color:'#0d9488'}];
  const weeks=[{w:'Week 1',desc:'Implement core systems'},{w:'Week 2',desc:'Train team + reinforce execution'},{w:'Week 3',desc:'Optimize and adjust'},{w:'Week 4',desc:'Measure results + stabilize'}];
  let html=`<div style="margin-bottom:14px;font-size:13px;color:var(--text2)">Fix constraints in order: lowest funnel first. Downstream fixes = fastest revenue impact.</div>
  <div class="sprint-grid">
    <div style="background:var(--surface);border:1px solid var(--border);border-radius:var(--rl);padding:16px">
      <div style="font-size:13px;font-weight:600;margin-bottom:12px">Sprint priority order</div>`;
  order.forEach((o,i)=>{html+=`<div class="sprint-order-item"><div class="sprint-num" style="background:${o.color}">${i+1}</div><div style="font-size:13px">${o.label}</div>${i===0?'<div style="font-size:11px;color:var(--text3);margin-left:auto">Fix first</div>':''}</div>`;});
  html+=`</div>
    <div style="background:var(--surface);border:1px solid var(--border);border-radius:var(--rl);padding:16px">
      <div style="font-size:13px;font-weight:600;margin-bottom:12px">Current sprint</div>
      <div class="field-label">Sprint focus KPI</div>
      <select class="field-select" id="sprint-kpi">${order.map(o=>`<option>${o.label}</option>`).join('')}</select>
      <div class="field-label">Breakdown issue 1</div><input class="field-input" id="si1" placeholder="e.g. Low confirmations">
      <div class="field-label">Breakdown issue 2</div><input class="field-input" id="si2" placeholder="e.g. Last-minute cancellations">
      <div class="field-label">Revenue opportunity estimate</div><input class="field-input" id="srev" placeholder="e.g. +$40,000/month">
      <button class="btn btn-primary" style="width:100%" onclick="genSlack()">Generate Slack post</button>
    </div>
  </div>
  <div style="background:var(--surface);border:1px solid var(--border);border-radius:var(--rl);padding:16px;margin-bottom:20px">
    <div style="font-size:13px;font-weight:600;margin-bottom:14px">4-week sprint roadmap</div>
    <div class="week-cards">`;
  weeks.forEach(w=>{html+=`<div class="week-card"><div class="week-card-head">${w.w}</div><div class="week-card-body"><div class="week-card-desc">${w.desc}</div><textarea placeholder="Add specific actions..."></textarea></div></div>`;});
  html+=`</div></div>`;c.innerHTML=html;
}
function genSlack(){
  const kpi=document.getElementById('sprint-kpi')?.value||'',i1=document.getElementById('si1')?.value||'[Issue 1]',i2=document.getElementById('si2')?.value||'[Issue 2]',rev=document.getElementById('srev')?.value||'[TBD]',cl=getActiveClient();
  const post=`🔔 NEW 30-DAY GROWTH SPRINT: ${kpi.toUpperCase()} OPTIMIZATION\n${cl?.name?`Client: ${cl.name}${cl.practice?' – '+cl.practice:''}\n`:''}\nWe're shifting focus to improving ${kpi}.\n\nPrimary breakdowns identified:\n• ${i1}\n• ${i2}\n\nRevenue opportunity: ${rev}\n\n30-Day Roadmap:\nWeek 1 – Implement core systems\nWeek 2 – Train team + reinforce execution\nWeek 3 – Optimize and adjust\nWeek 4 – Measure results + stabilize\n\nWe'll track progress weekly and adjust as needed.`;
  document.getElementById('modal-root').innerHTML=`<div class="overlay" onclick="closeModalBg(event)"><div class="modal"><div class="modal-title">Slack post – ready to copy</div><textarea class="copy-textarea" id="copy-ta">${post}</textarea><div class="modal-actions"><button class="btn" onclick="closeModal()">Close</button><button class="btn btn-primary" id="copy-btn" onclick="copySlack()">Copy to clipboard</button></div></div></div>`;
}
function copySlack(){const ta=document.getElementById('copy-ta');if(ta)navigator.clipboard.writeText(ta.value).then(()=>{const b=document.getElementById('copy-btn');if(b){b.textContent='Copied!';setTimeout(()=>{b.textContent='Copy to clipboard';},2000);}}).catch(()=>{ta.select();document.execCommand('copy');});}

// ══ TASK CRUD ══
function togglePhase(id){collapsed[id]=!collapsed[id];renderMain();}
function toggleDone(id){const t=tasks.find(t=>t.id===id);if(!t)return;t.status=t.status==='done'?'todo':'done';persistTasks();renderMain();}
function quickAdd(e,phase,input){if(e.key==='Enter'&&input.value.trim()){tasks.push({id:nextId++,phase,name:input.value.trim(),owner:'Devyn',status:'todo',day:'',priority:'Med',notes:''});persistTasks();renderMain();}}
function openAddTask(){
  teamMembers=loadTeam();
  const todayVal=dateStr(new Date());
  document.getElementById('modal-root').innerHTML=`<div class="overlay" onclick="closeModalBg(event)"><div class="modal">
    <div class="modal-title">Add task</div>
    <div class="field-label">Task name</div><input class="field-input" id="m-name" placeholder="Task description...">
    <div class="field-label">Phase</div>
    <select class="field-select" id="m-phase" onchange="updateTimingUI()">${PHASES.map(p=>`<option value="${p.id}">${p.name}</option>`).join('')}</select>
    <div class="form-grid">
      <div><div class="field-label">Owner</div>
        <select class="owner-select" id="m-owner">${teamOwnerOptions(currentUser?.username||'Devyn')}</select>
      </div>
      <div id="timing-col"><div class="field-label">Due date</div><input class="field-input" id="m-dueDate" type="date" value="${todayVal}"></div>
    </div>
    <div id="recur-row" style="display:none;margin-bottom:13px">
      <div class="field-label">Recurring day</div>
      <select class="field-select" id="m-day" style="margin-bottom:0">
        <option value="Monday">Every Monday</option>
        <option value="Tuesday">Every Tuesday</option>
        <option value="Wednesday">Every Wednesday</option>
        <option value="Thursday">Every Thursday</option>
        <option value="Friday">Every Friday</option>
      </select>
    </div>
    <div id="monthly-row" style="display:none;margin-bottom:13px">
      <div class="field-label">Day of month</div>
      <select class="field-select" id="m-monthday" style="margin-bottom:0">
        <option value="1st">1st of month</option>
        <option value="14th">14th of month</option>
        <option value="26th">26th of month</option>
        <option value="End">End of month</option>
      </select>
    </div>
    <div class="form-grid">
      <div><div class="field-label">Status</div>
        <select class="field-select" id="m-status"><option value="todo">To do</option><option value="inprog">In progress</option><option value="done">Done</option><option value="blocked">Blocked</option></select>
      </div>
      <div><div class="field-label">Priority</div>
        <select class="field-select" id="m-priority"><option>High</option><option selected>Med</option><option>Low</option></select>
      </div>
    </div>
    <div class="field-label">Notes</div><textarea class="field-textarea" id="m-notes" placeholder="Additional context..."></textarea>
    <div class="modal-actions">
      <button class="btn" style="margin-right:auto;color:var(--text3)" onclick="closeModal();openTeamManager()">&#43; Manage team</button>
      <button class="btn" onclick="closeModal()">Cancel</button>
      <button class="btn btn-primary" onclick="saveNew()">Add task</button>
    </div>
  </div></div>`;
  updateTimingUI();
}

function updateTimingUI(){
  const phase=document.getElementById('m-phase')?.value||'';
  const dueDateCol=document.getElementById('timing-col');
  const recurRow=document.getElementById('recur-row');
  const monthlyRow=document.getElementById('monthly-row');
  if(!dueDateCol||!recurRow||!monthlyRow)return;
  if(phase==='weekly_ops'){
    dueDateCol.style.display='none';recurRow.style.display='block';monthlyRow.style.display='none';
  } else if(phase==='monthly'){
    dueDateCol.style.display='none';recurRow.style.display='none';monthlyRow.style.display='block';
  } else {
    dueDateCol.style.display='block';recurRow.style.display='none';monthlyRow.style.display='none';
  }
}
function openEdit(id){
  const t=tasks.find(t=>t.id===id);if(!t)return;
  teamMembers=loadTeam();
  const isWeekly=t.phase==='weekly_ops';
  const isMonthly=t.phase==='monthly';
  const dueDateVal=t.dueDate||'';
  const monthDayVal=t.day||'1st';
  const weekDayVal=t.day||'Monday';
  document.getElementById('modal-root').innerHTML=`<div class="overlay" onclick="closeModalBg(event)"><div class="modal">
    <div class="modal-title">Edit task</div>
    <div class="field-label">Task name</div><input class="field-input" id="m-name" value="${t.name.replace(/"/g,'&quot;').replace(/'/g,'&#39;')}">
    <div class="field-label">Phase</div>
    <select class="field-select" id="m-phase" onchange="updateTimingUI()">${PHASES.map(p=>`<option value="${p.id}" ${p.id===t.phase?'selected':''}>${p.name}</option>`).join('')}</select>
    <div class="form-grid">
      <div><div class="field-label">Owner</div>
        <select class="owner-select" id="m-owner">${teamOwnerOptions(t.owner)}</select>
      </div>
      <div id="timing-col" ${isWeekly||isMonthly?'style="display:none"':''}><div class="field-label">Due date</div><input class="field-input" id="m-dueDate" type="date" value="${dueDateVal}"></div>
    </div>
    <div id="recur-row" ${isWeekly?'':'style="display:none"'} style="${isWeekly?'':'display:none'};margin-bottom:13px">
      <div class="field-label">Recurring day</div>
      <select class="field-select" id="m-day" style="margin-bottom:0">
        ${['Monday','Tuesday','Wednesday','Thursday','Friday'].map(d=>`<option value="${d}" ${weekDayVal===d?'selected':''}>${'Every '+d}</option>`).join('')}
      </select>
    </div>
    <div id="monthly-row" ${isMonthly?'':'style="display:none"'} style="${isMonthly?'':'display:none'};margin-bottom:13px">
      <div class="field-label">Day of month</div>
      <select class="field-select" id="m-monthday" style="margin-bottom:0">
        ${[['1st','1st of month'],['14th','14th of month'],['26th','26th of month'],['End','End of month']].map(([v,l])=>`<option value="${v}" ${monthDayVal===v?'selected':''}>${l}</option>`).join('')}
      </select>
    </div>
    <div class="form-grid">
      <div><div class="field-label">Status</div>
        <select class="field-select" id="m-status">
          <option value="todo" ${t.status==='todo'?'selected':''}>To do</option>
          <option value="inprog" ${t.status==='inprog'?'selected':''}>In progress</option>
          <option value="done" ${t.status==='done'?'selected':''}>Done</option>
          <option value="blocked" ${t.status==='blocked'?'selected':''}>Blocked</option>
        </select>
      </div>
      <div><div class="field-label">Priority</div>
        <select class="field-select" id="m-priority">
          <option ${t.priority==='High'?'selected':''}>High</option>
          <option ${t.priority==='Med'?'selected':''}>Med</option>
          <option ${t.priority==='Low'?'selected':''}>Low</option>
        </select>
      </div>
    </div>
    <div class="field-label">Notes</div><textarea class="field-textarea" id="m-notes">${t.notes}</textarea>
    <div class="modal-actions">
      <button class="btn btn-danger" onclick="deleteTask(${id})">Delete</button>
      <button class="btn" onclick="closeModal()">Cancel</button>
      <button class="btn btn-primary" onclick="saveEdit(${id})">Save changes</button>
    </div>
  </div></div>`;
}
function saveNew(){
  const name=document.getElementById('m-name')?.value?.trim();if(!name)return;
  const phase=document.getElementById('m-phase')?.value||'onboarding';
  let day='',dueDate='';
  if(phase==='weekly_ops') day=document.getElementById('m-day')?.value||'Monday';
  else if(phase==='monthly') day=document.getElementById('m-monthday')?.value||'1st';
  else dueDate=document.getElementById('m-dueDate')?.value||'';
  tasks.push({id:nextId++,phase,name,owner:document.getElementById('m-owner')?.value||'',status:document.getElementById('m-status')?.value||'todo',day,dueDate,priority:document.getElementById('m-priority')?.value||'Med',notes:document.getElementById('m-notes')?.value||''});
  persistTasks();closeModal();renderMain();
}
function saveEdit(id){
  const t=tasks.find(t=>t.id===id);if(!t)return;
  t.name=document.getElementById('m-name')?.value||t.name;
  t.phase=document.getElementById('m-phase')?.value||t.phase;
  t.owner=document.getElementById('m-owner')?.value||t.owner;
  t.status=document.getElementById('m-status')?.value||t.status;
  t.priority=document.getElementById('m-priority')?.value||t.priority;
  t.notes=document.getElementById('m-notes')?.value||'';
  if(t.phase==='weekly_ops'){t.day=document.getElementById('m-day')?.value||t.day;t.dueDate='';}
  else if(t.phase==='monthly'){t.day=document.getElementById('m-monthday')?.value||t.day;t.dueDate='';}
  else{t.dueDate=document.getElementById('m-dueDate')?.value||'';t.day='';}
  persistTasks();closeModal();renderMain();
}
function deleteTask(id){if(!confirm('Delete this task?'))return;tasks=tasks.filter(t=>t.id!==id);persistTasks();closeModal();renderMain();}
function closeModal(){document.getElementById('modal-root').innerHTML='';}
function closeModalBg(e){if(e.target.classList.contains('overlay'))closeModal();}

function exportJSON(){const cl=getActiveClient();const blob=new Blob([JSON.stringify({client:cl,tasks,kpis:kpiData},null,2)],{type:'application/json'});const url=URL.createObjectURL(blob);const a=document.createElement('a');a.href=url;a.download=`${(cl?.name||'client').replace(/\s+/g,'-').toLowerCase()}-pm.json`;a.click();}


// ══ AUTH ══
// Simple hash function (djb2) - good enough for a local file tool
function hashStr(str){let h=5381;for(let i=0;i<str.length;i++)h=(h*33)^str.charCodeAt(i);return(h>>>0).toString(36);}

const DEFAULT_USERS=[{username:'devyn',passwordHash:hashStr('implant2024!'),role:'Admin',color:'#2563eb'}];

function loadUsers(){try{return JSON.parse(localStorage.getItem('pm_users')||'null')||DEFAULT_USERS;}catch(e){return DEFAULT_USERS;}}
function saveUsers(u){try{localStorage.setItem('pm_users',JSON.stringify(u));}catch(e){}}
function loadSession(){try{return JSON.parse(sessionStorage.getItem('pm_session')||'null');}catch(e){return null;}}
function saveSession(u){try{sessionStorage.setItem('pm_session',JSON.stringify(u));}catch(e){}}
function clearSession(){try{sessionStorage.removeItem('pm_session');}catch(e){}}

let currentUser=null;

function togglePw(){
  const inp=document.getElementById('login-pass');
  inp.type=inp.type==='password'?'text':'password';
}

function doLogin(){
  const username=document.getElementById('login-user')?.value?.trim().toLowerCase();
  const password=document.getElementById('login-pass')?.value||'';
  const err=document.getElementById('login-error');
  const users=loadUsers();
  const match=users.find(u=>u.username.toLowerCase()===username&&u.passwordHash===hashStr(password));
  if(!match){
    err.classList.add('show');
    document.getElementById('login-pass').value='';
    document.getElementById('login-pass').focus();
    return;
  }
  err.classList.remove('show');
  currentUser=match;
  saveSession({username:match.username,role:match.role,color:match.color});
  document.getElementById('screen-login').style.display='none';
  document.getElementById('screen-home').style.display='flex';
  loadClients();
  renderClientsScreen();
}

function doLogout(){
  currentUser=null;
  clearSession();
  document.getElementById('screen-home').style.display='none';
  document.getElementById('screen-app').style.display='none';
  document.getElementById('screen-login').style.display='flex';
  document.getElementById('login-user').value='';
  document.getElementById('login-pass').value='';
  document.getElementById('login-error').classList.remove('show');
}

function openUserSettings(){
  const users=loadUsers();
  const rows=users.map((u,i)=>`
    <div class="settings-user-row">
      <div class="settings-user-avatar" style="background:${u.color||'#1a1a18'}">${u.username[0].toUpperCase()}</div>
      <div style="flex:1">
        <div class="settings-user-name">${u.username}</div>
        <div class="settings-user-role">${u.role||'Member'}</div>
      </div>
      ${u.username.toLowerCase()===currentUser?.username?.toLowerCase()
        ?'<span style="font-size:11px;color:var(--text3);padding:3px 8px;background:var(--surface2);border-radius:10px">You</span>'
        :`<button class="btn btn-ghost btn-sm" style="color:var(--red-text)" onclick="removeUser(${i})">Remove</button>`}
    </div>`).join('');

  document.getElementById('modal-root').innerHTML=`<div class="overlay" onclick="closeModalBg(event)">
    <div class="modal">
      <div class="modal-title">User management</div>
      <div style="font-size:12px;color:var(--text2);margin-bottom:14px">Users who can access this PM tool. Passwords are stored as hashes — never in plain text.</div>

      <div class="settings-section-title">Current users</div>
      <div id="user-list">${rows}</div>

      <div class="settings-section-title">Add new user</div>
      <div class="form-grid" style="margin-bottom:0">
        <div>
          <div class="field-label">Username</div>
          <input class="field-input" id="new-username" placeholder="e.g. sarah" style="margin-bottom:0">
        </div>
        <div>
          <div class="field-label">Role</div>
          <input class="field-input" id="new-role" placeholder="e.g. Coordinator" style="margin-bottom:0">
        </div>
      </div>
      <div class="form-grid" style="margin-top:10px">
        <div>
          <div class="field-label">Password</div>
          <input class="field-input" id="new-password" type="password" placeholder="Set a password" style="margin-bottom:0">
        </div>
        <div>
          <div class="field-label">Avatar color</div>
          <div class="color-swatches" id="new-user-swatches" style="margin-bottom:0;margin-top:5px">${AVATAR_COLORS.map((col,i)=>`<div class="swatch ${i===0?'selected':''}" style="background:${col}" data-color="${col}" onclick="selectNewUserSwatch(this)"></div>`).join('')}</div>
          <input type="hidden" id="new-user-color" value="${AVATAR_COLORS[0]}">
        </div>
      </div>

      <div class="settings-section-title">Change your password</div>
      <div class="form-grid">
        <div>
          <div class="field-label">New password</div>
          <input class="field-input" id="change-pw-new" type="password" placeholder="New password" style="margin-bottom:0">
        </div>
        <div>
          <div class="field-label">Confirm</div>
          <input class="field-input" id="change-pw-confirm" type="password" placeholder="Confirm" style="margin-bottom:0">
        </div>
      </div>
      <button class="btn btn-sm" style="margin-bottom:14px" onclick="changePassword()">Update my password</button>

      <div class="modal-actions">
        <button class="btn btn-danger" onclick="doLogout();closeModal()">Sign out</button>
        <button class="btn" onclick="closeModal()">Close</button>
        <button class="btn btn-primary" onclick="addNewUser()">Add user</button>
      </div>
    </div>
  </div>`;
}

function selectNewUserSwatch(el){
  document.querySelectorAll('#new-user-swatches .swatch').forEach(s=>s.classList.remove('selected'));
  el.classList.add('selected');
  document.getElementById('new-user-color').value=el.dataset.color;
}

function addNewUser(){
  const username=document.getElementById('new-username')?.value?.trim().toLowerCase();
  const password=document.getElementById('new-password')?.value||'';
  const role=document.getElementById('new-role')?.value?.trim()||'Member';
  const color=document.getElementById('new-user-color')?.value||AVATAR_COLORS[0];
  if(!username||!password){alert('Username and password are required.');return;}
  const users=loadUsers();
  if(users.find(u=>u.username.toLowerCase()===username)){alert('That username already exists.');return;}
  users.push({username,passwordHash:hashStr(password),role,color});
  saveUsers(users);
  openUserSettings();
}

function removeUser(idx){
  const users=loadUsers();
  if(users[idx]?.username?.toLowerCase()===currentUser?.username?.toLowerCase()){alert("You can't remove yourself.");return;}
  if(!confirm(`Remove user "${users[idx].username}"?`))return;
  users.splice(idx,1);
  saveUsers(users);
  openUserSettings();
}

function changePassword(){
  const np=document.getElementById('change-pw-new')?.value||'';
  const cp=document.getElementById('change-pw-confirm')?.value||'';
  if(!np){alert('Enter a new password.');return;}
  if(np!==cp){alert('Passwords do not match.');return;}
  const users=loadUsers();
  const u=users.find(u=>u.username.toLowerCase()===currentUser?.username?.toLowerCase());
  if(!u){alert('User not found.');return;}
  u.passwordHash=hashStr(np);
  saveUsers(users);
  alert('Password updated successfully.');
  document.getElementById('change-pw-new').value='';
  document.getElementById('change-pw-confirm').value='';
}

// ══ BOOT ══
(function(){
  // Check for existing session
  const session=loadSession();
  if(session){
    currentUser=session;
    document.getElementById('screen-login').style.display='none';
    document.getElementById('screen-home').style.display='flex';
    loadClients();
    renderClientsScreen();
  }
  // else login screen is already visible
})();

</script>
</body>
</html>
