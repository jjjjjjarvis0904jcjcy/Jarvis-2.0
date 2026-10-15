<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="theme-color" content="#030812">
<title>Jarvis</title>
<style>
:root{--bg:#030812;--deep:#08203a;--cy:#35e8ff;--ice:#d6f8ff;--err:#ff6b5b}
*{box-sizing:border-box;margin:0}
html,body{height:100%}
body{
  background:radial-gradient(circle at 50% 42%,var(--deep) 0,var(--bg) 68%);
  color:var(--ice);font-family:"Segoe UI",system-ui,sans-serif;
  display:flex;flex-direction:column;align-items:center;justify-content:space-between;
  padding:calc(env(safe-area-inset-top,0px) + 28px) 20px calc(env(safe-area-inset-bottom,0px) + 32px);
  overflow:hidden;text-align:center
}
h1{font-weight:200;font-size:1.3rem;letter-spacing:.7em;padding-left:.7em;color:var(--cy);text-shadow:0 0 14px var(--cy)}

/* Le cœur : l'élément mémorable */
.orb{position:relative;width:min(72vw,320px);aspect-ratio:1;flex:none}
.orb i{position:absolute;border-radius:50%;display:block}
.r1{inset:0;border:2px solid transparent;border-top-color:var(--cy);border-bottom-color:var(--cy);animation:spin 9s linear infinite}
.r2{inset:9%;border:1px dashed rgba(53,232,255,.55);animation:spin 14s linear infinite reverse}
.r3{inset:20%;border:3px solid transparent;border-left-color:var(--cy);border-right-color:var(--cy);animation:spin 5s linear infinite}
.core{inset:34%;background:radial-gradient(circle,var(--ice) 0,var(--cy) 38%,rgba(53,232,255,.08) 72%);
  box-shadow:0 0 40px 6px rgba(53,232,255,.55);animation:pulse 3.2s ease-in-out infinite}
.off .r1,.off .r2,.off .r3{animation-play-state:paused}
.off .orb{opacity:.38;filter:saturate(.4)}
.listening .core{animation-duration:1.8s}
.speaking .core{animation-duration:.55s;box-shadow:0 0 70px 14px rgba(214,248,255,.8)}
.speaking .r1,.speaking .r3{animation-duration:2s}
.error .orb{filter:hue-rotate(150deg) saturate(1.6)}
@keyframes spin{to{transform:rotate(360deg)}}
@keyframes pulse{50%{transform:scale(.82);opacity:.8}}

.txt{min-height:9.5rem;display:flex;flex-direction:column;gap:.7rem;justify-content:center;max-width:28rem}
#say{font-size:1.9rem;font-weight:300;letter-spacing:.08em;text-shadow:0 0 16px var(--cy);min-height:2.4rem}
#heard{font-size:.95rem;opacity:.6;min-height:1.3rem;overflow-wrap:anywhere}
#state{font-size:1rem;color:var(--cy)}
.error #state{color:var(--err)}

button{
  background:rgba(53,232,255,.08);color:var(--ice);border:1px solid var(--cy);border-radius:999px;
  padding:1rem 2.4rem;font:inherit;font-size:1.05rem;letter-spacing:.06em;
  box-shadow:0 0 18px rgba(53,232,255,.3);cursor:pointer
}
button:active{background:rgba(53,232,255,.28)}
button:focus-visible{outline:3px solid var(--ice);outline-offset:4px}
@media (prefers-reduced-motion:reduce){*{animation:none!important}}
</style>
</head>
<body class="off">
<h1>JARVIS</h1>

<div class="orb" aria-hidden="true"><i class="r1"></i><i class="r2"></i><i class="r3"></i><i class="core"></i></div>

<div class="txt" aria-live="polite">
  <div id="say"></div>
  <div id="heard"></div>
  <div id="state">En veille. Appuie sur le bouton pour m'activer.</div>
</div>

<button id="btn" type="button">Activer le micro</button>

<script>
(function () {
  var SR = window.SpeechRecognition || window.webkitSpeechRecognition;
  var $ = function (id) { return document.getElementById(id); };
  var say = $('say'), heard = $('heard'), state = $('state'), btn = $('btn');
  var rec = null, on = false, busy = false, last = 0, lock = null;

  function setState(cls, txt) { document.body.className = cls; state.textContent = txt; }

  function keepAwake() {
    try {
      if (navigator.wakeLock && on) {
        navigator.wakeLock.request('screen').then(function (l) { lock = l; }).catch(function () {});
      }
    } catch (e) {}
  }
  document.addEventListener('visibilitychange', function () {
    if (document.visibilityState === 'visible') keepAwake();
  });

  function listen() {
    if (!on || busy || !rec) return;
    try { rec.start(); } catch (e) {}
  }

  function reply(text) {
    busy = true;
    say.textContent = text.toUpperCase();
    setState('speaking', 'Je réponds…');
    try { rec.abort(); } catch (e) {}
    var done = function () {
      busy = false;
      if (on) { setState('listening', "Je t'écoute. Dis « Jarvis »."); setTimeout(listen, 300); }
    };
    if (!window.speechSynthesis) { setTimeout(done, 1500); return; }
    try {
      speechSynthesis.cancel();
      var u = new SpeechSynthesisUtterance(text);
      u.lang = 'fr-FR';
      var v = speechSynthesis.getVoices().filter(function (x) { return x.lang && x.lang.indexOf('fr') === 0; })[0];
      if (v) u.voice = v;
      u.onend = done; u.onerror = done;
      speechSynthesis.speak(u);
    } catch (e) { done(); }
  }

  function build() {
    rec = new SR();
    rec.lang = 'fr-FR';
    rec.continuous = true;
    rec.interimResults = true;
    rec.onresult = function (e) {
      if (busy) return;
      var t = '';
      for (var i = e.resultIndex; i < e.results.length; i++) t += e.results[i][0].transcript;
      heard.textContent = t;
      if (/jarvis|jarvi[cs]e?|jarvès/i.test(t) && Date.now() - last > 3000) {
        last = Date.now();
        reply('Oui monsieur');
      }
    };
    rec.onerror = function (e) {
      if (e.error === 'not-allowed' || e.error === 'service-not-allowed') {
        on = false; btn.textContent = 'Activer le micro';
        setState('error', "Micro refusé. Autorise-le dans les réglages du site (icône à gauche de l'adresse), puis réessaie.");
      } else if (e.error === 'network') {
        setState('error', 'Pas de connexion. La reconnaissance vocale de Chrome a besoin d\'internet.');
      }
    };
    rec.onend = function () { if (on && !busy) setTimeout(listen, 300); };
  }

  btn.addEventListener('click', function () {
    if (!SR) { setState('error', "Ce navigateur ne gère pas le micro vocal. Ouvre la page dans Chrome."); return; }
    if (!on) {
      if (!rec) build();
      on = true; busy = false;
      btn.textContent = 'Mettre en veille';
      setState('listening', "Je t'écoute. Dis « Jarvis ».");
      say.textContent = ''; heard.textContent = '';
      keepAwake(); listen();
    } else {
      on = false;
      try { rec.abort(); } catch (e) {}
      try { if (lock) lock.release(); } catch (e) {}
      btn.textContent = 'Activer le micro';
      setState('off', 'En veille. Appuie sur le bouton pour m\'activer.');
    }
  });
})();
</script>
</body>
</html>
