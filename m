Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7331F8718A0
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Mar 2024 09:51:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2121BC71286;
	Tue,  5 Mar 2024 08:51:47 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A9D3C6DD65
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 23:02:32 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5658082d2c4so6918508a12.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 15:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709593351; x=1710198151;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EfKVvCc8ZYEfB1COmorOeK1mNHbPkMIzSdBUHLdvQJI=;
 b=ZW/brPdh0xcsh2pF+rE12rX0E1KbKQIZN6rm1LETwd2GtaQsQJl1SckNC3CO30cVXv
 XlIJfPileBZ3+D1xzwFnACPORFLyVLF+Crh5hwh0Z2Gpvs5AS6yWAawN8L8YuKMZXb3v
 TdhHINU1jN5upf3f42ZrCOkswl3ABeGEvkmP4enAd4FPG/4e/xwLJEMR2c1vMj4gDwe2
 vQs6iNB7fQMTuzYYRaMysy60gdqIcJhDkYW9VHk7uS/RVOyJHDusEzMLznqWHm3WWEu7
 Tpcj0+qkJcAnXp1n1sdQceVJnq7rvAdxEzJhtng9XCN6ZLngMnVTTcoaIkyRzNFHMsk4
 Ew1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709593351; x=1710198151;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EfKVvCc8ZYEfB1COmorOeK1mNHbPkMIzSdBUHLdvQJI=;
 b=H6/XXdUQhllKCVsU+Vkc2FwKvuQTxsbWBajT6P5Bg8lpULW9x+JqhW1F18+KiuFy1A
 HTzM+SQt7ESIbUPd+JibyeHfTV1Ncj4W30NmHEcqyUo3YAa6KRYLsEqxJuqZAtMu0eBx
 5wsHu+IhTcI4LrYVgyWcqd0gNjNoyQEABkTlVOqXVhbzQ0c4eIM6rZvCJtmsiwiGpquP
 IFE48VsuY8KsO4gLWRie9zSOOw9Msv4mrwFoB+HDj8wJAt5Dh+XdaS4WC+ggUqIDi7me
 XPJf/jgwF5pLq/Gx18z25AHmNecs+JZIROWRTngSEQt/CBLd6Q9xeS+zecKeL6CvV6yX
 9jwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUht2mM5wn11zIb0AkCCS3LxWJB4KyvxbziknKP7RD6DShnEjX9wdYizWm74oCnkgqLoV8LKCeFo2QOb6oFENja8ZOsgXF7bp9psoYtLRidWrqzhzZw1RFb
X-Gm-Message-State: AOJu0Yxvw8fxooAPzbhphZ2DCIHIkVyV4bk/n1p5x9nMX0vGJSeqLSug
 TAtsJJ8GBqNDr1veOxxrxGl/HaarO7UF9kphlLAsN4uuggfBFZlG9jQ7QnooS5plUC3aJN1ie9l
 V6YQldAbMclh8t7AbVu8Bb9UT8J8=
X-Google-Smtp-Source: AGHT+IHrbX0TI1QzY4ITSD9vI9OrADmTTHJvB5pQMV71Lb/GX8KJKjae0afRbrPN2TprSlhSuU8msCqZoppsjaE4sys=
X-Received: by 2002:a50:cdd0:0:b0:566:3f3e:3a23 with SMTP id
 h16-20020a50cdd0000000b005663f3e3a23mr6881548edj.1.1709593351307; Mon, 04 Mar
 2024 15:02:31 -0800 (PST)
MIME-Version: 1.0
References: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
 <20240304-b4-upstream-dt-headers-v1-26-b7ff41925f92@linaro.org>
In-Reply-To: <20240304-b4-upstream-dt-headers-v1-26-b7ff41925f92@linaro.org>
From: Tony Dinh <mibodhi@gmail.com>
Date: Mon, 4 Mar 2024 15:02:12 -0800
Message-ID: <CAJaLiFyXC2-wkwbyvK+bKWhwzV9=rWY445Lz5dFQSWdB0Zb5Bg@mail.gmail.com>
To: Caleb Connolly <caleb.connolly@linaro.org>
X-Mailman-Approved-At: Tue, 05 Mar 2024 08:51:46 +0000
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sam Protsenko <semen.protsenko@linaro.org>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot-amlogic@groups.io, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, Dai Okamura <okamura.dai@socionext.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Rick Chen <rick@andestech.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, uboot-snps-arc@synopsys.com,
 Michal Simek <michal.simek@amd.com>, Sumit Garg <sumit.garg@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>
Subject: Re: [Uboot-stm32] [PATCH RFC 26/26] dts: support building all dtb
 files for a specific vendor
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

SGkgQ2FsZWIsCgpPbiBNb24sIE1hciA0LCAyMDI0IGF0IDk6MjTigK9BTSBDYWxlYiBDb25ub2xs
eSA8Y2FsZWIuY29ubm9sbHlAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIGFkanVzdHMgT0Zf
VVBTVFJFQU0gdG8gYmVoYXZlIG1vcmUgbGlrZSB0aGUga2VybmVsIGJ5IGFsbG93aW5nIGZvcgo+
IGFsbCB0aGUgZGV2aWNldHJlZSBmaWxlcyBmb3IgYSBnaXZlbiB2ZW5kb3IgdG8gYmUgY29tcGls
ZWQuIFRoaXMgaXMKPiB1c2VmdWwgZm9yIFF1YWxjb21tIGluIHBhcnRpY3VsYXIgYXMgbW9zdCBi
b2FyZHMgYXJlIHN1cHBvcnRlZCBieSBhCj4gc2luZ2xlIFUtQm9vdCBidWlsZCBqdXN0IHByb3Zp
ZGVkIHdpdGggYSBkaWZmZXJlbnQgRFQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDYWxlYiBDb25ub2xs
eSA8Y2FsZWIuY29ubm9sbHlAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHRzL0tjb25maWcgICAgICAg
ICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPiAgc2NyaXB0cy9NYWtlZmlsZS5kdHMg
fCAxNyArKysrKysrKysrKysrKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kdHMvS2NvbmZpZyBiL2R0cy9LY29u
ZmlnCj4gaW5kZXggYjliNjM2NzE1NGVmLi42N2Q5ZGM0ODk4NTYgMTAwNjQ0Cj4gLS0tIGEvZHRz
L0tjb25maWcKPiArKysgYi9kdHMvS2NvbmZpZwo+IEBAIC0xMDAsOCArMTAwLDMyIEBAIGNvbmZp
ZyBPRl9VUFNUUkVBTQo+ICAgICAgICAgICBIb3dldmVyLCBuZXdlciBib2FyZHMgd2hvc2UgZGV2
aWNldHJlZSBzb3VyY2UgZmlsZXMgaGF2ZW4ndCBsYW5kZWQgaW4KPiAgICAgICAgICAgdGhlIGR0
cy91cHN0cmVhbSBzdWJ0cmVlLCB0aGV5IGNhbiBvdmVycmlkZSB0aGlzIG9wdGlvbiB0byBoYXZl
IHRoZQo+ICAgICAgICAgICBEVCBidWlsZCBmcm9tIGV4aXN0aW5nIFUtQm9vdCB0cmVlIGxvY2F0
aW9uIGluc3RlYWQuCj4KPiArY29uZmlnIE9GX1VQU1RSRUFNX0JVSUxEX1ZFTkRPUgo+ICsgICAg
ICAgYm9vbCAiQnVpbGQgYWxsIGRldmljZXRyZWUgZmlsZXMgZm9yIGEgcGFydGljdWxhciB2ZW5k
b3IiCj4gKyAgICAgICBkZXBlbmRzIG9uIE9GX1VQU1RSRUFNCj4gKyAgICAgICBoZWxwCj4gKyAg
ICAgICAgIEVuYWJsZSBidWlsZGluZyBhbGwgZGV2aWNldHJlZSBmaWxlcyBmb3IgYSBwYXJ0aWN1
bGFyIHZlbmRvci4gVGhpcwo+ICsgICAgICAgICBpcyB1c2VmdWwgZm9yIGdlbmVyaWMgVS1Cb290
IGNvbmZpZ3VyYXRpb25zIHdoZXJlIG1hbnkgYm9hcmRzIGNhbgo+ICsgICAgICAgICBiZSBzdXBw
b3J0ZWQgd2l0aCBhIHNpbmdsZSBiaW5hcnkuCj4gKwo+ICsgICAgICAgICBUaGlzIGlzIG9ubHkg
YXZhaWxhYmxlIGZvciBwbGF0Zm9ybXMgdXNpbmcgdXBzdHJlYW0gZGV2aWNldHJlZS4KPiArCj4g
K2NvbmZpZyBPRl9VUFNUUkVBTV9WRU5ET1IKPiArICAgICAgIHN0cmluZyAiVmVuZG9yIHRvIGJ1
aWxkIGFsbCB1cHN0cmVhbSBkZXZpY2V0cmVlIGZpbGVzIGZvciIKPiArICAgICAgIGRlcGVuZHMg
b24gT0ZfVVBTVFJFQU1fQlVJTERfVkVORE9SCj4gKyAgICAgICBkZWZhdWx0ICJxY29tIiBpZiBB
UkNIX1NOQVBEUkFHT04KPiArICAgICAgIGRlZmF1bHQgInJvY2tjaGlwIiBpZiBBUkNIX1JPQ0tD
SElQCj4gKyAgICAgICBkZWZhdWx0ICJhbWxvZ2ljIiBpZiBBUkNIX01FU09OCj4gKyAgICAgICBk
ZWZhdWx0ICJhbGx3aW5uZXIiIGlmIEFSQ0hfU1VOWEkKPiArICAgICAgIGRlZmF1bHQgIm1lZGlh
dGVrIiBpZiBBUkNIX01FRElBVEVLCj4gKyAgICAgICBkZWZhdWx0ICJtYXJ2ZWxsIiBpZiBBUkNI
X01WRUJVCgpQZXJoYXBzIGhlcmUgaXQgc2hvdWxkIGJlOgpkZWZhdWx0ICJtYXJ2ZWxsIiBpZiBB
UkNIX01WRUJVIHx8IEFSQ0hfS0lSS1dPT0QKCkFsbCB0aGUgYmVzdCwKVG9ueQoKPiArICAgICAg
IGRlZmF1bHQgInhpbGlueCIgaWYgQVJDSF9WRVJTQUwgfHwgQVJDSF9aWU5RCj4gKyAgICAgICBk
ZWZhdWx0ICJudmlkaWEiIGlmIEFSQ0hfVEVHUkEKPiArICAgICAgIGhlbHAKPiArICAgICAgICAg
U2VsZWN0IHRoZSB2ZW5kb3IgdG8gYnVpbGQgYWxsIGRldmljZXRyZWUgZmlsZXMgZm9yLgo+ICsK
PiAgY2hvaWNlCj4gICAgICAgICBwcm9tcHQgIlByb3ZpZGVyIG9mIERUQiBmb3IgRFQgY29udHJv
bCIKPiAgICAgICAgIGRlcGVuZHMgb24gT0ZfQ09OVFJPTAo+Cj4gZGlmZiAtLWdpdCBhL3Njcmlw
dHMvTWFrZWZpbGUuZHRzIGIvc2NyaXB0cy9NYWtlZmlsZS5kdHMKPiBpbmRleCA1ZTI0MjljNjE3
MGMuLjgwMDU1MjdmM2RmNyAxMDA2NDQKPiAtLS0gYS9zY3JpcHRzL01ha2VmaWxlLmR0cwo+ICsr
KyBiL3NjcmlwdHMvTWFrZWZpbGUuZHRzCj4gQEAgLTEsMyArMSwxOCBAQAo+ICAjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKwo+Cj4gLWR0Yi15ICs9ICQocGF0c3Vic3QgJSwlLmR0
YiwkKHN1YnN0ICIsLCQoQ09ORklHX0RFRkFVTFRfREVWSUNFX1RSRUUpICQoQ09ORklHX09GX0xJ
U1QpICQoQ09ORklHX1NQTF9PRl9MSVNUKSkpCj4gK2R0Yi15ICs9ICQocGF0c3Vic3QgJSwlLmR0
YixcCj4gKyAgICAgICAkKHN1YnN0ICIsLCQoQ09ORklHX0RFRkFVTFRfREVWSUNFX1RSRUUpICQo
Q09ORklHX09GX0xJU1QpICQoQ09ORklHX1NQTF9PRl9MSVNUKSkpCj4gKwo+ICtpZmVxICgkKENP
TkZJR19PRl9VUFNUUkVBTV9CVUlMRF9WRU5ET1IpLHkpCj4gK2lmZXEgKCQoQ09ORklHX0FSTTY0
KSx5KQo+ICtkdF9kaXIgOj0gJChzcmN0cmVlKS9kdHMvdXBzdHJlYW0vc3JjL2FybTY0Cj4gK2Vs
c2UKPiArZHRfZGlyIDo9ICQoc3JjdHJlZSkvZHRzL3Vwc3RyZWFtL3NyYy8kKEFSQ0gpCj4gK2Vu
ZGlmCj4gKwo+ICtkdGItdmVuZG9yX2R0cyA6PSAkKHBhdHN1YnN0ICUuZHRzLCUuZHRiLCBcCj4g
KyAgICAgICAkKHdpbGRjYXJkICQoZHRfZGlyKS8kKHN1YnN0ICIsLCQoQ09ORklHX09GX1VQU1RS
RUFNX1ZFTkRPUikpLyouZHRzKSkKPiArCj4gK2R0Yi15ICs9ICQoc3Vic3QgJChkdF9kaXIpLyws
JChkdGItdmVuZG9yX2R0cykpCj4gKwo+ICtlbmRpZgo+Cj4gLS0KPiAyLjQ0LjAKPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWls
aW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0z
Mgo=
