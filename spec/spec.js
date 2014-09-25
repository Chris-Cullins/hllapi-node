'use strict';
var hllapi = require("../hllapi.js");

describe("testing HLLAPI wrapper", function() {

    it("has function connectPresentationSpace", function() {
        expect(hllapi.connectPresentationSpace()).toBeDefined();
    });
    it("has function disconnectPresentationSpace", function() {
        expect(hllapi.disconnectPresentationSpace()).toBeDefined();
    });
    it("has function sendKey", function() {
        expect(hllapi.sendKey()).toBeDefined();
    });
    it("has function wait", function() {
        expect(hllapi.wait()).toBeDefined();
    });
    it("has function copyPresentationSpace", function() {
        expect(hllapi.copyPresentationSpace()).toBeDefined();
    });
    it("has function searchPresentationSpace", function() {
        expect(hllapi.searchPresentationSpace()).toBeDefined();
    });
    it("has function queryCursorLocation", function() {
        expect(hllapi.queryCursorLocation()).toBeDefined();
    });
    it("has function copyPresentationSpaceToString", function() {
        expect(hllapi.copyPresentationSpaceToString()).toBeDefined();
    });
    it("has function setSessionParameters", function() {
        expect(hllapi.setSessionParameters()).toBeDefined();
    });
    it("has function pause", function() {
        expect(hllapi.pause()).toBeDefined();
    });
    it("has function querySessionStatus", function() {
        expect(hllapi.querySessionStatus()).toBeDefined();
    });
    it("has function startHostNotification", function() {
        expect(hllapi.startHostNotification()).toBeDefined();
    });
    it("has function queryHostUpdate", function() {
        expect(hllapi.queryHostUpdate()).toBeDefined();
    });
    it("has function stopHostNotification", function() {
        expect(hllapi.stopHostNotification()).toBeDefined();
    });
    it("has function findFieldPosition", function() {
        expect(hllapi.findFieldPosition()).toBeDefined();
    });
    it("has function copyStringtoField", function() {
        expect(hllapi.copyStringtoField()).toBeDefined();
    });
    it("has function copyFieldtoString", function() {
        expect(hllapi.copyFieldtoString()).toBeDefined();
    });
});
