Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E9BEEA2
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Sep 2019 11:42:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B0B5C36B3F
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Sep 2019 09:42:35 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ABE3C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2019 09:42:33 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4EF9520006;
 Thu, 26 Sep 2019 09:42:32 +0000 (UTC)
Date: Thu, 26 Sep 2019 11:42:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20190926114231.4b3f0a7b@xps13>
In-Reply-To: <fa7563df3038453da3bda06da03fb51d@SFHDAG6NODE3.st.com>
References: <20190920072012.17841-1-patrick.delaunay@st.com>
 <e9bfec17-f534-ce8a-fba0-067f8a1c7131@denx.de>
 <fa7563df3038453da3bda06da03fb51d@SFHDAG6NODE3.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Christophe KERELLO <christophe.kerello@st.com>,
 Quentin Schulz <quentin.schulz@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] cmd: mtd: solve bad block support in
	erase command
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgUGF0cmljaywKClBhdHJpY2sgREVMQVVOQVkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPiB3
cm90ZSBvbiBUaHUsIDI2IFNlcCAyMDE5CjA5OjMxOjQ2ICswMDAwOgoKPiBIaSBTdGVmYW4sCj4g
Cj4gPiBGcm9tOiBTdGVmYW4gUm9lc2UgPHNyQGRlbnguZGU+Cj4gPiBTZW50OiB2ZW5kcmVkaSAy
MCBzZXB0ZW1icmUgMjAxOSAxMToyMAo+ID4gCj4gPiBIaSBQYXRyaWNrLAo+ID4gCj4gPiBPbiAy
MC4wOS4xOSAwOToyMCwgUGF0cmljayBEZWxhdW5heSB3cm90ZTogIAo+ID4gPiBUaGlzIHBhdGNo
IG1vZGlmeSB0aGUgbG9vcCBpbiBtdGQgZXJhc2UgY29tbWFuZCB0byBlcmFzZSBvbmUgYnkgb25l
Cj4gPiA+IHRoZSBibG9ja3MgaW4gdGhlIHJlcXVlc3RlZCBhcmVhLgo+ID4gPgo+ID4gPiBJdCBz
b2x2ZXMgaXNzdWUgb24gIm10ZCBlcmFzZSIgY29tbWFuZCBvbiBuYW5kIHdpdGggZXhpc3Rpbmcg
YmFkCj4gPiA+IGJsb2NrLCB0aGUgY29tbWFuZCBpcyBpbnRlcnJ1cHRlZCBvbiB0aGUgZmlyc3Qg
YmFkIGJsb2NrIHdpdGggdGhlIHRyYWNlOgo+ID4gPiAJIlNraXBwaW5nIGJhZCBibG9jayBhdCAw
eGZmZmZmZmZmZmZmZmZmZmYiCj4gPiA+Cj4gPiA+IEluIE1URCBkcml2ZXIgKG5hbmQvcmF3KSwg
d2hlbiBhIGJhZCBibG9jayBpcyBwcmVzZW50IG9uIHRoZSBNVEQKPiA+ID4gZGV2aWNlLCB0aGUg
ZXJhc2Vfb3AuZmFpbF9hZGRyIGlzIG5vdCB1cGRhdGVkIGFuZCB3ZSBoYXZlIHRoZSBpbml0aWFs
Cj4gPiA+IHZhbHVlIE1URF9GQUlMX0FERFJfVU5LTk9XTiA9IChVTEwpLTEuICAKPiA+IAo+ID4g
U28gaGVyZSBpcyB0aGUgZGlmZmVyZW5jZT8gSSByZW1lbWJlciB0ZXN0aW5nIHRoaXMgb24gYSBi
b2FyZCB3aXRoIFNQSSBOQU5EIGFuZAo+ID4gaGVyZSBpdCB3b3JrZWQgY29ycmVjdGx5LiBCdXQg
eW91ciB0ZXN0IGNhc2UgaXMgd2l0aCBSQVcgTkFORD8gIAo+IAo+IFllcyB3aXRoIFJBVyBuYW5k
Lgo+IAo+IGl0IGlzIHRoZSBkaWZmZXJlbmNlIHRoZSBVLUJvb3QgY29kZSwgZm9yIFNQSSBuYW4g
dXNlOgo+IAlpbnQgbmFuZGRldl9tdGRfZXJhc2UoKQo+IAo+IHRoZSBmYWlsIGFkZHJlc3MgaXMg
YWx3YXlzIHVwZGF0ZWQgCj4gCT0+IGVpbmZvLT5mYWlsX2FkZHIgPSBuYW5kZGV2X3Bvc190b19v
ZmZzKG5hbmQsICZwb3MpOyAgCj4gCj4gIAo+ID4gRG8geW91IGhhdmUgYSBjaGFuZ2UgdG8gYWxz
byB0ZXN0IHRoaXMgb24gYSBib2FyZCB3aXRoIFNQSSBOQU5EPyAgCj4gCj4gSSBkbyB0aGUgdGVz
dCAgYSBTUEktTkFORCB0b2RheS4KPiAKPiBUaGUgbXRkIGVyYXNlIGNvbW1hbmQgd2FzIGZ1bmN0
aW9uYWwgb24gU1BJLUFOTkQgYmVmb3JlIG15IHBhdGNoIDogCj4gSSBjcmVhdGUgMiBiYWQgYmxv
Y2sgbWFudWFsbHkgYW5kIHRoZXkgYXJlIGNvcnJlY3RseSBza2lwcGVkLgo+IAo+IFNUTTMyTVA+
IG10ZCBsaXN0ICAgIAo+IExpc3Qgb2YgTVREIGRldmljZXM6Cj4gKiBzcGktbmFuZDAKPiAgIC0g
ZGV2aWNlOiBzcGktbmFuZEAwCj4gICAtIHBhcmVudDogcXNwaUA1ODAwMzAwMAo+ICAgLSBkcml2
ZXI6IHNwaV9uYW5kCj4gICAtIHR5cGU6IE5BTkQgZmxhc2gKPiAgIC0gYmxvY2sgc2l6ZTogMHgy
MDAwMCBieXRlcwo+ICAgLSBtaW4gSS9POiAweDgwMCBieXRlcwo+ICAgLSBPT0Igc2l6ZTogMTI4
IGJ5dGVzCj4gICAtIE9PQiBhdmFpbGFibGU6IDYyIGJ5dGVzCj4gICAtIDB4MDAwMDAwMDAwMDAw
LTB4MDAwMDEwMDAwMDAwIDogInNwaS1uYW5kMCIKPiAJICAtIDB4MDAwMDAwMDAwMDAwLTB4MDAw
MDAwMjAwMDAwIDogImZzYmwiCj4gCSAgLSAweDAwMDAwMDIwMDAwMC0weDAwMDAwMDQwMDAwMCA6
ICJzc2JsMSIKPiAJICAtIDB4MDAwMDAwNDAwMDAwLTB4MDAwMDAwNjAwMDAwIDogInNzYmwyIgo+
IAkgIC0gMHgwMDAwMDA2MDAwMDAtMHgwMDAwMTAwMDAwMDAgOiAiVUJJIgo+IAo+IFNUTTMyTVA+
IG10ZCBlcmFzZSBzcGktbmFuZDAgMHgwMDAwMDAwMCAweDEwMDAwMDAwICAgICAgICAgICAgICAK
PiBFcmFzaW5nIDB4MDAwMDAwMDAgLi4uIDB4MGZmZmZmZmYgKDIwNDggZXJhc2VibG9jayhzKSkK
PiAweDBmZDAwMDAwOiBiYWQgYmxvY2sKPiAweDBmZDIwMDAwOiBiYWQgYmxvY2sKPiBhdHRlbXB0
IHRvIGVyYXNlIGEgYmFkL3Jlc2VydmVkIGJsb2NrIEBmZDAwMDAwCj4gU2tpcHBpbmcgYmFkIGJs
b2NrIGF0IDB4MGZkMDAwMDAKPiBhdHRlbXB0IHRvIGVyYXNlIGEgYmFkL3Jlc2VydmVkIGJsb2Nr
IEBmZDIwMDAwCj4gU2tpcHBpbmcgYmFkIGJsb2NrIGF0IDB4MGZkMjAwMDAKPiAweDBmZDAwMDAw
OiBiYWQgYmxvY2sKPiAweDBmZDIwMDAwOiBiYWQgYmxvY2sKPiAKPiAKPiA+IFRoYW5rcywKPiA+
IFN0ZWZhbgo+ID4gICAKPiAKPiBXaGF0IGl0IGlzIHRoZSBiZXR0ZXIgc29sdXRpb24gZm9yIHlv
dSA/Cj4gCj4gIHVwZGF0ZSB0aGUgTVREIGNvbW1hbmQgKG15IHBhdGNoKSBvciBhbGxpZ24gdGhl
IGJlaGF2aW9yIG9mIHRoZSAyIE1URCBkZXZpY2VzIAo+IC0gTVREIFJBVyBOQU5EIChuYW5kX2Jh
c2UuYzo6IG5hbmRfZXJhc2VfbmFuZCkKPiAtIE1URCBTUEkgTkFORCAoY29yZS5jOjogbmFuZGRl
dl9tdGRfZXJhc2UpCgpEbyB5b3UgdGhpbmsgaXQgaXMgZWFzeSB0byBtYWtlIHVzZSBvZiBuYW5k
ZGV2X210ZF9lcmFzZSgpIGZyb20gdGhlIHJhdwpOQU5EIGNvcmU/IEl0IGlzIHByb2JhYmx5IGEg
bGl0dGxlIGJpdCBtb3JlIGVsZWdhbnQgKGFuZCBlZmZpY2llbnQpCnRvIGRvIGFsbCBpbiBvbmUg
Z28gdGhhbiBpdGVyYXRpbmcgb3ZlciBlYWNoIGJsb2NrICh3aGlsZSB0aGVyZSBpcyBhCmhlbHBl
ciBpbiB0aGUgY29yZSB0byBkbyB0aGF0KS4KCgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
