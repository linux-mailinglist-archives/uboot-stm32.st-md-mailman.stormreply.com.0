Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB2375DFCD
	for <lists+uboot-stm32@lfdr.de>; Sun, 23 Jul 2023 05:48:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBBE2C6B442;
	Sun, 23 Jul 2023 03:48:46 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 041DCC6A611
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jul 2023 03:48:45 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5221f3affe4so742104a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jul 2023 20:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690084125; x=1690688925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BXKHLELKVjfiL8PvG4FbIIVI+D9B0EihRIhb2H3VI4E=;
 b=buosSmDyREMiTevwBNw/LdMLs/jZWXNWYA2cZ2BvjhD7jcGWaWxCl2qPupa5Bnm9Wl
 xNDEBQEhH7SK0GoEeQ1dEykUxXULaBsXYtrX0E3+SjHUYKDmN7CkV6Io9PpC1YhdGOwp
 nw9p7zXwClAU6BRYr3Lpmk6eOEbuFDhrjU94k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690084125; x=1690688925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BXKHLELKVjfiL8PvG4FbIIVI+D9B0EihRIhb2H3VI4E=;
 b=jKkmb8ty85XuLnWP/QX6djdXGrTN1R/U5FIOm0V75r30tF0zCh8SAyEYEKBYLBML1Y
 4hwcbSO5jWLNg09QpM7+Pt1r9OhMVL4rF3n9nJAaV1oFrfjC0ng8bh/cwWR95x7+CDcy
 qbw8WenKf6KKu+fylI8mKgHQG68KLuBGW/ZWgahMSPohz4aMmSJiFJVVFWjb/Z7bcZdd
 i3ZoB/xALKTyllvDAOqCNHz2nDb4+j1wnywGJxbzZVzp8/Nu4kmBmhCGMU6QOFe7yZOQ
 IfzbfWeOGr2hbYieUoBUQDWni+iBgJm7mlwx1IZKhSMegwbGMTti9sJ7eRAXnoe6l+S9
 6tsw==
X-Gm-Message-State: ABy/qLZmF05CRldsreiQSio3ySYenmgObgjdY39lHYJBQzcdbS+30+7w
 CnoEHQLEHerGl89oFWQIg24VM6XcGVBCPCmCD6pVng==
X-Google-Smtp-Source: APBJJlEtjqhA3doUMRFHZ5UW74xHaJEbN+rPK/EoVqUK8clVLzMhzFDHjkFX3rvvdYdJdp08vKaH5MzqAN68Wjin3jQ=
X-Received: by 2002:aa7:c3c4:0:b0:522:274c:376c with SMTP id
 l4-20020aa7c3c4000000b00522274c376cmr754700edr.38.1690084125353; Sat, 22 Jul
 2023 20:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230720123744.26854-1-clamor95@gmail.com>
 <20230720123744.26854-2-clamor95@gmail.com>
 <CAPnjgZ3BnsiR-=w6Bp5m0eT9ZQ-_MQ-4HpmBierAfxGmTCeE=Q@mail.gmail.com>
 <CAPVz0n1Z_pP+a4+j+856QL2dC=RsMyZb9AB13Pz+Y=-VqKFQfg@mail.gmail.com>
In-Reply-To: <CAPVz0n1Z_pP+a4+j+856QL2dC=RsMyZb9AB13Pz+Y=-VqKFQfg@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 22 Jul 2023 21:48:32 -0600
Message-ID: <CAPnjgZ3pYXiWuc3sMZQhS9xq+m8u+a9QcToUW84bF_iu-tQ7cA@mail.gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 u-boot@dh-electronics.com, Matteo Lisi <matteo.lisi@engicam.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 1/7] power: regulator: expand basic
 reference counter onto all uclass
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

SGkgU3Z5YXRvc2xhdiwKCk9uIFRodSwgMjAgSnVsIDIwMjMgYXQgMjM6MjMsIFN2eWF0b3NsYXYg
UnloZWwgPGNsYW1vcjk1QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiDRh9GCLCAyMCDQu9C40L8uIDIw
MjPigK/RgC4g0L4gMjI6NDMgU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+INC/0LjRiNC1
Ogo+ID4KPiA+IEhpIFN2eWF0b3NsYXYsCj4gPgo+ID4gT24gVGh1LCAyMCBKdWwgMjAyMyBhdCAw
NjozOCwgU3Z5YXRvc2xhdiBSeWhlbCA8Y2xhbW9yOTVAZ21haWwuY29tPiB3cm90ZToKPiA+ID4K
PiA+ID4gQ29tbWl0IGlzIGJhc2VkIG9uIDRmY2JhNWQgKCJyZWd1bGF0b3I6IGltcGxlbWVudCBi
YXNpYyByZWZlcmVuY2UKPiA+ID4gY291bnRlciIpIGJ1dCBleHBhbmRzIHRoZSBpZGVhIHRvIGFs
bCByZWd1bGF0b3JzIGluc3RlYWQgb2YganVzdAo+ID4gPiBmaXhlZC9ncGlvIHJlZ3VsYXRvcnMu
Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFN2eWF0b3NsYXYgUnloZWwgPGNsYW1vcjk1QGdt
YWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL3Bvd2VyL3JlZ3VsYXRvci9yZWd1bGF0
b3ItdWNsYXNzLmMgfCA0MSArKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICBkcml2ZXJzL3Bv
d2VyL3JlZ3VsYXRvci9yZWd1bGF0b3JfY29tbW9uLmMgfCAyMiAtLS0tLS0tLS0tLS0KPiA+ID4g
IGRyaXZlcnMvcG93ZXIvcmVndWxhdG9yL3JlZ3VsYXRvcl9jb21tb24uaCB8IDIxIC0tLS0tLS0t
LS0tCj4gPiA+ICBpbmNsdWRlL3Bvd2VyL3JlZ3VsYXRvci5oICAgICAgICAgICAgICAgICAgfCAg
MiArKwo+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBSZXZpZXdlZC1ieTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+
Cj4gPgo+ID4gbml0IGJlbG93Cj4gPgo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
b3dlci9yZWd1bGF0b3IvcmVndWxhdG9yLXVjbGFzcy5jIGIvZHJpdmVycy9wb3dlci9yZWd1bGF0
b3IvcmVndWxhdG9yLXVjbGFzcy5jCj4gPiA+IGluZGV4IDNhNmJhNjlmNmQuLmZjN2E0NjMxYjQg
MTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvcG93ZXIvcmVndWxhdG9yL3JlZ3VsYXRvci11Y2xh
c3MuYwo+ID4gPiArKysgYi9kcml2ZXJzL3Bvd2VyL3JlZ3VsYXRvci9yZWd1bGF0b3ItdWNsYXNz
LmMKPiA+ID4gQEAgLTE1OSw2ICsxNTksMjUgQEAgaW50IHJlZ3VsYXRvcl9nZXRfZW5hYmxlKHN0
cnVjdCB1ZGV2aWNlICpkZXYpCj4gPiA+ICAgICAgICAgcmV0dXJuIG9wcy0+Z2V0X2VuYWJsZShk
ZXYpOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiArLyoKPiA+ID4gKyAqIEVuYWJsZSBvciBEaXNhYmxl
IGEgcmVndWxhdG9yCj4gPiA+ICsgKgo+ID4gPiArICogVGhpcyBpcyBhIHJlZW50cmFudCBmdW5j
dGlvbiBhbmQgc3Vic2VxdWVudCBjYWxscyB0aGF0IGVuYWJsZSB3aWxsCj4gPiA+ICsgKiBpbmNy
ZWFzZSBhbiBpbnRlcm5hbCBjb3VudGVyLCBhbmQgZGlzYWJsZSBjYWxscyB3aWxsIGRlY3JlYXNl
IHRoZSBjb3VudGVyLgo+ID4gPiArICogVGhlIGFjdHVhbCByZXNvdXJjZSB3aWxsIGJlIGVuYWJs
ZWQgd2hlbiB0aGUgY291bnRlciBnZXRzIHRvIDEgY29taW5nIGZyb20gMCwKPiA+ID4gKyAqIGFu
ZCBkaXNhYmxlZCB3aGVuIGl0IHJlYWNoZXMgMCBjb21pbmcgZnJvbSAxLgo+ID4gPiArICoKPiA+
ID4gKyAqIEBkZXY6IHJlZ3VsYXRvciBkZXZpY2UKPiA+ID4gKyAqIEBlbmFibGU6IGJvb2wgaW5k
aWNhdGluZyB3aGV0aGVyIHRvIGVuYWJsZSBvciBkaXNhYmxlIHRoZSByZWd1bGF0b3IKPiA+ID4g
KyAqIEByZXR1cm46Cj4gPiA+ICsgKiAwIG9uIFN1Y2Nlc3MKPiA+ID4gKyAqIC1FQlVTWSBpZiB0
aGUgcmVndWxhdG9yIGNhbm5vdCBiZSBkaXNhYmxlZCBiZWNhdXNlIGl0J3MgcmVxdWVzdGVkIGJ5
Cj4gPiA+ICsgKiAgICAgICAgYW5vdGhlciBkZXZpY2UKPiA+ID4gKyAqIC1FQUxSRUFEWSBpZiB0
aGUgcmVndWxhdG9yIGhhcyBhbHJlYWR5IGJlZW4gZW5hYmxlZCBvciBoYXMgYWxyZWFkeSBiZWVu
Cj4gPiA+ICsgKiAgICAgICAgZGlzYWJsZWQKPiA+ID4gKyAqIC1FQUNDRVMgaWYgdGhlcmUgaXMg
bm8gcG9zc2liaWxpdHkgdG8gZW5hYmxlL2Rpc2FibGUgdGhlIHJlZ3VsYXRvcgo+ID4gPiArICog
LXZlIG9uIGRpZmZlcmVudCBlcnJvciBzaXR1YXRpb24KPiA+ID4gKyAqLwo+ID4gPiAgaW50IHJl
Z3VsYXRvcl9zZXRfZW5hYmxlKHN0cnVjdCB1ZGV2aWNlICpkZXYsIGJvb2wgZW5hYmxlKQo+ID4g
PiAgewo+ID4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCBkbV9yZWd1bGF0b3Jfb3BzICpvcHMgPSBk
ZXZfZ2V0X2RyaXZlcl9vcHMoZGV2KTsKPiA+ID4gQEAgLTE3Miw2ICsxOTEsMjMgQEAgaW50IHJl
Z3VsYXRvcl9zZXRfZW5hYmxlKHN0cnVjdCB1ZGV2aWNlICpkZXYsIGJvb2wgZW5hYmxlKQo+ID4g
PiAgICAgICAgIGlmICghZW5hYmxlICYmIHVjX3BkYXRhLT5hbHdheXNfb24pCj4gPiA+ICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVBQ0NFUzsKPiA+ID4KPiA+ID4gKyAgICAgICAvKiBJZiBwcmV2
aW91c2x5IGVuYWJsZWQsIGluY3JlYXNlIGNvdW50ICovCj4gPiA+ICsgICAgICAgaWYgKGVuYWJs
ZSAmJiB1Y19wZGF0YS0+ZW5hYmxlX2NvdW50ID4gMCkgewo+ID4gPiArICAgICAgICAgICAgICAg
dWNfcGRhdGEtPmVuYWJsZV9jb3VudCsrOwo+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC1F
QUxSRUFEWTsKPiA+ID4gKyAgICAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBpZiAoIWVuYWJs
ZSkgewo+ID4gPiArICAgICAgICAgICAgICAgaWYgKHVjX3BkYXRhLT5lbmFibGVfY291bnQgPiAx
KSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qIElmIGVuYWJsZWQgbXVsdGlwbGUg
dGltZXMsIGRlY3JlYXNlIGNvdW50ICovCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHVj
X3BkYXRhLT5lbmFibGVfY291bnQtLTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FQlVTWTsKPiA+ID4gKyAgICAgICAgICAgICAgIH0gZWxzZSBpZiAoIXVjX3BkYXRhLT5l
bmFibGVfY291bnQpIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgLyogSWYgYWxyZWFk
eSBkaXNhYmxlZCwgZG8gbm90aGluZyAqLwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVBTFJFQURZOwo+ID4gPiArICAgICAgICAgICAgICAgfQo+ID4gPiArICAgICAgIH0K
PiA+ID4gKwo+ID4gPiAgICAgICAgIGlmICh1Y19wZGF0YS0+cmFtcF9kZWxheSkKPiA+ID4gICAg
ICAgICAgICAgICAgIG9sZF9lbmFibGUgPSByZWd1bGF0b3JfZ2V0X2VuYWJsZShkZXYpOwo+ID4g
Pgo+ID4gPiBAQCAtMTg3LDYgKzIyMywxMSBAQCBpbnQgcmVndWxhdG9yX3NldF9lbmFibGUoc3Ry
dWN0IHVkZXZpY2UgKmRldiwgYm9vbCBlbmFibGUpCj4gPiA+ICAgICAgICAgICAgICAgICB9Cj4g
PiA+ICAgICAgICAgfQo+ID4gPgo+ID4gPiArICAgICAgIGlmIChlbmFibGUpCj4gPiA+ICsgICAg
ICAgICAgICAgICB1Y19wZGF0YS0+ZW5hYmxlX2NvdW50Kys7Cj4gPiA+ICsgICAgICAgZWxzZQo+
ID4gPiArICAgICAgICAgICAgICAgdWNfcGRhdGEtPmVuYWJsZV9jb3VudC0tOwo+ID4gPiArCj4g
PiA+ICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcG93ZXIvcmVndWxhdG9yL3JlZ3VsYXRvcl9jb21tb24uYyBiL2RyaXZlcnMvcG93
ZXIvcmVndWxhdG9yL3JlZ3VsYXRvcl9jb21tb24uYwo+ID4gPiBpbmRleCBlMjZmNWViZWMzLi5k
ODhiYzZmNmRlIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3Bvd2VyL3JlZ3VsYXRvci9yZWd1
bGF0b3JfY29tbW9uLmMKPiA+ID4gKysrIGIvZHJpdmVycy9wb3dlci9yZWd1bGF0b3IvcmVndWxh
dG9yX2NvbW1vbi5jCj4gPiA+IEBAIC03MiwyMyArNzIsNiBAQCBpbnQgcmVndWxhdG9yX2NvbW1v
bl9zZXRfZW5hYmxlKGNvbnN0IHN0cnVjdCB1ZGV2aWNlICpkZXYsCj4gPiA+ICAgICAgICAgICAg
ICAgICByZXR1cm4gMDsKPiA+ID4gICAgICAgICB9Cj4gPiA+Cj4gPiA+IC0gICAgICAgLyogSWYg
cHJldmlvdXNseSBlbmFibGVkLCBpbmNyZWFzZSBjb3VudCAqLwo+ID4gPiAtICAgICAgIGlmIChl
bmFibGUgJiYgcGxhdC0+ZW5hYmxlX2NvdW50ID4gMCkgewo+ID4gPiAtICAgICAgICAgICAgICAg
cGxhdC0+ZW5hYmxlX2NvdW50Kys7Cj4gPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVBTFJF
QURZOwo+ID4gPiAtICAgICAgIH0KPiA+ID4gLQo+ID4gPiAtICAgICAgIGlmICghZW5hYmxlKSB7
Cj4gPiA+IC0gICAgICAgICAgICAgICBpZiAocGxhdC0+ZW5hYmxlX2NvdW50ID4gMSkgewo+ID4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAvKiBJZiBlbmFibGVkIG11bHRpcGxlIHRpbWVzLCBk
ZWNyZWFzZSBjb3VudCAqLwo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBwbGF0LT5lbmFi
bGVfY291bnQtLTsKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FQlVTWTsK
PiA+ID4gLSAgICAgICAgICAgICAgIH0gZWxzZSBpZiAoIXBsYXQtPmVuYWJsZV9jb3VudCkgewo+
ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAvKiBJZiBhbHJlYWR5IGRpc2FibGVkLCBkbyBu
b3RoaW5nICovCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUFMUkVBRFk7
Cj4gPiA+IC0gICAgICAgICAgICAgICB9Cj4gPiA+IC0gICAgICAgfQo+ID4gPiAtCj4gPiA+ICAg
ICAgICAgcmV0ID0gZG1fZ3Bpb19zZXRfdmFsdWUoJnBsYXQtPmdwaW8sIGVuYWJsZSk7Cj4gPiA+
ICAgICAgICAgaWYgKHJldCkgewo+ID4gPiAgICAgICAgICAgICAgICAgcHJfZXJyKCJDYW4ndCBz
ZXQgcmVndWxhdG9yIDogJXMgZ3BpbyB0bzogJWRcbiIsIGRldi0+bmFtZSwKPiA+ID4gQEAgLTEw
MywxMCArODYsNSBAQCBpbnQgcmVndWxhdG9yX2NvbW1vbl9zZXRfZW5hYmxlKGNvbnN0IHN0cnVj
dCB1ZGV2aWNlICpkZXYsCj4gPiA+ICAgICAgICAgaWYgKCFlbmFibGUgJiYgcGxhdC0+b2ZmX29u
X2RlbGF5X3VzKQo+ID4gPiAgICAgICAgICAgICAgICAgdWRlbGF5KHBsYXQtPm9mZl9vbl9kZWxh
eV91cyk7Cj4gPiA+Cj4gPiA+IC0gICAgICAgaWYgKGVuYWJsZSkKPiA+ID4gLSAgICAgICAgICAg
ICAgIHBsYXQtPmVuYWJsZV9jb3VudCsrOwo+ID4gPiAtICAgICAgIGVsc2UKPiA+ID4gLSAgICAg
ICAgICAgICAgIHBsYXQtPmVuYWJsZV9jb3VudC0tOwo+ID4gPiAtCj4gPiA+ICAgICAgICAgcmV0
dXJuIDA7Cj4gPiA+ICB9Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bvd2VyL3JlZ3VsYXRv
ci9yZWd1bGF0b3JfY29tbW9uLmggYi9kcml2ZXJzL3Bvd2VyL3JlZ3VsYXRvci9yZWd1bGF0b3Jf
Y29tbW9uLmgKPiA+ID4gaW5kZXggZDQ5NjI4OTlkOC4uMTVmMWZhNGM5MyAxMDA2NDQKPiA+ID4g
LS0tIGEvZHJpdmVycy9wb3dlci9yZWd1bGF0b3IvcmVndWxhdG9yX2NvbW1vbi5oCj4gPiA+ICsr
KyBiL2RyaXZlcnMvcG93ZXIvcmVndWxhdG9yL3JlZ3VsYXRvcl9jb21tb24uaAo+ID4gPiBAQCAt
MTMsNyArMTMsNiBAQCBzdHJ1Y3QgcmVndWxhdG9yX2NvbW1vbl9wbGF0IHsKPiA+ID4gICAgICAg
ICBzdHJ1Y3QgZ3Bpb19kZXNjIGdwaW87IC8qIEdQSU8gZm9yIHJlZ3VsYXRvciBlbmFibGUgY29u
dHJvbCAqLwo+ID4gPiAgICAgICAgIHVuc2lnbmVkIGludCBzdGFydHVwX2RlbGF5X3VzOwo+ID4g
PiAgICAgICAgIHVuc2lnbmVkIGludCBvZmZfb25fZGVsYXlfdXM7Cj4gPiA+IC0gICAgICAgdW5z
aWduZWQgaW50IGVuYWJsZV9jb3VudDsKPiA+ID4gIH07Cj4gPiA+Cj4gPiA+ICBpbnQgcmVndWxh
dG9yX2NvbW1vbl9vZl90b19wbGF0KHN0cnVjdCB1ZGV2aWNlICpkZXYsCj4gPiA+IEBAIC0yMSwy
NiArMjAsNiBAQCBpbnQgcmVndWxhdG9yX2NvbW1vbl9vZl90b19wbGF0KHN0cnVjdCB1ZGV2aWNl
ICpkZXYsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hhciAqZW5hYmxl
X2dwaW9fbmFtZSk7Cj4gPiA+ICBpbnQgcmVndWxhdG9yX2NvbW1vbl9nZXRfZW5hYmxlKGNvbnN0
IHN0cnVjdCB1ZGV2aWNlICpkZXYsCj4gPiA+ICAgICAgICAgc3RydWN0IHJlZ3VsYXRvcl9jb21t
b25fcGxhdCAqcGxhdCk7Cj4gPiA+IC0vKgo+ID4gPiAtICogRW5hYmxlIG9yIERpc2FibGUgYSBy
ZWd1bGF0b3IKPiA+ID4gLSAqCj4gPiA+IC0gKiBUaGlzIGlzIGEgcmVlbnRyYW50IGZ1bmN0aW9u
IGFuZCBzdWJzZXF1ZW50IGNhbGxzIHRoYXQgZW5hYmxlIHdpbGwKPiA+ID4gLSAqIGluY3JlYXNl
IGFuIGludGVybmFsIGNvdW50ZXIsIGFuZCBkaXNhYmxlIGNhbGxzIHdpbGwgZGVjcmVhc2UgdGhl
IGNvdW50ZXIuCj4gPiA+IC0gKiBUaGUgYWN0dWFsIHJlc291cmNlIHdpbGwgYmUgZW5hYmxlZCB3
aGVuIHRoZSBjb3VudGVyIGdldHMgdG8gMSBjb21pbmcgZnJvbSAwLAo+ID4gPiAtICogYW5kIGRp
c2FibGVkIHdoZW4gaXQgcmVhY2hlcyAwIGNvbWluZyBmcm9tIDEuCj4gPiA+IC0gKgo+ID4gPiAt
ICogQGRldjogcmVndWxhdG9yIGRldmljZQo+ID4gPiAtICogQHBsYXQ6IFBsYXRmb3JtIGRhdGEK
PiA+ID4gLSAqIEBlbmFibGU6IGJvb2wgaW5kaWNhdGluZyB3aGV0aGVyIHRvIGVuYWJsZSBvciBk
aXNhYmxlIHRoZSByZWd1bGF0b3IKPiA+ID4gLSAqIEByZXR1cm46Cj4gPiA+IC0gKiAwIG9uIFN1
Y2Nlc3MKPiA+ID4gLSAqIC1FQlVTWSBpZiB0aGUgcmVndWxhdG9yIGNhbm5vdCBiZSBkaXNhYmxl
ZCBiZWNhdXNlIGl0J3MgcmVxdWVzdGVkIGJ5Cj4gPiA+IC0gKiAgICAgICAgYW5vdGhlciBkZXZp
Y2UKPiA+ID4gLSAqIC1FQUxSRUFEWSBpZiB0aGUgcmVndWxhdG9yIGhhcyBhbHJlYWR5IGJlZW4g
ZW5hYmxlZCBvciBoYXMgYWxyZWFkeSBiZWVuCj4gPiA+IC0gKiAgICAgICAgZGlzYWJsZWQKPiA+
ID4gLSAqIC1FQUNDRVMgaWYgdGhlcmUgaXMgbm8gcG9zc2liaWxpdHkgdG8gZW5hYmxlL2Rpc2Fi
bGUgdGhlIHJlZ3VsYXRvcgo+ID4gPiAtICogLXZlIG9uIGRpZmZlcmVudCBlcnJvciBzaXR1YXRp
b24KPiA+ID4gLSAqLwo+ID4gPiAgaW50IHJlZ3VsYXRvcl9jb21tb25fc2V0X2VuYWJsZShjb25z
dCBzdHJ1Y3QgdWRldmljZSAqZGV2LAo+ID4gPiAgICAgICAgIHN0cnVjdCByZWd1bGF0b3JfY29t
bW9uX3BsYXQgKnBsYXQsIGJvb2wgZW5hYmxlKTsKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvcG93ZXIvcmVndWxhdG9yLmggYi9pbmNsdWRlL3Bvd2VyL3JlZ3VsYXRvci5oCj4gPiA+
IGluZGV4IGZmMWJmYzI0MzUuLjcyNzc3NmE4Y2YgMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1ZGUv
cG93ZXIvcmVndWxhdG9yLmgKPiA+ID4gKysrIGIvaW5jbHVkZS9wb3dlci9yZWd1bGF0b3IuaAo+
ID4gPiBAQCAtMTU4LDYgKzE1OCw3IEBAIGVudW0gcmVndWxhdG9yX2ZsYWcgewo+ID4gPiAgICog
QG5hbWUqKiAgICAgLSBmZHQgcmVndWxhdG9yIG5hbWUgLSBzaG91bGQgYmUgdGFrZW4gZnJvbSB0
aGUgZGV2aWNlIHRyZWUKPiA+ID4gICAqIGN0cmxfcmVnOiAgIC0gQ29udHJvbCByZWdpc3RlciBv
ZmZzZXQgdXNlZCB0byBlbmFibGUvZGlzYWJsZSByZWd1bGF0b3IKPiA+ID4gICAqIHZvbHRfcmVn
OiAgIC0gcmVnaXN0ZXIgb2Zmc2V0IGZvciB3cml0aW5nIHZvbHRhZ2UgdnNlbCB2YWx1ZXMKPiA+
ID4gKyAqIGVuYWJsZV9jb3VudCAtIGNvdW50ZXIgb2YgZW5hYmxlIGNhbGxzIGZvciB0aGlzIHJl
Z3VsYXRvcgo+ID4gPiAgICoKPiA+ID4gICAqIE5vdGU6Cj4gPiA+ICAgKiAqICAtIHNldCBhdXRv
bWF0aWNhbGx5IG9uIGRldmljZSBwcm9iZSBieSB0aGUgdWNsYXNzJ3MgJy5wcmVfcHJvYmUnIG1l
dGhvZC4KPiA+ID4gQEAgLTE4NCw2ICsxODUsNyBAQCBzdHJ1Y3QgZG1fcmVndWxhdG9yX3VjbGFz
c19wbGF0IHsKPiA+ID4gICAgICAgICB1OCB2b2x0X3JlZzsKPiA+ID4gICAgICAgICBib29sIHN1
c3BlbmRfb247Cj4gPiA+ICAgICAgICAgdTMyIHN1c3BlbmRfdVY7Cj4gPiA+ICsgICAgICAgdTMy
IGVuYWJsZV9jb3VudDsKPiA+Cj4gPiBQbGVhc2UgYWRkIGEgY29tbWVudCBmb3IgdGhpcwo+ID4K
Pgo+IERlc2NyaXB0aW9uIGluY2x1ZGVkIGluIHN0cnVjdCBkZXNjcmlwdGlvbiBoZXJlOgo+ICsg
KiBlbmFibGVfY291bnQgLSBjb3VudGVyIG9mIGVuYWJsZSBjYWxscyBmb3IgdGhpcyByZWd1bGF0
b3IKPgoKT0sgdGhhbmtzLCBJIHdvbmRlciB3aHkgaXQgc2F5cyBpdCBpcyBwYXJ0IG9mICdlbnVt
IHJlZ3VsYXRvcl9mbGFnJyA/CgpSZWdhcmRzLApTaW1vbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
