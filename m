Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BCBC3FE26
	for <lists+uboot-stm32@lfdr.de>; Fri, 07 Nov 2025 13:23:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8315CC5F1F4;
	Fri,  7 Nov 2025 12:23:56 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5965C5F1CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 12:23:55 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-640ca678745so1243213a12.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Nov 2025 04:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1762518235; x=1763123035;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hyVeY8EHvVRwJahRHsSSRUD7YjS46fTQECUTRatwrwE=;
 b=atuwQBZRAVwUwXtBjMksksUIggXD9dcOf8iI01skOinGu5Wku1kyULwVIL2i0c0rPD
 xBNAc3S34Eyerk7MlcByrr2+tb5h42FDVMWeR0bvOpecZ8E4FKH4C7axMBWx6YtX2uMl
 yOBCMTSFP7J2zvhqV429HHliWnPH9su/6fABw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762518235; x=1763123035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hyVeY8EHvVRwJahRHsSSRUD7YjS46fTQECUTRatwrwE=;
 b=uXUD2lMs/wgcM3xBcIbKtxWvnvQwFFwy/6ZLHrB+QXtxCyd4fHn1Cl9anElu9lSQ4T
 Jelr5uuDfPl+Kc0RV6qJ5EiMJMzFJYXPJWX6ejqiA/ph4gwZVqNse3OGAdbD5TCNAHTm
 60RwpIEi5BeBksLhYDlTKDsTmE+q/jRB26lKfWAxGdr2pvhmWTYKC4Ee3bW2mL/wdRkJ
 bBEf6PUBkIeKqfeoQFDOHHWhScdk67Pe3MzaBCH2UWR6vDioL2EbKdCLIKytmNoTqxpV
 DzsXNEENL8VYkuSFV1beXADT/0RIn58hGqj8G6K/TQIagGXQ4M+D+sk+3+zOCSFhftmT
 NiZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDKOcs98obfX1sniP6Ggqm3D5ei2mMEiHuwklcCHsekOfguYBbPnyUypDJ6TbBtOBL9AAEzIrDukE+Bg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxE9QpEvqSdyvgX6fVWrNIfTNEzvYr+vicMEYbMrTc6k1qEnVKA
 lHm5UVjQ7QE/Mhd3yO2XPUczIU4rc+z6og7hDS/ewwT6Sy1aaeEL5HsJ57qLccD1yty4JImhbHD
 Y4mdK9RLnJZTMvO1gmhKOv/S0Fj04gmdWS/isLm77
X-Gm-Gg: ASbGncv05ir9jhcez+mOceHes/RiuBEf0dDsriOHkWk+v8g3a6lwDksBCOyg/JDLmnE
 B7uAin7CrHZ+pM2Dwe93BNDiwQdN0WRO9Y3vq5vvZkw6ItTrotwggMULK0VtihdFJQ0sfWdN0CB
 aqYgxb4FSYvukK6y2csp8B7F5Jr+AKJfTSee4Bks2u7/v7b8+jFycXvMhU2JkAw+eb/W7rVhzuA
 xkHguwHYh2/6Y3G46XJLLAICXTVHqqkQqd9F0KX0Ax7zv5ar/Co4ImB54g9
X-Google-Smtp-Source: AGHT+IG6cagEJg5eVQjqdn7CA4L6iy5Z0UobYw6LFtAlkO6aMXIgRr7kZT8KFLDnwKUxMR/Kggt31yUxIKLpm73giGA=
X-Received: by 2002:a17:906:ef01:b0:b6d:6bcd:6c59 with SMTP id
 a640c23a62f3a-b72c0d9fa72mr265218666b.64.1762518234938; Fri, 07 Nov 2025
 04:23:54 -0800 (PST)
MIME-Version: 1.0
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-1-b42847884974@foss.st.com>
 <CAFLszTiT9iLx6gguhVui2Qh0Ew89yhvpDggKwPo71cB+Rv=xJA@mail.gmail.com>
 <aQavXq6jVagkIa53@thinkstation>
 <CAFLszThdV7cZ-uBXzqRYWv-HsGbNJV9BVKVOC4FQUD1yjZDNkg@mail.gmail.com>
 <20251103141726.GJ6688@bill-the-cat>
 <CAFLszTgvpjf4GUfCPJyb0-tkhLPUSwH9pcsF4+0QWvpAKRkFwg@mail.gmail.com>
 <20251104165537.GC6688@bill-the-cat>
In-Reply-To: <20251104165537.GC6688@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 7 Nov 2025 13:23:41 +0100
X-Gm-Features: AWmQ_bktCfRB1DXka3wijIghdgpcNeB8MI-ogdQr6YCpnrtoJskt3w5omCjFTus
Message-ID: <CAFLszTi4pf66frdK_DvkAKCjTUxO=z1+v3igSEGoTQ8p4XJ1iw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dillon Min <dillon.minfei@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/7] ofnode: support panel-timings in
	ofnode_decode_display_timing
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

SGkgUmFwaGFsZSwKCk9uIFR1ZSwgNCBOb3YgMjAyNSBhdCAxNzo1NSwgVG9tIFJpbmkgPHRyaW5p
QGtvbnN1bGtvLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE5vdiAwNCwgMjAyNSBhdCAwNTozMToy
MVBNICswMTAwLCBTaW1vbiBHbGFzcyB3cm90ZToKPiA+IEhpIFRvbSwKPiA+Cj4gPiBPbiBNb24s
IDMgTm92IDIwMjUgYXQgMTU6MTcsIFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBPbiBTdW4sIE5vdiAwMiwgMjAyNSBhdCAwODo1Mzo0M1BNICswMTAwLCBT
aW1vbiBHbGFzcyB3cm90ZToKPiA+ID4gPiBIaSBSYXBoYWVsLAo+ID4gPiA+Cj4gPiA+ID4gT24g
U3VuLCAyIE5vdiAyMDI1IGF0IDAyOjEwLCBSYXBoYcOrbCBHYWxsYWlzLVBvdSA8cmdhbGxhaXNw
b3VAZ21haWwuY29tPgo+ID4gPiA+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IExlIFNhdCwg
Tm92IDAxLCAyMDI1IGF0IDEwOjAzOjU5QU0gKzAxMDAsIFNpbW9uIEdsYXNzIGEgw6ljcml0IDoK
PiA+ID4gPiA+ID4gSGkgUmFwaGFlbCwKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT24gVGh1LCA0
IFNlcHQgMjAyNSBhdCAxNDo1MywgUmFwaGFlbCBHYWxsYWlzLVBvdQo+ID4gPiA+ID4gPiA8cmFw
aGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gPiBUaGUgIkRpc3BsYXkgVGltaW5ncyIgaW4gcGFuZWwtY29tbW9uLnlhbWwgY2FuIGJl
IHByb3ZpZGVkIGJ5IDIKPiA+ID4gPiBwcm9wZXJ0aWVzCj4gPiA+ID4gPiA+ID4gLSBwYW5lbC10
aW1pbmc6IHdoZW4gZGlzcGxheSBwYW5lbHMgYXJlIHJlc3RyaWN0ZWQgdG8gYSBzaW5nbGUKPiA+
ID4gPiByZXNvbHV0aW9uCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHRoZSAicGFuZWwt
dGltaW5nIiBub2RlIGV4cHJlc3NlcyB0aGUgcmVxdWlyZWQKPiA+ID4gPiB0aW1pbmdzLgo+ID4g
PiA+ID4gPiA+IC0gZGlzcGxheS10aW1pbmdzOiBzZXZlcmFsIHJlc29sdXRpb25zIHdpdGggZGlm
ZmVyZW50IHRpbWluZ3MgYXJlCj4gPiA+ID4gc3VwcG9ydGVkCj4gPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgIHdpdGggc2V2ZXJhbCB0aW1pbmcgc3Vibm9kZSBvZiAiZGlzcGxheS10aW1p
bmdzIgo+ID4gPiA+IG5vZGUKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFRoaXMgcGF0Y2gg
dXBkYXRlIHRoZSBwYXJzaW5nIGZ1bmN0aW9uIHRvIGhhbmRsZSB0aGlzIDIgcG9zc2liaWxpdHkK
PiA+ID4gPiA+ID4gPiB3aGVuIGluZGV4ID0gMC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
IFJldmlld2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNv
bT4KPiA+ID4gPiA+ID4gPiBSZXZpZXdlZC1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVy
dHJlQGZvc3Muc3QuY29tPgo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJhcGhhZWwgR2Fs
bGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+Cj4gPiA+ID4gPiA+ID4g
LS0tCj4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvY29yZS9vZm5vZGUuYyB8IDE3ICsrKysrKysrKyst
LS0tLS0tCj4gPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY29yZS9vZm5vZGUuYyBiL2RyaXZlcnMvY29yZS9vZm5vZGUuYwo+ID4gPiA+ID4gPiA+
IGluZGV4Cj4gPiA+ID4gZTA0MGUzZjI4MDZmZmU3NGM1OGRjZDgyZjM2MzA3MzUxYWNkNWE5OS4u
NWE3MjFiNDZlNWEzMjE0ZTdiZDQzNzczOTc3NjM2MmMyZDIyYTNjOQo+ID4gPiA+IDEwMDY0NAo+
ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvY29yZS9vZm5vZGUuYwo+ID4gPiA+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvY29yZS9vZm5vZGUuYwo+ID4gPiA+ID4gPiA+IEBAIC0xMjIxLDEzICsxMjIx
LDE2IEBAIGludCBvZm5vZGVfZGVjb2RlX2Rpc3BsYXlfdGltaW5nKG9mbm9kZQo+ID4gPiA+IHBh
cmVudCwgaW50IGluZGV4LAo+ID4gPiA+ID4gPiA+ICAgICAgICAgaW50IHJldCA9IDA7Cj4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgICAgICAgIHRpbWluZ3MgPSBvZm5vZGVfZmluZF9zdWJu
b2RlKHBhcmVudCwgImRpc3BsYXktdGltaW5ncyIpOwo+ID4gPiA+ID4gPiA+IC0gICAgICAgaWYg
KCFvZm5vZGVfdmFsaWQodGltaW5ncykpCj4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+ID4gPiA+ID4gPiA+IC0KPiA+ID4gPiA+ID4gPiAtICAgICAgIGkgPSAw
Owo+ID4gPiA+ID4gPiA+IC0gICAgICAgb2Zub2RlX2Zvcl9lYWNoX3N1Ym5vZGUobm9kZSwgdGlt
aW5ncykgewo+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBpZiAoaSsrID09IGluZGV4KQo+
ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiA+ID4gPiA+
ICsgICAgICAgaWYgKG9mbm9kZV92YWxpZCh0aW1pbmdzKSkgewo+ID4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICBpID0gMDsKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgb2Zub2RlX2Zv
cl9lYWNoX3N1Ym5vZGUobm9kZSwgdGltaW5ncykgewo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChpKysgPT0gaW5kZXgpCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAg
fQo+ID4gPiA+ID4gPiA+ICsgICAgICAgfSBlbHNlIHsKPiA+ID4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgaWYgKGluZGV4ICE9IDApCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIG5vZGUgPSBv
Zm5vZGVfZmluZF9zdWJub2RlKHBhcmVudCwgInBhbmVsLXRpbWluZyIpOwo+ID4gPiA+ID4gPiA+
ICAgICAgICAgfQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gICAgICAgICBpZiAoIW9mbm9k
ZV92YWxpZChub2RlKSkKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiA+
ID4gMi4yNS4xCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gUGxlYXNlIGFk
ZCBhIHRlc3QgZm9yIHRoaXMgaW4gdGVzdC9kbS9vZm5vZGUuYwo+ID4gPiA+ID4KPiA+ID4gPiA+
IEhpIFNpbW9uLAo+ID4gPiA+ID4KPiA+ID4gPiA+IEknbGwgZ2xhZGx5IGRvIHRoYXQsIGJ1dCBJ
IGhhdmVuJ3Qgd3JpdGUgYW5kIHVzZSBhbnkgdGVzdCBpbiBVLUJvb3QuICBTbwo+ID4gPiA+ID4g
aXQgaXMgYSBiaXQgZm9nZ3kgaG93IHRvIGltcGxlbWVudCBpdC4KPiA+ID4gPgo+ID4gPiA+IFRo
ZXJlIGlzIHNvbWUgaW5mbyBoZXJlOgo+ID4gPiA+Cj4gPiA+ID4gaHR0cHM6Ly9kb2NzLnUtYm9v
dC5vcmcvZW4vbGF0ZXN0L2RldmVsb3AvdGVzdGluZy5odG1sCj4gPiA+ID4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBEbyB3ZSB3YW50IHRvIGNyZWF0ZSBhIGZha2UgZGV2aWNlLXRyZWUgYW5kIHRlc3Qg
ZWFjaCBjb25maWd1cmF0aW9uIG9yCj4gPiA+ID4gPiBkbyB3ZSB3YW50IHRvIHRlc3QgaW4gdGhl
IF9jdXJyZW50XyBkZXZpY2UtdHJlZSBpZiB0aW1pbmdzIGFyZSBjb3JyZWN0bHkKPiA+ID4gPiA+
IHNldCBhY2NvcmRpbmcgdG8gdGhlIGluZGV4IHZhbHVlID8KPiA+ID4gPgo+ID4gPiA+IEl0IGxv
b2tzIGxpa2UgdGhlcmUgaXMgYSAnZGlzcGxheS10aW1pbmdzJyBub2RlIGluIHRlc3QuZHRzLCB3
aXRoIHRocmVlCj4gPiA+ID4gc3Vibm9kZXMsIHNvIHlvdSBzaG91bGQganVzdCBiZSBhYmxlIHRv
IGdldCBhbiBvZm5vZGUgZm9yIHRoYXQgYW5kIHRoZW4KPiA+ID4gPiByZWFkIG91dCBvbmUgb2Yg
dGhlbSBhbmQgY2hlY2sgaXQuCj4gPiA+Cj4gPiA+IE9LLCBidXQgd2hhdCBpcyB0aGUgdXRpbGl0
eSBpbiBkb2luZyB0aGF0PyBXZSBkb24ndCwgYW5kIGFyZW4ndCwgZ29pbmcKPiA+ID4gdG8gaGF2
ZSB0ZXN0cyBmb3IgZXZlcnkgdmFsaWQgcG9zc2libGUgRFQgbm9kZSwgYW5kIHRoaXMgaXNuJ3QK
PiA+ID4gaW50cm9kdWNpbmcgbmV3IGxpYnJhcnkgcGFyc2luZyBmdW5jdGlvbmFsaXR5ICh0aGUg
bW9zdCByZWNlbnQgcGF0Y2ggdG8KPiA+ID4gdGVzdC9kbS9vZm5vZGUuYyB3YXMgZm9yIG9mbm9k
ZV9ncmFwaCBhbmQgdGhhdCBpcyBpbXBvcnRhbnQgdG8gdGVzdCkuIFdlCj4gPiA+IGRvbid0IGhh
dmUgZGlzcGxheS10aW1pbmcgdGVzdHMgdG8gc3RhcnQgd2l0aCwgc28gd2UncmUgZmluZSBub3Qg
YWRkaW5nCj4gPiA+IHNvbWV0aGluZyBtb3JlIGhlcmUuCj4gPgo+ID4gVGhlIHV0aWxpdHkgaXMg
dGhhdCBjb2RlIGlzIHRlc3RlZCwgc28gaXQgd29ya3Mgbm93IGFuZCBkb2Vzbid0IGJyZWFrCj4g
PiBsYXRlci4gRm9yIG9mbm9kZSB3ZSBkbyBoYXZlIHRlc3RzIC0gc2VlIHRlc3QvZG0vb2Zub2Rl
LmMKPgo+IFRoYXQgaXMgYSBjaXJjdWxhciBhbmQgdW5zYXRpc2Z5aW5nIGFuc3dlciB0byB3aGF0
IEkgc2FpZC4gSSBkaWQgcmVhZAo+IHRlc3QvZG0vb2Zub2RlLmMgYW5kIHRoZW4gcmUtcmVhZCB0
aGUgcGF0Y2ggYW5kIGRvbid0IHNlZSBhbnkgdmFsdWUgaW4KPiBhZGRpbmcgbm9kZXMgYW5kIHRo
ZW4gcmVhZGluZyBub2RlcywgYnV0IGdhdmUgYW4gZXhhbXBsZSBvZiB3aGF0IGtpbmQgb2YKPiBj
aGFuZ2VzIGRvIG1ha2Ugc2Vuc2UgdG8gYWRkIHRlc3RzIGZvciBiZWNhdXNlIHRoZXkgYWRkIHZh
bHVlLiBBbmQgaW4KPiB0aGUgaW50ZXJlc3Qgb2Ygbm90IGhhdmluZyB5ZXQgYW5vdGhlciBzZWVt
aW5nbHkgaW5maW5pdGUgdGhyZWFkIHdpdGgKPiB5b3UsIHRoaXMgaXMgYWxsIEknbSBnb2luZyB0
byBmdXJ0aGVyIGFkZCBoZXJlLgoKVGhlIG5vZGVzIGV4aXN0IGluIHRlc3QuZHRzIHNvIGl0IHNo
b3VsZCBqdXN0IGJlIGEgY2FzZSBvZiBjYWxsaW5nCm9mbm9kZV9kZWNvZGVfZGlzcGxheV90aW1p
bmcoKSB3aXRoIGEgZ2l2ZW4gaW5kZXggYW5kIGNoZWNraW5nIHdoYXQgaXMKcmV0dXJuZWQuIFRo
YXQgd291bGQgYmUgZW5vdWdoIHRvIHRlc3QgeW91ciBjb2RlLCBpZiB5b3UnZCBsaWtlIHRvLgoK
UmVnYXJkcywKU0ltb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
