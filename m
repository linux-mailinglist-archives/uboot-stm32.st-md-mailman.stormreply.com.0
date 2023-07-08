Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFF674BE91
	for <lists+uboot-stm32@lfdr.de>; Sat,  8 Jul 2023 19:19:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3108AC6B45E;
	Sat,  8 Jul 2023 17:19:17 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E74A0C6B45D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Jul 2023 17:19:15 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-5703d12ab9aso37527497b3.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Jul 2023 10:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688836755; x=1691428755;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVlMpycwaC4JrwCRg4BWK2E7N09nrgAc4uqE0If6jws=;
 b=m0QWSQPkMlaHiB0XQ/My3vdoDUBAL155c/NhVt381LX5K4LHJxtOWV48yE9cUEiizm
 V6L+fk8n++JRx2ZDqsOcDUyRgu3uaP2SmWHDjXDIzLRKRBIAPbvlaJjZw/85mM81EPtw
 lkSn54v3/IG+gTIEOR6GhhGqeSLI+L9pY6XsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688836755; x=1691428755;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVlMpycwaC4JrwCRg4BWK2E7N09nrgAc4uqE0If6jws=;
 b=PJrLVQ45Yx/JTf/qRjcwFe3DUfxoqcL3kj+8OfvY4zHrNdzb5uK6WzmTfFCK5UuJAc
 3DCtA2en6t8Nwx8fsqb06LmDQzDLw254GleE2BmqNZXOnTu50Unp4erhiKbN34wyNo/K
 4/eHTTeC67fN9qJ73QgCNJKTSMYptam/WYYcbFHRgSrIzIWxqorfshOoTA2XEdGiU/Qn
 1NQGWC2CaBeQf3QyDQ2Dt7HdRyrXkXoY40XAbcGHW3jLDHRHHFW/YfEdTmMQ9Mvlm3Jf
 DavU4INv6Bs90bS7vFX6iuJQOQXES1pMfar341ywMzPnUv0OVztGpUeDnp7x8GpPWLHU
 uFKg==
X-Gm-Message-State: ABy/qLY3CXwoBzJj/KjjcB2zGT5kEAPbiw4gHW/4b0axAEePLkY6fqlu
 tYr9dRgjukZWFNg84ItNH7rgvh3V2uChhBDYGWvGPtitlmW5gz0cFi0=
X-Google-Smtp-Source: APBJJlFlv/2fiEJ5Sf+fSuHf8GYKRq5FJ/xQxVmnSdwTjejo2qTS5Gcj0x9cg3F8/4ufeZLGqOwQ37sW4WmnLmPwKYI=
X-Received: by 2002:a81:5ed4:0:b0:57a:6946:f668 with SMTP id
 s203-20020a815ed4000000b0057a6946f668mr2852248ywb.36.1688836754747; Sat, 08
 Jul 2023 10:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230704173121.589620-1-dario.binacchi@amarulasolutions.com>
 <6798832b-2e55-2d40-e017-bb7c308aaf9f@foss.st.com>
In-Reply-To: <6798832b-2e55-2d40-e017-bb7c308aaf9f@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 8 Jul 2023 19:19:03 +0200
Message-ID: <CABGWkvruFoNNU+tHg7tKpLCdRxSPcpOmei3Kp8ooteUUVixhSA@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v2] board: stm32mp1: add splash screen on
	dk2
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

SGkgUGF0cmljaywKCk9uIFdlZCwgSnVsIDUsIDIwMjMgYXQgMjowOeKAr1BNIFBhdHJpY2sgREVM
QVVOQVkKPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gSGkgRGFyaW8s
Cj4KPiBPbiA3LzQvMjMgMTk6MzEsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+ID4gRGlzcGxheSB0
aGUgU1RNaWNyb2VsZWN0cm9uaWNzIGxvZ28uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFyaW8g
QmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4KPiA+Cj4g
PiAtLS0KPiA+Cj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gLSBtb3ZlICJzcGxhc2guaCIgYW5kICJz
dF9sb2dvX2RhdGEuaCIgaGVhZGVycyBiZWZvcmUgInN5c2Nvbi5oIiBpbiBvcmRlcgo+ID4gICAg
dG8ga2VlcCBpbmNsdWRlcyBzb3J0ZWQgYWxwaGFiZXRpY2FsbHkuCj4gPiAtIHJlbW92ZSAibG9n
byIgdmFyaWFibGUgYW5kIHBhc3MgIih1bG9uZylzdG1pY3JvZWxlY3Ryb25pY3NfdWJvb3RfbG9n
b184Yml0X3JsZSIKPiA+ICAgIGRpcmVjdGx5IHRvIHRoZSBibXBfZGlzcGxheSgpIGZ1bmN0aW9u
Lgo+ID4KPiA+ICAgYm9hcmQvc3Qvc3RtMzJtcDEvc3RtMzJtcDEuYyB8IDExICsrKysrKysrKysr
Cj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2JvYXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmMgYi9ib2FyZC9zdC9zdG0zMm1wMS9zdG0z
Mm1wMS5jCj4gPiBpbmRleCAxYTFiMTg0NGM4YzAuLmViZDM5NDhkNTE5YyAxMDA2NDQKPiA+IC0t
LSBhL2JvYXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmMKPiA+ICsrKyBiL2JvYXJkL3N0L3N0bTMy
bXAxL3N0bTMybXAxLmMKPiA+IEBAIC0zMSw4ICszMSwxMSBAQAo+ID4gICAjaW5jbHVkZSA8cGh5
Lmg+Cj4gPiAgICNpbmNsdWRlIDxyZW1vdGVwcm9jLmg+Cj4gPiAgICNpbmNsdWRlIDxyZXNldC5o
Pgo+ID4gKyNpbmNsdWRlIDxzcGxhc2guaD4KPiA+ICsjaW5jbHVkZSA8c3RfbG9nb19kYXRhLmg+
Cj4gPiAgICNpbmNsdWRlIDxzeXNjb24uaD4KPiA+ICAgI2luY2x1ZGUgPHVzYi5oPgo+ID4gKyNp
bmNsdWRlIDx2aWRlby5oPgo+ID4gICAjaW5jbHVkZSA8d2F0Y2hkb2cuaD4KPiA+ICAgI2luY2x1
ZGUgPGFzbS9nbG9iYWxfZGF0YS5oPgo+ID4gICAjaW5jbHVkZSA8YXNtL2lvLmg+Cj4gPiBAQCAt
Njg0LDYgKzY4NywxNCBAQCBpbnQgYm9hcmRfaW5pdCh2b2lkKQo+ID4gICAgICAgZndfaW1hZ2Vz
WzBdLmZ3X25hbWUgPSB1IlNUTTMyTVAtRklQIjsKPiA+ICAgICAgIGZ3X2ltYWdlc1swXS5pbWFn
ZV9pbmRleCA9IDE7Cj4gPiAgICNlbmRpZgo+ID4gKwo+ID4gKyAgICAgaWYgKElTX0VOQUJMRUQo
Q09ORklHX0NNRF9CTVApKSB7Cj4gPiArICAgICAgICAgICAgIGlmIChib2FyZF9pc19zdG0zMm1w
MTV4X2RrMigpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgYm1wX2Rpc3BsYXkoKHVsb25n
KXN0bWljcm9lbGVjdHJvbmljc191Ym9vdF9sb2dvXzhiaXRfcmxlLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEJNUF9BTElHTl9DRU5URVIsIEJNUF9BTElHTl9DRU5URVIp
Owo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICB9Cj4gPiArCj4gPiAgICAgICByZXR1cm4g
MDsKPiA+ICAgfQo+ID4KPgo+Cj4gSSB0aGluayAiaW5jbHVkZS9zdF9sb2dvX2RhdGEuaCIgc2hv
dWxkIGJlIG5vdCBkaXJlY3RseSB1c2VkIGZvciBTVE0zMiBNUFUKPgo+IGl0IGlzIGEgb2Jzb2xl
dGUgd2F5IHRvIGhhdmUgc3BsYXNoIHNjcmVlbiwgdXNlZCBieSBTVE0zMiBNQ1UgYXMgU1RNMzJG
Ny4KPgo+Cj4gQW5kIGRpcmVjdCBtYW5hZ2VtZW50IGZvciBzcGxhc2ggaXQgaXMgbm90IHJlYWxs
eSBuZWVkZWQgaW4gYm9hcmQgY29kZSwKPgo+IGFzIGl0IGlzIGFscmVhZHkgbWFuYWdlZCBpbiBW
SURFTyBmcmFtZXdvcmsgd2l0aCBDT05GSUdfVklERU9fTE9HTwo+Cj4gZW5hYmxlZCBieSBkZWZh
dWx0IHNpbmNlIGNvbW1pdCA4NDVkNzFjZTk5OTkzNmFiNWFlMmNlZjQ1NDJiMjIxODUxY2RlMTk5
Cj4gKCJ2aWRlbzogU2hvdyB0aGUgVS1Cb290IGxvZ28gYnkgZGVmYXVsdCIpCj4KPiBhbmQgd2l0
aCBDT05GSUdfU1BMQVNIX1NDUkVFTgo+Cj4KPiBzZWUgc3RkaW9faW5pdF90YWJsZXMoKQo+Cj4g
ICAgPT4gc3BsYXNoX2Rpc3BsYXkoKTsKPgo+Cj4gcG9zaXRpb24gaXMgbWFuYWdlZCB3aXRoOgo+
Cj4gLSBDT05GSUdfU1BMQVNIX1NDUkVFTl9BTElHTgo+Cj4gLSB2YXJpYWJsZTogInNwbGFzaHBv
cz1tLG0iCj4KPgo+IEJ1dCBieSBkZWZhdWx0IHRoZSBVLUJvb3QgbG9nbyAoeWVsbG93IHN1Ym1h
cmluZSkgaXMgdXNlZCBmb3IgVklERU8gTE9HTwo+IChTUExBU0hfREVDTCh1X2Jvb3RfbG9nbykg
aW4gdmlkZW8gdWNsYXNzCj4KPiBvciBkZW54IGZvciBTUExBU0ggaXMgdXNlZCBpbiB0b29scy9N
YWtlZmlsZQo+Cj4KPiAjIEdlbmVyaWMgbG9nbwo+IGlmZXEgKCQoTE9HT19CTVApLCkKPiBMT0dP
X0JNUD0gJChzcmN0cmVlKS8kKHNyYykvbG9nb3MvZGVueC5ibXAKPgo+ICMgVXNlIGJvYXJkIGxv
Z28gYW5kIGZhbGxiYWNrIHRvIHZlbmRvcgo+IGlmbmVxICgkKHdpbGRjYXJkICQoc3JjdHJlZSkv
JChzcmMpL2xvZ29zLyQoQk9BUkQpLmJtcCksKQo+IExPR09fQk1QPSAkKHNyY3RyZWUpLyQoc3Jj
KS9sb2dvcy8kKEJPQVJEKS5ibXAKPiBlbHNlCj4gaWZuZXEgKCQod2lsZGNhcmQgJChzcmN0cmVl
KS8kKHNyYykvbG9nb3MvJChWRU5ET1IpLmJtcCksKQo+IExPR09fQk1QPSAkKHNyY3RyZWUpLyQo
c3JjKS9sb2dvcy8kKFZFTkRPUikuYm1wCj4gZW5kaWYKPiBlbmRpZgo+Cj4KPiBUaGUgU1RNaWNy
b2VsZWN0cm9uaWNzIGxvZ28gaW1hZ2UgY2FuIGJlIGludGVncmF0ZWQgaW4gdGhpcyBkaXJlY3Rv
cnkgd2l0aAo+Cj4gICAgICAgICAgIFZFTkRPUj0ic3QiCj4KPiAgICAgICAgICAgQk9BUkQ9InN0
bTMybXAxIgo+Cj4KPiBXZSBuZWVkIHRvIGFkZCBpdCAuL3Rvb2xzL2xvZ29zL3N0LmJtcAo+Cj4K
PiBJIGNhbiBwcm9wb3NlIHNvbWV0aGluZywgZm9yIGFsbCBTVCBib2FyZCBTVE0zMk1QMXgsIG5v
dCBvbmx5IERLMgo+Cj4KClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9ucy4KClJlZ2FyZHMsCkRh
cmlvCgo+IFBhdHJpY2sKPgoKCi0tIAoKRGFyaW8gQmluYWNjaGkKClNlbmlvciBFbWJlZGRlZCBM
aW51eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpW
aWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQuICszOSAwNDIg
MjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMu
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290
LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3Vib290LXN0bTMyCg==
