Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB4A3D110B
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Jul 2021 16:19:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25B31C597BF;
	Wed, 21 Jul 2021 14:19:41 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BC30C597BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 14:19:38 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id m2so2409198wrq.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 07:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cB1Z8iTuGbGbGHaU3Yp5354EcUUnCTpO0DE7z1gbuTs=;
 b=aEezGQtTe5iIBjegyaJvdO8Ly/X4tHaPaLhuNVbZI7ryHCFUSl7mdjizpU8Oy31RcN
 lFU46FlZGuq0rO/nwHe+aVelt4S40R+UOfUOySFV4w/vvbGUt5OGwDINVsITuXZAyN4S
 AixAoObkkWq8zC9r6jUyIxNnycmL73B1/eeKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cB1Z8iTuGbGbGHaU3Yp5354EcUUnCTpO0DE7z1gbuTs=;
 b=RP0/KRW4M/+0shQiOk24G/4JYpj+tUCMkdOCXZn4aG3jw+snr3fRnLXSV+8GciRMy0
 3kbkqvHddSyl9oiHT/g+QbAMJZ1CjDbW78ZjQtkkvBEmAVzqsLLAJ2fYuxZhAeMoM0Op
 JPe8cnu4YBgJIIMiKVGgKrpyfJqfKs2ddivXIw6URSLqb7GhvQ5O3Eat3YMDCFPNKR5O
 PKlNvKMkr/N3X4aavKwhKe19e5B91Sc7ArYFAFTCW4bYvRpBFXmmJ5U1EdUHV75Y4py1
 C4v3JNjsBYXrRu1gEZeGY3fyTBrq6Q7D0LfhSafspaTEUiKXfP6ZNOyJXrnfhgfx8KwA
 +NQA==
X-Gm-Message-State: AOAM531HvL6NCn6/+k7ZxhlycFTMVl2Bq+KHCucZZDqkdD4m9mtVNf++
 xTop4wTOegCUR1ZjXWYMUI6pFHAJ5ly44Zgo5EFrmg==
X-Google-Smtp-Source: ABdhPJy1fauZGhR7XIANxClSSrnsv1IE32+ruq2WkjQ8hq3Cz78i9hSFT2rko9dbJLGS4YxtpajEL9y5hNrKT/aOy7I=
X-Received: by 2002:adf:ce83:: with SMTP id r3mr43506049wrn.204.1626877178030; 
 Wed, 21 Jul 2021 07:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210721114521.1.I6630d4cc18870d3e830587ffbcb61898dc045cb6@changeid>
In-Reply-To: <20210721114521.1.I6630d4cc18870d3e830587ffbcb61898dc045cb6@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 21 Jul 2021 08:19:26 -0600
Message-ID: <CAPnjgZ1-T6+5L_LjLXnbTn9y2DPjYci-xNS8Ph_U4hwiDRU+xw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH] patman: add warning for invalid tag
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

SGkgUGF0cmljaywKCk9uIFdlZCwgMjEgSnVsIDIwMjEgYXQgMDM6NDUsIFBhdHJpY2sgRGVsYXVu
YXkKPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gQWRkIGEgZXJyb3Ig
aW4gcGF0bWFuIHRvb2wgd2hlbiB0aGUgY29tbWl0IG1lc3NhZ2UgY29udGVudHMgYW4gaW52YWxp
ZAo+IHRhZyAiU2VyaWUtLioiIGluc3RlYWQgb2YgIlNlcmllcy0uKiIuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IC0t
LQo+IEkgY3JlYXRlIHRoaXMgcGF0Y2ggdG8gYXZvaWQgbXkgZnJlcXVlbnQgbWlzdGFrZToKPiB1
c2luZyAiU2VyaWUtIiB0YWcgaW5zdGVhZCBvZiAiU2VyaWVzLSIgYXMgaXQgaXMgZG9uZSBpbiBb
MV0uCj4KPiBSRV9JTlZfVEFHIGNhbiBiZSBleHRlbmRlZCB0byBvdGhlciBmcmVxdWVudCBlcnJv
cnMuCj4KPiBBbnkgIlNlcmllLSIgdGFnIGlzIHJlZnVzZWQgd2l0aCB0aGUgcGF0Y2gsIGZvciBl
eGFtcGxlOgo+Cj4gVmFsdWVFcnJvcjogTGluZSAyODogSW52YWxpZCB0YWcgPQo+ICAgICdTZXJp
ZS1jYzogTWFyZWsgQmVow7puIDxtYXJlay5iZWh1bkBuaWMuY3o+Jwo+Cj4gWzFdIGh0dHA6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290L3BhdGNoLzIwMjEwNzIwMjAzMzUzLjEu
STU1MGI5NWY2ZDEyZDU5YWVlZjViNzQ0ZDgzN2RiYjM2MDAzN2QzOWVAY2hhbmdlaWQvCj4KPgo+
ICB0b29scy9wYXRtYW4vcGF0Y2hzdHJlYW0ucHkgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspCgpUaGlzIGlzIGEgZ3JlYXQgaWRlYSEgQnV0IHBsZWFzZSBk
byBhZGQgYSB0ZXN0LgoKPgo+IGRpZmYgLS1naXQgYS90b29scy9wYXRtYW4vcGF0Y2hzdHJlYW0u
cHkgYi90b29scy9wYXRtYW4vcGF0Y2hzdHJlYW0ucHkKPiBpbmRleCBhNDRjZDg2MWFmLi5iOTYw
MjkyNDI3IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3BhdG1hbi9wYXRjaHN0cmVhbS5weQo+ICsrKyBi
L3Rvb2xzL3BhdG1hbi9wYXRjaHN0cmVhbS5weQo+IEBAIC01OSw2ICs1OSw5IEBAIFJFX0RJRkYg
PSByZS5jb21waWxlKHInXj4uKmRpZmYgLS1naXQgYS8oLiopIGIvKC4qKSQnKQo+ICAjIERldGVj
dCBhIGNvbnRleHQgbGluZSwgbGlrZSAnPiBAQCAtMTUzLDggKzE1MywxMyBAQCBDaGVja1BhdGNo
Cj4gIFJFX0xJTkUgPSByZS5jb21waWxlKHInPi4qQEAgXC0oXGQrKSxcZCsgXCsoXGQrKSxcZCsg
QEAgKiguKiknKQo+Cj4gKyMgRGV0ZWN0IGxpbmUgd2l0aCBpbnZhbGlkIFRBRwo+ICtSRV9JTlZf
VEFHID0gcmUuY29tcGlsZSgnXlNlcmllLShbYS16LV0qKTogKiguKiknKQo+ICsKPiAgIyBTdGF0
ZXMgd2UgY2FuIGJlIGluIC0gY2FuIHdlIHVzZSByYW5nZSgpIGFuZCBzdGlsbCBoYXZlIGNvbW1l
bnRzPwo+ICBTVEFURV9NU0dfSEVBREVSID0gMCAgICAgICAgIyBTdGlsbCBpbiB0aGUgbWVzc2Fn
ZSBoZWFkZXIKPiAgU1RBVEVfUEFUQ0hfU1VCSkVDVCA9IDEgICAgICMgSW4gcGF0Y2ggc3ViamVj
dCAoZmlyc3QgbGluZSBvZiBsb2cgZm9yIGEgY29tbWl0KQo+IEBAIC0zMTgsNiArMzIxLDcgQEAg
Y2xhc3MgUGF0Y2hTdHJlYW06Cj4gICAgICAgICAgbGVhZGluZ193aGl0ZXNwYWNlX21hdGNoID0g
UkVfTEVBRElOR19XSElURVNQQUNFLm1hdGNoKGxpbmUpCj4gICAgICAgICAgZGlmZl9tYXRjaCA9
IFJFX0RJRkYubWF0Y2gobGluZSkKPiAgICAgICAgICBsaW5lX21hdGNoID0gUkVfTElORS5tYXRj
aChsaW5lKQo+ICsgICAgICAgIGludmFsaWRfbWF0Y2ggPSBSRV9JTlZfVEFHLm1hdGNoKGxpbmUp
Cj4gICAgICAgICAgdGFnX21hdGNoID0gTm9uZQo+ICAgICAgICAgIGlmIHNlbGYuc3RhdGUgPT0g
U1RBVEVfUEFUQ0hfSEVBREVSOgo+ICAgICAgICAgICAgICB0YWdfbWF0Y2ggPSBSRV9UQUcubWF0
Y2gobGluZSkKPiBAQCAtNDcxLDYgKzQ3NSwxMSBAQCBjbGFzcyBQYXRjaFN0cmVhbToKPiAgICAg
ICAgICAgICAgICAgIHNlbGYuX2FkZF93YXJuKCdMaW5lICVkOiBJZ25vcmluZyBDb21taXQtJXMn
ICUKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChzZWxmLmxpbmVudW0sIG5hbWUp
KQo+Cj4gKyAgICAgICAgIyBEZXRlY3QgaW52YWxpZCB0YWdzCj4gKyAgICAgICAgZWxpZiBpbnZh
bGlkX21hdGNoOgo+ICsgICAgICAgICAgICByYWlzZSBWYWx1ZUVycm9yKCJMaW5lICVkOiBJbnZh
bGlkIHRhZyA9ICclcyciICUKPiArICAgICAgICAgICAgICAgIChzZWxmLmxpbmVudW0sIGxpbmUp
KQo+ICsKPiAgICAgICAgICAjIERldGVjdCB0aGUgc3RhcnQgb2YgYSBuZXcgY29tbWl0Cj4gICAg
ICAgICAgZWxpZiBjb21taXRfbWF0Y2g6Cj4gICAgICAgICAgICAgIHNlbGYuX2Nsb3NlX2NvbW1p
dCgpCj4gLS0KPiAyLjI1LjEKPgoKUmVnYXJkcywKU2ltb24KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
