'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "0d0885aca5adb1c6406e9ac7cf3a88e8",
"version.json": "009c9e65172e010890f7f65fde438006",
"index.html": "c1c5f29031926111ab3ccb7c551c88f9",
"/": "c1c5f29031926111ab3ccb7c551c88f9",
"main.dart.js": "ef37e5b8ff7f2d533bae8fc1fe2f3d12",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"assets/AssetManifest.json": "ba0666ed7f3547d9002185ef5490dd50",
"assets/NOTICES": "308d2c4e608854dc939a57fdcdf2bb46",
"assets/FontManifest.json": "ed737cd07d045391f6529c6d8bdb2ca3",
"assets/AssetManifest.bin.json": "9f6b42450cd65b4e35741ce47895ba3b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "170b6cf2fa8f71dc666b660a72331586",
"assets/fonts/MaterialIcons-Regular.otf": "024e0b006066e2021ac67eece559fdbf",
"assets/assets/images/background.svg": "4707328f6f7aa9c921606c8e4fd9a07a",
"assets/assets/images/crypto.jpg": "a66bf267e56317a97847bd72a5d69804",
"assets/assets/images/villa.png": "63a3cbefdff9ed280690240bc9df272b",
"assets/assets/images/weather.png": "63d7d33451c7a889fcd87d68740ec428",
"assets/assets/images/tasky.png": "c94fcd6ecb91f00e8eb2a1b19d5f0fca",
"assets/assets/images/onboarding.png": "6b5e51b616917a02e60bafb9ffbf6846",
"assets/assets/images/profile.png": "eac8b051140870510a38d721737987dc",
"assets/assets/images/wasteswift.png": "19055641ccb0c272cf885c0b0e57390b",
"assets/assets/images/nova.png": "d1200e148b4d8637d68ceb352d9877a9",
"assets/assets/images/quiz.png": "46b3229a82ee41730787ad1f849aeb52",
"assets/assets/lotties/verified.json": "13ba578f578f5ab57232473511b59765",
"assets/assets/lotties/mobile.json": "2f4d8873f57c144c9c1cc001c19fd2fd",
"assets/assets/icons/figma.svg": "ecade513b9478566efac5a4163e26ac5",
"assets/assets/icons/restApi.svg": "b6a67396ea28b655f7fcb70369bdd3e3",
"assets/assets/icons/android.svg": "0a9fb442cf77fdd21dc56d0b8cdc5252",
"assets/assets/icons/firebase.svg": "5de18648101ab5ae5e11ccaf36631986",
"assets/assets/icons/java.svg": "832331d4937e354c16dd25d25b9281c3",
"assets/assets/icons/github.svg": "c7f4f8cd4e1d67c295179575eab41e59",
"assets/assets/icons/verified.svg": "cce0d54faf794fb2c1847fbab12090ee",
"assets/assets/icons/flutter.svg": "749737f954a8acaae1b3d389b3fc857f",
"assets/assets/icons/instagram.svg": "01769ce5321dfdba8b63d51e85f4bc9b",
"assets/assets/icons/git.svg": "1e85d5c17b9aaa5a64d487e57d7d8cbe",
"assets/assets/icons/mongodb.svg": "ebf723d47dc4203868088d005452543b",
"assets/assets/icons/dart.svg": "7afdb9090bfaf501eb648a883a2a1882",
"assets/assets/icons/facebook.svg": "f03662aa4bdccfae95f611cb6d7d7c82",
"assets/assets/icons/c.svg": "1a9824eaa069d092a75716a8fcce0700",
"assets/assets/icons/postman.svg": "fbfb57a181ce251926d686d12e6cee5a",
"assets/assets/icons/linkedin.svg": "3edb84837155a86e00faea33d19bb25f",
"assets/assets/icons/twitter.svg": "0bb01ad606f634b08422ad45aa30311f",
"assets/assets/icons/mysql.svg": "b5ca628a30b5ec34ae40d7dad1eaba1e",
"assets/assets/pdfs/resume.pdf": "fda0e810c5e8f443c0a17d7cb850810c",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/Poppins-Bold.ttf": "7940efc40d8e3b477e16cc41b0287139",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
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
