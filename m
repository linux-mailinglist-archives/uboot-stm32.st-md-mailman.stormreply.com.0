Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0186A973217
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Sep 2024 12:18:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A83EAC71290;
	Tue, 10 Sep 2024 10:18:42 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57E17C6DD9E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 10:18:36 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DD5B988FFB;
 Tue, 10 Sep 2024 12:18:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1725963515;
 bh=obbBx79+BINc2fFD1CAqxPy3MoG0ZM6H/XK3HkCBUn8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y2mOO9FP/pqS9vIggr5KHd//rnA0HHVeJHwAyY7AwZJZCS4ML/+h8l6aAqyITfKwS
 DM2oDWOgz+lTbL3qQ0PpiRhIMG0MGbCI3EoADKPF+USE9vy5s0HgGyNcM5hqf0DJz7
 cEpkbol8J/PAGU52aIH3yWAzBQcBUb7FlQi7fSXwtAmi+v845JWtkK4xxMAseOGbOU
 LFod3bzAC9gLejvGZHgRn9tGZg9qq5rcuZjDRcCKnGJZQJUzI1OARYEnnbdE3kh2kT
 vww5aXASHflH22SSCYSz8OfQ4tHvg8aua9j6IYJTBO2RVNS65p29aRYahdZuPy1ejO
 e6ShJtI0C5NEg==
Message-ID: <f778366b-bdaf-415d-a94e-c995f62e8c71@denx.de>
Date: Tue, 10 Sep 2024 12:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Svyatoslav Ryhel <clamor95@gmail.com>
References: <20240626235717.272219-1-marex@denx.de>
 <a73dffe5-87e3-4e96-965f-9d029f2af8ed@denx.de>
 <CAPVz0n0C6TPdBRUEvJmgAUGAKoetuzr1j=0cMXweP2EqMTwn=g@mail.gmail.com>
 <0910419d-e8ab-4bf9-a083-dc2783afaca1@denx.de>
 <4D07A6E5-F156-44C3-A26D-0F2D913CE92D@gmail.com>
 <18d84528-d2e5-41d6-ae1d-109ee30853b2@denx.de>
 <CAPVz0n2Jzfih0Z85TSQbnz-8OrX4D6UN=anKGTJ=hckRt8f3xA@mail.gmail.com>
 <a95f0d60-2883-4c3d-8a53-ee3ef414cc32@denx.de>
 <CAPVz0n3Ji1sKQK+Lnq8rP3ZqwX3o-kXe2btj93UuVBa3T5C=qw@mail.gmail.com>
 <eced1020-2157-44a4-98a9-845e218529d9@denx.de>
 <45c74c58-98cf-43df-b837-c48b0341c551@denx.de>
 <CAPVz0n2-DCKDcVrAi00kF6yDcE2bN1mtUhzBcw7JDiZoXgzu0w@mail.gmail.com>
 <e5837ce4-0a14-4822-960d-6ab667a9f4b1@denx.de>
 <CAPVz0n323ktF6kb3WHR9JcE+xOzQr9-aWOR47+ZvwQr=ib18rg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAPVz0n323ktF6kb3WHR9JcE+xOzQr9-aWOR47+ZvwQr=ib18rg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Tom Rini <trini@konsulko.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 Sumit Garg <sumit.garg@linaro.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] power: regulator: Trigger probe of
 regulators which are always-on or boot-on
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

T24gOS8xMC8yNCAxMTowNSBBTSwgU3Z5YXRvc2xhdiBSeWhlbCB3cm90ZToKPiDQv9C9LCA5INCy
0LXRgC4gMjAyNOKAr9GALiDQviAxOToxMyBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4g0L/Q
uNGI0LU6Cj4+Cj4+IE9uIDgvMjAvMjQgOTowOCBBTSwgU3Z5YXRvc2xhdiBSeWhlbCB3cm90ZToK
Pj4+INC/0L0sIDE5INGB0LXRgNC/LiAyMDI04oCv0YAuINC+IDIwOjI3IE1hcmVrIFZhc3V0IDxt
YXJleEBkZW54LmRlPiDQv9C40YjQtToKPj4+Pgo+Pj4+IE9uIDgvMS8yNCAyOjI4IEFNLCBNYXJl
ayBWYXN1dCB3cm90ZToKPj4+Pj4gT24gNy8yOS8yNCAxOjU1IFBNLCBTdnlhdG9zbGF2IFJ5aGVs
IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBbLi4uXQo+Pj4+Pgo+Pj4+Pj4+Pj4gV2hhdCBpcyB0aGUgcHJv
YmxlbSB5b3Ugb2JzZXJ2ZSBvbiB0ZWdyYSAzID8KPj4+Pj4+Pj4gaTJjIGxpbmUgZmFpbHMgc2lu
Y2UgaXQgcHJvYmVzIGluIHNwbCB3aXRoIHlvdXIgcGF0Y2gsIGJ1dCBpdCBkb2VzIG5vdAo+Pj4+
Pj4+PiByZWxvY2F0ZSBhbmQgdGhlbiBwcm9iZXMgb25jZSBtb3JlIGFmdGVyIHJlbG9jYXRpb24u
IFByb2JlIGZhaWxzIGFsb25nCj4+Pj4+Pj4+IHdpdGggYWxsIGRldmljZXMgb24gc2FtZSBsaW5l
Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ291bGQgaXQgYmUgdGhhdCB5b3UgZWl0aGVyIGhhdmUgdG86Cj4+
Pj4+Pj4gLSBBZGQgRE1fSTJDIHRvIHRlZ3JhIDMgU1BMCj4+Pj4+Pj4gLSBSZW1vdmUgYm9vdHBo
LSogZnJvbSBEVCB0byByZW1vdmUgdGhlIHJlZ3VsYXRvciBub2RlIGZyb20gU1BMCj4+Pj4+Pj4g
LSAvZGVsZXRlLXByb3BlcnR5LyByZWd1bGF0b3ItYWx3YXlzLW9uOyBhbmQgL2RlbGV0ZS1wcm9w
ZXJ0eS8KPj4+Pj4+PiByZWd1bGF0b3ItYm9vdC1vbjsgaW4gLXUtYm9vdC5kdHNpIHRvIHByZXZl
bnQgdGhlIHJlZ3VsYXRvciBmcm9tIGJlaW5nCj4+Pj4+Pj4gZW5hYmxlZCBpbiBTUEwgPwo+Pj4+
Pj4+Cj4+Pj4+PiBPYnZpb3VzbHkgTk8sIHlvdSBwcm9wb3NlIG5vbnNlbnNlLiBTYW1lIGR0cyBp
cyB1c2VkIGZvciBib3RoIHN0YWdlcy4KPj4+Pj4KPj4+Pj4gRFQgc291cmNlIHllcywgRFQgYmxv
YiBsaWtlbHkgbm8uCj4+Pj4+Cj4+Pj4+PiBBbmQgSSBoYXZlIHRvIGFkZCBoYWNrLWlzaCBzdHVm
ZiBqdXN0IGJlY2F1c2UgeW91IHdhbm5hIGludHJvZHVjZSBjb2RlCj4+Pj4+PiB3aGljaCBjYXVz
ZXMga25vd24gcmVncmVzc2lvbnMuCj4+Pj4+Cj4+Pj4+IEkgYW0gdHJ5aW5nIHRvIHVuZGVyc3Rh
bmQgd2hhdCBwcm9ibGVtIHRoZXJlIGlzIG9uIHRlZ3JhIDMsIGJ1dCBpdCBpcwo+Pj4+PiBzdGls
bCBub3QgY2xlYXIgdG8gbWUuCj4+Pj4+Cj4+Pj4+IElzIHRoZSBwcm9ibGVtIHNvbWVob3cgcmVs
YXRlZCB0byBQTUlDcyAoPykgYmVpbmcgcHJvYmVkIGluIFNQTCAoPykKPj4+Pj4gYmVjYXVzZSB0
aGV5IGhhdmUgcmVndWxhdG9ycyAoPykgd2hpY2ggYXJlIG1hcmtlZCBhcyByZWd1bGF0b3ItYWx3
YXlzLW9uCj4+Pj4+ID8gSWYgc28sIHRoZW4gdGhpcyBpcyBjb3JyZWN0IGJlaGF2aW9yLCBhbmQg
aWYgdGhpcyBpcyBub3QgZGVzaXJlZCBpbgo+Pj4+PiBTUEwsIHRoZW4geW91IGNhbiByZW1vdmUg
dGhpcyBwcm9wZXJ0eSBmcm9tIFNQTCBEVCBpbiAtdS1ib290LmR0c2kgdXNpbmcKPj4+Pj4gL2Rl
bGV0ZS1wcm9wZXJ0eS8gLgo+Pj4+Pgo+Pj4+PiBbLi4uXQo+Pj4+Pgo+Pj4+Pj4gIldlIG11c3Qg
bm90IHByb2JlIHRoaW5ncyBhcyB3ZSBnby4gVGhlcmUgbWlnaHQgYmUgb3RoZXIKPj4+Pj4+IGRl
cGVuZGVuY2llcyBub3QgeWV0IGJvdW5kLiBJdCBtYXkgYWxzbyB0YWtlIHNvbWUgdGltZS4gVGhp
cyBpcyBub3QKPj4+Pj4+IGZvbGxvd2luZyBkcml2ZXIgbW9kZWwgZGVzaWduLCBzb3JyeS4KPj4+
Pj4+Cj4+Pj4+PiBTbyBwbGVhc2UgdGhpbmsgb2YgYSB3YXkgdG8gZG8gdGhpcyBwcm9wZXJseS4i
Cj4+Pj4+Cj4+Pj4+IFdoYXQgaXMgdGhpcyBxdW90ZSBhYm91dCA/IFdoZXJlIGlzIHRoaXMgZnJv
bSA/Cj4+Pj4KPj4+PiBXaGF0IGlzIHRoZSBwcm9ibGVtIHdpdGggVGVncmEgMyBhbmQgdGhpcyBw
YXRjaHNldCA/Cj4+Pj4KPj4+PiBDYW4geW91IHBsZWFzZSBleHBsYWluIHRoYXQgc28gdGhpcyBw
YXRjaHNldCBjYW4gbW92ZSBmb3J3YXJkID8KPj4+Pgo+Pj4KPj4+IHdpdGggeW91ciBjaGFuZ2Vz
Cj4+Pgo+Pj4gVS1Cb290IDIwMjQuMDctMDA2OTYtZ2UyMTdlMjc2OWRiOS1kaXJ0eSAoQXVnIDIw
IDIwMjQgLSAwOTo1NToyOSArMDMwMCkKPj4+Cj4+PiBTb0M6IHRlZ3JhMTE0Cj4+PiBNb2RlbDog
TlZJRElBIFRlZ3JhIE5vdGUgNwo+Pj4gQm9hcmQ6IE5WSURJQSBUZWdyYVRhYgo+Pj4gRFJBTTog
IDEgR2lCCj4+PiB0ZWdyYV9pMmNfcHJvYmU6IGNhbGxlZAo+Pj4gaTJjOiBjb250cm9sbGVyIGJ1
cyAwIGF0IDcwMDBkMDAwLCBzcGVlZCAwOiB0ZWdyYV9pMmNfcHJvYmU6IGV4aXQKPj4+IGkyY19p
bml0X2NvbnRyb2xsZXI6IHNwZWVkPTQwMDAwMAo+Pj4gaTJjX2luaXRfY29udHJvbGxlcjogQ0xL
X0RJVl9TVERfRkFTVF9NT0RFIHNldHRpbmcgPSAyNQo+Pj4gaTJjX3hmZXI6IDIgbWVzc2FnZXMK
Pj4+IGkyY194ZmVyOiBjaGlwPTB4NTgsIGxlbj0weDEKPj4+IGkyY193cml0ZV9kYXRhOiBjaGlw
PTB4NTgsIGxlbj0weDEKPj4+IHdyaXRlX2RhdGE6ICAweDM3Cj4+PiBwa3QgaGVhZGVyIDEgc2Vu
dCAoMHgxMDAxMCkKPj4+IHBrdCBoZWFkZXIgMiBzZW50ICgweDApCj4+PiBwa3QgaGVhZGVyIDMg
c2VudCAoMHgxMDBiMCkKPj4+IHBrdCBkYXRhIHNlbnQgKDB4MzcpCj4+PiB0ZWdyYV9pMmNfd3Jp
dGVfZGF0YTogRXJyb3IgKC0xKSAhISEKPj4+IGkyY193cml0ZV9kYXRhKCk6IHJjPS0xCj4+PiBp
MmNfd3JpdGU6IGVycm9yIHNlbmRpbmcKPj4+IHJlYWQgZXJyb3IgZnJvbSBkZXZpY2U6IGJkMjZm
OGUwIHJlZ2lzdGVyOiAweDM3IQo+Pgo+PiBUaGlzIHNlZW1zIGxpa2UgdGhlIFBNSUMgZHJpdmVy
IChwYWxtYXM/KSBpcyB0cnlpbmcgdG8gcmVhZCByZWdpc3Rlcgo+PiAweDM3IFBHT09EIGFuZCB0
aGUgSTJDIHRyYW5zZmVyIGZhaWxzIC4gV2h5IGRvZXMgdGhlIEkyQyB0cmFuc2ZlciBmYWlsID8K
PiAKPiBZb3UgIGFyZSBhc2tpbmcgbWU/IEJlY2F1c2UgeW91ciBwYXRjaGVzIGJyZWFrIHNvbWUg
aW1wb3J0YW50IHNldHVwIHNlcXVlbmNlLgo+IFBNSUMgbW9kZWwgZG9lcyBub3QgbWF0dGVyLCBh
bGwgYmVoYXZlIHNhbWUgd2F5LgoKVGhlc2UgcmVndWxhdG9yIHBhdGNoZXMgZG8gbm90IG1vZGlm
eSBhbnl0aGluZyByZWxhdGVkIHRvIEkyQyBhbmQgSSAKZG9uJ3Qgb2JzZXJ2ZSB0aGlzIGtpbmQg
b2YgYmVoYXZpb3Igb24gaU1YOE0gb3IgU1RNMzIgcGxhdGZvcm1zLCBzbyBJIApzdXNwZWN0IHRo
aXMgaXMgc29tZXRoaW5nIHNwZWNpZmljIHRvIHRlZ3JhLgoKPj4gWW91IGRpZCBtZW50aW9uIHNv
bWV0aGluZyByZWdhcmRpbmcgSTJDL1BNSUMgZHJpdmVyIHByb2JlIHRpbWluZywgYnV0IGl0Cj4+
IHNlZW1zIHRoZSBJMkMgZHJpdmVyIGFuZCBQTUlDIGRyaXZlcnMgcHJvYmUgcm91Z2hseSBhcm91
bmQgdGhlIHNhbWUgdGltZQo+PiBpbiBib3RoIHBhc3MgYW5kIGZhaWwgY2FzZXMgPwo+IAo+IFll
cywgaGVyZSBJIGFncmVlIHRoYXQgdGhleSBib3RoIHByb2JlIGFuZCBwcm9iZSBwYXNzZXMsIGJ1
dCBJIGFzc3VtZQo+IHRpbWluZyBvZiBpMmMgY2FsbCBpcyBjcml0aWNhbCBhbmQgdGhlcmUgbWF5
IGJlIHNvbWUgZGVwZW5kZW5jeSB3aGljaAo+IGlzIG5vdCByZWFkeS4KCk15IGd1ZXNzIHdvdWxk
IGJlIHBpbm11eCBvciBjbG9jaywgbWF5YmUgdGhlIGkyYyBjb250cm9sbGVyIGlzIG1hcmtlZCBh
cyAKYm9vdHBoLSogaW4gRFQgYW5kIGl0cyBwaW5tdXgvY2xvY2sgaXMgbm90PyBNYXliZSB0aGUg
aTJjIG9uIHRlZ3JhIHdvcmtzIApieSBzaGVlciBjb2luY2lkZW5jZSByaWdodCBub3c/IENhbiB5
b3UgaGF2ZSBhIGxvb2s/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
