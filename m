Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E039B771B71
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Aug 2023 09:27:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7D32C6B469;
	Mon,  7 Aug 2023 07:27:33 +0000 (UTC)
Received: from s.wrqvtzvf.outbound-mail.sendgrid.net
 (s.wrqvtzvf.outbound-mail.sendgrid.net [149.72.126.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3E26C65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Aug 2023 20:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=mime-version:subject:references:from:in-reply-to:to:cc:content-type:
 content-transfer-encoding:cc:content-type:from:subject:to;
 s=s1; bh=jmbItxVKnRHwpFsPPfbJcenxhsh7MNwiOmlRo9Dwsf0=;
 b=kjYpk4MvkQbZZpRGnrSqQ9+LN16DVMjix4zkeCG3dw+NqJvKk0QiWo/xdCeAIA/7FjmI
 JsDNlUsK/pUrjRqiwj+s7ZqLyd5zsOIfiXzsT8A28uzoKuH+OGjFCdPpDMBocU7htnU6fb
 jkghdgIXHG1SmTl3VQeSKc8xCNn3Ff/5wcRl9/KtkTQFPZbLnjGOr+j1RfSGlpiD9GSQ2d
 j5qJVoGtP8fK//ZMBq/ynXbyYNdbu32ljpsGUwH/mz+AnyJIIzSSU0s2zfrkMXDegPINTP
 DQBQOXL+qIKdqw323p3yJ6QwsXrr+BVqS82gC29yI+gRPPM2lGTFL1BflpW5Puyg==
Received: by filterdrecv-66949dbc98-gwbzx with SMTP id
 filterdrecv-66949dbc98-gwbzx-1-64CEB523-23
 2023-08-05 20:46:27.940442383 +0000 UTC m=+7506399.723259300
Received: from [192.168.1.50] (unknown) by geopod-ismtpd-3 (SG) with ESMTP
 id 1hHvjzyhTail7WX4izvq2A Sat, 05 Aug 2023 20:46:27.546 +0000 (UTC)
Message-ID: <cdd2fb7c-6790-c747-47ff-bdb5beac85fd@kwiboo.se>
Date: Sat, 05 Aug 2023 20:46:28 +0000 (UTC)
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
References: <20230720123744.26854-1-clamor95@gmail.com>
 <20230720123744.26854-4-clamor95@gmail.com>
 <CAPnjgZ3jXmqtB=MTv7-SvEaKGyHHgO=zh5m8yPP=hbobh=B=pg@mail.gmail.com>
 <CAPVz0n2wxT_u0BDSdq5+VOkScdDJxAsBntr_p6ajawxiEszyzg@mail.gmail.com>
 <09c6ff35-250a-18ff-667d-9ce62e24b18c@kwiboo.se>
 <4222D0DC-D1D9-4382-93A0-E09EFD807CCC@gmail.com>
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <4222D0DC-D1D9-4382-93A0-E09EFD807CCC@gmail.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hzrgn6H+EWz43Yxt8?=
 =?us-ascii?Q?4dcNReikBfqkT4dha+LxbRxhzVLRCggEicjMUin?=
 =?us-ascii?Q?hEgwQNF+WBDSC=2FNWikwZcfC+akmWly9hlMOuMio?=
 =?us-ascii?Q?MhBxDNDN+CdDvuoNfUu+UQqwpFIKD81q+LgsY2s?=
 =?us-ascii?Q?+buX03e2WbmLLbz81=2F3BXozn30l6cxCklu7xjSk?=
 =?us-ascii?Q?cQoeVNC5gu0qJOBWSKsqg=3D=3D?=
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

T24gMjAyMy0wOC0wNSAyMTo1OCwgU3Z5YXRvc2xhdiBSeWhlbCB3cm90ZToKPiAKPiAKPiA1INGB
0LXRgNC/0L3RjyAyMDIzINGALiAxNTo0OTozMiBHTVQrMDM6MDAsIEpvbmFzIEthcmxtYW4gPGpv
bmFzQGt3aWJvby5zZT4g0L3QsNC/0LjRgdCw0LIoLdC70LApOgo+PiBIaSwKPj4KPj4gT24gMjAy
My0wNy0yMSAwNzozNCwgU3Z5YXRvc2xhdiBSeWhlbCB3cm90ZToKPj4+INGH0YIsIDIwINC70LjQ
vy4gMjAyM+KAr9GALiDQviAyMjo0MyBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4g0L/Q
uNGI0LU6Cj4+Pj4KPj4+PiBIaSBTdnlhdG9zbGF2LAo+Pj4+Cj4+Pj4gT24gVGh1LCAyMCBKdWwg
MjAyMyBhdCAwNjozOCwgU3Z5YXRvc2xhdiBSeWhlbCA8Y2xhbW9yOTVAZ21haWwuY29tPiB3cm90
ZToKPj4+Pj4KPj4+Pj4gUmVndWxhdG9ycyBpbml0aWFsIHNldHVwIHdhcyBwcmV2aW91c2x5IGRl
cGVuZGVudCBvbiBib2FyZCBjYWxsLgo+Pj4+PiBUbyBtb3ZlIGZyb20gdGhpcyBiZWhhdmlvdXIg
d2VyZSBpbnRyb2R1Y2VkIHR3byBzdGVwcy4gRmlyc3QgaXMKPj4+Pj4gdGhhdCBhbGwgaW5kaXZp
ZHVhbCByZWd1bGF0b3JzIHdpbGwgYmUgcHJvYmVkIGp1c3QgYWZ0ZXIgYmluZGluZwo+Pj4+Cj4+
Pj4gV2UgbXVzdCBub3QgcHJvYmUgZGV2aWNlcyBhdXRvbWF0aWNhbGx5IHdoZW4gYm91bmQuIFRo
ZSBpMmMgaW50ZXJmYWNlCj4+Pj4gbWF5IG5vdCBiZSBhdmFpbGFibGUsIGV0Yy4gRG8gYSBwcm9i
ZSBhZnRlcndhcmRzLgo+Pj4+Cj4+Pj4gUGVyaGFwcyBJIGFtIG1pc3VuZGVyc3RhbmRpbmcgdGhp
cywgaXdjIHBsZWFzZSByZXdvcmQgdGhpcyBjb21taXQgbWVzc2FnZS4KPj4+Cj4+PiBBZnRlciBi
b3VuZC4gSWYgdGhlIHJlZ3VsYXRvciBpcyBhIHNlbGYtc3VmZmljaWVudCBpMmMgZGV2aWNlIHRo
ZW4gaXQKPj4+IHdpbGwgYmUgYm91bmQKPj4+IGFmdGVyIGkyYyBpcyBhdmFpbGFibGUgYnkgY29k
ZSBkZXNpZ24gc28gaTJjIGludGVyZmFjZSBzaG91bGQgYmUKPj4+IGF2YWlsYWJsZSBhdCB0aGF0
Cj4+PiBtb21lbnQuIEF0IGxlYXN0IGxlZCBhbmQgZ3BpbyB1Y2xhc3NlcyBwZXJmb3JtIHRoaXMg
Zm9yIGluaXRpYWwgc2V0dXAKPj4+IG9mIGRldmljZXMuCj4+Pgo+Pj4gUGxhdGZvcm0gcmVndWxh
dG9ycyAoYWthIGZpeGVkL2dwaW8gcmVndWxhdG9ycykgd29yayBwZXJmZWN0bHkgZmluZS4gSQo+
Pj4gaGF2ZSBubyBpMmMKPj4+IHJlZ3VsYXRvcnMgdG8gdGVzdCBkZWVwbHkuCj4+Pgo+Pj4gQXMg
Zm9yIG5vdyBvbmx5IG9uZSB1Y2xhc3MgaXMgbm90IGNvbXBhdGlibGUgd2l0aCB0aGlzIHN5c3Rl
bSAtIFBNSUMgd2hpY2ggaGFzCj4+PiBzdHJvbmcgZGVwZW5kZW5jeSBiZXR3ZWVuIHJlZ3VsYXRv
ciBhbmQgbWFpbiBtZmQuIFRoaXMgaXMgd2h5IHByb2JpbmcgYWZ0ZXIKPj4+IGJpbmQgZm9yIHBt
aWMgcmVndWxhdG9ycyBpcyBkaXNhYmxlZCBhbmQgcG1pYyByZWd1bGF0b3JzIGFyZSBwcm9iZWQg
b24gcG1pYyBjb3JlCj4+PiBwb3N0X3Byb2JlLgo+Pgo+PiBUaGlzIHNvdW5kcyBtb3JlIGxpa2Ug
YSBwb3NzaWJsZSBidWcgb2Ygc29tZSBkZXBlbmRlbmN5IG5vdCBiZWluZwo+PiBwcm9iZWQgaW4g
Y29ycmVjdCBvcmRlciBvciBub3QgbGVhdmluZyB0aGUgZGV2aWNlIGluIGEgcmVhZHkgc3RhdGUK
Pj4gYWZ0ZXIgcHJvYmUuCj4+Cj4+IElmIHBtaWMgcmVndWxhdG9ycyBhcmUgYmluZCBpbiBwbWlj
IGJpbmQgd2l0aCB0aGUgcG1pYyBhcyBwYXJlbnQsIHRoZW4KPj4gYXQgcmVndWxhdG9yIHByb2Jl
IHRoZSBkcml2ZXIgY29yZSBlbnN1cmUgdGhhdCBwbWljIGhhcyBwcm9iZWQgYmVmb3JlCj4+IHJl
Z3VsYXRvciB1c2UuCj4+Cj4+IFRoaXMgd29ya3MgcGVyZmVjdCBmaW5lIHdpdGggdGhlIFJLOHh4
IEkyQyBQTUlDIGFuZCBpdHMgcmVndWxhdG9ycy4KPj4gV2ljaCBhIGNhbGwgdG8gZGV2aWNlX2dl
dF9zdXBwbHlfcmVndWxhdG9yKGRldiwgInRlc3Qtc3VwcGx5IiwgJnJlZykKPj4gcHJvYmUgaGFw
cGVucyBpbiBpMmMsIHBtaWMgYW5kIHJlZ3VsYXRvciBvcmRlci4KPj4KPiAKPiBJIHdpbGwgY2hl
Y2sgYW5kIHJlLXRlc3QgZHJpdmVycyBJIGhhdmUgQVNBUC4gCj4gCj4+Pgo+Pj4+PiB3aGljaCBl
bnN1cmVzIHRoYXQgcmVndWxhdG9yIHBkYXRhIGlzIGZpbGxlZCBhbmQgc2Vjb25kIGlzIHNldHRp
bmcKPj4+Pj4gdXAgcmVndWxhdG9yIGluIHBvc3QgcHJvYmUgd2hpY2ggZW5zZXJlcyB0aGF0IGNv
cnJlY3QgcmVndWxhdG9yCj4+Pj4+IHN0YXRlIGFjY29yZGluZyB0byBwZGF0YSBpcyByZWFjaGVk
Lgo+Pgo+PiBJIHRoaW5rIHRoYXQgdGhlIGFwcHJvYWNoIGluIHRoaXMgcGF0Y2ggaXMgdHJ5aW5n
IHRvIGNoYW5nZSB0b28gbXVjaCBhbGwKPj4gYXQgb25jZS4KPj4KPj4gSGF2ZSBtYWRlIHNvbWUg
YWRqdXN0bWVudHMgdGhhdCBJIHRoaW5rIHNob3VsZCBoZWxwIHdpdGggdHJhbnNpdGlvbi4KPj4g
LSBBZGRlZCBhIGZsYWcgdG8gcHJvdGVjdCByZWd1bGF0b3JfYXV0b3NldCBmcm9tIGJlaW5nIGNh
bGxlZCBtb3JlIHRoZW4KPj4gIG9uY2UgZm9yIGVhY2ggcmVndWxhdG9yLCBpbiBhIHNlcGFyYXRl
IHBhdGNoLgo+IAo+IEl0IGlzIG5vdCBhIGdvb2QgZGVjaXNpb24gaW4gdGhlIGxvbmcgcnVuIGFu
ZCB5b3Ugc2hvdWxkIGtlZXAgaW4gbWluZCB0aGF0IHRoZXJlIGlzIG5vdGhpbmcgbW9yZSBjb25z
dGFudCB0aGFuIGEgdGVtcG9yYXJ5IHNvbHV0aW9uLgoKTm9yIGRvIEkgcHJvcG9zZSB0aGlzIHRv
IGJlIGEgbG9uZy10ZXJtIHNvbHV0aW9uLCBvbmx5IHRoYXQgaXQgaXMgbW9yZQpyZXZpZXdhYmxl
IHRvIHNlZSBjaGFuZ2VzIGluIG5vbi1icmVha2luZyBzbWFsbGVyIHN0ZXBzLiBJbiBjdXJyZW50
CnN0YXRlIHRoaXMgcGF0Y2ggYnJlYWtzIGJ1aWxkaW5nIFUtQm9vdCBhbmQgcmVxdWlyZXMgdGhl
IGxhc3QgcGF0Y2ggdG8KZml4IGJ1aWxkIGFnYWluLgoKQW55d2F5LCBJIHdpbGwgYmUgcG9zdGlu
ZyBhIHNpbWlsYXIgcGF0Y2ggZm9yIGF1dG9zZXQgYXMgbGlua2VkIGJlbG93IGFzCnBhcnQgb2Yg
YSBzZXJpZXMgdG8gYWRkIGEgUm9ja2NoaXAgSU8tZG9tYWluIGRyaXZlciBzaG9ydGx5LiBJbiBj
dXJyZW50CnN0YXRlIGF1dG9zZXQgY2Fubm90IHNhZmVseSBiZSBjYWxsZWQgbXVsdGlwbGUgdGlt
ZXMsIGFuZCBzdWNoIHBhdGNoCnNob3VsZCBub3QgaGF2ZSBhbiBpbXBhY3Qgb24gdGhlIGRpcmVj
dGlvbiBvZiB0aGlzIHNlcmllcy4KCj4gCj4+IC0gQ2hhbmdlZCB0byBvbmx5IHByb2JlLWFmdGVy
LWJpbmQgb24gcmVndWxhdG9ycyBtYXJrZWQgYXMKPj4gIGFsd2F5cy1vbi9ib290LW9uLgo+Pgo+
PiBBbmQgaXQgd29ya3Mgc29tZXRoaW5nIGxpa2UgdGhpczoKPj4KPj4gc3RhdGljIGludCByZWd1
bGF0b3JfcG9zdF9iaW5kKHN0cnVjdCB1ZGV2aWNlICpkZXYpCj4+IHsKPj4gCVsuLi5dCj4+Cj4+
IAlpZiAodWNfcGRhdGEtPmFsd2F5c19vbiB8fCB1Y19wZGF0YS0+Ym9vdF9vbikKPj4gCQlkZXZf
b3JfZmxhZ3MoZGV2LCBETV9GTEFHX1BST0JFX0FGVEVSX0JJTkQpOwo+PiB9Cj4+Cj4+IHN0YXRp
YyBpbnQgcmVndWxhdG9yX3Bvc3RfcHJvYmUoc3RydWN0IHVkZXZpY2UgKmRldikKPj4gewo+PiAJ
cmV0ID0gcmVndWxhdG9yX2F1dG9zZXQoZGV2KTsKPj4gfQo+Pgo+PiBXaXRoIHRoYXQgYW55IGFs
d2F5cy1vbi9ib290LW9uIHJlZ3VsYXRvciB3b3VsZCBhdXRvbWF0aWNhbGx5IHByb2JlIGFuZAo+
PiBhdXRvc2V0IGFmdGVyIGJpbmQsIHJlbWFpbmluZyB3b3VsZCBvbmx5IHByb2JlIGFuZCBhdXRv
c2V0IGlmIHRoZXkgYXJlCj4+IHVzZWQuCj4gCj4gdWNfcGRhdGEgaXMgZmlsbGVkIGluIHByZV9w
cm9iZSwgd2hpbGUgeW91IGFyZSBydW5pbmcgY2hlY2sgaW4gcG9zdF9iaW5kLgoKUGxlYXNlIGxv
b2sgY2xvc2VyIGF0IHRoZSBjb2RlIGFuZCBub3QgdGhlIHNuaXBwZXQgYWJvdmUsIHRoZXkgYXJl
CmZpbGxlZCBpbiBwb3N0X2JpbmQgb3IgdGhlIGNvZGUgd291bGQgbm90IGhhdmUgd29ya2VkIDot
KQoKUmVnYXJkcywKSm9uYXMKCj4gCj4+IFRoaXMgYXBwcm9hY2ggc2hvdWxkIGFsc28gcHJldmVu
dCBoYXZpbmcgdG8gY2hhbmdlIGV4aXN0aW5nIGNvZGUgdGhhdAo+PiBtYXkgY2FsbCBhdXRvc2V0
LCBhbmQgY2xlYW51cCBjYW4gYmUgZG9uZSBpbiBmb2xsb3ctdXAgcGF0Y2hlcy9zZXJpZXMuCj4+
Cj4+IFByb2JlLWFmdGVyLWJpbmQgYW5kIGNhbGwgdG8gYXV0b3NldCBjb3VsZCBhbHNvIGJlIHBy
b3RlY3RlZCB3aXRoIGEgbmV3Cj4+IEtjb25maWcgdG8gaGVscCB3aXRoIHRyYW5zaXRpb24uCj4+
Cj4+IFNlZSBmb2xsb3dpbmcgZm9yIGEgd29ya2luZyBleGFtcGxlIHVzaW5nIGEgbmV3IGRyaXZl
ciB0aGF0IGRlcGVuZHMKPj4gb24gdGhhdCByZWd1bGF0b3JzIGhhdmUgYmVlbiBhdXRvc2V0IHBy
aW9yIHRvIHJlZ3VsYXRvcl9nZXRfdmFsdWUuCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9Ld2lib28v
dS1ib290LXJvY2tjaGlwL2NvbXBhcmUvbWFzdGVyLi4ucmszNTY4LWlvLWRvbWFpbgo+Pgo+PiBP
ciB0aGUgdHdvIGNvbW1pdHMgc2VwYXJhdGU6Cj4+Cj4+IHBvd2VyOiByZWd1bGF0b3I6IE9ubHkg
cnVuIGF1dG9zZXQgb25jZSBmb3IgZWFjaCByZWd1bGF0b3IKPj4gaHR0cHM6Ly9naXRodWIuY29t
L0t3aWJvby91LWJvb3Qtcm9ja2NoaXAvY29tbWl0LzA1ZGI0ZGJjYjhmOTA4YjQxN2VkNWNhZThh
N2EzMjVjODIxMTJkNzUKPj4KPj4gcG93ZXI6IHJlZ3VsYXRvcjogUGVyZm9ybSByZWd1bGF0b3Ig
c2V0dXAgaW5zaWRlIHVjbGFzcwo+PiBodHRwczovL2dpdGh1Yi5jb20vS3dpYm9vL3UtYm9vdC1y
b2NrY2hpcC9jb21taXQvNDg5YmQ1ZDJjMWEyYTMzODI0ZWFjNGYyZDU0Mzk5ZWY1ZGZmNGZkZgo+
Pgo+PiBSZWdhcmRzLAo+PiBKb25hcwo+Pgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTdnlh
dG9zbGF2IFJ5aGVsIDxjbGFtb3I5NUBnbWFpbC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgZHJpdmVy
cy9wb3dlci9yZWd1bGF0b3IvcmVndWxhdG9yLXVjbGFzcy5jIHwgMjEyICsrKysrKy0tLS0tLS0t
LS0tLS0tLQo+Pj4+PiAgaW5jbHVkZS9wb3dlci9yZWd1bGF0b3IuaCAgICAgICAgICAgICAgICAg
IHwgMTE5IC0tLS0tLS0tLS0tLQo+Pj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25z
KCspLCAyNjkgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBSZWdhcmRzLAo+Pj4+IFNJbW9uCj4+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0z
MiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9v
dC1zdG0zMgo=
