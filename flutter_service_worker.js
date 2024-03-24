'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "a5a7bf6da9e5326c8504f680104fbc10",
"assets/AssetManifest.bin.json": "a8684443393d018d348271b4986a6327",
"assets/AssetManifest.json": "ebdfa1a9848d1beef40197a1298cb3a1",
"assets/assets/images/highlights/decisionai/decisionai_hl_compare.webp": "742b72c33e0e7b7077722aa3efa8e7d8",
"assets/assets/images/highlights/decisionai/decisionai_hl_importance.webp": "a457b1b61155ccc9bd59d7078d664544",
"assets/assets/images/highlights/decisionai/decisionai_hl_result.webp": "f93b7a6617db0c0b4efb25c6ac04f54d",
"assets/assets/images/highlights/decisionai/decisionai_hl_share.webp": "1c0070e150ac3888382bbe6fec955855",
"assets/assets/images/highlights/tg/tg_hl_offer.webp": "05f4f5d5ffbdcd62add0abd3b397edc8",
"assets/assets/images/highlights/tg/tg_hl_report.webp": "39b78ec38b90dd8f98a9f19d6d9c781c",
"assets/assets/images/highlights/tg/tg_hl_store.webp": "b064b4d9fb217a5f228a1ad17a8e572b",
"assets/assets/images/highlights/tg/tg_hl_valuation.webp": "0df81c447147579735821895f4df2653",
"assets/assets/images/icons/app/decisionai.png": "ba607aa4ef9322b1e984d206a5d9252b",
"assets/assets/images/icons/app/tg.png": "d216a8658868f1b9caa54e310903b481",
"assets/assets/images/icons/apple.png": "1ef84e1f46cabe1e34bad6cc0585e102",
"assets/assets/images/icons/play.png": "1f42280aff713ea591f7ee6f88524179",
"assets/assets/images/icons/socials/figma.webp": "870ab4b054d861fa9f87c5d9bf884ad9",
"assets/assets/images/icons/socials/github.webp": "895cc2a0b087f3547e01c7e338a5cf1d",
"assets/assets/images/icons/socials/instagram.webp": "385b63afaf9af00d994566a504e62561",
"assets/assets/images/icons/socials/linkedin.webp": "fb42565d465772ab512a132c048ffa1b",
"assets/assets/images/icons/socials/medium.webp": "7e23fe28317a8aec7a5f8a9ba878722e",
"assets/assets/images/icons/socials/play.webp": "6dcde7cff344a13fa8b62251525df7c4",
"assets/assets/images/icons/socials/x.webp": "402c73e25d2ec625377fa0ca3d0b04bb",
"assets/assets/images/icons/socials/youtube.webp": "06aa4eeb9502fc0c0568f09d4e30a075",
"assets/assets/images/pp.png": "1617f383842e4388833f89706c656ebf",
"assets/assets/images/screenshots/decisionai/decisionai_ss_1.webp": "9eb484b4bfcc9a9ca12a89adc733600b",
"assets/assets/images/screenshots/decisionai/decisionai_ss_2.webp": "6e19d199b8661bf977d5cebdc21f9a5b",
"assets/assets/images/screenshots/decisionai/decisionai_ss_3.webp": "c2f5331e89d00fe6f644bc71913be1a1",
"assets/assets/images/screenshots/decisionai/decisionai_ss_4.webp": "4bd9c8c6fa7e3781d1e6fa7d83204e10",
"assets/assets/images/screenshots/decisionai/decisionai_ss_5.webp": "78bec8db0c7cb359de22b15bb4785dae",
"assets/assets/images/screenshots/decisionai/decisionai_ss_6.webp": "dc1fd246f3190662b09415419cdfe537",
"assets/assets/images/screenshots/decisionai/decisionai_ss_7.webp": "3daadeb46cff80c9da1482c7260df0ca",
"assets/assets/images/screenshots/tg/tg_ss_1.webp": "7679f05c3a82d2c12d20258670a4bb94",
"assets/assets/images/screenshots/tg/tg_ss_2.webp": "eb2bf6e1df63e04a50cf1002fa47d801",
"assets/assets/images/screenshots/tg/tg_ss_3.webp": "0637584b0873fdeb6ceb1db71327b7b3",
"assets/assets/images/screenshots/tg/tg_ss_4.webp": "aa18cfccbca79ad251b75c84e347b337",
"assets/assets/images/screenshots/tg/tg_ss_5.webp": "a88fb4299a459cd623583d060d4a395a",
"assets/assets/images/screenshots/tg/tg_ss_6.webp": "89fe6ec5c59657c43b9b7a078236be81",
"assets/assets/images/screenshots/tg/tg_ss_7.webp": "e3b5c70dcf8738efcb1ecfa39da69113",
"assets/assets/images/thumbnails/decisionai_thumbnail.png": "f92e2ed64b3c35235d2bdfec54c83760",
"assets/assets/images/thumbnails/tg_thumbnail.png": "d9d1bba6e1a120bab9593d4d8e169307",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "a8aa01b6bd02576f114caafd69be7c32",
"assets/NOTICES": "272914d260e7bf05506b1ee27009fae2",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.ico": "16f7315a317f898c6e3239f10b7405fc",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/Icon-192.png": "d145f16cf0064920c21385f7e0aa656c",
"icons/Icon-512.png": "8e54c1d43da14dc190791358fe5d6c0d",
"icons/Icon-maskable-192.png": "60a1cc7967fc7c736a1ffca6adec0e09",
"icons/Icon-maskable-512.png": "b9de8045206740bbd67b8788435680e3",
"index.html": "9debcf5e58becc8d9dd7918829874a30",
"/": "9debcf5e58becc8d9dd7918829874a30",
"main.dart.js": "43a4f672a558375790adef5762cea276",
"manifest.json": "49a245640859428f283e65e222f5b5eb",
"version.json": "d14a8eb3ab1b1de8f6183226770eb302"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
