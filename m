Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA639B7BD8
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Oct 2024 14:39:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23927C78035;
	Thu, 31 Oct 2024 13:39:28 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7C5DC78034
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 13:39:20 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4XfQ861hSLz9sdG;
 Thu, 31 Oct 2024 14:39:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1730381958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vWeR805Tg+XVxby5opKNPnTLQsYj3PzgbffAxSpzfHU=;
 b=UsdoEse2eKpCeVX8VSHYLufIVO6E/8Vd9uh97mdclF7SVZpJ76ZhqseTKvJ3w5g8VFxwIg
 /rS5bpmnjwawNVKM04jUhaQlVi6dRVqhMqyLgPuQi3FVm0o/6Oo+WITSdmgYP7C4gUMcDd
 Trq5yqSICvWAdvNXYHYuJLHy6V7IzSlKdyHy3xkr8D8lDuethI+DW13tg42Rqcb3ypfld3
 w37fb3F6BQAE67+SMvg5SrEgI2a+SfDfRuvav5YiN7SBgX9/oRmxtEfCOUONfxB2Z3va/c
 RZWDo0cXhEx9/fiIDFbtjqJPoM4huqANBH0Jf1E74f053Ket5mcDQx+e9bz1Qw==
Message-ID: <997b584a-8065-48dd-9bbf-d56dbcb18626@mailbox.org>
Date: Thu, 31 Oct 2024 14:39:14 +0100
MIME-Version: 1.0
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Tom Rini <trini@konsulko.com>,
 Michal Simek <michal.simek@amd.com>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
 <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
 <19fc4486-f8fe-4286-8941-76ff2a81b7d9@linaro.org>
 <CAMty3ZAJrKvUAxWg9CfKtyrjw+WnHOgwkfAJb+N-7d3NyXUrxA@mail.gmail.com>
 <f797cb27-84ca-41c3-83a5-b9044f2d5e5c@linaro.org>
 <3835b139-ae37-423e-8a24-a958ece69c0d@amd.com>
 <20241030165618.GP2558755@bill-the-cat>
 <37c64d4a-1d5b-4f5e-bf2d-6e2a8b6b7669@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <37c64d4a-1d5b-4f5e-bf2d-6e2a8b6b7669@linaro.org>
X-MBO-RS-META: 68hnnwuyz8uajwkwcciyke3nb9mhn4uf
X-MBO-RS-ID: 4e939db9966b9ce266f
Cc: Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/9] mtd: spi-nor: Remove recently added
 nor->addr_width == 3 test
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

T24gMTAvMzEvMjQgODoxMCBBTSwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKPiAKPiAKPiBPbiAxMC8z
MC8yNCA0OjU2IFBNLCBUb20gUmluaSB3cm90ZToKPj4gT24gV2VkLCBPY3QgMzAsIDIwMjQgYXQg
MDQ6MjA6MzJQTSArMDEwMCwgTWljaGFsIFNpbWVrIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAxMC8z
MC8yNCAxNTo0OSwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMTAvMzAv
MjQgMjoxNyBQTSwgSmFnYW4gVGVraSB3cm90ZToKPj4+Pj4gT24gV2VkLCBPY3QgMzAsIDIwMjQg
YXQgNDoxNeKAr1BNIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4gd3Jv
dGU6Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBPbiAxMC8zMC8yNCAxMDozMyBBTSwgSmFn
YW4gVGVraSB3cm90ZToKPj4+Pj4+PiBIaSBNYXJlaywKPj4+Pj4+Pgo+Pj4+Pj4+IE9uIFN1biwg
T2N0IDI3LCAyMDI0IGF0IDE6NDjigK9BTSBNYXJlayBWYXN1dAo+Pj4+Pj4+IDxtYXJlay52YXN1
dCtyZW5lc2FzQG1haWxib3gub3JnPiB3cm90ZToKPj4+Pj4+Pj4KPj4+Pj4+Pj4gUmVtb3ZlIHVu
ZG9jdW1lbnRlZCBub3ItPmFkZHJfd2lkdGggPT0gMyB0ZXN0LiBUaGlzIHdhcyBhZGRlZCBpbiBj
b21taXQKPj4+Pj4+Pj4gNWQ0MGIzZDM4NGRjICgibXRkOiBzcGktbm9yOiBBZGQgcGFyYWxsZWwg
YW5kIHN0YWNrZWQgbWVtb3JpZXMgc3VwcG9ydCIpCj4+Pj4+Pj4+IHdpdGhvdXQgYW55IGV4cGxh
bmF0aW9uIGluIHRoZSBjb21taXQgbWVzc2FnZS4gUmVtb3ZlIGl0Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBUaGlzIGFsc28gaGFzIGEgYmFkIHNpZGUtZWZmZWN0IHdoaWNoIGJyZWFrcyBSRUFEIG9wZXJh
dGlvbiBvZiBldmVyeSBTUEkgTk9SCj4+Pj4+Pj4+IHdoaWNoIGRvZXMgbm90IHVzZSBhZGRyX3dp
ZHRoID09IDMsIGUuZy4gczI1ZnM1MTJzIGRvZXMgbm90IHdvcmsgYXQgYWxsLiBUaGlzCj4+Pj4+
Pj4+IGlzIGJlY2F1c2UgaWYgYWRkcl93aWR0aCAhPSAzLCByZW1fYmFua19sZW4gaXMgYWx3YXlz
IDAsIGFuZCBpZiByZW1fYmFua19sZW4KPj4+Pj4+Pj4gaXMgMCwgdGhlbiByZWFkX2xlbiBpcyAw
IGFuZCBpZiByZWFkX2xlbiBpcyAwLCB0aGVuIHRoZSBzcGlfbm9yX3JlYWQoKSByZXR1cm5zCj4+
Pj4+Pj4+IC1FSU8uCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEJhc2ljIHJlcHJvZHVjZXIgaXMgYXMgZm9s
bG93czoKPj4+Pj4+Pj4gIgo+Pj4+Pj4+PiA9PiBzZiBwcm9iZSA7IHNmIHJlYWQgMHg1MDAwMDAw
MCAwIDB4MTAwMDAKPj4+Pj4+Pj4gU0Y6IERldGVjdGVkIHMyNWZzNTEycyB3aXRoIHBhZ2Ugc2l6
ZSAyNTYgQnl0ZXMsIGVyYXNlIHNpemUgMjU2IEtpQiwgdG90YWwgNjQgTWlCCj4+Pj4+Pj4+IGRl
dmljZSAwIG9mZnNldCAweDAsIHNpemUgMHgxMDAwMAo+Pj4+Pj4+PiBTRjogNjU1MzYgYnl0ZXMg
QCAweDAgUmVhZDogRVJST1IgLTUKPj4+Pj4+Pj4gIgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBGaXhlczog
NWQ0MGIzZDM4NGRjICgibXRkOiBzcGktbm9yOiBBZGQgcGFyYWxsZWwgYW5kIHN0YWNrZWQgbWVt
b3JpZXMgc3VwcG9ydCIpCj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJl
ay52YXN1dCtyZW5lc2FzQG1haWxib3gub3JnPgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gQ2M6IEFu
ZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPgo+Pj4+Pj4+PiBDYzogQXNob2sg
UmVkZHkgU29tYSA8YXNob2sucmVkZHkuc29tYUBhbWQuY29tPgo+Pj4+Pj4+PiBDYzogSmFnYW4g
VGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+Pj4+Pj4+IENjOiBNaWNoYWVsIFdh
bGxlIDxtd2FsbGVAa2VybmVsLm9yZz4KPj4+Pj4+Pj4gQ2M6IE1pY2hhbCBTaW1layA8bWljaGFs
LnNpbWVrQGFtZC5jb20+Cj4+Pj4+Pj4+IENjOiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hv
dGFyZEBmb3NzLnN0LmNvbT4KPj4+Pj4+Pj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2su
ZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+Pj4+Pj4+IENjOiBQcmF0eXVzaCBZYWRhdiA8cC55YWRh
dkB0aS5jb20+Cj4+Pj4+Pj4+IENjOiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAY2hl
cnJ5LmRlPgo+Pj4+Pj4+PiBDYzogU2VhbiBBbmRlcnNvbiA8c2VhbmdhMkBnbWFpbC5jb20+Cj4+
Pj4+Pj4+IENjOiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4KPj4+Pj4+Pj4gQ2M6IFRh
a2FoaXJvIEt1d2FubyA8VGFrYWhpcm8uS3V3YW5vQGluZmluZW9uLmNvbT4KPj4+Pj4+Pj4gQ2M6
IFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5jb20+Cj4+Pj4+Pj4+IENjOiBUdWRvciBBbWJhcnVz
IDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4+Pj4+Pj4+IENjOiBWZW5rYXRlc2ggWWFkYXYg
QWJiYXJhcHUgPHZlbmthdGVzaC5hYmJhcmFwdUBhbWQuY29tPgo+Pj4+Pj4+PiBDYzogdS1ib290
QGxpc3RzLmRlbnguZGUKPj4+Pj4+Pj4gQ2M6IHVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KPj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4KPj4+Pj4+PiBJcyB0aGlzIHBhdGNoLXNl
dCBuZXh0IHZlcnNpb24gZm9yICdwcmV2aW91cycgcmV2ZXJ0ZWQgc2VyaWVzPwo+Pj4+Pj4+Cj4+
Pj4+Pgo+Pj4+Pj4gbXkgMmM6IEkgdGhpbmsgSSBsZWFuIHRvd2FyZHMgcmV2ZXJ0aW5nIHRoZSBz
dGFja2VkL3BhcmFsbGVsIHN1cHBvcnQuCj4+Pj4+PiBUaGUgb25seSBvbmUgdGhhdCBiZW5lZml0
cyBvZiBpcyBBTUQsIHdoaWxlIGFmZmVjdGluZyB0aGUgY29yZSBjb2RlCj4+Pj4+PiBxdWFsaXR5
LiBJdCBhbHNvIHNsb3dzIGRvd24gZnVydGhlciBjb250cmlidXRpb25zIGFuZCBJIGFzc3VtZSBp
dAo+Pj4+Pj4gaGFyZGVucyBtYWludGFpbmVyJ3Mgam9iLgo+Pj4+Pgo+Pj4+PiBJIGRpZCB0cnkg
dGhpcyBiZWZvcmUgYW5kIGl0IGlzIGhhcmQgdG8gc2VwYXJhdGUgZnJvbSB0aGUgY29yZS4gYW5k
IGF0Cj4+Pj4+IHRoZSBzYW1lIHRpbWUgaXQgaXMgaGFyZCB0byBtYWludGFpbiB0aGUgY29yZSB0
b28uCj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gRXZlbiBpZiBJICh3ZT8pIGhhdmVuJ3QgbWFkZSBteSBt
aW5kIG9uIGhvdyB0byBiZXN0IGltcGxlbWVudCB0aGlzLCBpdCdzCj4+Pj4+PiBjbGVhciB0aGF0
IGl0IHNoYWxsIGJlIGFib3ZlIFNQSSBOT1Igd2l0aG91dCBhZmZlY3RpbmcgY3VycmVudCBkZXZp
Y2VzLgo+Pj4+Pj4KPj4+Pj4+IE5vdCBzdXJlIGlmIGl0J3MgZmluZSB0byByZXZlcnQgZXZlcnl0
aGluZywgaGF2ZW4ndCBmb2xsb3dlZCB1LWJvb3QKPj4+Pj4+IGxhdGVseSwgeW91ciBjaG9pY2Ug
dG8gbWFrZS4KPj4+Pj4KPj4+Pj4gSWYgd2UgZmluZCBhIHdheSAobm90IHN1cmUgaWYgaXQncyBw
b3NzaWJsZSkgc2VwYXJhdGUgbGlrZSBhIHdyYXBwZXIKPj4+Pj4gb3IgZml4IHRoZSB0aGluZ3Mg
d2l0aG91dCByZXZlcnQgLSB0aGVzZSBhcmUgdHdvIHBvaW50cyBJIGNhbiBzZWUgYXMKPj4+Pj4g
b2Ygbm93Lgo+Pj4+Pgo+Pj4+Cj4+Pj4gVGhlbiB0aGlzIHNldCBzaGFsbCBoZWxwIG1vdmUgaW4g
dGhpcyBkaXJlY3Rpb24uIFNvbWUgaW52b2x2ZW1lbnQgZnJvbQo+Pj4+IHRoZSBzdGFja2VkL3Bh
cmFsbGVsIGF1dGhvcnMgd291bGQgYmUgbmljZSBoZXJlLCBhbmQgc29tZSBjb21taXRtZW50Cj4+
Pj4gdGhhdCB0aGUgY3VycmVudCBzdGF0dXMgaW4ganVzdCBhIHRlbXBvcmFyeSBzaXR1YXRpb24u
Cj4+Pgo+Pj4gSSBob3BlIHRoYXQgYnkgYXV0aG9ycyB5b3UgbWVhbiBTVyBvd25lcnMgbm90IHJl
YWxseSBIVyBhdXRob3JzIG9mIHRoaXMgd2lyaW5nLgo+Pj4gSmFnYW4gaXMgYXdhcmUgdGhhdCB3
ZSBhcmUgdXNpbmcgdGhpcyBjb25maWd1cmF0aW9uIGZvciBxdWl0ZSBhIGxvbmcgdGltZQo+Pj4g
YW5kIHdlIGFyZSBzdGlsbCBoZXJlIGFuZCBub3QgbGVhdmluZy4KPj4+IEFzIHlvdSBrbm93IEFt
aXQgaXMgdHJ5aW5nIHRvIGZpbmQgYSBzb2x1dGlvbiBpbiBMaW51eCBidXQgbm90aGluZyBoYXMg
YmVlbgo+Pj4gYWdyZWVkIHlldC4gSWYgdGhlcmUgaXMgYWdyZWVtZW50IHRvIHNlcGFyYXRlIGl0
IHRvIG93biBkcml2ZXIgb3Igc28gd2Ugd2lsbAo+Pj4gYmUgZGVmaW5pdGVseSB3b3JraW5nIHdp
dGggdS1ib290IHRvIGdldCBpdCB0byB0aGUgc2FtZSBzdGF0ZS4KPj4+Cj4+PiBUaGlzIHBhdGNo
c2V0IGlzIHVzaW5nIHRoZSBsYXRlc3QgYXBwcm92ZWQgRFQgYmluZGluZyBjcmVhdGVkIGJ5IE1p
cXVlbCBhbmQKPj4+IGlmIG5ldyBiaW5kaW5nIGlzIGFjY2VwdGVkIHdlIHdpbGwgYmUgd29ya2lu
ZyB0byBhbGlnbiB0byBpdC4KPj4+IEFsc28gaW50ZW50aW9uIGlzIHRvIGJyaW5nIHRoaXMgZnVu
Y3Rpb25hbGl0eSB0byBjdXN0b21lcnMgYW5kIG5vdCBicmVhawo+Pj4gb3RoZXJzLiBUaGF0J3Mg
d2h5IHRoZXNlIHBhdGNoZXMgYXJlIHB1bGxlZCBpbnRvIHJjMSB0byBnZXQgYmV0dGVyIHRlc3QK
Pj4+IGNvdmVyYWdlLgo+Pj4KPj4+IEFuZCB0byBiZSBmYWlyIHRvIHNheSB2ZXJzaW9uIHdoaWNo
IGhhcyBiZWVuIG1lcmdlZCB3YXMgdjE0IGFuZCBhbnlib2R5Cj4+PiBjb3VsZCBjb21tZW50IGl0
IGJlZm9yZSBhbmQgd2UgYXJlIGRlZmluaXRlbHkgaGVyZSB0byBoZWxwIHRvIHJlc29sdmUgaXNz
dWVzCj4+PiBvbiBvdGhlciBib2FyZHMgY2F1c2VkIGJ5IHRoaXMgcGF0Y2hzZXQuIEJ1dCB3ZSBu
ZWVkIHRvIGhhdmUgaGVscCBmcm9tCj4+PiBvdGhlcnMgYmVjYXVzZSBvYnZpb3VzbHkgd2UgZG9u
J3QgaGF2ZSBvdGhlciBib2FyZHMgYW5kIHRoZXkgYXJlIGxpa2VseSBhbHNvCj4+PiBub3Qgd2ly
ZWQgaW4gQ0kuCj4+Cj4+IFRvIGJlIGNsZWFyLCB3ZSBuZWVkIHRvIHJlc29sdmUgdGhlIHByb2Js
ZW1zIHRoYXQgaGF2ZSBzaG93biB1cCBub3cgb24KPj4gYWxsIG9mIHRoZSBoYXJkd2FyZSB0aGF0
IHdhcyB3b3JraW5nIGluIHYyMDI0LjEwLiBNeSBjdXJyZW50IGluY2xpbmF0aW9uCj4+IGlzIHRv
IG1lcmdlCj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC91Ym9vdC9saXN0
Lz9zZXJpZXM9NDI5OTMyJnN0YXRlPSoKPj4gKGFrYSB0aGlzIHNlcmllcyBpbiBxdWVzdGlvbikg
QVNBUC4KPj4KPiAKPiBXZSBjYW4gc3VyZWx5IGxpdmUgd2l0aCB0aGlzIHRlbXBvcmFyeSBzaXR1
YXRpb24uIE5vdyB0aGF0IHdlJ3JlIGFzc3VyZWQKPiB0byBoYXZlIEFNRCdzIGhlbHAgaW4gbW92
aW5nIGZvcndhcmQsIGl0IGZlZWxzIGxlc3MgbGlrZSBhIHRyYW5zZmVyIG9mCj4gcmVzcG9uc2li
aWxpdHkgb24gdGhlIHBvb3JseSBkZXNpZ25lZCBzdGFja2VkL3BhcmFsbGVsIHNvZnR3YXJlIHN1
cHBvcnQuCj4gRmluZSBieSBtZSB0byBjaG9vc2UgdGhlIHNtYWxsZXIgZml4ZXMvaW1wcm92ZW1l
bnRzIG92ZXIgdGhlIGZ1bGwgcmV2ZXJ0LgpDb25zaWRlcmluZyBob3cgbWFueSB1bmV4cGxhaW5l
ZCBzdWJ0bGUgYnJva2VuIGNoYW5nZXMgZXZlbiB0aGUgZmlyc3QgCmNvbW1pdCBvZiB0aGUgc3Rh
Y2tlZC9wYXJhbGxlbCBzZXJpZXMgaW5jbHVkZWQsIEkgd291bGQgYmUgYmFua2luZyAKdG93YXJk
IGEgZnVsbCByZXZlcnQuIFRoZSBoaW50cyBvbiB3aGljaCBjaGFuZ2VzIHdlcmUgdW5leHBsYWlu
ZWQgYXJlIGluIAp0aGlzIHNlcmllcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
