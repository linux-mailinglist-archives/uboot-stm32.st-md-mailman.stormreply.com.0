Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF601604619
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Oct 2022 14:58:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98E7DC64101;
	Wed, 19 Oct 2022 12:58:24 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 063E3C63326
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 12:58:22 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id bh13so16177129pgb.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 05:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DzCb3itzBpHVSgPjHI0LX0fN3B1X1QNoZSSmuoxXiLs=;
 b=D/tGhVGxXKG2Va1CCS/7g+HRElb4Kg+O+rus5n+D1nXSmLoSDIEmPykiqFY4TZ/AsS
 DZV/r5xDSVW6rh0Km+qlLex7abFbSSCFDwGWyJtAicvqR/nFn+V5Dem+L61KzwJAqXZ5
 5auLyvZ9H3fR6bwnkjnu2xfiCFIEqEkcbHI8VlT1DWdEW73m25xZM0jC7FqYdGoPOfw0
 DJJyQSmE5E+iWu9CCC6QkCKwprBIQCP9F/X6PL0Ke54E/Vf47bUJDc6W1zAF/nLqK/KP
 oto9ApMVeon1PzlCaHIEf0MI8VG+48XeUXdWyMEtGGhmcDjmjI7sAaVUwfbRiJx3lJS4
 s6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DzCb3itzBpHVSgPjHI0LX0fN3B1X1QNoZSSmuoxXiLs=;
 b=n6jXOhzkO3SgGh9nQmElQMliA5CSap+yswIvG4bkt9QvAxVRqYqmYp9Gg8uZxa7vbQ
 sX+PCxn+xozBzYeYH02Y6LR9NGYa23hczz+KzeX0v+u3W0Llzp6VGfk+6TgqdVvNbq1H
 0JOkCh/oB/H3+1eylaxtElsoc2gwZmfzrl+8jl3ZVpglL41j+r3/UqlgtZ5maIDIQg+r
 O3usmW5IdTTYC2ia+mI+JVs+90lHodnHP8ImhDZ/M7wQBYMo0ux1TYMDpYJBZUScLjdI
 0dMu4yUAqrA3Lm6LktZtXhGxZkL0MwRn0RP2KFM8wC/3RMr5AmaFFTGzOIOD1NH2FZnk
 dPPQ==
X-Gm-Message-State: ACrzQf2ShcUZ68D9fgLEca+ATS502RG4Cc5jA9MJF07QOT2+bSSdSVcU
 T0g9c375+kCARe926+RZZcvMqqSsYzEqofruas0=
X-Google-Smtp-Source: AMsMyM5gnZhzQI0PhydLqscgGFGCBd6zLOX14DNoRm7XSItITnHu8LaEs2VESCvMYfE4AwNQDb7y0ZDw0BvrviXYG58=
X-Received: by 2002:a63:2a97:0:b0:457:23e9:586d with SMTP id
 q145-20020a632a97000000b0045723e9586dmr7134458pgq.190.1666184301531; Wed, 19
 Oct 2022 05:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221018174827.1393211-1-max.oss.09@gmail.com>
 <20221018180331.sgsufsip2p2544ip@pali> <20221018180446.GP2020586@bill-the-cat>
 <20221018180627.eezooyqb2yyhyodu@pali> <20221018181723.GQ2020586@bill-the-cat>
 <20221018181923.4vuaskvw3bkfil7b@pali> <20221018182301.GR2020586@bill-the-cat>
In-Reply-To: <20221018182301.GR2020586@bill-the-cat>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Wed, 19 Oct 2022 14:58:10 +0200
Message-ID: <CAEHkU3WK3vfG6HGqdd8ueFRcejeg4vPGUNZcJXh7MJPStOmwFg@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Adam Ford <aford173@gmail.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH] Makefile: fix u-boot-initial-env target
	if lto is enabled
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

SGkgYWxsCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjawoKT24gVHVlLCBPY3QgMTgsIDIwMjIgYXQg
ODoyMyBQTSBUb20gUmluaSA8dHJpbmlAa29uc3Vsa28uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwg
T2N0IDE4LCAyMDIyIGF0IDA4OjE5OjIzUE0gKzAyMDAsIFBhbGkgUm9ow6FyIHdyb3RlOgo+ID4g
T24gVHVlc2RheSAxOCBPY3RvYmVyIDIwMjIgMTQ6MTc6MjMgVG9tIFJpbmkgd3JvdGU6Cj4gPiA+
IE9uIFR1ZSwgT2N0IDE4LCAyMDIyIGF0IDA4OjA2OjI3UE0gKzAyMDAsIFBhbGkgUm9ow6FyIHdy
b3RlOgo+ID4gPiA+IE9uIFR1ZXNkYXkgMTggT2N0b2JlciAyMDIyIDE0OjA0OjQ2IFRvbSBSaW5p
IHdyb3RlOgo+ID4gPiA+ID4gT24gVHVlLCBPY3QgMTgsIDIwMjIgYXQgMDg6MDM6MzFQTSArMDIw
MCwgUGFsaSBSb2jDoXIgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFR1ZXNkYXkgMTggT2N0b2JlciAy
MDIyIDE5OjQ4OjI3IE1heCBLcnVtbWVuYWNoZXIgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gRnJvbTog
TWF4IEtydW1tZW5hY2hlciA8bWF4LmtydW1tZW5hY2hlckB0b3JhZGV4LmNvbT4KPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+IFdpdGggTFRPIGVuYWJsZWQgdGhlIFUtQm9vdCBpbml0aWFsIGVu
dmlyb25tZW50IGlzIG5vIGxvbmdlciBzdG9yZWQKPiA+ID4gPiA+ID4gPiBpbiBhbiBlYXN5IGFj
Y2Vzc2libGUgc2VjdGlvbiBpbiBlbnYvY29tbW9uLm8uIEkuZS4gdGhlIHNlY3Rpb24gbmFtZQo+
ID4gPiA+ID4gPiA+IGNoYW5nZXMgZnJvbSBidWlsZCB0byBidWlsZCwgaXRzIGNvbnRlbnQgbWF5
YmUgY29tcHJlc3NlZCBhbmQgaXQgaXMKPiA+ID4gPiA+ID4gPiBhbm5vdGF0ZWQgd2l0aCBhZGRp
dGlvbmFsIGRhdGEuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBGb3IgR0NDIGFkZGluZyB0
aGUgb3B0aW9uICctZmZhdC1sdG8tb2JqZWN0cycgd2hlbiBjb21waWxpbmcgY29tbW9uLm8KPiA+
ID4gPiA+ID4gPiBhZGRzIGFkZGl0aW9uYWxseSB0aGUgdHJhZGl0aW9uYWwgc2VjdGlvbnMgaW4g
dGhlIG9iamVjdCBmaWxlIGFuZAo+ID4gPiA+ID4gPiA+ICdtYWtlIHUtYm9vdC1pbml0aWFsLWVu
dicgd291bGQgd29yayBhbHNvIGZvciB0aGUgTFRPIGVuYWJsZWQgY2FzZS4KPiA+ID4gPiA+ID4g
PiBIb3dldmVyIGNsYW5nIGRvZXNuJ3QgaGF2ZSB0aGF0IG9wdGlvbi4KPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+IEZpeCB0aGlzIGJ5IHJlY29tcGlsaW5nIGNvbW1vbi5vIGludG8gYSBvYmpl
Y3QgZmlsZSBvbmx5IHVzZWQgZm9yCj4gPiA+ID4gPiA+ID4gdGhlIGNyZWF0aW9uIG9mIHUtYm9v
dC1pbml0aWFsLWVudiBpZiBMVE8gaXMgZW5hYmxlZC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+IFNlZSBhbHNvOgo+ID4gPiA+ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC85
MjdiMTIyZS0xZjYyLWU3OTAtZjVjYS0zMGJhZTQzMzJjNzdAZm9zcy5zdC5jb20vCj4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXggS3J1bW1lbmFjaGVyIDxtYXgu
a3J1bW1lbmFjaGVyQHRvcmFkZXguY29tPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gLS0t
Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgTWFrZWZpbGUgfCA4ICsrKysrKysrCj4gPiA+
ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCj4gPiA+ID4gPiA+
ID4gaW5kZXggMzg2NmNjNjJmOWEuLmNkNDVjNzIwZDIzIDEwMDY0NAo+ID4gPiA+ID4gPiA+IC0t
LSBhL01ha2VmaWxlCj4gPiA+ID4gPiA+ID4gKysrIGIvTWFrZWZpbGUKPiA+ID4gPiA+ID4gPiBA
QCAtMjQ1MSw5ICsyNDUxLDE3IEBAIGVuZGlmCj4gPiA+ID4gPiA+ID4gICAgICQoUSkkKE1BS0Up
IC1mICQoc3JjdHJlZSkvc2NyaXB0cy9NYWtlZmlsZS5tb2Rwb3N0Cj4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiAgcXVpZXRfY21kX2dlbmVudiA9IEdFTkVOViAgJEAKPiA+ID4gPiA+ID4gPiAr
aWZlcSAoJChMVE9fRU5BQkxFKSx5KQo+ID4gPiA+ID4gPiA+ICtjbWRfZ2VuZW52ID0gJChDQykg
JChmaWx0ZXItb3V0ICQoTFRPX0NGTEFHUyksJChjX2ZsYWdzKSkgLWMgLW8gZW52L2luaXRpYWxf
ZW52Lm8gZW52L2NvbW1vbi5jOyBcCj4gPiA+ID4gPiA+ID4gKyAgICQoT0JKQ09QWSkgLS1kdW1w
LXNlY3Rpb24gLnJvZGF0YS5kZWZhdWx0X2Vudmlyb25tZW50PSRAIGVudi9pbml0aWFsX2Vudi5v
OyBcCj4gPiA+ID4gPiA+ID4gKyAgIHNlZCAtLWluLXBsYWNlIC1lICdzL1x4MDAvXHgwQS9nJyAk
QDsgc2VkIC0taW4tcGxhY2UgLWUgJy9eXHMqJCQvZCcgJEA7IFwKPiA+ID4gPiA+ID4gPiArICAg
c29ydCAtLWZpZWxkLXNlcGFyYXRvcj09IC1rMSwxIC0tc3RhYmxlICRAIC1vICRAOyBcCj4gPiA+
ID4gPiA+ID4gKyAgIHJtIC1mIGVudi9pbml0aWFsX2Vudi5vIGVudi9pbml0aWFsX2Vudi5zdQo+
ID4gPiA+ID4gPiA+ICtlbHNlCj4gPiA+ID4gPiA+ID4gIGNtZF9nZW5lbnYgPSAkKE9CSkNPUFkp
IC0tZHVtcC1zZWN0aW9uIC5yb2RhdGEuZGVmYXVsdF9lbnZpcm9ubWVudD0kQCBlbnYvY29tbW9u
Lm87IFwKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhpcyBjb2RlIGlzIHN0aWxsIGJyb2tlbiBi
ZWNhdXNlIGluIHNvbWUgY2FzZXMgc2VjdGlvbiBuYW1lIGlzIG5vdCBSTy4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBXYWl0LCB3aGVuIGRvZXMgdGhhdCBoYXBwZW4/Cj4gPiA+ID4KPiA+ID4gPiBFLmcu
IGZvciBtdmVidV9lc3ByZXNzb2Jpbi04OGYzNzIwX2RlZmNvbmZpZwo+ID4gPgo+ID4gPiBFcm0s
IHVnaC4gSSBzZWUgNDRiZTgzNWQyNWJhICgiYXJtOiBtdmVidTogRXNwcmVzc29iaW46IFNldCBk
ZWZhdWx0Cj4gPiA+IHZhbHVlIGZvciAkZXRoTmFkZHIgZW52IHZhcmlhYmxlIikgYW5kIGM0ZGYw
ZjZmMzE1YyAoImFybTogbXZlYnU6Cj4gPiA+IEVzcHJlc3NvYmluOiBTZXQgZGVmYXVsdCB2YWx1
ZSBmb3IgJGZkdGZpbGUgZW52IHZhcmlhYmxlIikgSSBndWVzcyB3ZQo+ID4gPiBjb3VsZG4ndCBz
b2x2ZSB0aGlzIGFueSBvdGhlciB3YXk/IFRoZSBwbGF0Zm9ybXMgYXJlbid0IHVuaXF1ZSBpbgo+
ID4gPiBuZWVkaW5nIC8gd2FudGluZyB0byBzZXQgTUFDIG9yIGZkdGZpbGUgdmFyaWFibGVzLgo+
ID4KPiA+IFllcywgd2UgY2FuIHNvbHZlIGl0LiBNYXJlayB3YXMgd29ya2luZyBvbiBzb2x1dGlv
biBmb3Igc2V0dGluZyBkZWZhdWx0Cj4gPiB2YXJpYWJsZXMgYXQgcnVudGltZSBidXQgc2VlbXMg
aXQgaXMgbm90IGZpbmlzaGVkIHlldC4KPgo+IE9LLCB0aGVuIGxldHMgbm90IGFzc3VtZSBERUZB
VUxUX0VOVl9JU19SVyBpcyBzb21ldGhpbmcgd2UgbmVlZCB0byB3b3JyeQo+IGFib3V0IGxvbmcg
dGVybS4KClRoZSBwYXRjaCB3YXMgaW50ZW5kZWQgdG8gZml4IHUtYm9vdC1pbml0aWFsLWVudiBt
YWtlIHRhcmdldCBmb3IgY2FzZXMKd2hlcmUgaXQgd29ya2VkCndpdGhvdXQgJ0NPTkZJR19MVE8n
IHRvIGFsc28gd29yayBpZiB0aGF0IGNvbmZpZyBnZXRzIGVuYWJsZWQuCgpBbnkgdXNlIGNhc2Ug
d2hlcmUgaXQgYWxyZWFkeSBmYWlscyB3aXRob3V0ICdDT05GSUdfTFRPJyBzZXQgd2lsbCBub3Qg
YmVuZWZpdC4KCkkgYWdyZWUgdGhhdCBhIHZhcmlhbnQgb2YgdG9vbHMvZW52L2Z3X3ByaW50ZW52
IGNvbXBpbGVkIGZvciB0aGUgYnVpbGQgaG9zdCBtYXkKc29sdmUgYWRkaXRpb25hbCBpc3N1ZXMg
cHJlc2VudC4gSG93ZXZlciBJIHdpbGwgbm90IGJlIGFibGUgdG8gd29yayBvbiBzdWNoIGEKc29s
dXRpb24gaW4gdGhlIG5lYXIgZnV0dXJlLgoKTWF4Cgo+Cj4gLS0KPiBUb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
