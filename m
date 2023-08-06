Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1C8771608
	for <lists+uboot-stm32@lfdr.de>; Sun,  6 Aug 2023 18:22:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E393C6B44B;
	Sun,  6 Aug 2023 16:22:07 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23471C65E58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Aug 2023 16:22:06 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-99cdb0fd093so3478966b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Aug 2023 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691338925; x=1691943725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RNmsTwI7erStSG/2JTlMTXnY734GJ8ACbwIf08EUsOA=;
 b=M4dc754Ds/JhuWDI8FegySoijTwYMGiuOTaJCEsFf00wzY+0jXDekrh0kj/5u6jvab
 tRAPnkXqVk37T8ev+sdex5FUKRS8e3GmaPq7zX8htsB0/9vRXtlx063Rzz9Xp/UWCM7V
 ygsUGuBM6WRtcA/u0jnAbIwMs32sYnh+WBYLgX1NLdp70VkIw/EfokNGPVN7bP8p89v7
 DXAz4NmVJeAafYgVIlvserVZ1e4lljv6pSjqEj/eIsoZvnlZVjcEmkBduQwe5sxVLMrP
 MtgqoDkpvI+UG52nMrwOHq+ZoakO8zhRHXur84xWIuBvCG38Br+aqstHFIL9FTZFzUH3
 1e7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691338925; x=1691943725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RNmsTwI7erStSG/2JTlMTXnY734GJ8ACbwIf08EUsOA=;
 b=l5pJdsNP8aGGlEQgudy08x5VCpHPSbMdFN7yhqg4thAzra3kubDW+A60sZbkgsxhdp
 1ncbbXXIWLEJ3qrL5bi+JJYGuenJTIKlh70wedqHQiBfFma6ucx/MCZAqJhStbjpz6M+
 ZmmfrsjDZrepcUcUJhGS+ubpKAPzvS64WDrIAdmbTInCM70nWIEDRrcdfk4jXdOQZH/O
 uKO5WlV/p69Z8/zGVe3GniCI+W3en3NOnCuna8p5BzIz0hc1PeEpemYXuQfjwjZ0OfTh
 BM3Vy7MKOBfm7JrFkp40fac41Sxa1pD2Enzzm0DddaFFfZ727iOTreRdcmSp4eGEOfkR
 1k1w==
X-Gm-Message-State: AOJu0YwkVXY1ordqPcPf30+20pZIHzNSK3u0Ci8d/Wn5ULo64xN/Iebt
 o/uULvZq/CM3ayu0PM4bIhPSh8mXzRxjMBernpo=
X-Google-Smtp-Source: AGHT+IEvMnTKCKKq6MW4pm06MIh/xl6Swnk8eyIyIEcJcThZk/Oqrc9U6dunbOQGtxXuWG/7+DRFpzY6w/FnXAurkDU=
X-Received: by 2002:a17:906:257:b0:991:fef4:bb7 with SMTP id
 23-20020a170906025700b00991fef40bb7mr6129760ejl.73.1691338925272; Sun, 06 Aug
 2023 09:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230720123744.26854-1-clamor95@gmail.com>
 <20230720123744.26854-4-clamor95@gmail.com>
 <CAPnjgZ3jXmqtB=MTv7-SvEaKGyHHgO=zh5m8yPP=hbobh=B=pg@mail.gmail.com>
 <CAPVz0n2wxT_u0BDSdq5+VOkScdDJxAsBntr_p6ajawxiEszyzg@mail.gmail.com>
 <09c6ff35-250a-18ff-667d-9ce62e24b18c@kwiboo.se>
In-Reply-To: <09c6ff35-250a-18ff-667d-9ce62e24b18c@kwiboo.se>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 6 Aug 2023 19:21:54 +0300
Message-ID: <CAPVz0n3v4U4_9SWgtRmpJR+SF1Ta2meOkvj5q8xrvB8qn9P7iw@mail.gmail.com>
To: Jonas Karlman <jonas@kwiboo.se>, Simon Glass <sjg@chromium.org>
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

0YHQsSwgNSDRgdC10YDQvy4gMjAyM+KAr9GALiDQviAxNTo0OSBKb25hcyBLYXJsbWFuIDxqb25h
c0Brd2lib28uc2U+INC/0LjRiNC1Ogo+Cj4gSGksCj4KPiBPbiAyMDIzLTA3LTIxIDA3OjM0LCBT
dnlhdG9zbGF2IFJ5aGVsIHdyb3RlOgo+ID4g0YfRgiwgMjAg0LvQuNC/LiAyMDIz4oCv0YAuINC+
IDIyOjQzIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPiDQv9C40YjQtToKPiA+Pgo+ID4+
IEhpIFN2eWF0b3NsYXYsCj4gPj4KPiA+PiBPbiBUaHUsIDIwIEp1bCAyMDIzIGF0IDA2OjM4LCBT
dnlhdG9zbGF2IFJ5aGVsIDxjbGFtb3I5NUBnbWFpbC5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+PiBS
ZWd1bGF0b3JzIGluaXRpYWwgc2V0dXAgd2FzIHByZXZpb3VzbHkgZGVwZW5kZW50IG9uIGJvYXJk
IGNhbGwuCj4gPj4+IFRvIG1vdmUgZnJvbSB0aGlzIGJlaGF2aW91ciB3ZXJlIGludHJvZHVjZWQg
dHdvIHN0ZXBzLiBGaXJzdCBpcwo+ID4+PiB0aGF0IGFsbCBpbmRpdmlkdWFsIHJlZ3VsYXRvcnMg
d2lsbCBiZSBwcm9iZWQganVzdCBhZnRlciBiaW5kaW5nCj4gPj4KPiA+PiBXZSBtdXN0IG5vdCBw
cm9iZSBkZXZpY2VzIGF1dG9tYXRpY2FsbHkgd2hlbiBib3VuZC4gVGhlIGkyYyBpbnRlcmZhY2UK
PiA+PiBtYXkgbm90IGJlIGF2YWlsYWJsZSwgZXRjLiBEbyBhIHByb2JlIGFmdGVyd2FyZHMuCj4g
Pj4KPiA+PiBQZXJoYXBzIEkgYW0gbWlzdW5kZXJzdGFuZGluZyB0aGlzLCBpd2MgcGxlYXNlIHJl
d29yZCB0aGlzIGNvbW1pdCBtZXNzYWdlLgo+ID4KPiA+IEFmdGVyIGJvdW5kLiBJZiB0aGUgcmVn
dWxhdG9yIGlzIGEgc2VsZi1zdWZmaWNpZW50IGkyYyBkZXZpY2UgdGhlbiBpdAo+ID4gd2lsbCBi
ZSBib3VuZAo+ID4gYWZ0ZXIgaTJjIGlzIGF2YWlsYWJsZSBieSBjb2RlIGRlc2lnbiBzbyBpMmMg
aW50ZXJmYWNlIHNob3VsZCBiZQo+ID4gYXZhaWxhYmxlIGF0IHRoYXQKPiA+IG1vbWVudC4gQXQg
bGVhc3QgbGVkIGFuZCBncGlvIHVjbGFzc2VzIHBlcmZvcm0gdGhpcyBmb3IgaW5pdGlhbCBzZXR1
cAo+ID4gb2YgZGV2aWNlcy4KPiA+Cj4gPiBQbGF0Zm9ybSByZWd1bGF0b3JzIChha2EgZml4ZWQv
Z3BpbyByZWd1bGF0b3JzKSB3b3JrIHBlcmZlY3RseSBmaW5lLiBJCj4gPiBoYXZlIG5vIGkyYwo+
ID4gcmVndWxhdG9ycyB0byB0ZXN0IGRlZXBseS4KPiA+Cj4gPiBBcyBmb3Igbm93IG9ubHkgb25l
IHVjbGFzcyBpcyBub3QgY29tcGF0aWJsZSB3aXRoIHRoaXMgc3lzdGVtIC0gUE1JQyB3aGljaCBo
YXMKPiA+IHN0cm9uZyBkZXBlbmRlbmN5IGJldHdlZW4gcmVndWxhdG9yIGFuZCBtYWluIG1mZC4g
VGhpcyBpcyB3aHkgcHJvYmluZyBhZnRlcgo+ID4gYmluZCBmb3IgcG1pYyByZWd1bGF0b3JzIGlz
IGRpc2FibGVkIGFuZCBwbWljIHJlZ3VsYXRvcnMgYXJlIHByb2JlZCBvbiBwbWljIGNvcmUKPiA+
IHBvc3RfcHJvYmUuCj4KPiBUaGlzIHNvdW5kcyBtb3JlIGxpa2UgYSBwb3NzaWJsZSBidWcgb2Yg
c29tZSBkZXBlbmRlbmN5IG5vdCBiZWluZwo+IHByb2JlZCBpbiBjb3JyZWN0IG9yZGVyIG9yIG5v
dCBsZWF2aW5nIHRoZSBkZXZpY2UgaW4gYSByZWFkeSBzdGF0ZQo+IGFmdGVyIHByb2JlLgo+Cj4g
SWYgcG1pYyByZWd1bGF0b3JzIGFyZSBiaW5kIGluIHBtaWMgYmluZCB3aXRoIHRoZSBwbWljIGFz
IHBhcmVudCwgdGhlbgo+IGF0IHJlZ3VsYXRvciBwcm9iZSB0aGUgZHJpdmVyIGNvcmUgZW5zdXJl
IHRoYXQgcG1pYyBoYXMgcHJvYmVkIGJlZm9yZQo+IHJlZ3VsYXRvciB1c2UuCgpJIGhhdmUgZm91
bmQgd2h5IHRoaXMgb2NjdXJzLiBXaXRoIHRoaXMgcGF0Y2hzZXQgYWx3YXlzL2Jvb3Qtb24gcmVn
dWxhdG9ycwphcmUgcHJvYmVkIGltbWVkaWF0ZWx5IGFmdGVyIGJpbmQsIHNpbmNlIHBtaWMgcmVn
dWxhdG9ycyBhcmUgYm91bmQgb24gcG1pY3MKYmluZCBpdCBjYXVzZXMgYSBzaXR1YXRpb24gd2hl
biByZWd1bGF0b3IgaXMgcHJvYmVkIGJlZm9yZSBwbWljIGFuZCBwbWljcyBvcHMKYXJlIG5vdCBh
dmFpbGFibGUuIE1vdmluZyBwbWljIGNoaWxkcmVuIGJpbmQgdG8gcG1pY3MgcHJvYmUgZml4ZWQg
dGhpcyBpc3N1ZS4KCj4gVGhpcyB3b3JrcyBwZXJmZWN0IGZpbmUgd2l0aCB0aGUgUks4eHggSTJD
IFBNSUMgYW5kIGl0cyByZWd1bGF0b3JzLgo+IFdpY2ggYSBjYWxsIHRvIGRldmljZV9nZXRfc3Vw
cGx5X3JlZ3VsYXRvcihkZXYsICJ0ZXN0LXN1cHBseSIsICZyZWcpCj4gcHJvYmUgaGFwcGVucyBp
biBpMmMsIHBtaWMgYW5kIHJlZ3VsYXRvciBvcmRlci4KPgo+ID4KPiA+Pj4gd2hpY2ggZW5zdXJl
cyB0aGF0IHJlZ3VsYXRvciBwZGF0YSBpcyBmaWxsZWQgYW5kIHNlY29uZCBpcyBzZXR0aW5nCj4g
Pj4+IHVwIHJlZ3VsYXRvciBpbiBwb3N0IHByb2JlIHdoaWNoIGVuc2VyZXMgdGhhdCBjb3JyZWN0
IHJlZ3VsYXRvcgo+ID4+PiBzdGF0ZSBhY2NvcmRpbmcgdG8gcGRhdGEgaXMgcmVhY2hlZC4KPgo+
IEkgdGhpbmsgdGhhdCB0aGUgYXBwcm9hY2ggaW4gdGhpcyBwYXRjaCBpcyB0cnlpbmcgdG8gY2hh
bmdlIHRvbyBtdWNoIGFsbAo+IGF0IG9uY2UuCj4KPiBIYXZlIG1hZGUgc29tZSBhZGp1c3RtZW50
cyB0aGF0IEkgdGhpbmsgc2hvdWxkIGhlbHAgd2l0aCB0cmFuc2l0aW9uLgo+IC0gQWRkZWQgYSBm
bGFnIHRvIHByb3RlY3QgcmVndWxhdG9yX2F1dG9zZXQgZnJvbSBiZWluZyBjYWxsZWQgbW9yZSB0
aGVuCj4gICBvbmNlIGZvciBlYWNoIHJlZ3VsYXRvciwgaW4gYSBzZXBhcmF0ZSBwYXRjaC4KPiAt
IENoYW5nZWQgdG8gb25seSBwcm9iZS1hZnRlci1iaW5kIG9uIHJlZ3VsYXRvcnMgbWFya2VkIGFz
Cj4gICBhbHdheXMtb24vYm9vdC1vbi4KPgo+IEFuZCBpdCB3b3JrcyBzb21ldGhpbmcgbGlrZSB0
aGlzOgo+Cj4gc3RhdGljIGludCByZWd1bGF0b3JfcG9zdF9iaW5kKHN0cnVjdCB1ZGV2aWNlICpk
ZXYpCj4gewo+ICAgICAgICAgWy4uLl0KPgo+ICAgICAgICAgaWYgKHVjX3BkYXRhLT5hbHdheXNf
b24gfHwgdWNfcGRhdGEtPmJvb3Rfb24pCj4gICAgICAgICAgICAgICAgIGRldl9vcl9mbGFncyhk
ZXYsIERNX0ZMQUdfUFJPQkVfQUZURVJfQklORCk7Cj4gfQo+Cj4gc3RhdGljIGludCByZWd1bGF0
b3JfcG9zdF9wcm9iZShzdHJ1Y3QgdWRldmljZSAqZGV2KQo+IHsKPiAgICAgICAgIHJldCA9IHJl
Z3VsYXRvcl9hdXRvc2V0KGRldik7Cj4gfQo+Cj4gV2l0aCB0aGF0IGFueSBhbHdheXMtb24vYm9v
dC1vbiByZWd1bGF0b3Igd291bGQgYXV0b21hdGljYWxseSBwcm9iZSBhbmQKPiBhdXRvc2V0IGFm
dGVyIGJpbmQsIHJlbWFpbmluZyB3b3VsZCBvbmx5IHByb2JlIGFuZCBhdXRvc2V0IGlmIHRoZXkg
YXJlCj4gdXNlZC4KPgo+IFRoaXMgYXBwcm9hY2ggc2hvdWxkIGFsc28gcHJldmVudCBoYXZpbmcg
dG8gY2hhbmdlIGV4aXN0aW5nIGNvZGUgdGhhdAo+IG1heSBjYWxsIGF1dG9zZXQsIGFuZCBjbGVh
bnVwIGNhbiBiZSBkb25lIGluIGZvbGxvdy11cCBwYXRjaGVzL3Nlcmllcy4KPgo+IFByb2JlLWFm
dGVyLWJpbmQgYW5kIGNhbGwgdG8gYXV0b3NldCBjb3VsZCBhbHNvIGJlIHByb3RlY3RlZCB3aXRo
IGEgbmV3Cj4gS2NvbmZpZyB0byBoZWxwIHdpdGggdHJhbnNpdGlvbi4KPgo+IFNlZSBmb2xsb3dp
bmcgZm9yIGEgd29ya2luZyBleGFtcGxlIHVzaW5nIGEgbmV3IGRyaXZlciB0aGF0IGRlcGVuZHMK
PiBvbiB0aGF0IHJlZ3VsYXRvcnMgaGF2ZSBiZWVuIGF1dG9zZXQgcHJpb3IgdG8gcmVndWxhdG9y
X2dldF92YWx1ZS4KPiBodHRwczovL2dpdGh1Yi5jb20vS3dpYm9vL3UtYm9vdC1yb2NrY2hpcC9j
b21wYXJlL21hc3Rlci4uLnJrMzU2OC1pby1kb21haW4KPgo+IE9yIHRoZSB0d28gY29tbWl0cyBz
ZXBhcmF0ZToKPgo+IHBvd2VyOiByZWd1bGF0b3I6IE9ubHkgcnVuIGF1dG9zZXQgb25jZSBmb3Ig
ZWFjaCByZWd1bGF0b3IKPiBodHRwczovL2dpdGh1Yi5jb20vS3dpYm9vL3UtYm9vdC1yb2NrY2hp
cC9jb21taXQvMDVkYjRkYmNiOGY5MDhiNDE3ZWQ1Y2FlOGE3YTMyNWM4MjExMmQ3NQo+Cj4gcG93
ZXI6IHJlZ3VsYXRvcjogUGVyZm9ybSByZWd1bGF0b3Igc2V0dXAgaW5zaWRlIHVjbGFzcwo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9Ld2lib28vdS1ib290LXJvY2tjaGlwL2NvbW1pdC80ODliZDVkMmMx
YTJhMzM4MjRlYWM0ZjJkNTQzOTllZjVkZmY0ZmRmCj4KPiBSZWdhcmRzLAo+IEpvbmFzCj4KPiA+
Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogU3Z5YXRvc2xhdiBSeWhlbCA8Y2xhbW9yOTVAZ21haWwu
Y29tPgo+ID4+PiAtLS0KPiA+Pj4gIGRyaXZlcnMvcG93ZXIvcmVndWxhdG9yL3JlZ3VsYXRvci11
Y2xhc3MuYyB8IDIxMiArKysrKystLS0tLS0tLS0tLS0tLS0KPiA+Pj4gIGluY2x1ZGUvcG93ZXIv
cmVndWxhdG9yLmggICAgICAgICAgICAgICAgICB8IDExOSAtLS0tLS0tLS0tLS0KPiA+Pj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgMjY5IGRlbGV0aW9ucygtKQo+ID4+Cj4g
Pj4gUmVnYXJkcywKPiA+PiBTSW1vbgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
