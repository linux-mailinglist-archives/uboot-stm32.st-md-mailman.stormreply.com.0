Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B142D9BBB95
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Nov 2024 18:19:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 789C6C7A827;
	Mon,  4 Nov 2024 17:19:24 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6341CC78032
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 07:10:34 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-37d5689eea8so398208f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 00:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730358634; x=1730963434;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MSTWRPHinJZQzx9wAdFkaC9m1ILgta8SsdyNNp9eS7g=;
 b=S2ovviwfLBuYupiHpU9Ti1RAMlPTuhxR/zGVnOqzRewbIfCKlcxqh7fTx4LZ7obTL7
 AfYVQ49BDQL8FXZoR0SMU9yX7HyUAPjiNspYme6xi5T5Fty9wUWBrXvDuxQ/vUTzKSo1
 qpK6knRlbJWqAYY+XKws81bx/d85MOQp3LmRQKH4LRvLODUFrmTFy8BN76nASgC1Or4J
 wVKyr/fW86wXWxHGyrcuzJPpNKIEAbLRWqGTzBp5S9TruLdlnkBZh8SB3s/h3XCNx9SJ
 sg6nrBSivzx+Ck2ChbvJlTO3/BNye0biKWrcUik2YQheD3mstzQXUYn9+B6DZvhyVhkt
 zn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730358634; x=1730963434;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MSTWRPHinJZQzx9wAdFkaC9m1ILgta8SsdyNNp9eS7g=;
 b=LnwyU5zGMbBkBVUi9UBTJ0rVS3Y238Ym+T07qIdJb0fzZRDqKIH7Gcz8r104Zwq8Au
 CQIshftM9Z4LhH8jdjlell+OmeSnGQu0jGlCklYa3WGLy4JiLECfUnVE0aApKIDNkjoJ
 1hndxoHyG6/TDVz9I2du8kC0GdKo3xzUmiW7dUXKh+/vuNWaHRG8CXI2DvZuIY8Mc0Xp
 C05YVf6Vsa9WRKd8I6Y2cBRZKGMfyj5Z/9vs4uD+ds5u7wn1MD+y3X5vwH72ahUr2WPv
 gS4fHzFoy/mkJLkaiE9C5U7RIw8zJ+RIyg3SHhoVxORJ2/2BdRlBvFzQU1yEbXNCx2fo
 zLqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXoJRbx5mif//xeJy4LdWXgYXybGInwCV5t4j8wjc35KFboUpSS6nGcLxax0X62ER5fEUfXHaJCXE0/A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy3P6XfdFN3ud4ZNuufrAMV80QOBaJ0gJlzo3sYYwraWoyd8K2p
 DzeP3LMmoda7YTgF+LDE3mt1XsgDKWsyAueYO58EpyZ/KhhXxeh2+0LvlSuxOKk=
X-Google-Smtp-Source: AGHT+IFjRC2LtqEIZ0hor5n7YMgzAAOXBut70z1XBAp9fWZsC1gaX50jfCgDip1ZAEi7RG1KKgJ55Q==
X-Received: by 2002:a05:6000:d4f:b0:37d:45c3:3455 with SMTP id
 ffacd0b85a97d-38061163803mr13532110f8f.30.1730358633774; 
 Thu, 31 Oct 2024 00:10:33 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7c13sm1169113f8f.13.2024.10.31.00.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 00:10:33 -0700 (PDT)
Message-ID: <37c64d4a-1d5b-4f5e-bf2d-6e2a8b6b7669@linaro.org>
Date: Thu, 31 Oct 2024 07:10:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>, Michal Simek <michal.simek@amd.com>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
 <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
 <19fc4486-f8fe-4286-8941-76ff2a81b7d9@linaro.org>
 <CAMty3ZAJrKvUAxWg9CfKtyrjw+WnHOgwkfAJb+N-7d3NyXUrxA@mail.gmail.com>
 <f797cb27-84ca-41c3-83a5-b9044f2d5e5c@linaro.org>
 <3835b139-ae37-423e-8a24-a958ece69c0d@amd.com>
 <20241030165618.GP2558755@bill-the-cat>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241030165618.GP2558755@bill-the-cat>
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:19:22 +0000
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 Pratyush Yadav <p.yadav@ti.com>,
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

CgpPbiAxMC8zMC8yNCA0OjU2IFBNLCBUb20gUmluaSB3cm90ZToKPiBPbiBXZWQsIE9jdCAzMCwg
MjAyNCBhdCAwNDoyMDozMlBNICswMTAwLCBNaWNoYWwgU2ltZWsgd3JvdGU6Cj4+Cj4+Cj4+IE9u
IDEwLzMwLzI0IDE1OjQ5LCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAxMC8z
MC8yNCAyOjE3IFBNLCBKYWdhbiBUZWtpIHdyb3RlOgo+Pj4+IE9uIFdlZCwgT2N0IDMwLCAyMDI0
IGF0IDQ6MTXigK9QTSBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IHdy
b3RlOgo+Pj4+Pgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBPbiAxMC8zMC8yNCAxMDozMyBBTSwgSmFnYW4g
VGVraSB3cm90ZToKPj4+Pj4+IEhpIE1hcmVrLAo+Pj4+Pj4KPj4+Pj4+IE9uIFN1biwgT2N0IDI3
LCAyMDI0IGF0IDE6NDjigK9BTSBNYXJlayBWYXN1dAo+Pj4+Pj4gPG1hcmVrLnZhc3V0K3JlbmVz
YXNAbWFpbGJveC5vcmc+IHdyb3RlOgo+Pj4+Pj4+Cj4+Pj4+Pj4gUmVtb3ZlIHVuZG9jdW1lbnRl
ZCBub3ItPmFkZHJfd2lkdGggPT0gMyB0ZXN0LiBUaGlzIHdhcyBhZGRlZCBpbiBjb21taXQKPj4+
Pj4+PiA1ZDQwYjNkMzg0ZGMgKCJtdGQ6IHNwaS1ub3I6IEFkZCBwYXJhbGxlbCBhbmQgc3RhY2tl
ZCBtZW1vcmllcyBzdXBwb3J0IikKPj4+Pj4+PiB3aXRob3V0IGFueSBleHBsYW5hdGlvbiBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UuIFJlbW92ZSBpdC4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoaXMgYWxzbyBo
YXMgYSBiYWQgc2lkZS1lZmZlY3Qgd2hpY2ggYnJlYWtzIFJFQUQgb3BlcmF0aW9uIG9mIGV2ZXJ5
IFNQSSBOT1IKPj4+Pj4+PiB3aGljaCBkb2VzIG5vdCB1c2UgYWRkcl93aWR0aCA9PSAzLCBlLmcu
IHMyNWZzNTEycyBkb2VzIG5vdCB3b3JrIGF0IGFsbC4gVGhpcwo+Pj4+Pj4+IGlzIGJlY2F1c2Ug
aWYgYWRkcl93aWR0aCAhPSAzLCByZW1fYmFua19sZW4gaXMgYWx3YXlzIDAsIGFuZCBpZiByZW1f
YmFua19sZW4KPj4+Pj4+PiBpcyAwLCB0aGVuIHJlYWRfbGVuIGlzIDAgYW5kIGlmIHJlYWRfbGVu
IGlzIDAsIHRoZW4gdGhlIHNwaV9ub3JfcmVhZCgpIHJldHVybnMKPj4+Pj4+PiAtRUlPLgo+Pj4+
Pj4+Cj4+Pj4+Pj4gQmFzaWMgcmVwcm9kdWNlciBpcyBhcyBmb2xsb3dzOgo+Pj4+Pj4+ICIKPj4+
Pj4+PiA9PiBzZiBwcm9iZSA7IHNmIHJlYWQgMHg1MDAwMDAwMCAwIDB4MTAwMDAKPj4+Pj4+PiBT
RjogRGV0ZWN0ZWQgczI1ZnM1MTJzIHdpdGggcGFnZSBzaXplIDI1NiBCeXRlcywgZXJhc2Ugc2l6
ZSAyNTYgS2lCLCB0b3RhbCA2NCBNaUIKPj4+Pj4+PiBkZXZpY2UgMCBvZmZzZXQgMHgwLCBzaXpl
IDB4MTAwMDAKPj4+Pj4+PiBTRjogNjU1MzYgYnl0ZXMgQCAweDAgUmVhZDogRVJST1IgLTUKPj4+
Pj4+PiAiCj4+Pj4+Pj4KPj4+Pj4+PiBGaXhlczogNWQ0MGIzZDM4NGRjICgibXRkOiBzcGktbm9y
OiBBZGQgcGFyYWxsZWwgYW5kIHN0YWNrZWQgbWVtb3JpZXMgc3VwcG9ydCIpCj4+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0K3JlbmVzYXNAbWFpbGJveC5vcmc+
Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gQ2M6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBh
cm0uY29tPgo+Pj4+Pj4+IENjOiBBc2hvayBSZWRkeSBTb21hIDxhc2hvay5yZWRkeS5zb21hQGFt
ZC5jb20+Cj4+Pj4+Pj4gQ2M6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29t
Pgo+Pj4+Pj4+IENjOiBNaWNoYWVsIFdhbGxlIDxtd2FsbGVAa2VybmVsLm9yZz4KPj4+Pj4+PiBD
YzogTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4KPj4+Pj4+PiBDYzogUGF0cmlj
ZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+Pj4+Pj4gQ2M6IFBhdHJp
Y2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+Pj4+Pj4gQ2M6IFBy
YXR5dXNoIFlhZGF2IDxwLnlhZGF2QHRpLmNvbT4KPj4+Pj4+PiBDYzogUXVlbnRpbiBTY2h1bHog
PHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4KPj4+Pj4+PiBDYzogU2VhbiBBbmRlcnNvbiA8c2Vh
bmdhMkBnbWFpbC5jb20+Cj4+Pj4+Pj4gQ2M6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3Jn
Pgo+Pj4+Pj4+IENjOiBUYWthaGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5j
b20+Cj4+Pj4+Pj4gQ2M6IFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5jb20+Cj4+Pj4+Pj4gQ2M6
IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KPj4+Pj4+PiBDYzogVmVu
a2F0ZXNoIFlhZGF2IEFiYmFyYXB1IDx2ZW5rYXRlc2guYWJiYXJhcHVAYW1kLmNvbT4KPj4+Pj4+
PiBDYzogdS1ib290QGxpc3RzLmRlbnguZGUKPj4+Pj4+PiBDYzogdWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+Pj4+Pj4+IC0tLQo+Pj4+Pj4KPj4+Pj4+IElzIHRoaXMg
cGF0Y2gtc2V0IG5leHQgdmVyc2lvbiBmb3IgJ3ByZXZpb3VzJyByZXZlcnRlZCBzZXJpZXM/Cj4+
Pj4+Pgo+Pj4+Pgo+Pj4+PiBteSAyYzogSSB0aGluayBJIGxlYW4gdG93YXJkcyByZXZlcnRpbmcg
dGhlIHN0YWNrZWQvcGFyYWxsZWwgc3VwcG9ydC4KPj4+Pj4gVGhlIG9ubHkgb25lIHRoYXQgYmVu
ZWZpdHMgb2YgaXMgQU1ELCB3aGlsZSBhZmZlY3RpbmcgdGhlIGNvcmUgY29kZQo+Pj4+PiBxdWFs
aXR5LiBJdCBhbHNvIHNsb3dzIGRvd24gZnVydGhlciBjb250cmlidXRpb25zIGFuZCBJIGFzc3Vt
ZSBpdAo+Pj4+PiBoYXJkZW5zIG1haW50YWluZXIncyBqb2IuCj4+Pj4KPj4+PiBJIGRpZCB0cnkg
dGhpcyBiZWZvcmUgYW5kIGl0IGlzIGhhcmQgdG8gc2VwYXJhdGUgZnJvbSB0aGUgY29yZS4gYW5k
IGF0Cj4+Pj4gdGhlIHNhbWUgdGltZSBpdCBpcyBoYXJkIHRvIG1haW50YWluIHRoZSBjb3JlIHRv
by4KPj4+Pgo+Pj4+Pgo+Pj4+PiBFdmVuIGlmIEkgKHdlPykgaGF2ZW4ndCBtYWRlIG15IG1pbmQg
b24gaG93IHRvIGJlc3QgaW1wbGVtZW50IHRoaXMsIGl0J3MKPj4+Pj4gY2xlYXIgdGhhdCBpdCBz
aGFsbCBiZSBhYm92ZSBTUEkgTk9SIHdpdGhvdXQgYWZmZWN0aW5nIGN1cnJlbnQgZGV2aWNlcy4K
Pj4+Pj4KPj4+Pj4gTm90IHN1cmUgaWYgaXQncyBmaW5lIHRvIHJldmVydCBldmVyeXRoaW5nLCBo
YXZlbid0IGZvbGxvd2VkIHUtYm9vdAo+Pj4+PiBsYXRlbHksIHlvdXIgY2hvaWNlIHRvIG1ha2Uu
Cj4+Pj4KPj4+PiBJZiB3ZSBmaW5kIGEgd2F5IChub3Qgc3VyZSBpZiBpdCdzIHBvc3NpYmxlKSBz
ZXBhcmF0ZSBsaWtlIGEgd3JhcHBlcgo+Pj4+IG9yIGZpeCB0aGUgdGhpbmdzIHdpdGhvdXQgcmV2
ZXJ0IC0gdGhlc2UgYXJlIHR3byBwb2ludHMgSSBjYW4gc2VlIGFzCj4+Pj4gb2Ygbm93Lgo+Pj4+
Cj4+Pgo+Pj4gVGhlbiB0aGlzIHNldCBzaGFsbCBoZWxwIG1vdmUgaW4gdGhpcyBkaXJlY3Rpb24u
IFNvbWUgaW52b2x2ZW1lbnQgZnJvbQo+Pj4gdGhlIHN0YWNrZWQvcGFyYWxsZWwgYXV0aG9ycyB3
b3VsZCBiZSBuaWNlIGhlcmUsIGFuZCBzb21lIGNvbW1pdG1lbnQKPj4+IHRoYXQgdGhlIGN1cnJl
bnQgc3RhdHVzIGluIGp1c3QgYSB0ZW1wb3Jhcnkgc2l0dWF0aW9uLgo+Pgo+PiBJIGhvcGUgdGhh
dCBieSBhdXRob3JzIHlvdSBtZWFuIFNXIG93bmVycyBub3QgcmVhbGx5IEhXIGF1dGhvcnMgb2Yg
dGhpcyB3aXJpbmcuCj4+IEphZ2FuIGlzIGF3YXJlIHRoYXQgd2UgYXJlIHVzaW5nIHRoaXMgY29u
ZmlndXJhdGlvbiBmb3IgcXVpdGUgYSBsb25nIHRpbWUKPj4gYW5kIHdlIGFyZSBzdGlsbCBoZXJl
IGFuZCBub3QgbGVhdmluZy4KPj4gQXMgeW91IGtub3cgQW1pdCBpcyB0cnlpbmcgdG8gZmluZCBh
IHNvbHV0aW9uIGluIExpbnV4IGJ1dCBub3RoaW5nIGhhcyBiZWVuCj4+IGFncmVlZCB5ZXQuIElm
IHRoZXJlIGlzIGFncmVlbWVudCB0byBzZXBhcmF0ZSBpdCB0byBvd24gZHJpdmVyIG9yIHNvIHdl
IHdpbGwKPj4gYmUgZGVmaW5pdGVseSB3b3JraW5nIHdpdGggdS1ib290IHRvIGdldCBpdCB0byB0
aGUgc2FtZSBzdGF0ZS4KPj4KPj4gVGhpcyBwYXRjaHNldCBpcyB1c2luZyB0aGUgbGF0ZXN0IGFw
cHJvdmVkIERUIGJpbmRpbmcgY3JlYXRlZCBieSBNaXF1ZWwgYW5kCj4+IGlmIG5ldyBiaW5kaW5n
IGlzIGFjY2VwdGVkIHdlIHdpbGwgYmUgd29ya2luZyB0byBhbGlnbiB0byBpdC4KPj4gQWxzbyBp
bnRlbnRpb24gaXMgdG8gYnJpbmcgdGhpcyBmdW5jdGlvbmFsaXR5IHRvIGN1c3RvbWVycyBhbmQg
bm90IGJyZWFrCj4+IG90aGVycy4gVGhhdCdzIHdoeSB0aGVzZSBwYXRjaGVzIGFyZSBwdWxsZWQg
aW50byByYzEgdG8gZ2V0IGJldHRlciB0ZXN0Cj4+IGNvdmVyYWdlLgo+Pgo+PiBBbmQgdG8gYmUg
ZmFpciB0byBzYXkgdmVyc2lvbiB3aGljaCBoYXMgYmVlbiBtZXJnZWQgd2FzIHYxNCBhbmQgYW55
Ym9keQo+PiBjb3VsZCBjb21tZW50IGl0IGJlZm9yZSBhbmQgd2UgYXJlIGRlZmluaXRlbHkgaGVy
ZSB0byBoZWxwIHRvIHJlc29sdmUgaXNzdWVzCj4+IG9uIG90aGVyIGJvYXJkcyBjYXVzZWQgYnkg
dGhpcyBwYXRjaHNldC4gQnV0IHdlIG5lZWQgdG8gaGF2ZSBoZWxwIGZyb20KPj4gb3RoZXJzIGJl
Y2F1c2Ugb2J2aW91c2x5IHdlIGRvbid0IGhhdmUgb3RoZXIgYm9hcmRzIGFuZCB0aGV5IGFyZSBs
aWtlbHkgYWxzbwo+PiBub3Qgd2lyZWQgaW4gQ0kuCj4gCj4gVG8gYmUgY2xlYXIsIHdlIG5lZWQg
dG8gcmVzb2x2ZSB0aGUgcHJvYmxlbXMgdGhhdCBoYXZlIHNob3duIHVwIG5vdyBvbgo+IGFsbCBv
ZiB0aGUgaGFyZHdhcmUgdGhhdCB3YXMgd29ya2luZyBpbiB2MjAyNC4xMC4gTXkgY3VycmVudCBp
bmNsaW5hdGlvbgo+IGlzIHRvIG1lcmdlCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L3Vib290L2xpc3QvP3Nlcmllcz00Mjk5MzImc3RhdGU9Kgo+IChha2EgdGhpcyBzZXJp
ZXMgaW4gcXVlc3Rpb24pIEFTQVAuCj4gCgpXZSBjYW4gc3VyZWx5IGxpdmUgd2l0aCB0aGlzIHRl
bXBvcmFyeSBzaXR1YXRpb24uIE5vdyB0aGF0IHdlJ3JlIGFzc3VyZWQKdG8gaGF2ZSBBTUQncyBo
ZWxwIGluIG1vdmluZyBmb3J3YXJkLCBpdCBmZWVscyBsZXNzIGxpa2UgYSB0cmFuc2ZlciBvZgpy
ZXNwb25zaWJpbGl0eSBvbiB0aGUgcG9vcmx5IGRlc2lnbmVkIHN0YWNrZWQvcGFyYWxsZWwgc29m
dHdhcmUgc3VwcG9ydC4KRmluZSBieSBtZSB0byBjaG9vc2UgdGhlIHNtYWxsZXIgZml4ZXMvaW1w
cm92ZW1lbnRzIG92ZXIgdGhlIGZ1bGwgcmV2ZXJ0LgoKQ2hlZXJzLAp0YQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxp
c3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
