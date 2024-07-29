Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 790AF93F4A6
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Jul 2024 13:56:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AC2BC6DD96;
	Mon, 29 Jul 2024 11:56:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 630FBC6B460
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2024 11:56:04 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-368440b073bso1070152f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2024 04:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722254164; x=1722858964;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aby4Ag03JF9p64tkUSZ0h+rfCqmOzhrnTyDqK5jbv2Y=;
 b=EEUcEEHOAYix9VQPE/KwrU3+dboKhS5tQLiWp99bZV2/iWT1bkZJpnDcR/+2MZszih
 03zFG+P7TYyCxZ/hkcgEJH+9E3UIlOLqMLKgrIe6wVxQO/w8q3s3fT9MpA0m102DWHFX
 /dLZ8L7T730SdrnNchojF0xiy/3UQ9+3XDNRYjYNngegga9ndEwSFTKwRIWbNHCPhU3B
 dRXynP23MzOKxa8MMA0UYBP9cMAovyJfCZBnWwG3YekPTlmIhC3xtTCZ6pzMD6q8hqOB
 l33uHKPpqPhBvldT5AGdXIllgKTbSm7s0jtadQ5Zm2lywm4ghGqatj6dFh1yjtPu0NGe
 rKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722254164; x=1722858964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aby4Ag03JF9p64tkUSZ0h+rfCqmOzhrnTyDqK5jbv2Y=;
 b=d0nzyz6nnuKjbAGIgnlp+X8Tnw4N1oK+yR+O6/2kb7dYVsuHrG/UVrQDQEKtJpUZ+z
 0PoHRajs37f5NHmDaI0pSyu1aP3nSCOMIywufSBfhydWkPVrnxEI8TwXktxj7k61p9yq
 frXCaLr0EZQAEhxJRxmCMsBvFVqD0H3gWcBDfkg7qjtY0sU3FsClFJ8jXwzWWxL+/55a
 dzCwojf7dWRR4mfU2ZN3hgI8ELF3GzgnKoVii3YOLEJp5DHp8Texka38IruroHwc8WeN
 2+GVsGLxmgklHuk9tvpkoD8qQcTeZzKHUeh7OZXzgf+rZvsT3TWDX70kFbFHl2aUs7l6
 vGAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC9PuBamq1HqXHhrQABGV7uaoMZgYVHftAlL0CU/VGTvTesYvlF1Iw4SEkay09thQHcx548v7wLlY6RpGuQg9BI52Nq82QahDMfHLc9zpwflxFjaqnrJ0s
X-Gm-Message-State: AOJu0Yxh9lg4SWj0eg5WyLDgglNmQ/fVoNe81TM61sTS47um3CAygvov
 K2cK37e0+j8q89SQG9PARHoux6a4zgIPPBIz6gmEcpLZTcsecADoztDKlZTD/3i51Yy2MAyyo7u
 qj3omGREwk/79xJZkC7/11OGVLws=
X-Google-Smtp-Source: AGHT+IHOJDMfOmgHiVQQwyhHcNRiYOrxQH2FrffrVH2TRxetrFber+bq70HzpD6UOh5B5D0HkR9IsK/WVnjyIMdz/1E=
X-Received: by 2002:a5d:6b86:0:b0:366:e9f5:781b with SMTP id
 ffacd0b85a97d-36b5d7d335bmr4786622f8f.21.1722254163483; Mon, 29 Jul 2024
 04:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240626235717.272219-1-marex@denx.de>
 <a73dffe5-87e3-4e96-965f-9d029f2af8ed@denx.de>
 <CAPVz0n0C6TPdBRUEvJmgAUGAKoetuzr1j=0cMXweP2EqMTwn=g@mail.gmail.com>
 <0910419d-e8ab-4bf9-a083-dc2783afaca1@denx.de>
 <4D07A6E5-F156-44C3-A26D-0F2D913CE92D@gmail.com>
 <18d84528-d2e5-41d6-ae1d-109ee30853b2@denx.de>
 <CAPVz0n2Jzfih0Z85TSQbnz-8OrX4D6UN=anKGTJ=hckRt8f3xA@mail.gmail.com>
 <a95f0d60-2883-4c3d-8a53-ee3ef414cc32@denx.de>
In-Reply-To: <a95f0d60-2883-4c3d-8a53-ee3ef414cc32@denx.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 29 Jul 2024 14:55:52 +0300
Message-ID: <CAPVz0n3Ji1sKQK+Lnq8rP3ZqwX3o-kXe2btj93UuVBa3T5C=qw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

0L/QvSwgMjkg0LvQuNC/LiAyMDI04oCv0YAuINC+IDEzOjQyIE1hcmVrIFZhc3V0IDxtYXJleEBk
ZW54LmRlPiDQv9C40YjQtToKPgo+IE9uIDcvMjkvMjQgNzozOCBBTSwgU3Z5YXRvc2xhdiBSeWhl
bCB3cm90ZToKPgo+IFsuLi5dCj4KPiA+PiBUaGUgUE1JQyBpcyBvbiBJMkMsIERNX1BNSUMgZW5h
YmxlZCBpbiBTUEwsIGJvdGggYnVjazQgYW5kIGJ1Y2s1Cj4gPj4gcmVndWxhdG9ycyBhcmUgZW5h
YmxlZCBpbiBTUEwsIGhhdmUgcmVndWxhdG9yLWFsd2F5cy1vbiBhbmQKPiA+PiByZWd1bGF0b3It
Ym9vdC1vbiBhbmQgYm9vdHBoLXByZS1yYW0gcHJvcGVydGllcy4KPiA+Pgo+ID4+IFRoaXMgc2Vl
bXMgc2ltaWxhciBlbm91Z2gsIHJpZ2h0ID8KPiA+Pgo+ID4gWWVzLCB0aG91Z2ggU1BMIG11c3Qg
cmVtYWluIGFzIHNtYWxsIGFzIHBvc3NpYmxlIGFuZCB5b3UgcHJvcG9zZSBhZGQKPiA+IHRoZXJl
IGkyYyBkcml2ZXIsICBQTUlDIGRyaXZlciwgUE1JQyByZWd1bGF0b3IgZHJpdmVycywgUE1JQyBH
UElPCj4gPiBkcml2ZXJzIGFsb25nIHdpdGggcmVsb2NhdGlvbiBvZiBhbGwgdGhpcyBzdHVmZi4g
SXQgaXMgbm90IG9wdGltYWwgYXQKPiA+IGFsbC4KPgo+IFN1cmUsIGlmIHlvdSBkbyB1c2UgRE1f
UE1JQyBmb3IgUE1JQyBvbiBJMkMgYnVzLCB0aGVuIHlvdSBhbHNvIG5lZWQKPiBETV9JMkMgLiBZ
b3UgY2FuIGFsc28gZG8gbm9uLURNIFBNSUMgY29uZmlndXJhdGlvbiBpbiBTUEwsIG5vbi1ETSBp
biBTUEwKPiBpcyBhbGxvd2VkLgo+ClRoYW5rcyBmb3IgZXhwbGFpbmluZyBhbiBvYnZpb3VzIHN0
dWZmLCBpdCBzZWVtcyB0aGF0IHdlIGFyZSB0YWxraW5nCm9uIGRpZmZlcmVudCBsYW5ndWFnZXMu
Cgo+ID4+IFdoYXQgaXMgdGhlIHByb2JsZW0geW91IG9ic2VydmUgb24gdGVncmEgMyA/Cj4gPiBp
MmMgbGluZSBmYWlscyBzaW5jZSBpdCBwcm9iZXMgaW4gc3BsIHdpdGggeW91ciBwYXRjaCwgYnV0
IGl0IGRvZXMgbm90Cj4gPiByZWxvY2F0ZSBhbmQgdGhlbiBwcm9iZXMgb25jZSBtb3JlIGFmdGVy
IHJlbG9jYXRpb24uIFByb2JlIGZhaWxzIGFsb25nCj4gPiB3aXRoIGFsbCBkZXZpY2VzIG9uIHNh
bWUgbGluZS4KPgo+IENvdWxkIGl0IGJlIHRoYXQgeW91IGVpdGhlciBoYXZlIHRvOgo+IC0gQWRk
IERNX0kyQyB0byB0ZWdyYSAzIFNQTAo+IC0gUmVtb3ZlIGJvb3RwaC0qIGZyb20gRFQgdG8gcmVt
b3ZlIHRoZSByZWd1bGF0b3Igbm9kZSBmcm9tIFNQTAo+IC0gL2RlbGV0ZS1wcm9wZXJ0eS8gcmVn
dWxhdG9yLWFsd2F5cy1vbjsgYW5kIC9kZWxldGUtcHJvcGVydHkvCj4gcmVndWxhdG9yLWJvb3Qt
b247IGluIC11LWJvb3QuZHRzaSB0byBwcmV2ZW50IHRoZSByZWd1bGF0b3IgZnJvbSBiZWluZwo+
IGVuYWJsZWQgaW4gU1BMID8KPgpPYnZpb3VzbHkgTk8sIHlvdSBwcm9wb3NlIG5vbnNlbnNlLiBT
YW1lIGR0cyBpcyB1c2VkIGZvciBib3RoIHN0YWdlcy4KQW5kIEkgaGF2ZSB0byBhZGQgaGFjay1p
c2ggc3R1ZmYganVzdCBiZWNhdXNlIHlvdSB3YW5uYSBpbnRyb2R1Y2UgY29kZQp3aGljaCBjYXVz
ZXMga25vd24gcmVncmVzc2lvbnMuCgo+IHJlZ3VsYXRvci1hbHdheXMtb24gbWVhbnMgdGhlIHJl
Z3VsYXRvciBoYXMgdG8gYmUgZW5hYmxlZAo+IHVuY29uZGl0aW9uYWxseSwgYW5kIHRoZSBzeXN0
ZW0gc29mdHdhcmUgaGFzIG5vIG90aGVyIHdheSB0byB0ZXN0Cj4gd2hldGhlciB0aGUgcmVndWxh
dG9yIGlzIGVuYWJsZWQgYnV0IGFjY2VzcyB0aGUgUE1JQywgc28gdGhhdCBpcyB3aHkgdGhlCj4g
cmVndWxhdG9yIGlzIHByb2JlZCwgZXZlbiBpZiBpdCBpcyBlYXJseS4KVGhhbmtzIGZvciBleHBs
YWluaW5nIGFuIG9idmlvdXMgc3R1ZmYsIGl0IHNlZW1zIHRoYXQgd2UgYXJlIHRhbGtpbmcKb24g
ZGlmZmVyZW50IGxhbmd1YWdlcy4KCkFueXdheSwKCiJXZSBtdXN0IG5vdCBwcm9iZSB0aGluZ3Mg
YXMgd2UgZ28uIFRoZXJlIG1pZ2h0IGJlIG90aGVyCmRlcGVuZGVuY2llcyBub3QgeWV0IGJvdW5k
LiBJdCBtYXkgYWxzbyB0YWtlIHNvbWUgdGltZS4gVGhpcyBpcyBub3QKZm9sbG93aW5nIGRyaXZl
ciBtb2RlbCBkZXNpZ24sIHNvcnJ5LgoKU28gcGxlYXNlIHRoaW5rIG9mIGEgd2F5IHRvIGRvIHRo
aXMgcHJvcGVybHkuIgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
