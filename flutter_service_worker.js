'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "a67989697c366cf4f821bde4733a6ca8",
"index.html": "3ba8bfa20fd40e44d723a05c07f29415",
"/": "3ba8bfa20fd40e44d723a05c07f29415",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "6d36282559699c50a046e3df3abe288f",
"assets/images/project_images/competitive_project_1.png": "ffbd9274de43e2b5b84cbd7492cfea1e",
"assets/images/project_images/vera_project_3.png": "c1922e88fe7f196b17df1119322eb65d",
"assets/images/project_images/buoyancy_project_1.png": "406da12ceec120651c7ba58cec4c5405",
"assets/images/project_images/competitive_project_2.png": "ecaa889a22feeb413a3032be5bb7e099",
"assets/images/project_images/vera_project_1.png": "1cc8fba502b4b4b5488f886b1cea5da1",
"assets/images/project_images/coming_soon.png": "74036407d977f5f8be7a9d0582748856",
"assets/images/project_images/cpt_project_2.png": "83ebc7751c741eb02a1b754d90a47750",
"assets/images/project_images/vera_project_4.png": "9fa56c7469f70ad8b4da526224ad128a",
"assets/images/project_images/vera_project_5.png": "2059413e56ddfa32d2dba4a128105413",
"assets/images/project_images/buoyancy_project_2.png": "94baa46492129c116c582e4cbb072b59",
"assets/images/project_images/vera_project_2.png": "7ac6eb482497a154fc9806dedddb0349",
"assets/images/project_images/portfolio_project.png": "fa304944f1e9b70e4f5ad3b36702e4fc",
"assets/images/project_images/cpt_project_1.png": "79f71fe38c169a0d1860ac9b05a0cc89",
"assets/images/app_grid.png": "66b333eb904ac238bc1ae46900b3dd07",
"assets/images/portfolio_image.jpg": "f2ef8020e09124299719a34c62427249",
"assets/images/extracurricular_images/extracurriculars_steam_icac.png": "5a5de2e24a02a612da50dd466f3cc541",
"assets/images/extracurricular_images/extracurriculars_physics.png": "a5915cc4f7def9448c3e41a398ee9354",
"assets/images/extracurricular_images/extracurriculars_lakeridge.png": "a4fcdcc375bc76bceea5b95b0d2778ee",
"assets/images/extracurricular_images/extracurriculars_la_silhouette.png": "a4d109d10cd1735767a8b70d982d321b",
"assets/images/extracurricular_images/extracurriculars_caypt.png": "c59c7a363909a54eda8a044f3cb7e409",
"assets/images/extracurricular_images/extracurriculars_spirit_of_math.png": "3cb742c5c62dd65605ead710dadaf0dd",
"assets/images/extracurricular_images/extracurriculars_swim_team.png": "a5113e46bc783a86828e4a5ed3315848",
"assets/images/skill_icons/vscode_icon_skills.png": "e08350af44b70e76401373037e7a7225",
"assets/images/skill_icons/sfml_icon_skills.png": "6a763d49ce9392e39552308f427c93a6",
"assets/images/skill_icons/java_icon_skills.png": "aac9a081f0dbfc4f54aa306ccf989d99",
"assets/images/skill_icons/git_icon_skills.png": "971cc01016fe6deceb89aa43be05efb9",
"assets/images/skill_icons/cpp_icon_skills.png": "6e143ba2a1100f43c155d017855f9baf",
"assets/images/skill_icons/python_icon_skills.png": "7027c178749adcc48bb633d250591350",
"assets/images/skill_icons/flutter_icon_skills.png": "26f950a0732a12dc3a8671886682c824",
"assets/images/skill_icons/dart_icon_skills.png": "23e19520e395eb97aca209bde4361dbc",
"assets/images/name_mask.png": "a01ada7266a9de12030ddb8159ae7b4c",
"assets/images/contact_icons/1.png": "9bbe23856ae23b5aef12ab14d9120a69",
"assets/images/contact_icons/2.png": "08bf92396a79dc83c06a7355d910d6bf",
"assets/fonts/MaterialIcons-Regular.otf": "fe6bf1d836d2c6f1a6a7fccc00bcc2c6",
"assets/NOTICES": "48d284a2792fdd150f30edbf587edbf0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Solid-900.otf": "5b8d20acec3e57711717f61417c1be44",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Brands-Regular-400.otf": "ad72f00c2e15fe9de0e809de8ee2f32e",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Regular-400.otf": "b2703f18eee8303425a5342dba6958db",
"assets/FontManifest.json": "c75f7af11fb9919e042ad2ee704db319",
"assets/AssetManifest.bin": "fc9db1381842080c9f7495d64115121d",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "8b79b951b0ede871d4c7127cdc019630",
"version.json": "cc1fa9cce5af273c0909d105387fee89",
"main.dart.js": "b745cfae7e854c2b51931e3e731914ed"};
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
