<!doctype html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="theme-color" content="#00080d">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-title" content="Jarvis">
<title>JARVIS</title>
<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64'%3E%3Crect width='64' height='64' fill='%2300080d'/%3E%3Ccircle cx='32' cy='32' r='20' fill='none' stroke='%2338e8ff' stroke-width='4'/%3E%3C/svg%3E">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap">
<style>
:root{--bg:#00080d;--ink:#d8faff;--dim:#6aa9b5;--c:#38e8ff;--k:1;box-sizing:border-box;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}
*,*::before,*::after{box-sizing:inherit}
html,body{height:100%;margin:0}
body{background:radial-gradient(90% 70% at 50% 45%,#02202c 0,var(--bg) 62%,#000 100%);color:var(--ink);font:15px/1.45 Orbitron,system-ui,sans-serif;display:flex;flex-direction:column;align-items:center;overflow:hidden}
body[data-s=listen]{--c:#38e8ff;--k:.55}
body[data-s=think]{--c:#ffb347;--k:.2}
body[data-s=speak]{--c:#b9f7ff;--k:.45}
.grid{position:fixed;inset:0;pointer-events:none;background:linear-gradient(rgba(56,232,255,.045) 1px,transparent 1px) 0 0/44px 44px,linear-gradient(90deg,rgba(56,232,255,.045) 1px,transparent 1px) 0 0/44px 44px}
header{position:relative;text-align:center;padding:22px 12px 0;width:100%}
h1{margin:0;font-weight:700;font-size:clamp(26px,8vw,44px);letter-spacing:.3em;padding-left:.3em;color:var(--ink);text-shadow:0 0 18px var(--c);animation:ttl 1.6s ease-out both}
@keyframes ttl{from{letter-spacing:.9em;opacity:0}}
#st{margin-top:8px;font-size:11px;letter-spacing:.3em;color:var(--c);transition:color .4s}
#more{position:fixed;top:calc(12px + env(safe-area-inset-top,0px));right:12px;width:44px;height:44px;border-radius:50%;border:1px solid var(--c);background:rgba(0,19,28,.6);display:grid;place-items:center;cursor:pointer;z-index:5;padding:0}
#more svg{width:22px;height:22px;fill:var(--c)}
main{position:relative;flex:1;min-height:0;width:100%;display:grid;place-items:center}
#hud{position:relative;width:min(88vw,46dvh,500px);aspect-ratio:1}
svg.h{display:block;width:100%;height:100%;filter:drop-shadow(0 0 5px var(--c))}
.s{fill:none;stroke:var(--c);transition:stroke .4s}
.rot{transform-box:fill-box;transform-origin:center;animation:spin calc(var(--t) * var(--k)) linear infinite}
.ccw{animation-direction:reverse}
@keyframes spin{to{transform:rotate(360deg)}}
#core{transform-box:fill-box;transform-origin:center;animation:core 3s ease-in-out infinite}
body[data-s=speak] #core{animation-duration:.7s}
body[data-s=think] #core{animation-duration:.9s}
@keyframes core{50%{transform:scale(.94);opacity:.8}}
#mic{position:absolute;inset:34%;border-radius:50%;border:1px solid var(--c);background:rgba(0,19,28,.55);color:var(--c);cursor:pointer;display:grid;place-items:center;padding:0}
#mic svg{width:42%;height:42%}
#mic:focus-visible,#more:focus-visible{outline:2px solid var(--ink);outline-offset:4px}
#tx{position:relative;width:min(92vw,560px);min-height:70px;max-height:24dvh;overflow:auto;border-left:2px solid var(--c);padding:6px 12px;margin:0 0 14px;font-family:system-ui,sans-serif;font-size:15px}
#you{color:var(--dim);margin:0 0 4px;overflow-wrap:anywhere}
#ans{margin:0;white-space:pre-wrap;overflow-wrap:anywhere}
#hint{font-size:10px;letter-spacing:.18em;color:var(--dim);margin:0 0 10px;text-align:center}
#menu{display:none;position:fixed;top:calc(64px + env(safe-area-inset-top,0px));right:10px;width:min(92vw,360px);max-height:78dvh;overflow:auto;background:rgba(0,12,18,.97);border:1px solid var(--c);padding:14px;z-index:6;font-family:system-ui,sans-serif}
#menu.open{display:block}
#menu h2{font:700 12px Orbitron,sans-serif;letter-spacing:.2em;margin:16px 0 8px;color:var(--c)}
#menu h2:first-child{margin-top:0}
#menu label{display:block;font-size:13px;color:var(--dim);margin:8px 0 3px}
#menu select,#menu input[type=text],#menu input[type=password]{width:100%;padding:9px;background:#001019;color:var(--ink);border:1px solid #1c4a56;font-size:14px}
#menu input[type=range]{width:100%;accent-color:var(--c)}
#menu button,.fl{display:inline-block;margin:8px 8px 0 0;padding:10px 12px;background:transparent;color:var(--c);border:1px solid var(--c);font-size:13px;cursor:pointer}
#menu a{color:var(--c)}
#menu small{display:block;color:var(--dim);margin-top:6px;font-size:12px}
.doc{display:flex;justify-content:space-between;align-items:center;gap:8px;font-size:13px;padding:6px 0;border-bottom:1px solid #12333d}
.doc span{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
.doc button{margin:0;padding:4px 10px}
@media (prefers-reduced-motion:reduce){*{animation:none!important}}
</style>
</head>
<body data-s="idle">
<div class="grid"></div>
<header><h1>J.A.R.V.I.S</h1><div id="st">EN VEILLE</div></header>
<button id="more" type="button" aria-label="Réglages"><svg viewBox="0 0 24 24"><circle cx="5" cy="12" r="2"/><circle cx="12" cy="12" r="2"/><circle cx="19" cy="12" r="2"/></svg></button>
<div id="menu">
<h2>VOIX</h2>
<label for="voice">Voix</label><select id="voice"></select>
<label for="pitch">Tonalité (plus bas = plus grave)</label><input id="pitch" type="range" min=".5" max="1.2" step=".05">
<label for="rate">Vitesse</label><input id="rate" type="range" min=".7" max="1.4" step=".05">
<button id="test" type="button">Tester la voix</button>
<h2>DOCUMENTS</h2>
<div id="docs"></div>
<label class="fl" for="file">Ajouter un document</label>
<input id="file" type="file" multiple accept=".txt,.md,.csv,.json,.html,.js,.py,.pdf,text/*,application/pdf" hidden>
<small>Jarvis s'en sert comme contexte. Texte ou PDF.</small>
<h2>CERVEAU</h2>
<label for="key">Clé Gemini gratuite</label><input id="key" type="password" autocomplete="off" placeholder="Colle ta clé ici">
<small>Gratuite, avec recherche internet : <a href="https://aistudio.google.com/apikey" target="_blank" rel="noopener">aistudio.google.com/apikey</a>. La clé reste sur ce téléphone.</small>
<label for="model">Modèle</label><input id="model" type="text" autocapitalize="off" spellcheck="false">
<h2>MÉMOIRE</h2>
<button id="wipe" type="button">Effacer la mémoire</button>
</div>
<main>
<div id="hud">
<svg class="h" viewBox="-300 -300 600 600" aria-hidden="true">
<circle class="s" r="288" stroke-width="1" opacity=".5"/>
<g class="rot" style="--t:90s"><circle class="s" r="272" stroke-width="10" stroke-dasharray="2 12.2" opacity=".7"/></g>
<g class="rot ccw" style="--t:60s"><circle class="s" r="245" stroke-width="3" stroke-dasharray="260 60 40 60"/></g>
<g class="rot" style="--t:40s"><circle class="s" r="215" stroke-width="8" stroke-dasharray="300 30 90 30" opacity=".8"/></g>
<circle class="s" r="186" stroke-width="1" opacity=".55"/>
<g class="rot ccw" style="--t:24s"><circle class="s" r="150" stroke-width="12" stroke-dasharray="215 40" opacity=".6"/></g>
<g class="rot" style="--t:30s"><circle class="s" r="120" stroke-width="2" stroke-dasharray="4 8"/></g>
<circle id="core" r="98" fill="rgba(56,232,255,.07)" stroke="var(--c)" stroke-width="1.5"/>
</svg>
<button id="mic" type="button" aria-label="Parler à Jarvis"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"><rect x="9" y="3" width="6" height="11" rx="3"/><path d="M5 11a7 7 0 0 0 14 0M12 18v3"/></svg></button>
</div>
</main>
<p id="hint">TOUCHEZ LE CERCLE ET PARLEZ</p>
<div id="tx"><p id="you"></p><p id="ans">Touchez le cercle, Monsieur. Je suis à votre service.</p></div>
<script>
"use strict";
const $=s=>document.querySelector(s);
const LS={get(k,d){try{const v=localStorage.getItem(k);return v==null?d:JSON.parse(v)}catch(e){return d}},set(k,v){try{localStorage.setItem(k,JSON.stringify(v))}catch(e){}}};
const st={pitch:LS.get('pitch',.7),rate:LS.get('rate',1),voice:LS.get('voice',''),key:LS.get('key',''),model:LS.get('model','gemini-flash-latest'),hist:LS.get('hist',[]),docs:LS.get('docs',[])};
const LAB={idle:'EN VEILLE',listen:'JE VOUS ÉCOUTE',think:'JE RÉFLÉCHIS',speak:'JE VOUS RÉPONDS'};
const SR=window.SpeechRecognition||window.webkitSpeechRecognition;
let rec=null,active=false,busy=false,gen=0,voices=[],lock=null;
const setS=s=>{document.body.dataset.s=s;$('#st').textContent=LAB[s]};
const msg=t=>{$('#ans').textContent=t};

/* ---------- Voix ---------- */
function loadVoices(){
  voices=speechSynthesis.getVoices().filter(v=>/^fr/i.test(v.lang));
  const sel=$('#voice');sel.textContent='';
  if(!voices.length){const o=document.createElement('option');o.textContent='Voix par défaut';sel.appendChild(o);return}
  voices.forEach(v=>{const o=document.createElement('option');o.value=v.name;o.textContent=v.name+' ('+v.lang+')';sel.appendChild(o)});
  const f=voices.find(v=>v.name===st.voice)||voices.find(v=>/thomas|henri|paul|nicolas|male|homme/i.test(v.name))||voices[0];
  sel.value=f.name;
}
if('speechSynthesis' in window){loadVoices();speechSynthesis.onvoiceschanged=loadVoices}
function say(text){
  return new Promise(res=>{
    const g=++gen;
    const clean=text.replace(/```[\s\S]*?```/g," J'ai affiché le code à l'écran. ").replace(/https?:\/\/\S+/g,'').replace(/[*#`_>|]/g,'');
    const parts=clean.match(/[^.!?\n]+[.!?]?/g)||[];
    const v=voices.find(x=>x.name===$('#voice').value);
    let i=0;
    speechSynthesis.cancel();
    const next=()=>{
      if(g!==gen||i>=parts.length){res();return}
      const t=parts[i++].trim();
      if(!t){next();return}
      const u=new SpeechSynthesisUtterance(t);
      u.lang='fr-FR';if(v)u.voice=v;u.pitch=st.pitch;u.rate=st.rate;
      u.onend=next;u.onerror=next;
      speechSynthesis.speak(u);
    };
    setTimeout(next,60);
  });
}

/* ---------- Cerveau ---------- */
function docsCtx(){
  if(!st.docs.length)return'';
  return"\n\nDocuments fournis par Monsieur, à utiliser comme contexte :\n"+st.docs.map(d=>"### "+d.name+"\n"+d.text).join("\n\n");
}
async function ask(q){
  const sys="Tu es J.A.R.V.I.S, majordome IA britannique, flegmatique, élégant et plein d'humour pince-sans-rire. Tu t'adresses à l'utilisateur par « Monsieur ». Tu réponds toujours en français, de façon courte et naturelle pour être lue à voix haute (2 à 4 phrases), sans listes ni mise en forme. Tu as accès à internet pour les actualités et les faits récents. Si on te demande du code, donne-le dans un bloc de code markdown avec une phrase d'explication. Date et heure : "+new Date().toLocaleString('fr-FR')+docsCtx();
  st.hist.push({role:'user',text:q});
  st.hist=st.hist.slice(-20);
  while(st.hist.length&&st.hist[0].role!=='user')st.hist.shift();
  try{
    let out;
    if(st.key){
      const r=await fetch('https://generativelanguage.googleapis.com/v1beta/models/'+encodeURIComponent(st.model)+':generateContent',{
        method:'POST',
        headers:{'Content-Type':'application/json','x-goog-api-key':st.key},
        body:JSON.stringify({systemInstruction:{parts:[{text:sys}]},contents:st.hist.map(m=>({role:m.role==='user'?'user':'model',parts:[{text:m.text}]})),tools:[{google_search:{}}]})
      });
      const j=await r.json().catch(()=>({}));
      if(!r.ok){
        if(r.status===429)throw new Error("La limite gratuite est atteinte, Monsieur. Réessayez dans une minute.");
        if(r.status===404)throw new Error("Ce modèle est introuvable. Vérifiez le nom du modèle dans les réglages.");
        throw new Error("La clé Gemini semble invalide, Monsieur. Vérifiez-la dans les réglages.");
      }
      out=((j.candidates&&j.candidates[0]&&j.candidates[0].content&&j.candidates[0].content.parts)||[]).map(p=>p.text||'').join('').trim();
    }else{
      const r=await fetch('https://text.pollinations.ai/openai',{
        method:'POST',headers:{'Content-Type':'application/json'},
        body:JSON.stringify({model:'openai',messages:[{role:'system',content:sys},...st.hist.map(m=>({role:m.role==='user'?'user':'assistant',content:m.text}))]})
      });
      if(!r.ok)throw new Error("Mon cerveau gratuit est indisponible, Monsieur. Ajoutez une clé Gemini gratuite dans les réglages.");
      const j=await r.json();
      out=(j.choices[0].message.content||'').trim();
    }
    if(!out)throw new Error("Je n'ai pas de réponse, Monsieur. Pouvez-vous répéter ?");
    st.hist.push({role:'model',text:out});
    LS.set('hist',st.hist);
    return out;
  }catch(e){
    st.hist.pop();
    if(e instanceof TypeError)throw new Error("Je n'arrive pas à joindre internet, Monsieur.");
    throw e;
  }
}

/* ---------- Écoute ---------- */
function listen(){
  if(!active||busy)return;
  let fin='';
  rec=new SR();rec.lang='fr-FR';rec.interimResults=true;rec.continuous=false;
  rec.onstart=()=>setS('listen');
  rec.onresult=e=>{let t='';for(const r of e.results){t+=r[0].transcript;if(r.isFinal)fin=t}$('#you').textContent=t};
  rec.onerror=e=>{
    if(e.error==='not-allowed'||e.error==='service-not-allowed'){stopAll();msg("Le micro est refusé. Touchez l'icône à gauche de l'adresse, puis autorisez le micro pour ce site.")}
  };
  rec.onend=()=>{
    if(!active)return;
    if(fin.trim())handle(fin.trim());
    else if(!busy)setTimeout(listen,350);
  };
  try{rec.start()}catch(e){setTimeout(listen,600)}
}
async function handle(q){
  busy=true;setS('think');
  q=q.replace(/^\s*(ok |hey |dis )?jarvis[\s,.:!]*/i,'')||q;
  $('#you').textContent=q;
  if(/^(stop|silence|tais-toi|arrête|arrete)\b/i.test(q)){stopAll();msg("Très bien, Monsieur. Je me mets en veille.");return}
  let a;
  try{a=await ask(q)}catch(e){a=e.message}
  if(!active){return}
  msg(a);setS('speak');
  await say(a);
  busy=false;
  if(active)listen();
}
async function start(){
  if(!SR){msg("Ce navigateur ne gère pas la reconnaissance vocale. Ouvrez Jarvis dans Chrome.");return}
  active=true;busy=true;
  try{if(navigator.wakeLock)lock=await navigator.wakeLock.request('screen')}catch(e){}
  setS('speak');
  await say("Bonjour Monsieur. Je vous écoute.");
  busy=false;
  if(active)listen();
}
function stopAll(){
  active=false;busy=false;gen++;
  try{speechSynthesis.cancel()}catch(e){}
  try{if(rec)rec.abort()}catch(e){}
  try{if(lock)lock.release()}catch(e){}
  lock=null;setS('idle');
}
$('#mic').onclick=()=>{
  const s=document.body.dataset.s;
  if(!active)start();
  else if(s==='speak'){gen++;speechSynthesis.cancel()}
  else stopAll();
};

/* ---------- Réglages ---------- */
$('#more').onclick=()=>$('#menu').classList.toggle('open');
$('#pitch').value=st.pitch;$('#rate').value=st.rate;$('#key').value=st.key;$('#model').value=st.model;
$('#pitch').oninput=e=>{st.pitch=+e.target.value;LS.set('pitch',st.pitch)};
$('#rate').oninput=e=>{st.rate=+e.target.value;LS.set('rate',st.rate)};
$('#voice').onchange=e=>{st.voice=e.target.value;LS.set('voice',st.voice)};
$('#key').onchange=e=>{st.key=e.target.value.trim();LS.set('key',st.key)};
$('#model').onchange=e=>{st.model=e.target.value.trim()||'gemini-flash-latest';LS.set('model',st.model)};
$('#test').onclick=()=>say("Bonjour Monsieur. Tous les systèmes sont opérationnels.");
$('#wipe').onclick=()=>{st.hist=[];LS.set('hist',[]);msg("Mémoire effacée, Monsieur.")};
$('#ans').onclick=()=>{try{navigator.clipboard.writeText($('#ans').textContent);$('#hint').textContent='TEXTE COPIÉ'}catch(e){}};

function renderDocs(){
  const box=$('#docs');box.textContent='';
  st.docs.forEach((d,i)=>{
    const row=document.createElement('div');row.className='doc';
    const n=document.createElement('span');n.textContent=d.name;
    const b=document.createElement('button');b.type='button';b.textContent='×';b.setAttribute('aria-label','Retirer '+d.name);
    b.onclick=()=>{st.docs.splice(i,1);LS.set('docs',st.docs);renderDocs()};
    row.append(n,b);box.appendChild(row);
  });
}
function loadPdf(){
  return window.pdfjsLib?Promise.resolve():new Promise((ok,ko)=>{
    const s=document.createElement('script');
    s.src='https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js';
    s.onload=()=>{pdfjsLib.GlobalWorkerOptions.workerSrc='https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js';ok()};
    s.onerror=ko;document.head.appendChild(s);
  });
}
async function pdfText(buf){
  await loadPdf();
  const p=await pdfjsLib.getDocument({data:buf}).promise;let t='';
  for(let i=1;i<=p.numPages&&i<=40;i++){const c=await(await p.getPage(i)).getTextContent();t+=c.items.map(x=>x.str).join(' ')+'\n'}
  return t;
}
$('#file').onchange=async e=>{
  for(const f of e.target.files){
    let t='';
    try{t=/\.pdf$/i.test(f.name)?await pdfText(await f.arrayBuffer()):await f.text()}catch(err){}
    if(t.trim()){st.docs.push({name:f.name,text:t.slice(0,12000)})}else msg("Je n'ai pas pu lire « "+f.name+" », Monsieur.");
  }
  e.target.value='';LS.set('docs',st.docs);renderDocs();
};
renderDocs();
</script>
</body>
</html>

