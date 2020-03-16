"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const functions = require("firebase-functions");
const universal = require(`${process.cwd()}/dist/server`).app;
exports.ssr = functions.https.onRequest(universal);
//# sourceMappingURL=index.js.map