Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2C1C32116
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 17:31:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A975FC62ED4;
	Tue,  4 Nov 2025 16:31:38 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20499C62ECF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 16:31:37 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b3e7cc84b82so1141777866b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Nov 2025 08:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1762273896; x=1762878696;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YdjAh5XTdCfq7Tj3H/R2aR9YmlBm6ioGmhwhinLpaoo=;
 b=duu8EqN4y1hzc5enOCtaEdldQ1FlAranb9tT5+5YrwCi4MPkahFZExUNIKTh5Sb6l/
 QDrKShWhgdiIw1p9LfEorp/BTolgK/33ARAqK2cEOPR+/PbkBIbbt2B9o942dF36Vrqy
 DbMDEl3bTMSRIMg29Bbhix0G13cUyRhDRg7yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762273896; x=1762878696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YdjAh5XTdCfq7Tj3H/R2aR9YmlBm6ioGmhwhinLpaoo=;
 b=RLnBwz3PsRH0Y1wpgRTBq/WVze1br2STQ05VFaXmDDrqhBmfEucmrubblHt6lYvrvq
 +K2F7yyeki45PdHcoqEzFZ9he0ZNsBtVXgkHYILyMbhftnW3xS1MCBKMHf/pxCgTi0O4
 vgu4BWCcjQLS1OS1cTKVcRn9eUHulCgskNES4H/cpPjxfH9JqIyeB1EQDDhE9C3riqRq
 KQaHHaWwaktEC2HB11cwMQjuIoxkHb07UHeHZAq68S0OSOjdGkFohZhG6rYh+forlamx
 L7O6j74I40DYbmT4uA5kGGZ3Il3BCFPu/a3IHaW5sw3GIFciB0MX1Vvk5vsd43sazWrv
 7Gnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVMApM1By5xmM629DDtbIx2oCx52DhhNAi+XhB36Woc9NH7omlenal8dJA7AxFeHPvnCKPbwqvw2K9zw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzrCsocevHmkj2cdw2vozoTSxRYwiACGQILiMZpRVNnXx2JPa14
 5he4tEs0EFdIx1Cwwqqami9ahtoTpC/GOxLU89h+wC8wzVt5AkMHd/r13GW2WvK/uyLn4lkfrl7
 eYX6VhLBJA7u6+zjRftCudlQiXd0DKX5tJg1O/v5e
X-Gm-Gg: ASbGncvCiZNX2kQS/lF2/DoGS/vzfR/6kZGka4kw6r6r7YoINioNT10kVcJRuQ9F9W3
 vHySTfYjID44MqfxBYxivHk0aqV4JT5TwmnZ4x92rGSI+lMu7S/C5VTuA5LoA5DtuZwQklDXPmv
 oyQJeff1Jcn2gH6OlOy/c3mVidYqFRkZDtC0O7Xxa1gXbMlcZCEYGA2CHWRvwvUK93jru+wIG+Q
 szYzTGwp7QE9SRW3UUHwYFGilroarJ8grLnu0Th605ARiOyYoQ/3hyF6eBJ
X-Google-Smtp-Source: AGHT+IEKRbLp1vnbIKO4Xmo8ReTK+lO5rdukj8o3TN2BLoPLicWgLznF1gA1Fa9UnuymkALh1y6kIHnwJe/uPQCOxGI=
X-Received: by 2002:a17:907:e8e:b0:b6d:606f:2aa9 with SMTP id
 a640c23a62f3a-b70708a8b76mr1573186666b.65.1762273896318; Tue, 04 Nov 2025
 08:31:36 -0800 (PST)
MIME-Version: 1.0
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-1-b42847884974@foss.st.com>
 <CAFLszTiT9iLx6gguhVui2Qh0Ew89yhvpDggKwPo71cB+Rv=xJA@mail.gmail.com>
 <aQavXq6jVagkIa53@thinkstation>
 <CAFLszThdV7cZ-uBXzqRYWv-HsGbNJV9BVKVOC4FQUD1yjZDNkg@mail.gmail.com>
 <20251103141726.GJ6688@bill-the-cat>
In-Reply-To: <20251103141726.GJ6688@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 4 Nov 2025 17:31:21 +0100
X-Gm-Features: AWmQ_bnwsCois-dGB3HdlL2a6ZA9F8WGYRUvKh6Rfbz3038ut1Un3rlj6g8QQ5Y
Message-ID: <CAFLszTgvpjf4GUfCPJyb0-tkhLPUSwH9pcsF4+0QWvpAKRkFwg@mail.gmail.com>
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

SGkgVG9tLAoKT24gTW9uLCAzIE5vdiAyMDI1IGF0IDE1OjE3LCBUb20gUmluaSA8dHJpbmlAa29u
c3Vsa28uY29tPiB3cm90ZToKPgo+IE9uIFN1biwgTm92IDAyLCAyMDI1IGF0IDA4OjUzOjQzUE0g
KzAxMDAsIFNpbW9uIEdsYXNzIHdyb3RlOgo+ID4gSGkgUmFwaGFlbCwKPiA+Cj4gPiBPbiBTdW4s
IDIgTm92IDIwMjUgYXQgMDI6MTAsIFJhcGhhw6tsIEdhbGxhaXMtUG91IDxyZ2FsbGFpc3BvdUBn
bWFpbC5jb20+Cj4gPiB3cm90ZToKPiA+ID4KPiA+ID4gTGUgU2F0LCBOb3YgMDEsIDIwMjUgYXQg
MTA6MDM6NTlBTSArMDEwMCwgU2ltb24gR2xhc3MgYSDDqWNyaXQgOgo+ID4gPiA+IEhpIFJhcGhh
ZWwsCj4gPiA+ID4KPiA+ID4gPiBPbiBUaHUsIDQgU2VwdCAyMDI1IGF0IDE0OjUzLCBSYXBoYWVs
IEdhbGxhaXMtUG91Cj4gPiA+ID4gPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+IHdy
b3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSAiRGlzcGxheSBUaW1pbmdzIiBpbiBwYW5lbC1j
b21tb24ueWFtbCBjYW4gYmUgcHJvdmlkZWQgYnkgMgo+ID4gcHJvcGVydGllcwo+ID4gPiA+ID4g
LSBwYW5lbC10aW1pbmc6IHdoZW4gZGlzcGxheSBwYW5lbHMgYXJlIHJlc3RyaWN0ZWQgdG8gYSBz
aW5nbGUKPiA+IHJlc29sdXRpb24KPiA+ID4gPiA+ICAgICAgICAgICAgICAgICB0aGUgInBhbmVs
LXRpbWluZyIgbm9kZSBleHByZXNzZXMgdGhlIHJlcXVpcmVkCj4gPiB0aW1pbmdzLgo+ID4gPiA+
ID4gLSBkaXNwbGF5LXRpbWluZ3M6IHNldmVyYWwgcmVzb2x1dGlvbnMgd2l0aCBkaWZmZXJlbnQg
dGltaW5ncyBhcmUKPiA+IHN1cHBvcnRlZAo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgIHdp
dGggc2V2ZXJhbCB0aW1pbmcgc3Vibm9kZSBvZiAiZGlzcGxheS10aW1pbmdzIgo+ID4gbm9kZQo+
ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMgcGF0Y2ggdXBkYXRlIHRoZSBwYXJzaW5nIGZ1bmN0aW9u
IHRvIGhhbmRsZSB0aGlzIDIgcG9zc2liaWxpdHkKPiA+ID4gPiA+IHdoZW4gaW5kZXggPSAwLgo+
ID4gPiA+ID4KPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2Uu
Y2hvdGFyZEBmb3NzLnN0LmNvbT4KPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBZYW5uaWNrIEZlcnRy
ZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBS
YXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgo+ID4g
PiA+ID4gLS0tCj4gPiA+ID4gPiAgZHJpdmVycy9jb3JlL29mbm9kZS5jIHwgMTcgKysrKysrKysr
Ky0tLS0tLS0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jb3Jl
L29mbm9kZS5jIGIvZHJpdmVycy9jb3JlL29mbm9kZS5jCj4gPiA+ID4gPiBpbmRleAo+ID4gZTA0
MGUzZjI4MDZmZmU3NGM1OGRjZDgyZjM2MzA3MzUxYWNkNWE5OS4uNWE3MjFiNDZlNWEzMjE0ZTdi
ZDQzNzczOTc3NjM2MmMyZDIyYTNjOQo+ID4gMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJz
L2NvcmUvb2Zub2RlLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvY29yZS9vZm5vZGUuYwo+ID4g
PiA+ID4gQEAgLTEyMjEsMTMgKzEyMjEsMTYgQEAgaW50IG9mbm9kZV9kZWNvZGVfZGlzcGxheV90
aW1pbmcob2Zub2RlCj4gPiBwYXJlbnQsIGludCBpbmRleCwKPiA+ID4gPiA+ICAgICAgICAgaW50
IHJldCA9IDA7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgICB0aW1pbmdzID0gb2Zub2RlX2Zp
bmRfc3Vibm9kZShwYXJlbnQsICJkaXNwbGF5LXRpbWluZ3MiKTsKPiA+ID4gPiA+IC0gICAgICAg
aWYgKCFvZm5vZGVfdmFsaWQodGltaW5ncykpCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gPiA+ID4gPiAtCj4gPiA+ID4gPiAtICAgICAgIGkgPSAwOwo+ID4gPiA+
ID4gLSAgICAgICBvZm5vZGVfZm9yX2VhY2hfc3Vibm9kZShub2RlLCB0aW1pbmdzKSB7Cj4gPiA+
ID4gPiAtICAgICAgICAgICAgICAgaWYgKGkrKyA9PSBpbmRleCkKPiA+ID4gPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiA+ID4gKyAgICAgICBpZiAob2Zub2RlX3ZhbGlk
KHRpbWluZ3MpKSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgaSA9IDA7Cj4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgb2Zub2RlX2Zvcl9lYWNoX3N1Ym5vZGUobm9kZSwgdGltaW5ncykgewo+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGkrKyA9PSBpbmRleCkKPiA+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgfQo+ID4gPiA+ID4gKyAgICAgICB9IGVsc2Ugewo+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgIGlmIChpbmRleCAhPSAwKQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgbm9kZSA9IG9mbm9k
ZV9maW5kX3N1Ym5vZGUocGFyZW50LCAicGFuZWwtdGltaW5nIik7Cj4gPiA+ID4gPiAgICAgICAg
IH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgIGlmICghb2Zub2RlX3ZhbGlkKG5vZGUpKQo+
ID4gPiA+ID4KPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiAyLjI1LjEKPiA+ID4gPiA+Cj4gPiA+ID4K
PiA+ID4gPiBQbGVhc2UgYWRkIGEgdGVzdCBmb3IgdGhpcyBpbiB0ZXN0L2RtL29mbm9kZS5jCj4g
PiA+Cj4gPiA+IEhpIFNpbW9uLAo+ID4gPgo+ID4gPiBJJ2xsIGdsYWRseSBkbyB0aGF0LCBidXQg
SSBoYXZlbid0IHdyaXRlIGFuZCB1c2UgYW55IHRlc3QgaW4gVS1Cb290LiAgU28KPiA+ID4gaXQg
aXMgYSBiaXQgZm9nZ3kgaG93IHRvIGltcGxlbWVudCBpdC4KPiA+Cj4gPiBUaGVyZSBpcyBzb21l
IGluZm8gaGVyZToKPiA+Cj4gPiBodHRwczovL2RvY3MudS1ib290Lm9yZy9lbi9sYXRlc3QvZGV2
ZWxvcC90ZXN0aW5nLmh0bWwKPiA+Cj4gPiA+Cj4gPiA+IERvIHdlIHdhbnQgdG8gY3JlYXRlIGEg
ZmFrZSBkZXZpY2UtdHJlZSBhbmQgdGVzdCBlYWNoIGNvbmZpZ3VyYXRpb24gb3IKPiA+ID4gZG8g
d2Ugd2FudCB0byB0ZXN0IGluIHRoZSBfY3VycmVudF8gZGV2aWNlLXRyZWUgaWYgdGltaW5ncyBh
cmUgY29ycmVjdGx5Cj4gPiA+IHNldCBhY2NvcmRpbmcgdG8gdGhlIGluZGV4IHZhbHVlID8KPiA+
Cj4gPiBJdCBsb29rcyBsaWtlIHRoZXJlIGlzIGEgJ2Rpc3BsYXktdGltaW5ncycgbm9kZSBpbiB0
ZXN0LmR0cywgd2l0aCB0aHJlZQo+ID4gc3Vibm9kZXMsIHNvIHlvdSBzaG91bGQganVzdCBiZSBh
YmxlIHRvIGdldCBhbiBvZm5vZGUgZm9yIHRoYXQgYW5kIHRoZW4KPiA+IHJlYWQgb3V0IG9uZSBv
ZiB0aGVtIGFuZCBjaGVjayBpdC4KPgo+IE9LLCBidXQgd2hhdCBpcyB0aGUgdXRpbGl0eSBpbiBk
b2luZyB0aGF0PyBXZSBkb24ndCwgYW5kIGFyZW4ndCwgZ29pbmcKPiB0byBoYXZlIHRlc3RzIGZv
ciBldmVyeSB2YWxpZCBwb3NzaWJsZSBEVCBub2RlLCBhbmQgdGhpcyBpc24ndAo+IGludHJvZHVj
aW5nIG5ldyBsaWJyYXJ5IHBhcnNpbmcgZnVuY3Rpb25hbGl0eSAodGhlIG1vc3QgcmVjZW50IHBh
dGNoIHRvCj4gdGVzdC9kbS9vZm5vZGUuYyB3YXMgZm9yIG9mbm9kZV9ncmFwaCBhbmQgdGhhdCBp
cyBpbXBvcnRhbnQgdG8gdGVzdCkuIFdlCj4gZG9uJ3QgaGF2ZSBkaXNwbGF5LXRpbWluZyB0ZXN0
cyB0byBzdGFydCB3aXRoLCBzbyB3ZSdyZSBmaW5lIG5vdCBhZGRpbmcKPiBzb21ldGhpbmcgbW9y
ZSBoZXJlLgoKVGhlIHV0aWxpdHkgaXMgdGhhdCBjb2RlIGlzIHRlc3RlZCwgc28gaXQgd29ya3Mg
bm93IGFuZCBkb2Vzbid0IGJyZWFrCmxhdGVyLiBGb3Igb2Zub2RlIHdlIGRvIGhhdmUgdGVzdHMg
LSBzZWUgdGVzdC9kbS9vZm5vZGUuYwoKUmVnYXJkcywKU2ltb24KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVi
b290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
