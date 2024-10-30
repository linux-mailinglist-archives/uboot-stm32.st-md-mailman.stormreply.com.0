Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D639BBB92
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Nov 2024 18:19:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68BBFC7A821;
	Mon,  4 Nov 2024 17:19:24 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0F14C78020
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 10:45:06 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539f84907caso7072105e87.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 03:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730285106; x=1730889906;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gQzfq8HFlckEdMtvo+/7XrLX3oRMcCfkWvw1vc5zxng=;
 b=ewys5RGlkY7OhKeMCwg4I2qK3s0zjSrfbXVES0CBJKb6N9R0tFu6bSjJ7njofDcpT+
 xa7KXHcMq2kEPlCIVYxSGUQuMrk53Pict+fQAGQU0On66hzoGpV68c7v/vDh/qZoXzF+
 pkoBGJWXHjcGvCh9QaE3SZ1y5m4PAxcTKADPsR3Q7RZrdMc331ESGoam40FIab5g0eFm
 qbU8Ej1urX/oUrqFGLuOxVsVJbRYq8xQNhISLwkKPt4ZHEAMGrHNiZpLH1aa41Uy5Wly
 JpTIpuaQ1zYnvIK4Fd6QjIDVDhxuJwPJGTHk4JVVtcKp+RzV5iBg5otaR4IMF86ZppIR
 jb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730285106; x=1730889906;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gQzfq8HFlckEdMtvo+/7XrLX3oRMcCfkWvw1vc5zxng=;
 b=XV2JE9cuj1ijVQGdGoX8Z5TNmZpGh1m0+ykVYoLHd3k2j7PHG527xjREMG1wTbZwyZ
 wNSutCVHhvYmVbOwBnUqvQ7fVMQ5U4u9eIjmnpkrs1wUxZSwIEPYRHLZrwNEwcVqkTev
 /lfHzCzlWe8flZRoAknyz62OgMMZtJ0LlyxhQjKlubhgUV6szQ+3BvoakTjFm5me7zqN
 gq0p0GiT131RSMyspa2uN3rMECFvsWONA0pNEXcKkm+Vk1iZ6vwj5t7IBKqThJLYUlck
 rxQrg0GX40+rOlTbRoaPGiWaI3abXMoYCIv5r9Cr/6SLILymvDCnQSwcXfYw/E3+Vd6P
 b16A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0Lcbv7df8tXq0lWk1yZaCrGcoie0cS1xxTyZBBwX1G5YZaTKD9Gt39wI3/s5089jYrhoEnZKu5Y4SYw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxv6inRwPuxuMln0+glbYO1sdzSWOv7rLAOiqehD4AO4wA7+Rfy
 IegX/Dwi8MJEOhGYHrHR4nyBjrtGzmxYgsya5Z2MqBSRLW/p76ATjmK7dmyONpc=
X-Google-Smtp-Source: AGHT+IHfZ0wQoUVU2dlojNnN9Q7J0tyx2oBk2zp+yztWAtCsqDTt+KPWmsrSjB5Gbpod52pkG8PuTg==
X-Received: by 2002:a05:6512:3f0c:b0:53b:1369:fcf8 with SMTP id
 2adb3069b0e04-53b348f96e8mr7391412e87.15.1730285105750; 
 Wed, 30 Oct 2024 03:45:05 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd8e8471sm17767315e9.4.2024.10.30.03.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 03:45:05 -0700 (PDT)
Message-ID: <19fc4486-f8fe-4286-8941-76ff2a81b7d9@linaro.org>
Date: Wed, 30 Oct 2024 10:45:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
 <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:19:22 +0000
Cc: Tom Rini <trini@konsulko.com>, Michael Walle <mwalle@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Michal Simek <michal.simek@amd.com>,
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

CgpPbiAxMC8zMC8yNCAxMDozMyBBTSwgSmFnYW4gVGVraSB3cm90ZToKPiBIaSBNYXJlaywKPiAK
PiBPbiBTdW4sIE9jdCAyNywgMjAyNCBhdCAxOjQ44oCvQU0gTWFyZWsgVmFzdXQKPiA8bWFyZWsu
dmFzdXQrcmVuZXNhc0BtYWlsYm94Lm9yZz4gd3JvdGU6Cj4+Cj4+IFJlbW92ZSB1bmRvY3VtZW50
ZWQgbm9yLT5hZGRyX3dpZHRoID09IDMgdGVzdC4gVGhpcyB3YXMgYWRkZWQgaW4gY29tbWl0Cj4+
IDVkNDBiM2QzODRkYyAoIm10ZDogc3BpLW5vcjogQWRkIHBhcmFsbGVsIGFuZCBzdGFja2VkIG1l
bW9yaWVzIHN1cHBvcnQiKQo+PiB3aXRob3V0IGFueSBleHBsYW5hdGlvbiBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UuIFJlbW92ZSBpdC4KPj4KPj4gVGhpcyBhbHNvIGhhcyBhIGJhZCBzaWRlLWVmZmVj
dCB3aGljaCBicmVha3MgUkVBRCBvcGVyYXRpb24gb2YgZXZlcnkgU1BJIE5PUgo+PiB3aGljaCBk
b2VzIG5vdCB1c2UgYWRkcl93aWR0aCA9PSAzLCBlLmcuIHMyNWZzNTEycyBkb2VzIG5vdCB3b3Jr
IGF0IGFsbC4gVGhpcwo+PiBpcyBiZWNhdXNlIGlmIGFkZHJfd2lkdGggIT0gMywgcmVtX2Jhbmtf
bGVuIGlzIGFsd2F5cyAwLCBhbmQgaWYgcmVtX2JhbmtfbGVuCj4+IGlzIDAsIHRoZW4gcmVhZF9s
ZW4gaXMgMCBhbmQgaWYgcmVhZF9sZW4gaXMgMCwgdGhlbiB0aGUgc3BpX25vcl9yZWFkKCkgcmV0
dXJucwo+PiAtRUlPLgo+Pgo+PiBCYXNpYyByZXByb2R1Y2VyIGlzIGFzIGZvbGxvd3M6Cj4+ICIK
Pj4gPT4gc2YgcHJvYmUgOyBzZiByZWFkIDB4NTAwMDAwMDAgMCAweDEwMDAwCj4+IFNGOiBEZXRl
Y3RlZCBzMjVmczUxMnMgd2l0aCBwYWdlIHNpemUgMjU2IEJ5dGVzLCBlcmFzZSBzaXplIDI1NiBL
aUIsIHRvdGFsIDY0IE1pQgo+PiBkZXZpY2UgMCBvZmZzZXQgMHgwLCBzaXplIDB4MTAwMDAKPj4g
U0Y6IDY1NTM2IGJ5dGVzIEAgMHgwIFJlYWQ6IEVSUk9SIC01Cj4+ICIKPj4KPj4gRml4ZXM6IDVk
NDBiM2QzODRkYyAoIm10ZDogc3BpLW5vcjogQWRkIHBhcmFsbGVsIGFuZCBzdGFja2VkIG1lbW9y
aWVzIHN1cHBvcnQiKQo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZWsudmFzdXQr
cmVuZXNhc0BtYWlsYm94Lm9yZz4KPj4gLS0tCj4+IENjOiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUu
cHJ6eXdhcmFAYXJtLmNvbT4KPj4gQ2M6IEFzaG9rIFJlZGR5IFNvbWEgPGFzaG9rLnJlZGR5LnNv
bWFAYW1kLmNvbT4KPj4gQ2M6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29t
Pgo+PiBDYzogTWljaGFlbCBXYWxsZSA8bXdhbGxlQGtlcm5lbC5vcmc+Cj4+IENjOiBNaWNoYWwg
U2ltZWsgPG1pY2hhbC5zaW1la0BhbWQuY29tPgo+PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRy
aWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IENjOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNr
LmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+PiBDYzogUHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGku
Y29tPgo+PiBDYzogUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4KPj4g
Q2M6IFNlYW4gQW5kZXJzb24gPHNlYW5nYTJAZ21haWwuY29tPgo+PiBDYzogU2ltb24gR2xhc3Mg
PHNqZ0BjaHJvbWl1bS5vcmc+Cj4+IENjOiBUYWthaGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fu
b0BpbmZpbmVvbi5jb20+Cj4+IENjOiBUb20gUmluaSA8dHJpbmlAa29uc3Vsa28uY29tPgo+PiBD
YzogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPgo+PiBDYzogVmVua2F0
ZXNoIFlhZGF2IEFiYmFyYXB1IDx2ZW5rYXRlc2guYWJiYXJhcHVAYW1kLmNvbT4KPj4gQ2M6IHUt
Ym9vdEBsaXN0cy5kZW54LmRlCj4+IENjOiB1Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCj4+IC0tLQo+IAo+IElzIHRoaXMgcGF0Y2gtc2V0IG5leHQgdmVyc2lvbiBmb3Ig
J3ByZXZpb3VzJyByZXZlcnRlZCBzZXJpZXM/Cj4gCgpteSAyYzogSSB0aGluayBJIGxlYW4gdG93
YXJkcyByZXZlcnRpbmcgdGhlIHN0YWNrZWQvcGFyYWxsZWwgc3VwcG9ydC4KVGhlIG9ubHkgb25l
IHRoYXQgYmVuZWZpdHMgb2YgaXMgQU1ELCB3aGlsZSBhZmZlY3RpbmcgdGhlIGNvcmUgY29kZQpx
dWFsaXR5LiBJdCBhbHNvIHNsb3dzIGRvd24gZnVydGhlciBjb250cmlidXRpb25zIGFuZCBJIGFz
c3VtZSBpdApoYXJkZW5zIG1haW50YWluZXIncyBqb2IuCgpFdmVuIGlmIEkgKHdlPykgaGF2ZW4n
dCBtYWRlIG15IG1pbmQgb24gaG93IHRvIGJlc3QgaW1wbGVtZW50IHRoaXMsIGl0J3MKY2xlYXIg
dGhhdCBpdCBzaGFsbCBiZSBhYm92ZSBTUEkgTk9SIHdpdGhvdXQgYWZmZWN0aW5nIGN1cnJlbnQg
ZGV2aWNlcy4KCk5vdCBzdXJlIGlmIGl0J3MgZmluZSB0byByZXZlcnQgZXZlcnl0aGluZywgaGF2
ZW4ndCBmb2xsb3dlZCB1LWJvb3QKbGF0ZWx5LCB5b3VyIGNob2ljZSB0byBtYWtlLgoKQ2hlZXJz
LAp0YQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=
