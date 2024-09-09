Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28843971EDC
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Sep 2024 18:14:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41EAFC6DD9E;
	Mon,  9 Sep 2024 16:14:01 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 535A5C6DD66
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Sep 2024 16:13:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BF89E88B11;
 Mon,  9 Sep 2024 18:13:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1725898433;
 bh=FUXuQPoEy5z3anhIbOWZnJkHWp+dwoSWYHBOM9CngVk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UnyW3Q+AxUjWkpRCqyXQ7MCvzVfq9TDa309XMZyPJduryI8Qe88A5g65vhUUtfIFA
 PVHlZzGGtgcyosNqE61eborNv6dErihvvkT70eWT2ZGQJS7ClyqfXFHkzOVr7aNwpw
 jeFGucrPnZu0VC2xGrEN/DD8yWFOWXkuhaBx+h6q5J0ajQrIY54bB/0wfZhyAeNnf8
 IfgGQ1GQMGcEeS9JnutApSQrV1MKP+04+d1v02dkfXkl40b1FmFtie4iMB7IXxf0MW
 zHYa4ZYihauQ2L81QJBUa3FwDDs6JFKxeQvcbjqam0rK1qKpBWYKcreLvKddILbvlF
 cgHa2lZEsYNSw==
Message-ID: <e5837ce4-0a14-4822-960d-6ab667a9f4b1@denx.de>
Date: Mon, 9 Sep 2024 18:10:52 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAPVz0n2-DCKDcVrAi00kF6yDcE2bN1mtUhzBcw7JDiZoXgzu0w@mail.gmail.com>
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

T24gOC8yMC8yNCA5OjA4IEFNLCBTdnlhdG9zbGF2IFJ5aGVsIHdyb3RlOgo+INC/0L0sIDE5INGB
0LXRgNC/LiAyMDI04oCv0YAuINC+IDIwOjI3IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPiDQ
v9C40YjQtToKPj4KPj4gT24gOC8xLzI0IDI6MjggQU0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4g
T24gNy8yOS8yNCAxOjU1IFBNLCBTdnlhdG9zbGF2IFJ5aGVsIHdyb3RlOgo+Pj4KPj4+IFsuLi5d
Cj4+Pgo+Pj4+Pj4+IFdoYXQgaXMgdGhlIHByb2JsZW0geW91IG9ic2VydmUgb24gdGVncmEgMyA/
Cj4+Pj4+PiBpMmMgbGluZSBmYWlscyBzaW5jZSBpdCBwcm9iZXMgaW4gc3BsIHdpdGggeW91ciBw
YXRjaCwgYnV0IGl0IGRvZXMgbm90Cj4+Pj4+PiByZWxvY2F0ZSBhbmQgdGhlbiBwcm9iZXMgb25j
ZSBtb3JlIGFmdGVyIHJlbG9jYXRpb24uIFByb2JlIGZhaWxzIGFsb25nCj4+Pj4+PiB3aXRoIGFs
bCBkZXZpY2VzIG9uIHNhbWUgbGluZS4KPj4+Pj4KPj4+Pj4gQ291bGQgaXQgYmUgdGhhdCB5b3Ug
ZWl0aGVyIGhhdmUgdG86Cj4+Pj4+IC0gQWRkIERNX0kyQyB0byB0ZWdyYSAzIFNQTAo+Pj4+PiAt
IFJlbW92ZSBib290cGgtKiBmcm9tIERUIHRvIHJlbW92ZSB0aGUgcmVndWxhdG9yIG5vZGUgZnJv
bSBTUEwKPj4+Pj4gLSAvZGVsZXRlLXByb3BlcnR5LyByZWd1bGF0b3ItYWx3YXlzLW9uOyBhbmQg
L2RlbGV0ZS1wcm9wZXJ0eS8KPj4+Pj4gcmVndWxhdG9yLWJvb3Qtb247IGluIC11LWJvb3QuZHRz
aSB0byBwcmV2ZW50IHRoZSByZWd1bGF0b3IgZnJvbSBiZWluZwo+Pj4+PiBlbmFibGVkIGluIFNQ
TCA/Cj4+Pj4+Cj4+Pj4gT2J2aW91c2x5IE5PLCB5b3UgcHJvcG9zZSBub25zZW5zZS4gU2FtZSBk
dHMgaXMgdXNlZCBmb3IgYm90aCBzdGFnZXMuCj4+Pgo+Pj4gRFQgc291cmNlIHllcywgRFQgYmxv
YiBsaWtlbHkgbm8uCj4+Pgo+Pj4+IEFuZCBJIGhhdmUgdG8gYWRkIGhhY2staXNoIHN0dWZmIGp1
c3QgYmVjYXVzZSB5b3Ugd2FubmEgaW50cm9kdWNlIGNvZGUKPj4+PiB3aGljaCBjYXVzZXMga25v
d24gcmVncmVzc2lvbnMuCj4+Pgo+Pj4gSSBhbSB0cnlpbmcgdG8gdW5kZXJzdGFuZCB3aGF0IHBy
b2JsZW0gdGhlcmUgaXMgb24gdGVncmEgMywgYnV0IGl0IGlzCj4+PiBzdGlsbCBub3QgY2xlYXIg
dG8gbWUuCj4+Pgo+Pj4gSXMgdGhlIHByb2JsZW0gc29tZWhvdyByZWxhdGVkIHRvIFBNSUNzICg/
KSBiZWluZyBwcm9iZWQgaW4gU1BMICg/KQo+Pj4gYmVjYXVzZSB0aGV5IGhhdmUgcmVndWxhdG9y
cyAoPykgd2hpY2ggYXJlIG1hcmtlZCBhcyByZWd1bGF0b3ItYWx3YXlzLW9uCj4+PiA/IElmIHNv
LCB0aGVuIHRoaXMgaXMgY29ycmVjdCBiZWhhdmlvciwgYW5kIGlmIHRoaXMgaXMgbm90IGRlc2ly
ZWQgaW4KPj4+IFNQTCwgdGhlbiB5b3UgY2FuIHJlbW92ZSB0aGlzIHByb3BlcnR5IGZyb20gU1BM
IERUIGluIC11LWJvb3QuZHRzaSB1c2luZwo+Pj4gL2RlbGV0ZS1wcm9wZXJ0eS8gLgo+Pj4KPj4+
IFsuLi5dCj4+Pgo+Pj4+ICJXZSBtdXN0IG5vdCBwcm9iZSB0aGluZ3MgYXMgd2UgZ28uIFRoZXJl
IG1pZ2h0IGJlIG90aGVyCj4+Pj4gZGVwZW5kZW5jaWVzIG5vdCB5ZXQgYm91bmQuIEl0IG1heSBh
bHNvIHRha2Ugc29tZSB0aW1lLiBUaGlzIGlzIG5vdAo+Pj4+IGZvbGxvd2luZyBkcml2ZXIgbW9k
ZWwgZGVzaWduLCBzb3JyeS4KPj4+Pgo+Pj4+IFNvIHBsZWFzZSB0aGluayBvZiBhIHdheSB0byBk
byB0aGlzIHByb3Blcmx5LiIKPj4+Cj4+PiBXaGF0IGlzIHRoaXMgcXVvdGUgYWJvdXQgPyBXaGVy
ZSBpcyB0aGlzIGZyb20gPwo+Pgo+PiBXaGF0IGlzIHRoZSBwcm9ibGVtIHdpdGggVGVncmEgMyBh
bmQgdGhpcyBwYXRjaHNldCA/Cj4+Cj4+IENhbiB5b3UgcGxlYXNlIGV4cGxhaW4gdGhhdCBzbyB0
aGlzIHBhdGNoc2V0IGNhbiBtb3ZlIGZvcndhcmQgPwo+Pgo+IAo+IHdpdGggeW91ciBjaGFuZ2Vz
Cj4gCj4gVS1Cb290IDIwMjQuMDctMDA2OTYtZ2UyMTdlMjc2OWRiOS1kaXJ0eSAoQXVnIDIwIDIw
MjQgLSAwOTo1NToyOSArMDMwMCkKPiAKPiBTb0M6IHRlZ3JhMTE0Cj4gTW9kZWw6IE5WSURJQSBU
ZWdyYSBOb3RlIDcKPiBCb2FyZDogTlZJRElBIFRlZ3JhVGFiCj4gRFJBTTogIDEgR2lCCj4gdGVn
cmFfaTJjX3Byb2JlOiBjYWxsZWQKPiBpMmM6IGNvbnRyb2xsZXIgYnVzIDAgYXQgNzAwMGQwMDAs
IHNwZWVkIDA6IHRlZ3JhX2kyY19wcm9iZTogZXhpdAo+IGkyY19pbml0X2NvbnRyb2xsZXI6IHNw
ZWVkPTQwMDAwMAo+IGkyY19pbml0X2NvbnRyb2xsZXI6IENMS19ESVZfU1REX0ZBU1RfTU9ERSBz
ZXR0aW5nID0gMjUKPiBpMmNfeGZlcjogMiBtZXNzYWdlcwo+IGkyY194ZmVyOiBjaGlwPTB4NTgs
IGxlbj0weDEKPiBpMmNfd3JpdGVfZGF0YTogY2hpcD0weDU4LCBsZW49MHgxCj4gd3JpdGVfZGF0
YTogIDB4MzcKPiBwa3QgaGVhZGVyIDEgc2VudCAoMHgxMDAxMCkKPiBwa3QgaGVhZGVyIDIgc2Vu
dCAoMHgwKQo+IHBrdCBoZWFkZXIgMyBzZW50ICgweDEwMGIwKQo+IHBrdCBkYXRhIHNlbnQgKDB4
MzcpCj4gdGVncmFfaTJjX3dyaXRlX2RhdGE6IEVycm9yICgtMSkgISEhCj4gaTJjX3dyaXRlX2Rh
dGEoKTogcmM9LTEKPiBpMmNfd3JpdGU6IGVycm9yIHNlbmRpbmcKPiByZWFkIGVycm9yIGZyb20g
ZGV2aWNlOiBiZDI2ZjhlMCByZWdpc3RlcjogMHgzNyEKClRoaXMgc2VlbXMgbGlrZSB0aGUgUE1J
QyBkcml2ZXIgKHBhbG1hcz8pIGlzIHRyeWluZyB0byByZWFkIHJlZ2lzdGVyIAoweDM3IFBHT09E
IGFuZCB0aGUgSTJDIHRyYW5zZmVyIGZhaWxzIC4gV2h5IGRvZXMgdGhlIEkyQyB0cmFuc2ZlciBm
YWlsID8KCllvdSBkaWQgbWVudGlvbiBzb21ldGhpbmcgcmVnYXJkaW5nIEkyQy9QTUlDIGRyaXZl
ciBwcm9iZSB0aW1pbmcsIGJ1dCBpdCAKc2VlbXMgdGhlIEkyQyBkcml2ZXIgYW5kIFBNSUMgZHJp
dmVycyBwcm9iZSByb3VnaGx5IGFyb3VuZCB0aGUgc2FtZSB0aW1lIAppbiBib3RoIHBhc3MgYW5k
IGZhaWwgY2FzZXMgPwoKSXQgc2VlbXMgdGhlIHRlZ3JhMyBEVHMgaGF2ZSBtb3N0IG9mIHRoZSBQ
TUlDIHJlZ3VsYXRvcnMgbWFya2VkIGFzIApib290LW9uIGFuZCBhbHdheXMtb24gLCBzbyBlbmFi
bGluZyB0aGUgcmVndWxhdG9ycyBlYXJseSBpcyB0aGUgcmlnaHQgCnRoaW5nIHRvIGRvLgoKWy4u
Ll0KCj4gU29DOiB0ZWdyYTExNAo+IE1vZGVsOiBOVklESUEgVGVncmEgTm90ZSA3Cj4gQm9hcmQ6
IE5WSURJQSBUZWdyYVRhYgo+IERSQU06ICAxIEdpQgo+IHRlZ3JhX2kyY19wcm9iZTogY2FsbGVk
Cj4gaTJjOiBjb250cm9sbGVyIGJ1cyAwIGF0IDcwMDBkMDAwLCBzcGVlZCAwOiB0ZWdyYV9pMmNf
cHJvYmU6IGV4aXQKPiBpMmNfaW5pdF9jb250cm9sbGVyOiBzcGVlZD00MDAwMDAKPiBpMmNfaW5p
dF9jb250cm9sbGVyOiBDTEtfRElWX1NURF9GQVNUX01PREUgc2V0dGluZyA9IDI1Cj4gcGt0IGhl
YWRlciAxIHNlbnQgKDB4MTAwMTApCj4gcGt0IGhlYWRlciAyIHNlbnQgKDB4MCkKPiBwa3QgaGVh
ZGVyIDMgc2VudCAoMHhiMCkKPiBwa3QgZGF0YSBzZW50ICgweDApCj4gaTJjX3hmZXI6IDIgbWVz
c2FnZXMKPiBpMmNfeGZlcjogY2hpcD0weDU4LCBsZW49MHgxCj4gaTJjX3dyaXRlX2RhdGE6IGNo
aXA9MHg1OCwgbGVuPTB4MQo+IHdyaXRlX2RhdGE6ICAweGZiClRoaXMgc2VlbXMgdG8gYmUgYWNj
ZXNzIHRvIHJlZ2lzdGVyIDB4ZmIgLCBpLmUuIHNvbWV0aGluZyBlbHNlID8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
