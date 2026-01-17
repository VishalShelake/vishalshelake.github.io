'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "b362f7c4c047a9c86df173df53f1849e",
"version.json": "898f391fcda9a525f662be747f6cf13b",
"index.html": "175c3fa91852838534564d21557f7eec",
"/": "175c3fa91852838534564d21557f7eec",
"main.dart.js": "fafab36ddb2a123bfa02acc2322811c1",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "1da70580a56f5e9a774f07cbc900fc36",
"assets/NOTICES": "d19a2500a031ad6c223397e78f1322f8",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "5ef3cebc2060217e7efa27309c73f226",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "74fe0736adf87f0562681e6c2212d7f3",
"assets/fonts/MaterialIcons-Regular.otf": "50d342bc9f461fbc3689c41b308cc5b4",
"assets/assets/images/screenshots/SYPrints/SyPrints6.png": "d11452ba395460f086e8e518d007c828",
"assets/assets/images/screenshots/SYPrints/SyPrintLogo.png": "75db5289b363911b77bf26910841837d",
"assets/assets/images/screenshots/SYPrints/SyPrints7.png": "79df52e69925114b089afcd3b0cf535f",
"assets/assets/images/screenshots/SYPrints/SyPrints5.png": "f43a0358cf8e170537370d78705853b8",
"assets/assets/images/screenshots/SYPrints/SyPrints4.png": "35a1e44bcce8b8ea031832510ccebf7e",
"assets/assets/images/screenshots/SYPrints/SyPrints1.png": "3bfac130763fcb4bc23c66c4934d0e6a",
"assets/assets/images/screenshots/SYPrints/SyPrints3.png": "48ab6d43ef1e04a44061883564f53cb2",
"assets/assets/images/screenshots/SYPrints/SyPrints2.png": "8a6675a3be4edf5b3733e4c79ddde014",
"assets/assets/images/screenshots/PUS/PUS1_iphone12black_portrait.png": "30a72ca06cb4c1f0c17f13f4e28e2b31",
"assets/assets/images/screenshots/PUS/PUSLogo.jpeg": "7f8f0557f4e941200c63602e1cf88400",
"assets/assets/images/screenshots/PUS/PUS2_iphone12black_portrait.png": "090fb53ed566e7e688905cb183603764",
"assets/assets/images/screenshots/PUS/PUS4_iphone12black_portrait.png": "d79b60e1b913a41526a55a00641ba785",
"assets/assets/images/screenshots/PUS/PUS3_iphone12black_portrait.png": "29d8da46f7d4464c39bc5ccaf1545413",
"assets/assets/images/screenshots/Lilacard/LilacardScreen10_iphone12black_portrait.png": "6beed9aa7cecdc303c68d75cccc02f0f",
"assets/assets/images/screenshots/Lilacard/LilacardScreen7_iphone12black_portrait.png": "6c5642624d9bd04a597f0581fe4aed87",
"assets/assets/images/screenshots/Lilacard/LilacardScreen6_iphone12black_portrait.png": "14455de35bdf21134693cc23f8aac70f",
"assets/assets/images/screenshots/Lilacard/LilacardScreen1_iphone12black_portrait.png": "ef5b80fc67db11c37e7c948503a4dc43",
"assets/assets/images/screenshots/Lilacard/LilacardScreen4_iphone12black_portrait.png": "d7ab5486bcd90cd5066807b860f32a75",
"assets/assets/images/screenshots/Lilacard/LilacardScreen8_iphone12black_portrait.png": "3e6e8ebbee6a205e7236553eb346ef04",
"assets/assets/images/screenshots/Lilacard/LilacardLogo.png": "e5e1261ceaca2305518a3f2dbe4b795f",
"assets/assets/images/screenshots/Lilacard/LilacardScreen3_iphone12black_portrait.png": "cd732abe45729c8b86c383e6aefac6fd",
"assets/assets/images/screenshots/Lilacard/LilacardScreen2_iphone12black_portrait.png": "801f8d43b6137b826e8f7d6acbcd8ee5",
"assets/assets/images/screenshots/Lilacard/LilacardScreen5_iphone12black_portrait.png": "0782866934c6f1a3d5d96965136b2c17",
"assets/assets/images/screenshots/Lilacard/LilacardScreen9_iphone12black_portrait.png": "22526bd0e043effca019a9ef121e615e",
"assets/assets/images/screenshots/QOH/QOHappLogo.png": "694165e9099019554818ca9c77324f51",
"assets/assets/images/screenshots/QOH/Qoh1.png": "64eb83bd86c571f7d3f125901512ecd6",
"assets/assets/images/screenshots/QOH/Qoh3.png": "6d5416a40998972d13efadd8023bff0e",
"assets/assets/images/screenshots/QOH/Qoh2.png": "9bdc1401995655183295585d81617319",
"assets/assets/images/screenshots/QOH/Qoh6.png": "618c822097624626d7232f2f08d8c8be",
"assets/assets/images/screenshots/QOH/Qoh7.png": "2ccb3761a14e5beb503b19a41db5685f",
"assets/assets/images/screenshots/QOH/Qoh5.png": "4aaabdd2cbe6772e433a0927596cd5c6",
"assets/assets/images/screenshots/QOH/Qoh4.png": "09bcb5976f2552cfde1b2751c0126f9c",
"assets/assets/images/screenshots/QOH/QohTestflight2.png": "2c9a1728b900fbd36d7fbdedcd40b8e1",
"assets/assets/images/screenshots/QOH/Qoh8.png": "3b3a29e6e56614968f4e2c9688895ee2",
"assets/assets/images/screenshots/QOH/QohTestflight1.png": "eef6e894a888b8390aeb6d831c3914e2",
"assets/assets/images/screenshots/iPAS/iPass10_iphone12black_portrait.png": "eb1c4d828bb05e1a9e269223fb327a7a",
"assets/assets/images/screenshots/iPAS/1_iphone12black_portrait.png": "7cc1bd660134fa22fc05f5f4913c9877",
"assets/assets/images/screenshots/iPAS/iPass7_iphone12black_portrait.png": "1008e3b8da2a3de58c22992dcbdf0eb8",
"assets/assets/images/screenshots/iPAS/iPass6_iphone12black_portrait.png": "d4ede1cd1e900395199a5d8f42aebcc5",
"assets/assets/images/screenshots/iPAS/iPass1_iphone12black_portrait.png": "0455ddd40e73dd9dc1ce481d282018e4",
"assets/assets/images/screenshots/iPAS/iPASLogo.png": "b2194429151387c50a5b74479c1349b4",
"assets/assets/images/screenshots/iPAS/iPass8_iphone12black_portrait.png": "af03812d9efaf055601fe892759153ee",
"assets/assets/images/screenshots/iPAS/iPass4_iphone12black_portrait.png": "646cdd87ed9462906db78f3980491012",
"assets/assets/images/screenshots/iPAS/iPass3_iphone12black_portrait.png": "c60ca93ace9a8ed94b71077d62dacae3",
"assets/assets/images/screenshots/iPAS/iPass2_iphone12black_portrait.png": "4eeff808b4b64b91a1d2a70952949076",
"assets/assets/images/screenshots/iPAS/iPass9_iphone12black_portrait.png": "d329826b417ca2bcadffc25d992951ff",
"assets/assets/images/screenshots/iPAS/iPass5_iphone12black_portrait.png": "6e1be78a74e4c12cd63dc38ec2156728",
"assets/assets/images/screenshots/Aldo/Aldo1_iphone12black_portrait.png": "dec4b970cb2ddcaabab0f01f392b2f25",
"assets/assets/images/screenshots/Aldo/Aldo3_iphone12black_portrait.png": "f3e1f4eeb6390f5a275caa7b465bce0b",
"assets/assets/images/screenshots/Aldo/Aldo2_iphone12black_portrait.png": "4f6c2b75bdfb0eafd597788afa339e2b",
"assets/assets/images/screenshots/Aldo/irevo_ft_logo.png": "8224ec1fde6b32973e53aa5c9f3e664f",
"assets/assets/images/screenshots/ArtToFrame/IMG_0017_iphone12miniblack_portrait.png": "aab443d1b5d1b54f693e7530bf363526",
"assets/assets/images/screenshots/ArtToFrame/IMG_0020_iphone12miniblack_portrait.png": "fa87c2f2cb76e3d39525d7f7e5a1820d",
"assets/assets/images/screenshots/ArtToFrame/IMG_0021_iphone12miniblack_portrait.png": "8cae22d322550eb75f6b7386e012c83d",
"assets/assets/images/screenshots/ArtToFrame/IMG_0019_iphone12miniblack_portrait.png": "a369160fc46918e07581b2287e1a28c4",
"assets/assets/images/screenshots/ArtToFrame/ATFLogo.png": "718facf59d79f79e42752c3b8f7d5cf9",
"assets/assets/images/screenshots/ArtToFrame/IMG_0018_iphone12miniblack_portrait.png": "12541c9fd27f9bfc889866bf0b9661c7",
"assets/assets/images/screenshots/eNlightMeet/enlightmeet1_iphone12black_portrait.png": "5643e2130d097e11702f7d7fcf8b830c",
"assets/assets/images/screenshots/eNlightMeet/enlightLogo.png": "657aeda0d3c234878b29e372651f4c7f",
"assets/assets/images/screenshots/eNlightMeet/enlightMeet_iphone12black_portrait.png": "eb3fd2bd7d78ecf979bce1980c722180",
"assets/assets/images/screenshots/eNlightMeet/eNlightmeet2_iphone12black_portrait.png": "60fc2a51dc203ec68c8679cbfe1b9516",
"assets/assets/images/screenshots/EscapeCity/EscapeC3_ipad_spacegrey_landscape.png": "704e285df2e678daca257348f7750f5f",
"assets/assets/images/screenshots/EscapeCity/EscapeC6_ipad_spacegrey_landscape.png": "ccbcf7b7dda3328533b1b2fa6a970569",
"assets/assets/images/screenshots/EscapeCity/EscapeCityLogo.png": "f1875dd85bc3fac26f813985ffb24dbd",
"assets/assets/images/screenshots/EscapeCity/EscapeC5_ipad_spacegrey_landscape.png": "9a18564831701958624972670949c6b7",
"assets/assets/images/screenshots/EscapeCity/EscapeC4_ipad_spacegrey_landscape.png": "67cf484712fff6be4f389e04b5c8587b",
"assets/assets/images/screenshots/EscapeCity/EscapeC7_ipad_spacegrey_landscape.png": "2a14afc7a6e14fb31bae4068775abe0c",
"assets/assets/images/screenshots/EscapeCity/EscapeC1_ipad_spacegrey_landscape.png": "c2c46fa5f524736aacdb7143e54e3ccb",
"assets/assets/images/screenshots/EscapeCity/EscapeC2_ipad_spacegrey_landscape.png": "578f08067396289405c3976941c54602",
"assets/assets/images/screenshots/Mofpi/1_iphone12black_portrait.png": "2bcc22158629230de55610d2931aa974",
"assets/assets/images/screenshots/Mofpi/6_iphone12black_portrait.png": "2a2e4ebaaa9de047a4f1f3acb31bfc36",
"assets/assets/images/screenshots/Mofpi/mofpiLogo.png": "4ac6235444eb3a7599ffb7d2f6f57a5f",
"assets/assets/images/screenshots/Mofpi/5_iphone12black_portrait.png": "ff9991c2fff448d66112f26256b94648",
"assets/assets/images/screenshots/Mofpi/2_iphone12black_portrait.png": "698208a285f9769d0845c6ac70bb78d5",
"assets/assets/images/screenshots/Mofpi/3_iphone12black_portrait.png": "beb54eba7355514b8fbe77bd7e93d43e",
"assets/assets/images/screenshots/Mofpi/4_iphone12black_portrait.png": "acd6243306d23d6bfc22483015166cd0",
"assets/assets/images/screenshots/UnionBankHealthcare/UBIH4.png": "574528675ecbc70608258670956c6046",
"assets/assets/images/screenshots/UnionBankHealthcare/UBIH5.png": "91a04656437428279cec99228057ddb8",
"assets/assets/images/screenshots/UnionBankHealthcare/UBIH6.png": "47fd55033e0c8eefc6583b23cf1f5254",
"assets/assets/images/screenshots/UnionBankHealthcare/UBIH2.png": "9405af212d99b1bfc87c662f8bbcb9e2",
"assets/assets/images/screenshots/UnionBankHealthcare/UBIH3.png": "8d1dc85e313934dd63d1e94da7c1e75e",
"assets/assets/images/screenshots/UnionBankHealthcare/unionBankHealthCare.jpeg": "b67d4dad49f1dfd3fa7f00349865db84",
"assets/assets/images/developer_profile_photo.png": "06e1f06e753517e3d419dff2716fb32e",
"assets/assets/documents/Resume_Vishal_Shelake_Oct22.pdf": "45dd53ba31bfc8b0e52870c54e28ad64",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
