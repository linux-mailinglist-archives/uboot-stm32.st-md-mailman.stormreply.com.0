Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 793FA7713B5
	for <lists+uboot-stm32@lfdr.de>; Sun,  6 Aug 2023 07:41:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25FF8C6B46A;
	Sun,  6 Aug 2023 05:41:14 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7A66C6B469
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Aug 2023 05:41:12 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5232d593646so1062964a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Aug 2023 22:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691300472; x=1691905272;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=19iONng6Tbc5/MGfiy2OxmunoOjv75WsG/a8kSqgdNo=;
 b=YTYyoj56pzaR38r/+J1+jPcnfeeCrKkrC7jPwKKD9ze5KkyLcKH2NFMTXlp85BR1Fy
 X9BqEnL2NT3XskIO8dKM4s165i9mMYIz2h+JwdrfrbqYyLxSjaA8u1IZMkJavykYxLsz
 fX/NaBiFq40UIwdmJxBSvPYPz5WNZd+E6kuFfw/crs3xAPcYlR9O1Iyznez/Ol5R5H6G
 Q7DImaH32nbnxH4t6wohrye11W4Anm+ICg2NqcPpKNODPruN3+eXP34YH/NdFuPrmOit
 yFij/7RLb1j0/jCmn8WkBWkgRiRcXpwoXzBWgxgkXzqI1mhGEivkKU3Ie2goNAJvoNjE
 M+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691300472; x=1691905272;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=19iONng6Tbc5/MGfiy2OxmunoOjv75WsG/a8kSqgdNo=;
 b=DIOFxovoFNdViANLQxgn2kl5HMkqajm+8srVUwMfCO7Mnezott00adQdtSTuVLynEf
 nz7vszY3kDPvqDxTsoLnmjxjoi92jN72efIljz915aiff9HlsuFiu99q0cf4rsaQFRdg
 937zD2apTcwBUf6b80/yxN5TAfDP36xY6OIkPnLNdVi6nYmpQSkA+RBDaUE407vO5sUL
 04dTBIZ8i0QR+f1itCcqGfngIyNUG4XRzmDm9jkQbqhUlo+cdeELDyzn6dOSqbd7TBpS
 UYyqqgYICqMo4OR5dPvlwfDxNWFaRewJAe8zwbBJvAkPE438/7MsXcIGm7yfvChDDBtL
 R8CQ==
X-Gm-Message-State: AOJu0YzsI9+KEel6NMQkq387eosP/YcEYwTTUbdXaBdQIyA5zwxAmPgV
 YkfSKTNwG8sebI3ZqHKuIG8=
X-Google-Smtp-Source: AGHT+IGbU1oxoCxhbAb6ekspjZ+xitT2fTQvQb1n30v9fwqMeoZi3A+wcIy94TznB/eRFNMH3SAOhQ==
X-Received: by 2002:a17:906:1085:b0:99b:f3ef:f084 with SMTP id
 u5-20020a170906108500b0099bf3eff084mr6633259eju.66.1691300471896; 
 Sat, 05 Aug 2023 22:41:11 -0700 (PDT)
Received: from [127.0.0.1] ([46.211.153.198]) by smtp.gmail.com with ESMTPSA id
 m17-20020a170906235100b00985bdb7dd5fsm3441608eja.201.2023.08.05.22.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Aug 2023 22:41:11 -0700 (PDT)
Date: Sun, 06 Aug 2023 08:41:09 +0300
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonas Karlman <jonas@kwiboo.se>, Simon Glass <sjg@chromium.org>
User-Agent: K-9 Mail for Android
In-Reply-To: <cdd2fb7c-6790-c747-47ff-bdb5beac85fd@kwiboo.se>
References: <20230720123744.26854-1-clamor95@gmail.com>
 <20230720123744.26854-4-clamor95@gmail.com>
 <CAPnjgZ3jXmqtB=MTv7-SvEaKGyHHgO=zh5m8yPP=hbobh=B=pg@mail.gmail.com>
 <CAPVz0n2wxT_u0BDSdq5+VOkScdDJxAsBntr_p6ajawxiEszyzg@mail.gmail.com>
 <09c6ff35-250a-18ff-667d-9ce62e24b18c@kwiboo.se>
 <4222D0DC-D1D9-4382-93A0-E09EFD807CCC@gmail.com>
 <cdd2fb7c-6790-c747-47ff-bdb5beac85fd@kwiboo.se>
Message-ID: <C014D201-A133-4AA0-A6DF-41BAE7D387A3@gmail.com>
MIME-Version: 1.0
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

Cgo1INGB0LXRgNC/0L3RjyAyMDIzINGALiAyMzo0NjoyNyBHTVQrMDM6MDAsIEpvbmFzIEthcmxt
YW4gPGpvbmFzQGt3aWJvby5zZT4g0L3QsNC/0LjRgdCw0LIoLdC70LApOgo+T24gMjAyMy0wOC0w
NSAyMTo1OCwgU3Z5YXRvc2xhdiBSeWhlbCB3cm90ZToKPj4gCj4+IAo+PiA1INGB0LXRgNC/0L3R
jyAyMDIzINGALiAxNTo0OTozMiBHTVQrMDM6MDAsIEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJv
by5zZT4g0L3QsNC/0LjRgdCw0LIoLdC70LApOgo+Pj4gSGksCj4+Pgo+Pj4gT24gMjAyMy0wNy0y
MSAwNzozNCwgU3Z5YXRvc2xhdiBSeWhlbCB3cm90ZToKPj4+PiDRh9GCLCAyMCDQu9C40L8uIDIw
MjPigK/RgC4g0L4gMjI6NDMgU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+INC/0LjRiNC1
Ogo+Pj4+Pgo+Pj4+PiBIaSBTdnlhdG9zbGF2LAo+Pj4+Pgo+Pj4+PiBPbiBUaHUsIDIwIEp1bCAy
MDIzIGF0IDA2OjM4LCBTdnlhdG9zbGF2IFJ5aGVsIDxjbGFtb3I5NUBnbWFpbC5jb20+IHdyb3Rl
Ogo+Pj4+Pj4KPj4+Pj4+IFJlZ3VsYXRvcnMgaW5pdGlhbCBzZXR1cCB3YXMgcHJldmlvdXNseSBk
ZXBlbmRlbnQgb24gYm9hcmQgY2FsbC4KPj4+Pj4+IFRvIG1vdmUgZnJvbSB0aGlzIGJlaGF2aW91
ciB3ZXJlIGludHJvZHVjZWQgdHdvIHN0ZXBzLiBGaXJzdCBpcwo+Pj4+Pj4gdGhhdCBhbGwgaW5k
aXZpZHVhbCByZWd1bGF0b3JzIHdpbGwgYmUgcHJvYmVkIGp1c3QgYWZ0ZXIgYmluZGluZwo+Pj4+
Pgo+Pj4+PiBXZSBtdXN0IG5vdCBwcm9iZSBkZXZpY2VzIGF1dG9tYXRpY2FsbHkgd2hlbiBib3Vu
ZC4gVGhlIGkyYyBpbnRlcmZhY2UKPj4+Pj4gbWF5IG5vdCBiZSBhdmFpbGFibGUsIGV0Yy4gRG8g
YSBwcm9iZSBhZnRlcndhcmRzLgo+Pj4+Pgo+Pj4+PiBQZXJoYXBzIEkgYW0gbWlzdW5kZXJzdGFu
ZGluZyB0aGlzLCBpd2MgcGxlYXNlIHJld29yZCB0aGlzIGNvbW1pdCBtZXNzYWdlLgo+Pj4+Cj4+
Pj4gQWZ0ZXIgYm91bmQuIElmIHRoZSByZWd1bGF0b3IgaXMgYSBzZWxmLXN1ZmZpY2llbnQgaTJj
IGRldmljZSB0aGVuIGl0Cj4+Pj4gd2lsbCBiZSBib3VuZAo+Pj4+IGFmdGVyIGkyYyBpcyBhdmFp
bGFibGUgYnkgY29kZSBkZXNpZ24gc28gaTJjIGludGVyZmFjZSBzaG91bGQgYmUKPj4+PiBhdmFp
bGFibGUgYXQgdGhhdAo+Pj4+IG1vbWVudC4gQXQgbGVhc3QgbGVkIGFuZCBncGlvIHVjbGFzc2Vz
IHBlcmZvcm0gdGhpcyBmb3IgaW5pdGlhbCBzZXR1cAo+Pj4+IG9mIGRldmljZXMuCj4+Pj4KPj4+
PiBQbGF0Zm9ybSByZWd1bGF0b3JzIChha2EgZml4ZWQvZ3BpbyByZWd1bGF0b3JzKSB3b3JrIHBl
cmZlY3RseSBmaW5lLiBJCj4+Pj4gaGF2ZSBubyBpMmMKPj4+PiByZWd1bGF0b3JzIHRvIHRlc3Qg
ZGVlcGx5Lgo+Pj4+Cj4+Pj4gQXMgZm9yIG5vdyBvbmx5IG9uZSB1Y2xhc3MgaXMgbm90IGNvbXBh
dGlibGUgd2l0aCB0aGlzIHN5c3RlbSAtIFBNSUMgd2hpY2ggaGFzCj4+Pj4gc3Ryb25nIGRlcGVu
ZGVuY3kgYmV0d2VlbiByZWd1bGF0b3IgYW5kIG1haW4gbWZkLiBUaGlzIGlzIHdoeSBwcm9iaW5n
IGFmdGVyCj4+Pj4gYmluZCBmb3IgcG1pYyByZWd1bGF0b3JzIGlzIGRpc2FibGVkIGFuZCBwbWlj
IHJlZ3VsYXRvcnMgYXJlIHByb2JlZCBvbiBwbWljIGNvcmUKPj4+PiBwb3N0X3Byb2JlLgo+Pj4K
Pj4+IFRoaXMgc291bmRzIG1vcmUgbGlrZSBhIHBvc3NpYmxlIGJ1ZyBvZiBzb21lIGRlcGVuZGVu
Y3kgbm90IGJlaW5nCj4+PiBwcm9iZWQgaW4gY29ycmVjdCBvcmRlciBvciBub3QgbGVhdmluZyB0
aGUgZGV2aWNlIGluIGEgcmVhZHkgc3RhdGUKPj4+IGFmdGVyIHByb2JlLgo+Pj4KPj4+IElmIHBt
aWMgcmVndWxhdG9ycyBhcmUgYmluZCBpbiBwbWljIGJpbmQgd2l0aCB0aGUgcG1pYyBhcyBwYXJl
bnQsIHRoZW4KPj4+IGF0IHJlZ3VsYXRvciBwcm9iZSB0aGUgZHJpdmVyIGNvcmUgZW5zdXJlIHRo
YXQgcG1pYyBoYXMgcHJvYmVkIGJlZm9yZQo+Pj4gcmVndWxhdG9yIHVzZS4KPj4+Cj4+PiBUaGlz
IHdvcmtzIHBlcmZlY3QgZmluZSB3aXRoIHRoZSBSSzh4eCBJMkMgUE1JQyBhbmQgaXRzIHJlZ3Vs
YXRvcnMuCj4+PiBXaWNoIGEgY2FsbCB0byBkZXZpY2VfZ2V0X3N1cHBseV9yZWd1bGF0b3IoZGV2
LCAidGVzdC1zdXBwbHkiLCAmcmVnKQo+Pj4gcHJvYmUgaGFwcGVucyBpbiBpMmMsIHBtaWMgYW5k
IHJlZ3VsYXRvciBvcmRlci4KPj4+Cj4+IAo+PiBJIHdpbGwgY2hlY2sgYW5kIHJlLXRlc3QgZHJp
dmVycyBJIGhhdmUgQVNBUC4gCj4+IAo+Pj4+Cj4+Pj4+PiB3aGljaCBlbnN1cmVzIHRoYXQgcmVn
dWxhdG9yIHBkYXRhIGlzIGZpbGxlZCBhbmQgc2Vjb25kIGlzIHNldHRpbmcKPj4+Pj4+IHVwIHJl
Z3VsYXRvciBpbiBwb3N0IHByb2JlIHdoaWNoIGVuc2VyZXMgdGhhdCBjb3JyZWN0IHJlZ3VsYXRv
cgo+Pj4+Pj4gc3RhdGUgYWNjb3JkaW5nIHRvIHBkYXRhIGlzIHJlYWNoZWQuCj4+Pgo+Pj4gSSB0
aGluayB0aGF0IHRoZSBhcHByb2FjaCBpbiB0aGlzIHBhdGNoIGlzIHRyeWluZyB0byBjaGFuZ2Ug
dG9vIG11Y2ggYWxsCj4+PiBhdCBvbmNlLgo+Pj4KPj4+IEhhdmUgbWFkZSBzb21lIGFkanVzdG1l
bnRzIHRoYXQgSSB0aGluayBzaG91bGQgaGVscCB3aXRoIHRyYW5zaXRpb24uCj4+PiAtIEFkZGVk
IGEgZmxhZyB0byBwcm90ZWN0IHJlZ3VsYXRvcl9hdXRvc2V0IGZyb20gYmVpbmcgY2FsbGVkIG1v
cmUgdGhlbgo+Pj4gIG9uY2UgZm9yIGVhY2ggcmVndWxhdG9yLCBpbiBhIHNlcGFyYXRlIHBhdGNo
Lgo+PiAKPj4gSXQgaXMgbm90IGEgZ29vZCBkZWNpc2lvbiBpbiB0aGUgbG9uZyBydW4gYW5kIHlv
dSBzaG91bGQga2VlcCBpbiBtaW5kIHRoYXQgdGhlcmUgaXMgbm90aGluZyBtb3JlIGNvbnN0YW50
IHRoYW4gYSB0ZW1wb3Jhcnkgc29sdXRpb24uCj4KPk5vciBkbyBJIHByb3Bvc2UgdGhpcyB0byBi
ZSBhIGxvbmctdGVybSBzb2x1dGlvbiwgb25seSB0aGF0IGl0IGlzIG1vcmUKPnJldmlld2FibGUg
dG8gc2VlIGNoYW5nZXMgaW4gbm9uLWJyZWFraW5nIHNtYWxsZXIgc3RlcHMuIEluIGN1cnJlbnQK
PnN0YXRlIHRoaXMgcGF0Y2ggYnJlYWtzIGJ1aWxkaW5nIFUtQm9vdCBhbmQgcmVxdWlyZXMgdGhl
IGxhc3QgcGF0Y2ggdG8KPmZpeCBidWlsZCBhZ2Fpbi4KPgo+QW55d2F5LCBJIHdpbGwgYmUgcG9z
dGluZyBhIHNpbWlsYXIgcGF0Y2ggZm9yIGF1dG9zZXQgYXMgbGlua2VkIGJlbG93IGFzCj5wYXJ0
IG9mIGEgc2VyaWVzIHRvIGFkZCBhIFJvY2tjaGlwIElPLWRvbWFpbiBkcml2ZXIgc2hvcnRseS4g
SW4gY3VycmVudAo+c3RhdGUgYXV0b3NldCBjYW5ub3Qgc2FmZWx5IGJlIGNhbGxlZCBtdWx0aXBs
ZSB0aW1lcywgYW5kIHN1Y2ggcGF0Y2gKPnNob3VsZCBub3QgaGF2ZSBhbiBpbXBhY3Qgb24gdGhl
IGRpcmVjdGlvbiBvZiB0aGlzIHNlcmllcy4KPgo+PiAKPj4+IC0gQ2hhbmdlZCB0byBvbmx5IHBy
b2JlLWFmdGVyLWJpbmQgb24gcmVndWxhdG9ycyBtYXJrZWQgYXMKPj4+ICBhbHdheXMtb24vYm9v
dC1vbi4KPj4+Cj4+PiBBbmQgaXQgd29ya3Mgc29tZXRoaW5nIGxpa2UgdGhpczoKPj4+Cj4+PiBz
dGF0aWMgaW50IHJlZ3VsYXRvcl9wb3N0X2JpbmQoc3RydWN0IHVkZXZpY2UgKmRldikKPj4+IHsK
Pj4+IAlbLi4uXQo+Pj4KPj4+IAlpZiAodWNfcGRhdGEtPmFsd2F5c19vbiB8fCB1Y19wZGF0YS0+
Ym9vdF9vbikKPj4+IAkJZGV2X29yX2ZsYWdzKGRldiwgRE1fRkxBR19QUk9CRV9BRlRFUl9CSU5E
KTsKPj4+IH0KPj4+Cj4+PiBzdGF0aWMgaW50IHJlZ3VsYXRvcl9wb3N0X3Byb2JlKHN0cnVjdCB1
ZGV2aWNlICpkZXYpCj4+PiB7Cj4+PiAJcmV0ID0gcmVndWxhdG9yX2F1dG9zZXQoZGV2KTsKPj4+
IH0KPj4+Cj4+PiBXaXRoIHRoYXQgYW55IGFsd2F5cy1vbi9ib290LW9uIHJlZ3VsYXRvciB3b3Vs
ZCBhdXRvbWF0aWNhbGx5IHByb2JlIGFuZAo+Pj4gYXV0b3NldCBhZnRlciBiaW5kLCByZW1haW5p
bmcgd291bGQgb25seSBwcm9iZSBhbmQgYXV0b3NldCBpZiB0aGV5IGFyZQo+Pj4gdXNlZC4KPj4g
Cj4+IHVjX3BkYXRhIGlzIGZpbGxlZCBpbiBwcmVfcHJvYmUsIHdoaWxlIHlvdSBhcmUgcnVuaW5n
IGNoZWNrIGluIHBvc3RfYmluZC4KPgo+UGxlYXNlIGxvb2sgY2xvc2VyIGF0IHRoZSBjb2RlIGFu
ZCBub3QgdGhlIHNuaXBwZXQgYWJvdmUsIHRoZXkgYXJlCj5maWxsZWQgaW4gcG9zdF9iaW5kIG9y
IHRoZSBjb2RlIHdvdWxkIG5vdCBoYXZlIHdvcmtlZCA6LSkKClNvIHlvdSBoYXZlIG1vdmVkIHRo
YXQsIGFscmlnaHQuIFdlbGwsIEkgYW0gZmluZSB3aXRoIGxlc3MgaW52YXNpdmUgcGF0Y2ggYXMg
bG9uZyBhcyBteSBkZXZpY2VzIGNvbnRpbnVlIHRvIHdvcmsgYXMgaW50ZW5kZWQuIEkgd2lsbCB0
ZXN0IHlvdXIgc3VnZ2VzdGlvbnMgYW5kIHJlbG9hZCBwYXRjaHNldC4gVGhhbmtzLgoKQmVzdCBy
ZWdhcmRzLApTdnlhdG9zbGF2IFIuCgo+UmVnYXJkcywKPkpvbmFzCj4KPj4gCj4+PiBUaGlzIGFw
cHJvYWNoIHNob3VsZCBhbHNvIHByZXZlbnQgaGF2aW5nIHRvIGNoYW5nZSBleGlzdGluZyBjb2Rl
IHRoYXQKPj4+IG1heSBjYWxsIGF1dG9zZXQsIGFuZCBjbGVhbnVwIGNhbiBiZSBkb25lIGluIGZv
bGxvdy11cCBwYXRjaGVzL3Nlcmllcy4KPj4+Cj4+PiBQcm9iZS1hZnRlci1iaW5kIGFuZCBjYWxs
IHRvIGF1dG9zZXQgY291bGQgYWxzbyBiZSBwcm90ZWN0ZWQgd2l0aCBhIG5ldwo+Pj4gS2NvbmZp
ZyB0byBoZWxwIHdpdGggdHJhbnNpdGlvbi4KPj4+Cj4+PiBTZWUgZm9sbG93aW5nIGZvciBhIHdv
cmtpbmcgZXhhbXBsZSB1c2luZyBhIG5ldyBkcml2ZXIgdGhhdCBkZXBlbmRzCj4+PiBvbiB0aGF0
IHJlZ3VsYXRvcnMgaGF2ZSBiZWVuIGF1dG9zZXQgcHJpb3IgdG8gcmVndWxhdG9yX2dldF92YWx1
ZS4KPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9Ld2lib28vdS1ib290LXJvY2tjaGlwL2NvbXBhcmUv
bWFzdGVyLi4ucmszNTY4LWlvLWRvbWFpbgo+Pj4KPj4+IE9yIHRoZSB0d28gY29tbWl0cyBzZXBh
cmF0ZToKPj4+Cj4+PiBwb3dlcjogcmVndWxhdG9yOiBPbmx5IHJ1biBhdXRvc2V0IG9uY2UgZm9y
IGVhY2ggcmVndWxhdG9yCj4+PiBodHRwczovL2dpdGh1Yi5jb20vS3dpYm9vL3UtYm9vdC1yb2Nr
Y2hpcC9jb21taXQvMDVkYjRkYmNiOGY5MDhiNDE3ZWQ1Y2FlOGE3YTMyNWM4MjExMmQ3NQo+Pj4K
Pj4+IHBvd2VyOiByZWd1bGF0b3I6IFBlcmZvcm0gcmVndWxhdG9yIHNldHVwIGluc2lkZSB1Y2xh
c3MKPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9Ld2lib28vdS1ib290LXJvY2tjaGlwL2NvbW1pdC80
ODliZDVkMmMxYTJhMzM4MjRlYWM0ZjJkNTQzOTllZjVkZmY0ZmRmCj4+Pgo+Pj4gUmVnYXJkcywK
Pj4+IEpvbmFzCj4+Pgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFN2eWF0b3NsYXYgUnlo
ZWwgPGNsYW1vcjk1QGdtYWlsLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gIGRyaXZlcnMvcG93ZXIv
cmVndWxhdG9yL3JlZ3VsYXRvci11Y2xhc3MuYyB8IDIxMiArKysrKystLS0tLS0tLS0tLS0tLS0K
Pj4+Pj4+ICBpbmNsdWRlL3Bvd2VyL3JlZ3VsYXRvci5oICAgICAgICAgICAgICAgICAgfCAxMTkg
LS0tLS0tLS0tLS0tCj4+Pj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCAy
NjkgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IFJlZ2FyZHMsCj4+Pj4+IFNJbW9uCj4+Pgo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMy
IG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290
LXN0bTMyCg==
