Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A9A771B70
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Aug 2023 09:27:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0E29C6B45B;
	Mon,  7 Aug 2023 07:27:33 +0000 (UTC)
Received: from s.wrqvwxzv.outbound-mail.sendgrid.net
 (s.wrqvwxzv.outbound-mail.sendgrid.net [149.72.154.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80ED8C65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Aug 2023 12:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=mime-version:subject:references:from:in-reply-to:to:cc:content-type:
 content-transfer-encoding:cc:content-type:from:subject:to;
 s=s1; bh=x+oADr75yj37fVjrDoZkiyw+Rxz1hM77H41q63SemCk=;
 b=J6KMDG34X/3dPg+sV6wNLXDOOGX3UjS296ZuSnC3gzZTaJIPfDmiP+CzWgFBY1Q1mr5N
 Jo32uD8IgFiT9nf+3kYfIptIv5A2+2R7mFnC+pP+6kadWqBu2LO1P7sHtfZnlabjnj051F
 C34kDk8EMcXAECkVG2Y2r3W64MZ2gudibWuEc44heLh12+uuKuYima2/7nbPRuYk79b63z
 x1lGo7Lan0JD1ZssjIpZeMM7cd3GrQ0V3xAEGo5G++pZk4awkFfKWQCUyh8LPzbcxGPRB0
 tMnY7PmBLfXaP6YNtQvT+rVxPquMP/8pV1qhTBJiU4/kV8VKmM4vJdA+WXrDM/gQ==
Received: by filterdrecv-66949dbc98-mtdwq with SMTP id
 filterdrecv-66949dbc98-mtdwq-1-64CE455B-26
 2023-08-05 12:49:32.08988888 +0000 UTC m=+3579271.339678866
Received: from [192.168.1.50] (unknown) by geopod-ismtpd-4 (SG) with ESMTP
 id Ps42-scwRyO71RUGCvVJDA Sat, 05 Aug 2023 12:49:31.724 +0000 (UTC)
Message-ID: <09c6ff35-250a-18ff-667d-9ce62e24b18c@kwiboo.se>
Date: Sat, 05 Aug 2023 12:49:32 +0000 (UTC)
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
References: <20230720123744.26854-1-clamor95@gmail.com>
 <20230720123744.26854-4-clamor95@gmail.com>
 <CAPnjgZ3jXmqtB=MTv7-SvEaKGyHHgO=zh5m8yPP=hbobh=B=pg@mail.gmail.com>
 <CAPVz0n2wxT_u0BDSdq5+VOkScdDJxAsBntr_p6ajawxiEszyzg@mail.gmail.com>
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <CAPVz0n2wxT_u0BDSdq5+VOkScdDJxAsBntr_p6ajawxiEszyzg@mail.gmail.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h7PXuQx8RfqT6EIBN?=
 =?us-ascii?Q?DkgQvkZC7fkMDYwb0sli2+CSDlDDWod2Zm4n9OQ?=
 =?us-ascii?Q?G1xgb=2FTW=2FW8o3KdByHCrAMLy9+VsoI9Y5mCurVJ?=
 =?us-ascii?Q?qAxPlgqCXbAivrBjy8prP2Eyr1U=2Fow8N0HnI72T?=
 =?us-ascii?Q?xPkIw4lEiwisubE5798d7u8kNeSq+iZG5aiWWn9?=
 =?us-ascii?Q?JWNckBH7JVu9nd03kWicw=3D=3D?=
To: Svyatoslav Ryhel <clamor95@gmail.com>, Simon Glass <sjg@chromium.org>
X-Entity-ID: P7KYpSJvGCELWjBME/J5tg==
X-Mailman-Approved-At: Mon, 07 Aug 2023 07:27:32 +0000
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 u-boot@dh-electronics.com, Matteo Lisi <matteo.lisi@engicam.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 3/7] power: regulator-uclass: perform
 regulator setup inside uclass
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

SGksCgpPbiAyMDIzLTA3LTIxIDA3OjM0LCBTdnlhdG9zbGF2IFJ5aGVsIHdyb3RlOgo+INGH0YIs
IDIwINC70LjQvy4gMjAyM+KAr9GALiDQviAyMjo0MyBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVt
Lm9yZz4g0L/QuNGI0LU6Cj4+Cj4+IEhpIFN2eWF0b3NsYXYsCj4+Cj4+IE9uIFRodSwgMjAgSnVs
IDIwMjMgYXQgMDY6MzgsIFN2eWF0b3NsYXYgUnloZWwgPGNsYW1vcjk1QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+Pgo+Pj4gUmVndWxhdG9ycyBpbml0aWFsIHNldHVwIHdhcyBwcmV2aW91c2x5IGRlcGVu
ZGVudCBvbiBib2FyZCBjYWxsLgo+Pj4gVG8gbW92ZSBmcm9tIHRoaXMgYmVoYXZpb3VyIHdlcmUg
aW50cm9kdWNlZCB0d28gc3RlcHMuIEZpcnN0IGlzCj4+PiB0aGF0IGFsbCBpbmRpdmlkdWFsIHJl
Z3VsYXRvcnMgd2lsbCBiZSBwcm9iZWQganVzdCBhZnRlciBiaW5kaW5nCj4+Cj4+IFdlIG11c3Qg
bm90IHByb2JlIGRldmljZXMgYXV0b21hdGljYWxseSB3aGVuIGJvdW5kLiBUaGUgaTJjIGludGVy
ZmFjZQo+PiBtYXkgbm90IGJlIGF2YWlsYWJsZSwgZXRjLiBEbyBhIHByb2JlIGFmdGVyd2FyZHMu
Cj4+Cj4+IFBlcmhhcHMgSSBhbSBtaXN1bmRlcnN0YW5kaW5nIHRoaXMsIGl3YyBwbGVhc2UgcmV3
b3JkIHRoaXMgY29tbWl0IG1lc3NhZ2UuCj4gCj4gQWZ0ZXIgYm91bmQuIElmIHRoZSByZWd1bGF0
b3IgaXMgYSBzZWxmLXN1ZmZpY2llbnQgaTJjIGRldmljZSB0aGVuIGl0Cj4gd2lsbCBiZSBib3Vu
ZAo+IGFmdGVyIGkyYyBpcyBhdmFpbGFibGUgYnkgY29kZSBkZXNpZ24gc28gaTJjIGludGVyZmFj
ZSBzaG91bGQgYmUKPiBhdmFpbGFibGUgYXQgdGhhdAo+IG1vbWVudC4gQXQgbGVhc3QgbGVkIGFu
ZCBncGlvIHVjbGFzc2VzIHBlcmZvcm0gdGhpcyBmb3IgaW5pdGlhbCBzZXR1cAo+IG9mIGRldmlj
ZXMuCj4gCj4gUGxhdGZvcm0gcmVndWxhdG9ycyAoYWthIGZpeGVkL2dwaW8gcmVndWxhdG9ycykg
d29yayBwZXJmZWN0bHkgZmluZS4gSQo+IGhhdmUgbm8gaTJjCj4gcmVndWxhdG9ycyB0byB0ZXN0
IGRlZXBseS4KPiAKPiBBcyBmb3Igbm93IG9ubHkgb25lIHVjbGFzcyBpcyBub3QgY29tcGF0aWJs
ZSB3aXRoIHRoaXMgc3lzdGVtIC0gUE1JQyB3aGljaCBoYXMKPiBzdHJvbmcgZGVwZW5kZW5jeSBi
ZXR3ZWVuIHJlZ3VsYXRvciBhbmQgbWFpbiBtZmQuIFRoaXMgaXMgd2h5IHByb2JpbmcgYWZ0ZXIK
PiBiaW5kIGZvciBwbWljIHJlZ3VsYXRvcnMgaXMgZGlzYWJsZWQgYW5kIHBtaWMgcmVndWxhdG9y
cyBhcmUgcHJvYmVkIG9uIHBtaWMgY29yZQo+IHBvc3RfcHJvYmUuCgpUaGlzIHNvdW5kcyBtb3Jl
IGxpa2UgYSBwb3NzaWJsZSBidWcgb2Ygc29tZSBkZXBlbmRlbmN5IG5vdCBiZWluZwpwcm9iZWQg
aW4gY29ycmVjdCBvcmRlciBvciBub3QgbGVhdmluZyB0aGUgZGV2aWNlIGluIGEgcmVhZHkgc3Rh
dGUKYWZ0ZXIgcHJvYmUuCgpJZiBwbWljIHJlZ3VsYXRvcnMgYXJlIGJpbmQgaW4gcG1pYyBiaW5k
IHdpdGggdGhlIHBtaWMgYXMgcGFyZW50LCB0aGVuCmF0IHJlZ3VsYXRvciBwcm9iZSB0aGUgZHJp
dmVyIGNvcmUgZW5zdXJlIHRoYXQgcG1pYyBoYXMgcHJvYmVkIGJlZm9yZQpyZWd1bGF0b3IgdXNl
LgoKVGhpcyB3b3JrcyBwZXJmZWN0IGZpbmUgd2l0aCB0aGUgUks4eHggSTJDIFBNSUMgYW5kIGl0
cyByZWd1bGF0b3JzLgpXaWNoIGEgY2FsbCB0byBkZXZpY2VfZ2V0X3N1cHBseV9yZWd1bGF0b3Io
ZGV2LCAidGVzdC1zdXBwbHkiLCAmcmVnKQpwcm9iZSBoYXBwZW5zIGluIGkyYywgcG1pYyBhbmQg
cmVndWxhdG9yIG9yZGVyLgoKPiAKPj4+IHdoaWNoIGVuc3VyZXMgdGhhdCByZWd1bGF0b3IgcGRh
dGEgaXMgZmlsbGVkIGFuZCBzZWNvbmQgaXMgc2V0dGluZwo+Pj4gdXAgcmVndWxhdG9yIGluIHBv
c3QgcHJvYmUgd2hpY2ggZW5zZXJlcyB0aGF0IGNvcnJlY3QgcmVndWxhdG9yCj4+PiBzdGF0ZSBh
Y2NvcmRpbmcgdG8gcGRhdGEgaXMgcmVhY2hlZC4KCkkgdGhpbmsgdGhhdCB0aGUgYXBwcm9hY2gg
aW4gdGhpcyBwYXRjaCBpcyB0cnlpbmcgdG8gY2hhbmdlIHRvbyBtdWNoIGFsbAphdCBvbmNlLgoK
SGF2ZSBtYWRlIHNvbWUgYWRqdXN0bWVudHMgdGhhdCBJIHRoaW5rIHNob3VsZCBoZWxwIHdpdGgg
dHJhbnNpdGlvbi4KLSBBZGRlZCBhIGZsYWcgdG8gcHJvdGVjdCByZWd1bGF0b3JfYXV0b3NldCBm
cm9tIGJlaW5nIGNhbGxlZCBtb3JlIHRoZW4KICBvbmNlIGZvciBlYWNoIHJlZ3VsYXRvciwgaW4g
YSBzZXBhcmF0ZSBwYXRjaC4KLSBDaGFuZ2VkIHRvIG9ubHkgcHJvYmUtYWZ0ZXItYmluZCBvbiBy
ZWd1bGF0b3JzIG1hcmtlZCBhcwogIGFsd2F5cy1vbi9ib290LW9uLgoKQW5kIGl0IHdvcmtzIHNv
bWV0aGluZyBsaWtlIHRoaXM6CgpzdGF0aWMgaW50IHJlZ3VsYXRvcl9wb3N0X2JpbmQoc3RydWN0
IHVkZXZpY2UgKmRldikKewoJWy4uLl0KCglpZiAodWNfcGRhdGEtPmFsd2F5c19vbiB8fCB1Y19w
ZGF0YS0+Ym9vdF9vbikKCQlkZXZfb3JfZmxhZ3MoZGV2LCBETV9GTEFHX1BST0JFX0FGVEVSX0JJ
TkQpOwp9CgpzdGF0aWMgaW50IHJlZ3VsYXRvcl9wb3N0X3Byb2JlKHN0cnVjdCB1ZGV2aWNlICpk
ZXYpCnsKCXJldCA9IHJlZ3VsYXRvcl9hdXRvc2V0KGRldik7Cn0KCldpdGggdGhhdCBhbnkgYWx3
YXlzLW9uL2Jvb3Qtb24gcmVndWxhdG9yIHdvdWxkIGF1dG9tYXRpY2FsbHkgcHJvYmUgYW5kCmF1
dG9zZXQgYWZ0ZXIgYmluZCwgcmVtYWluaW5nIHdvdWxkIG9ubHkgcHJvYmUgYW5kIGF1dG9zZXQg
aWYgdGhleSBhcmUKdXNlZC4KClRoaXMgYXBwcm9hY2ggc2hvdWxkIGFsc28gcHJldmVudCBoYXZp
bmcgdG8gY2hhbmdlIGV4aXN0aW5nIGNvZGUgdGhhdAptYXkgY2FsbCBhdXRvc2V0LCBhbmQgY2xl
YW51cCBjYW4gYmUgZG9uZSBpbiBmb2xsb3ctdXAgcGF0Y2hlcy9zZXJpZXMuCgpQcm9iZS1hZnRl
ci1iaW5kIGFuZCBjYWxsIHRvIGF1dG9zZXQgY291bGQgYWxzbyBiZSBwcm90ZWN0ZWQgd2l0aCBh
IG5ldwpLY29uZmlnIHRvIGhlbHAgd2l0aCB0cmFuc2l0aW9uLgoKU2VlIGZvbGxvd2luZyBmb3Ig
YSB3b3JraW5nIGV4YW1wbGUgdXNpbmcgYSBuZXcgZHJpdmVyIHRoYXQgZGVwZW5kcwpvbiB0aGF0
IHJlZ3VsYXRvcnMgaGF2ZSBiZWVuIGF1dG9zZXQgcHJpb3IgdG8gcmVndWxhdG9yX2dldF92YWx1
ZS4KaHR0cHM6Ly9naXRodWIuY29tL0t3aWJvby91LWJvb3Qtcm9ja2NoaXAvY29tcGFyZS9tYXN0
ZXIuLi5yazM1NjgtaW8tZG9tYWluCgpPciB0aGUgdHdvIGNvbW1pdHMgc2VwYXJhdGU6Cgpwb3dl
cjogcmVndWxhdG9yOiBPbmx5IHJ1biBhdXRvc2V0IG9uY2UgZm9yIGVhY2ggcmVndWxhdG9yCmh0
dHBzOi8vZ2l0aHViLmNvbS9Ld2lib28vdS1ib290LXJvY2tjaGlwL2NvbW1pdC8wNWRiNGRiY2I4
ZjkwOGI0MTdlZDVjYWU4YTdhMzI1YzgyMTEyZDc1Cgpwb3dlcjogcmVndWxhdG9yOiBQZXJmb3Jt
IHJlZ3VsYXRvciBzZXR1cCBpbnNpZGUgdWNsYXNzCmh0dHBzOi8vZ2l0aHViLmNvbS9Ld2lib28v
dS1ib290LXJvY2tjaGlwL2NvbW1pdC80ODliZDVkMmMxYTJhMzM4MjRlYWM0ZjJkNTQzOTllZjVk
ZmY0ZmRmCgpSZWdhcmRzLApKb25hcwoKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTdnlhdG9zbGF2
IFJ5aGVsIDxjbGFtb3I5NUBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+ICBkcml2ZXJzL3Bvd2VyL3Jl
Z3VsYXRvci9yZWd1bGF0b3ItdWNsYXNzLmMgfCAyMTIgKysrKysrLS0tLS0tLS0tLS0tLS0tCj4+
PiAgaW5jbHVkZS9wb3dlci9yZWd1bGF0b3IuaCAgICAgICAgICAgICAgICAgIHwgMTE5IC0tLS0t
LS0tLS0tLQo+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgMjY5IGRlbGV0
aW9ucygtKQo+Pgo+PiBSZWdhcmRzLAo+PiBTSW1vbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
