Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A592E9BBB93
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Nov 2024 18:19:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E326C7A823;
	Mon,  4 Nov 2024 17:19:24 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6708C78020
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 14:49:13 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-37d49a7207cso4746330f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 07:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730299753; x=1730904553;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ih2LJlFP7ouZI4XpcBod+6u3eX6bDouMjqKHkaaXymM=;
 b=d+4/8V0qa1F1mC9TD4r5BRusWBW/RQT3WMgSOEah8Yyquu/Jf55LqQWAAUsIFWgzyJ
 bWmQMqQU5hLo4xi0rttQi0dnUcoE7/biI2HHa7BTsQh2KcyRaO8nZscsqMlSrybj0JoV
 9US35F5tXcpOyK0K0KQ1VOxIXy+IjleRawFto3C80hcmi0Ii/QxpBJZvCC2Em/FihE0z
 a/4F5YN8GxsTUssX9JcFaegyFdYD5S7QSiX0JMquNS6kKSWZEv7NQUXJYLJiSAmI9wVO
 B3uFAR2zbegyHbKL02kUk3lFIu0O3h+CPPpVUbXsmhhXy8jgFiSV95GWzv7of9/pEXoW
 fQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730299753; x=1730904553;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ih2LJlFP7ouZI4XpcBod+6u3eX6bDouMjqKHkaaXymM=;
 b=UP8Ym4vmIpbaeF9WSQHW/8Ecv7XPiLSuamy1MVzQGIIC0OlxbhKhRw0NWLTi3gXF24
 09dPdAc2NijBuKHd/HgjmmUMVEnbLgGZ1CJ7f6zFQXDyg5XzHa58XZUaNFhf3L6ZGR0B
 ohDbnu61H8P047tog7brJ5+TLnuBSzK0i7IdzBbza6bd8lezYzp0g0qZa+1bcL+p+xQV
 lsgXOGR5b/WVnDfqr3sj6xJm31JXq/RLgrtsQeTfFLEA/lh733wO914PZeIhy8nmEC4R
 xJlOW0yexMmqkr+jed4zxb5GYbmLNHnaOoMH2UE2Hwe92G3FNU/PcLfAv6VUcFLB29UI
 FQVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXojvUUtBgAcPjAztLsYZHVaaKaCpd7sXl4YlbeRwR5bR0y3zOlRUo0mri0h3/5oOYXERG7WPOsOgSTjg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyagNWvKJzmg9RKHUhJxHT077sGSY3oSYx1APC6cd/3eRRnv8+Y
 rjB1kqdqP8G/Q2U1GC/bI0+L3WC8l1yBvC3vU8SYaJXRsy+B0jxTXLAF6cBGnoI=
X-Google-Smtp-Source: AGHT+IFYoOhMxj6VEKeLgltGCkOwtk27OCgc4bLo1XLu2tG7cwUBRJZ/wx0AAKiY5vt42jOifFD7qA==
X-Received: by 2002:a5d:4f92:0:b0:37d:3985:8871 with SMTP id
 ffacd0b85a97d-380611dbea7mr10884829f8f.39.1730299753154; 
 Wed, 30 Oct 2024 07:49:13 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3be78sm15647491f8f.31.2024.10.30.07.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 07:49:12 -0700 (PDT)
Message-ID: <f797cb27-84ca-41c3-83a5-b9044f2d5e5c@linaro.org>
Date: Wed, 30 Oct 2024 14:49:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jagan Teki <jagan@amarulasolutions.com>,
 Michal Simek <michal.simek@amd.com>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
 <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
 <19fc4486-f8fe-4286-8941-76ff2a81b7d9@linaro.org>
 <CAMty3ZAJrKvUAxWg9CfKtyrjw+WnHOgwkfAJb+N-7d3NyXUrxA@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAMty3ZAJrKvUAxWg9CfKtyrjw+WnHOgwkfAJb+N-7d3NyXUrxA@mail.gmail.com>
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:19:22 +0000
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/9] mtd: spi-nor: Remove recently added
 nor->addr_width == 3 test
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

CgpPbiAxMC8zMC8yNCAyOjE3IFBNLCBKYWdhbiBUZWtpIHdyb3RlOgo+IE9uIFdlZCwgT2N0IDMw
LCAyMDI0IGF0IDQ6MTXigK9QTSBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5v
cmc+IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBPbiAxMC8zMC8yNCAxMDozMyBBTSwgSmFnYW4gVGVraSB3
cm90ZToKPj4+IEhpIE1hcmVrLAo+Pj4KPj4+IE9uIFN1biwgT2N0IDI3LCAyMDI0IGF0IDE6NDji
gK9BTSBNYXJlayBWYXN1dAo+Pj4gPG1hcmVrLnZhc3V0K3JlbmVzYXNAbWFpbGJveC5vcmc+IHdy
b3RlOgo+Pj4+Cj4+Pj4gUmVtb3ZlIHVuZG9jdW1lbnRlZCBub3ItPmFkZHJfd2lkdGggPT0gMyB0
ZXN0LiBUaGlzIHdhcyBhZGRlZCBpbiBjb21taXQKPj4+PiA1ZDQwYjNkMzg0ZGMgKCJtdGQ6IHNw
aS1ub3I6IEFkZCBwYXJhbGxlbCBhbmQgc3RhY2tlZCBtZW1vcmllcyBzdXBwb3J0IikKPj4+PiB3
aXRob3V0IGFueSBleHBsYW5hdGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIFJlbW92ZSBpdC4K
Pj4+Pgo+Pj4+IFRoaXMgYWxzbyBoYXMgYSBiYWQgc2lkZS1lZmZlY3Qgd2hpY2ggYnJlYWtzIFJF
QUQgb3BlcmF0aW9uIG9mIGV2ZXJ5IFNQSSBOT1IKPj4+PiB3aGljaCBkb2VzIG5vdCB1c2UgYWRk
cl93aWR0aCA9PSAzLCBlLmcuIHMyNWZzNTEycyBkb2VzIG5vdCB3b3JrIGF0IGFsbC4gVGhpcwo+
Pj4+IGlzIGJlY2F1c2UgaWYgYWRkcl93aWR0aCAhPSAzLCByZW1fYmFua19sZW4gaXMgYWx3YXlz
IDAsIGFuZCBpZiByZW1fYmFua19sZW4KPj4+PiBpcyAwLCB0aGVuIHJlYWRfbGVuIGlzIDAgYW5k
IGlmIHJlYWRfbGVuIGlzIDAsIHRoZW4gdGhlIHNwaV9ub3JfcmVhZCgpIHJldHVybnMKPj4+PiAt
RUlPLgo+Pj4+Cj4+Pj4gQmFzaWMgcmVwcm9kdWNlciBpcyBhcyBmb2xsb3dzOgo+Pj4+ICIKPj4+
PiA9PiBzZiBwcm9iZSA7IHNmIHJlYWQgMHg1MDAwMDAwMCAwIDB4MTAwMDAKPj4+PiBTRjogRGV0
ZWN0ZWQgczI1ZnM1MTJzIHdpdGggcGFnZSBzaXplIDI1NiBCeXRlcywgZXJhc2Ugc2l6ZSAyNTYg
S2lCLCB0b3RhbCA2NCBNaUIKPj4+PiBkZXZpY2UgMCBvZmZzZXQgMHgwLCBzaXplIDB4MTAwMDAK
Pj4+PiBTRjogNjU1MzYgYnl0ZXMgQCAweDAgUmVhZDogRVJST1IgLTUKPj4+PiAiCj4+Pj4KPj4+
PiBGaXhlczogNWQ0MGIzZDM4NGRjICgibXRkOiBzcGktbm9yOiBBZGQgcGFyYWxsZWwgYW5kIHN0
YWNrZWQgbWVtb3JpZXMgc3VwcG9ydCIpCj4+Pj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQg
PG1hcmVrLnZhc3V0K3JlbmVzYXNAbWFpbGJveC5vcmc+Cj4+Pj4gLS0tCj4+Pj4gQ2M6IEFuZHJl
IFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPgo+Pj4+IENjOiBBc2hvayBSZWRkeSBT
b21hIDxhc2hvay5yZWRkeS5zb21hQGFtZC5jb20+Cj4+Pj4gQ2M6IEphZ2FuIFRla2kgPGphZ2Fu
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+Pj4+IENjOiBNaWNoYWVsIFdhbGxlIDxtd2FsbGVAa2Vy
bmVsLm9yZz4KPj4+PiBDYzogTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4KPj4+
PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+Pj4g
Q2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+Pj4g
Q2M6IFByYXR5dXNoIFlhZGF2IDxwLnlhZGF2QHRpLmNvbT4KPj4+PiBDYzogUXVlbnRpbiBTY2h1
bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4KPj4+PiBDYzogU2VhbiBBbmRlcnNvbiA8c2Vh
bmdhMkBnbWFpbC5jb20+Cj4+Pj4gQ2M6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+
Pj4+IENjOiBUYWthaGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5jb20+Cj4+
Pj4gQ2M6IFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5jb20+Cj4+Pj4gQ2M6IFR1ZG9yIEFtYmFy
dXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KPj4+PiBDYzogVmVua2F0ZXNoIFlhZGF2IEFi
YmFyYXB1IDx2ZW5rYXRlc2guYWJiYXJhcHVAYW1kLmNvbT4KPj4+PiBDYzogdS1ib290QGxpc3Rz
LmRlbnguZGUKPj4+PiBDYzogdWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQo+Pj4+IC0tLQo+Pj4KPj4+IElzIHRoaXMgcGF0Y2gtc2V0IG5leHQgdmVyc2lvbiBmb3IgJ3By
ZXZpb3VzJyByZXZlcnRlZCBzZXJpZXM/Cj4+Pgo+Pgo+PiBteSAyYzogSSB0aGluayBJIGxlYW4g
dG93YXJkcyByZXZlcnRpbmcgdGhlIHN0YWNrZWQvcGFyYWxsZWwgc3VwcG9ydC4KPj4gVGhlIG9u
bHkgb25lIHRoYXQgYmVuZWZpdHMgb2YgaXMgQU1ELCB3aGlsZSBhZmZlY3RpbmcgdGhlIGNvcmUg
Y29kZQo+PiBxdWFsaXR5LiBJdCBhbHNvIHNsb3dzIGRvd24gZnVydGhlciBjb250cmlidXRpb25z
IGFuZCBJIGFzc3VtZSBpdAo+PiBoYXJkZW5zIG1haW50YWluZXIncyBqb2IuCj4gCj4gSSBkaWQg
dHJ5IHRoaXMgYmVmb3JlIGFuZCBpdCBpcyBoYXJkIHRvIHNlcGFyYXRlIGZyb20gdGhlIGNvcmUu
IGFuZCBhdAo+IHRoZSBzYW1lIHRpbWUgaXQgaXMgaGFyZCB0byBtYWludGFpbiB0aGUgY29yZSB0
b28uCj4gCj4+Cj4+IEV2ZW4gaWYgSSAod2U/KSBoYXZlbid0IG1hZGUgbXkgbWluZCBvbiBob3cg
dG8gYmVzdCBpbXBsZW1lbnQgdGhpcywgaXQncwo+PiBjbGVhciB0aGF0IGl0IHNoYWxsIGJlIGFi
b3ZlIFNQSSBOT1Igd2l0aG91dCBhZmZlY3RpbmcgY3VycmVudCBkZXZpY2VzLgo+Pgo+PiBOb3Qg
c3VyZSBpZiBpdCdzIGZpbmUgdG8gcmV2ZXJ0IGV2ZXJ5dGhpbmcsIGhhdmVuJ3QgZm9sbG93ZWQg
dS1ib290Cj4+IGxhdGVseSwgeW91ciBjaG9pY2UgdG8gbWFrZS4KPiAKPiBJZiB3ZSBmaW5kIGEg
d2F5IChub3Qgc3VyZSBpZiBpdCdzIHBvc3NpYmxlKSBzZXBhcmF0ZSBsaWtlIGEgd3JhcHBlcgo+
IG9yIGZpeCB0aGUgdGhpbmdzIHdpdGhvdXQgcmV2ZXJ0IC0gdGhlc2UgYXJlIHR3byBwb2ludHMg
SSBjYW4gc2VlIGFzCj4gb2Ygbm93Lgo+IAoKVGhlbiB0aGlzIHNldCBzaGFsbCBoZWxwIG1vdmUg
aW4gdGhpcyBkaXJlY3Rpb24uIFNvbWUgaW52b2x2ZW1lbnQgZnJvbQp0aGUgc3RhY2tlZC9wYXJh
bGxlbCBhdXRob3JzIHdvdWxkIGJlIG5pY2UgaGVyZSwgYW5kIHNvbWUgY29tbWl0bWVudAp0aGF0
IHRoZSBjdXJyZW50IHN0YXR1cyBpbiBqdXN0IGEgdGVtcG9yYXJ5IHNpdHVhdGlvbi4KCkFsbCB0
aGUgc3RhY2tlZC9wYXJhbGxlbCBjb2RlIHNoYWxsIGJlIHB1bGxlZCBvdXQgZnJvbSBTUEkgTk9S
CmV2ZW50dWFsbHkuIFRoZSBkZXNpZ24gaXMgdHJlYXRpbmcgMiBpbmRlcGVuZGVudCBmbGFzaGVz
IGFzIG9uZS4KV2hhdGV2ZXIgdGllcyB0aGVtIHNoYWxsIGJlIGFib3ZlIFNQSSBOT1IuIEluIHRo
ZSBtZWFudGltZSB3ZSBhbGwgc3VmZmVyCnVudGlsIHRoYXQgaXMgYWNoaWV2ZWQuIEkgZ3Vlc3Mg
aWYgdGhpbmdzIGJlY29tZSB1bmJlYXJhYmxlIHdlIGNhbid0CnJlbW92ZSBldmVyeXRoaW5nIGxh
dGVyIG9uLCBjYW4gd2U/IE9yIG1heWJlIHRoaXMgc2hpcCBoYXMgc2FpbGVkCmFscmVhZHksIEkg
ZG9uJ3Qga25vdy4KCkl0J3MgcmVhbGx5IHlvdXIgZGVjaXNpb24gdG8gbWFrZSBiZWNhdXNlIHlv
dSBtYWludGFpbiB0aGlzIGNvZGUuIElmCmZ1bGwgcmV2ZXJ0IGlzIGNob3NlbiwgSSBjYW4gYWdy
ZWUgYW5kIEFDSyB0aGF0LiBJZiB3ZSBrZWVwIGl0IGFuZCB0cnkKdG8gc3dlZXRlbiBldmVyeXRo
aW5nIGEgYml0LCB0aGVuIGJlIGl0LgoKQ2hlZXJzLAp0YQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
