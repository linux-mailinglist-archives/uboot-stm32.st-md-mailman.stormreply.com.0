Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D482DD91
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 17:26:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3896C6B457;
	Mon, 15 Jan 2024 16:26:36 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59D19C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 16:26:35 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-50eabd1c701so10821357e87.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 08:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foundries.io; s=google; t=1705335994; x=1705940794;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I2ULnBts3eiCPQ4rcf6zBr7I4Aq0uQ8ncBziZmt4kGY=;
 b=ZIYVjjhen6uXJEhyzisgYxFiGGalsdIl2KcTGhaHKzCcsrJ2q/2H9zmZjxbcDVqopx
 +8Ajn9vyjXvecoYB5tvQJCjqo/QtTKRlyn5FMOD9n6TzGp53kM1LV9Lw55LrkGeOgXSJ
 Sp7DPzTDvidlqLic72ZPolrTGE+44NxxAXw82CRKLQ/scXKvyn8DejhyAwj2mpM2QJes
 ROEOMODlFaTHJjyYVApa1jN6W0uG1exDeEL7zA2Moh918ZoYaFq6SuOyMaFw7Mb+wFvV
 n4Un6739c4wpZkTwyRBgV/vboBQfrPm38Ic8tUzBgNaV2S2xPzqrSA8lCH7+aaNKtt5h
 BKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705335994; x=1705940794;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2ULnBts3eiCPQ4rcf6zBr7I4Aq0uQ8ncBziZmt4kGY=;
 b=RjcLhJQrPP37q3w3dgy9BR7ExUPqud+Qx2zm9ZWj5gGFFDe8RmwIh6C9AF/3vvqRYC
 Le8rqFkQa+xN3q8Fn58+PBxUCEPFR3FR6nPA4hq6xNzI6rNjNB8lZLxx/Ji7Xkpp2kLQ
 fLI2Lmvfk6eIc4FAVp9QyL2uC26H6kYS/Q36xoE5TitGs+ZZnL75f+vdpoBeAh0moEfD
 9kDAXM6xOOnSC6VpGFuAgWGdFsI6mbwsppA9vfOYXAWfqTP7XdaKSjz4FSTFh8utrIiX
 qqU9GQ8mMkvRpR7zUi9A1QPa46ht3bvN7SLOpfL+s73smhPDO0O6JdH8gb+U73WYdH/a
 dvSQ==
X-Gm-Message-State: AOJu0Yz3QLPDxYto/NxvyciAHps9ia9cCpNUSRK/b9+FpWUZ/c+7jnKo
 OvcGpStmLlRmsQTzfJ24oD8cO4Furs/iKrnaIKA6aPRKwTt48w==
X-Google-Smtp-Source: AGHT+IFDSh8QJ4kBc7UCKdJoB75/I3NYWelHLRcjs3R9lttqmo4nvm/7BeJdzesFQufT+gct2mI6YzuHOHUM6a9MLY4=
X-Received: by 2002:a05:6512:3c8d:b0:50e:74c1:64d2 with SMTP id
 h13-20020a0565123c8d00b0050e74c164d2mr3778658lfv.94.1705335994365; Mon, 15
 Jan 2024 08:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
 <20240115150451.v2.6.I175b5b047ccdb4198f1ae11bac19411617623518@changeid>
In-Reply-To: <20240115150451.v2.6.I175b5b047ccdb4198f1ae11bac19411617623518@changeid>
From: Igor Opaniuk <igor.opaniuk@foundries.io>
Date: Mon, 15 Jan 2024 17:26:22 +0100
Message-ID: <CAL6CDMESvLgGFrOb2767nCUiKPJcP9XLWkY1du+sKWamZf24Mw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
Subject: Re: [Uboot-stm32] [PATCH v2 06/14] stm32mp: add soc.c file
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

T24gTW9uLCBKYW4gMTUsIDIwMjQgYXQgMzowN+KAr1BNIFBhdHJpY2sgRGVsYXVuYXkKPHBhdHJp
Y2suZGVsYXVuYXlAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gQWRkIGEgbmV3IGZpbGUgc29jLmMg
Zm9yIGNvbW1vbiBmdW5jdGlvbnMgYmV0d2VlbiBzdG0zMm1wMSBhbmQgc3RtMzJtcDIKPiBmYW1p
bHkgYW5kIG1vdmUgcHJpbnRfY3B1aW5mbygpIGluIHRoaXMgbmV3IGZpbGUuCj4KPiBSZXZpZXdl
ZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNv
bT4KPiAtLS0KPgo+IChubyBjaGFuZ2VzIHNpbmNlIHYxKQo+Cj4gIGFyY2gvYXJtL21hY2gtc3Rt
MzJtcC9NYWtlZmlsZSAgICAgICB8ICAxICsKPiAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3NvYy5j
ICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysKPiAgYXJjaC9hcm0vbWFjaC1zdG0zMm1w
L3N0bTMybXAxL2NwdS5jIHwgMTEgLS0tLS0tLS0tLS0KPiAgYXJjaC9hcm0vbWFjaC1zdG0zMm1w
L3N0bTMybXAyL2NwdS5jIHwgMTEgLS0tLS0tLS0tLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAxOCBp
bnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
YXJtL21hY2gtc3RtMzJtcC9zb2MuYwo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3Rt
MzJtcC9NYWtlZmlsZSBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9NYWtlZmlsZQo+IGluZGV4IDAw
ZGMyNWJiMjc1Yy4uZmRjYmJmOTFkZmQ1IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3Rt
MzJtcC9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9NYWtlZmlsZQo+IEBA
IC02LDYgKzYsNyBAQAo+ICBvYmoteSArPSBkcmFtX2luaXQubwo+ICBvYmoteSArPSBzeXNjb24u
bwo+ICBvYmoteSArPSBic2VjLm8KPiArb2JqLXkgKz0gc29jLm8KPgo+ICBvYmotJChDT05GSUdf
U1RNMzJNUDE1eCkgKz0gc3RtMzJtcDEvCj4gIG9iai0kKENPTkZJR19TVE0zMk1QMTN4KSArPSBz
dG0zMm1wMS8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3NvYy5jIGIvYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL3NvYy5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwMDAuLjhkNWZhNDc0Y2NhZgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL2Fy
bS9tYWNoLXN0bTMybXAvc29jLmMKPiBAQCAtMCwwICsxLDE3IEBACj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyIE9SIEJTRC0zLUNsYXVzZQo+ICsvKgo+ICsg
KiBDb3B5cmlnaHQgKEMpIDIwMjQsIFNUTWljcm9lbGVjdHJvbmljcyAtIEFsbCBSaWdodHMgUmVz
ZXJ2ZWQKPiArICovCj4gKwo+ICsjaW5jbHVkZSA8YXNtL2FyY2gvc3lzX3Byb3RvLmg+Cj4gKwo+
ICsvKiB1c2VkIHdoZW4gQ09ORklHX0RJU1BMQVlfQ1BVSU5GTyBpcyBhY3RpdmF0ZWQgKi8KPiAr
aW50IHByaW50X2NwdWluZm8odm9pZCkKPiArewo+ICsgICAgICAgY2hhciBuYW1lW1NPQ19OQU1F
X1NJWkVdOwo+ICsKPiArICAgICAgIGdldF9zb2NfbmFtZShuYW1lKTsKPiArICAgICAgIHByaW50
ZigiQ1BVOiAlc1xuIiwgbmFtZSk7Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL2NwdS5jIGIvYXJjaC9hcm0v
bWFjaC1zdG0zMm1wL3N0bTMybXAxL2NwdS5jCj4gaW5kZXggNTU1NzRmZDRiZWJmLi4wMGZlYTc5
MjliMmYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL2NwdS5j
Cj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL2NwdS5jCj4gQEAgLTE1OCwx
NyArMTU4LDYgQEAgdm9pZCBlbmFibGVfY2FjaGVzKHZvaWQpCj4gICAgICAgICBkY2FjaGVfZW5h
YmxlKCk7Cj4gIH0KPgo+IC0vKiB1c2VkIHdoZW4gQ09ORklHX0RJU1BMQVlfQ1BVSU5GTyBpcyBh
Y3RpdmF0ZWQgKi8KPiAtaW50IHByaW50X2NwdWluZm8odm9pZCkKPiAtewo+IC0gICAgICAgY2hh
ciBuYW1lW1NPQ19OQU1FX1NJWkVdOwo+IC0KPiAtICAgICAgIGdldF9zb2NfbmFtZShuYW1lKTsK
PiAtICAgICAgIHByaW50ZigiQ1BVOiAlc1xuIiwgbmFtZSk7Cj4gLQo+IC0gICAgICAgcmV0dXJu
IDA7Cj4gLX0KPiAtCj4gIHN0YXRpYyB2b2lkIHNldHVwX2Jvb3RfbW9kZSh2b2lkKQo+ICB7Cj4g
ICAgICAgICBjb25zdCB1MzIgc2VyaWFsX2FkZHJbXSA9IHsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL2NwdS5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0
bTMybXAyL2NwdS5jCj4gaW5kZXggZjQzZDFhYWY3MmNjLi5jMGY2NTE5ZThkN2MgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL2NwdS5jCj4gKysrIGIvYXJjaC9h
cm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL2NwdS5jCj4gQEAgLTY3LDE3ICs2Nyw2IEBAIHZvaWQg
ZW5hYmxlX2NhY2hlcyh2b2lkKQo+ICAgICAgICAgZGNhY2hlX2VuYWJsZSgpOwo+ICB9Cj4KPiAt
LyogdXNlZCB3aGVuIENPTkZJR19ESVNQTEFZX0NQVUlORk8gaXMgYWN0aXZhdGVkICovCj4gLWlu
dCBwcmludF9jcHVpbmZvKHZvaWQpCj4gLXsKPiAtICAgICAgIGNoYXIgbmFtZVtTT0NfTkFNRV9T
SVpFXTsKPiAtCj4gLSAgICAgICBnZXRfc29jX25hbWUobmFtZSk7Cj4gLSAgICAgICBwcmludGYo
IkNQVTogJXNcbiIsIG5hbWUpOwo+IC0KPiAtICAgICAgIHJldHVybiAwOwo+IC19Cj4gLQo+ICBp
bnQgYXJjaF9taXNjX2luaXQodm9pZCkKPiAgewo+ICAgICAgICAgcmV0dXJuIDA7Cj4gLS0KPiAy
LjI1LjEKPgoKUmV2aWV3ZWQtYnk6IElnb3IgT3Bhbml1ayA8aWdvci5vcGFuaXVrQGZvdW5kcmll
cy5pbz4KCi0tIApCZXN0IHJlZ2FyZHMgLSBGcmV1bmRsaWNoZSBHcsO8c3NlIC0gTWVpbGxldXJl
cyBzYWx1dGF0aW9ucwoKSWdvciBPcGFuaXVrCkVtYmVkZGVkIFNvZnR3YXJlIEVuZ2luZWVyClQ6
ICArMzgwIDkzODM2NDA2NwpFOiBpZ29yLm9wYW5pdWtAZm91bmRyaWVzLmlvClc6IHd3dy5mb3Vu
ZHJpZXMuaW8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vdWJvb3Qtc3RtMzIK
