Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SA/HJ8uvw2nAtAQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Mar 2026 10:50:03 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D3D32271B
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Mar 2026 10:50:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A659BC87ED3;
	Wed, 25 Mar 2026 09:50:02 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82F99C87ED2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2026 09:50:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43b45bb7548so4401463f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2026 02:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774432200; cv=none;
 d=google.com; s=arc-20240605;
 b=CXRP9g5pWOH3bCgAsFWEzYsfy1+6RmJ4C96s+XwUg4MAClNON+HLS9W7xOAJRnFRju
 mNFO7HhrsDMVV7FzfUN49WPqUx0wyfbD3WDT0GPOGd1m5S2g98DbSr9CVvwh6BjgZiBm
 4Gcg/nQjwnCNh7u5nDUbGhOJRFibfIWMWwB1FNImrV072v7aK9Qgu+B805KZFDrkUc+y
 j/yzSt1jelAEm/YGaqPlwsjlK08KFclPP3n+AVgaj5BbnC7gvTza/cj/Qv4Y335uNfQC
 cFPm2geEZZ8jMvpZb2hgfhAmRfQbG9y/nF6fSK+kLW6CMfSoJFlI+/DFkSM1aYRL1b+L
 0WrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=CCRTV9uyRbWISy7+ySM7xkoMVHIkgikoUlESWsDeYR4=;
 fh=HCv7pJ9zOS3NRVWQEMrSZpkS4/NU6f/kdnBk4U/oocw=;
 b=ekVPuelWsLVvmFmfxEb1DWStNKz+ObRsEuaZpDGz9BNVz4ywQak/Tmd73eZaJlyyUA
 VVKo7o4ZdswNTlf6ohM55YAyA2TH1iZUmRGulFA5Fs6+XO2HK4w2k9qW9YX8spr26BZQ
 J5KcLZlaFMubSd5AjG4eFuLmUFsk5wFUdmKOD4GXOdpqURx7AmnFNwynAmYk7PcxRSw8
 E0NwE8C5PPnjAaJ7pOydQrnPzTjpgAYnTCkOwOZUtQ0AXn8K3Atx1fmPAw4Sa9iqOFnc
 bAI5AbmIeGJeCGoQRp7DO3wQSQpagqTCvrVrirAJZKiplkddKFrfTCHVRMK6lm8Yq+z9
 HFjA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774432200; x=1775037000;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCRTV9uyRbWISy7+ySM7xkoMVHIkgikoUlESWsDeYR4=;
 b=gqXkY1Xvz7Fe7P4I6yM57zU4yRY9aKP6uo9Gq4onCT0ORgNRM+mlHlVk1m1YmImTVk
 C+ZW375/YghOuEmU4d1P5LcFwuHd/NY6C0S9A1+qaVemBi14645vgwVeI2VluaMRG1YP
 TYfexQJOM0Keq1WiJc9dX1G+a7C+FttFaFeFS/t07lto/z2jjFZ2/WLmTqlp2qtkRTXg
 2aqqDZpiI6aNUCe5h9y8wffOAgeribGbfaNSNhq4FL10pq8L0oZLH/AyOGZ5/EaXes8X
 iu7hU8Sbk6eDzxCq0lhXC2Me1fTf4eeAaKs9eTC/Z+qM8CsRH4yOi5xOtaHxC2xsndp2
 1ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774432200; x=1775037000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CCRTV9uyRbWISy7+ySM7xkoMVHIkgikoUlESWsDeYR4=;
 b=oo0xZ4tUzixDreQTod43VpLRkhiS+FFj4/i2u2rIwn6R1KPjFseUgYIYTDNs80bWNH
 JoFXSrWxRZ8Ympv7jyKAGiYuPtQh40/AFyH6pblLfVHqbtXK5zFad/P8THkyyU4/GNfO
 e9MeuksOjOwTQkFzJBkLF+8r3Ac+AdRhSnXY+Ri1bgLodH3FnKwLT9gd+fsvNwz6ygFv
 0LxJS9f+JMwukAjKnJi73NIrAg4jjxxKfg5DE6bhMaYhMgoVTzdxuP1QsDIBtTC9fKUQ
 V/TKJbMMqvGM6xGRymMKRH7PlMtC4m6z1NqDZWMN7QuM7V0hXYLpNbSH/7WKUJ+dvy2X
 2aOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWV5GZQR0M/JmAlXUoE6H7H7i1YugU5AN9LvRKO51tHZKtduI7+vHIsnDZXhDvsh8W+E8jaGCvMMoe9w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx98IdxYdWoCPfPUbQ4EGdMK1ub76WXgVTPGzVJON/5q400B5Zo
 wZyimbpkHRviZ6jnL4CC+TsAW7rOHtEsgCgvMR9I8tqlewM2EwZl+HKiEdP4MAOzRoeLkHIDezC
 0nxfpmKk3onZSUVUfzZjx3eDU53gR8Os=
X-Gm-Gg: ATEYQzxrOT90oo0B/oB1dxnYLnlxgOeOAJMzEYez0T6EYRLQoKYolcAPhn+ruYqmhd8
 6wWCX56HSdWJkg6t6yiMTPMAgS5C9GMYqUxLeEz5AUEkf4KrNIb1/xJk2AVBY5BLTBqBzoby6W2
 2vQdG0ThNMQAfSmquNWyenuaBTLL8FGs2bQ+9VLSC5HM5pglq7cA7lbm/H4WaUNJ8G59FbUYrOA
 sS42HD5x5CWLcWxgfjinBdVj7KWvIaBBXmokzbudNA8a4y7M+uXlXviEMk1eCfrd2bF3Q4RrVeT
 XnMPiOWE
X-Received: by 2002:a05:6000:1842:b0:432:8504:8d5b with SMTP id
 ffacd0b85a97d-43b88a4137fmr3967651f8f.50.1774432199428; Wed, 25 Mar 2026
 02:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260323225537.896180-1-trini@konsulko.com>
In-Reply-To: <20260323225537.896180-1-trini@konsulko.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 25 Mar 2026 11:49:47 +0200
X-Gm-Features: AQROBzABhbC9_ktNUl2POzJ2hLo8YRR3441-TE89-tLolwsGaucqFxVrU2ci73w
Message-ID: <CAPVz0n3z1MOWOUMJZQpw-vs8oC7eMo9gXdPMpVT62R9-fLSeBA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Peng Fan <peng.fan@nxp.com>, Casey Connolly <casey.connolly@linaro.org>,
 Stefan Roese <stefan.roese@mailbox.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot-qcom@groups.io,
 Jerome Forissier <jerome.forissier@arm.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>, Peter Robinson <pbrobinson@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 =?UTF-8?Q?=C5=81ukasz_Majewski?= <lukma@nabladev.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Heiko Schocher <hs@nabladev.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Simon Glass <sjg@chromium.org>,
 linux@analog.com, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Bin Meng <bmeng.cn@gmail.com>, Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] global: Correct duplicate U_BOOT_DRIVER
	entry names
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[clamor95@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:trini@konsulko.com,m:peng.fan@nxp.com,m:casey.connolly@linaro.org,m:stefan.roese@mailbox.org,m:kever.yang@rock-chips.com,m:kojima.masahisa@socionext.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot-qcom@groups.io,m:jerome.forissier@arm.com,m:simon.k.r.goldschmidt@gmail.com,m:u-boot-amlogic@groups.io,m:jh80.chung@samsung.com,m:pbrobinson@gmail.com,m:treding@nvidia.com,m:marek.vasut+renesas@mailbox.org,m:tien.fong.chee@altera.com,m:lukma@nabladev.com,m:philipp.tomsich@vrull.eu,m:hs@nabladev.com,m:neil.armstrong@linaro.org,m:mbrugger@suse.com,m:sjg@chromium.org,m:linux@analog.com,m:patrick.delaunay@foss.st.com,m:bmeng.cn@gmail.com,m:ag.dev.uboot@gmail.com,m:simonkrgoldschmidt@gmail.com,m:marek.vasut@mailbox.org,m:bmengcn@gmail.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,linaro.org,mailbox.org,rock-chips.com,socionext.com,lists.denx.de,st-md-mailman.stormreply.com,groups.io,arm.com,gmail.com,samsung.com,nvidia.com,altera.com,nabladev.com,vrull.eu,suse.com,chromium.org,analog.com,foss.st.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.575];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 12D3D32271B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

0LLRgiwgMjQg0LHQtdGALiAyMDI24oCv0YAuINC+IDAwOjU1IFRvbSBSaW5pIDx0cmluaUBrb25z
dWxrby5jb20+INC/0LjRiNC1Ogo+Cj4gVGhlIFVfQk9PVF9EUklWRVIgbWFjcm8gY3JlYXRlcyBh
IGxpc3Qgb2YgZHJpdmVycyB1c2VkIGF0IGxpbmsgdGltZSwgYW5kCj4gYWxsIGVudHJpZXMgaGVy
ZSBtdXN0IGJlIHVuaXF1ZS4gVGhpcyBpbiB0dXJuIG1lYW5zIHRoYXQgYWxsIGVudHJpZXMgaW4K
PiB0aGUgY29kZSBzaG91bGQgYWxzbyBiZSB1bmlxdWUgaW4gb3JkZXIgdG8gbm90IGxlYWQgdG8g
YnVpbGQgZmFpbHVyZXMKPiBsYXRlciB3aXRoIHVuZXhwZWN0ZWQgYnVpbGQgY29tYmluYXRpb25z
LiBUeXBpY2FsbHksIHRoZSBwcm9ibGVtIHdlIGhhdmUKPiBoZXJlIGlzIHdoZW4gYSBkcml2ZXIg
aXMgb2J2aW91c2x5IGJhc2VkIG9uIGFub3RoZXIgZHJpdmVyIGFuZCBkaWRuJ3QKPiB1cGRhdGUg
dGhpcyBwYXJ0aWN1bGFyIGZpZWxkIGFuZCBzbyB3aGlsZSB0aGUgbmFtZSBmaWVsZCByZWZsZWN0
cwo+IHNvbWV0aGluZyB1bmlxdWUgdGhlIGxpbmtlciBlbnRyeSBpdHNlbGYgaXMgbm90LiBJbiBh
IGZldyBwbGFjZXMgdGhpcwo+IHByb3ZpZGVzIGEgbW9yZSBzdWl0YWJsZSBzdHJpbmcgbmFtZSBh
cyB3ZWxsLCBob3dldmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogVG9tIFJpbmkgPHRyaW5pQGtvbnN1
bGtvLmNvbT4KPiAtLS0KPiBDYzogQW5hdG9saWogR3VzdHNjaGluIDxhZy5kZXYudWJvb3RAZ21h
aWwuY29tPgo+IENjOiBCaW4gTWVuZyA8Ym1lbmcuY25AZ21haWwuY29tPgo+IENjOiBDYXNleSBD
b25ub2xseSA8Y2FzZXkuY29ubm9sbHlAbGluYXJvLm9yZz4KPiBDYzogSGVpa28gU2Nob2NoZXIg
PGhzQG5hYmxhZGV2LmNvbT4KPiBDYzogSmFlaG9vbiBDaHVuZyA8amg4MC5jaHVuZ0BzYW1zdW5n
LmNvbT4KPiBDYzogSmVyb21lIEZvcmlzc2llciA8amVyb21lLmZvcmlzc2llckBhcm0uY29tPgo+
IENjOiBLZXZlciBZYW5nIDxrZXZlci55YW5nQHJvY2stY2hpcHMuY29tPgo+IENjOiDFgXVrYXN6
IE1hamV3c2tpIDxsdWttYUBuYWJsYWRldi5jb20+Cj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJlay52
YXN1dCtyZW5lc2FzQG1haWxib3gub3JnPgo+IENjOiBNYXNhaGlzYSBLb2ppbWEgPGtvamltYS5t
YXNhaGlzYUBzb2Npb25leHQuY29tPgo+IENjOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBz
dXNlLmNvbT4KPiBDYzogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+
Cj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IENj
OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IENjOiBQ
ZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4KPiBDYzogUGV0ZXIgUm9iaW5zb24gPHBicm9iaW5z
b25AZ21haWwuY29tPgo+IENjOiBQaGlsaXBwIFRvbXNpY2ggPHBoaWxpcHAudG9tc2ljaEB2cnVs
bC5ldT4KPiBDYzogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4gQ2M6IFNpbW9uIEdv
bGRzY2htaWR0IDxzaW1vbi5rLnIuZ29sZHNjaG1pZHRAZ21haWwuY29tPgo+IENjOiBTdGVmYW4g
Um9lc2UgPHN0ZWZhbi5yb2VzZUBtYWlsYm94Lm9yZz4KPiBDYzogU3Z5YXRvc2xhdiBSeWhlbCA8
Y2xhbW9yOTVAZ21haWwuY29tPgo+IENjOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEu
Y29tPgo+IENjOiBUaWVuIEZvbmcgQ2hlZSA8dGllbi5mb25nLmNoZWVAYWx0ZXJhLmNvbT4KPiBD
YzogdS1ib290LWFtbG9naWNAZ3JvdXBzLmlvCj4gQ2M6IHVib290LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KPiBDYzogdS1ib290LXFjb21AZ3JvdXBzLmlvCj4gQ2M6IGxpbnV4
QGFuYWxvZy5jb20KPiAtLS0KPiAgYXJjaC94ODYvY3B1L2Jyb2Fkd2VsbC9zZHJhbS5jICAgICAg
ICAgICAgIHwgMiArLQo+ICBhcmNoL3g4Ni9jcHUvaXZ5YnJpZGdlL2Vhcmx5X21lLmMgICAgICAg
ICAgfCAyICstCj4gIGJvYXJkL2xpZWJoZXJyL2J0dC9idHQuYyAgICAgICAgICAgICAgICAgICB8
IDIgKy0KPiAgYm9hcmQvbGllYmhlcnIveGVhL3hlYS5jICAgICAgICAgICAgICAgICAgIHwgMiAr
LQo+ICBkcml2ZXJzL2Jsb2NrL2VmaV9ibGsuYyAgICAgICAgICAgICAgICAgICAgfCAyICstCj4g
IGRyaXZlcnMvY2xrL2F0OTEvY29tcGF0LmMgICAgICAgICAgICAgICAgICB8IDQgKystLQo+ICBk
cml2ZXJzL2Nsay9hdDkxL3Nja2MuYyAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZl
cnMvY2xrL21lc29uL2ExLmMgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9j
bGsvbWVzb24vZ3hiYi5jICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2Nsay9u
dXZvdG9uL2Nsa19ucGNtN3h4LmMgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvY2xrL251dm90
b24vY2xrX25wY204eHguYyAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9jbGsvc3RtMzIvY2xr
LXN0bTMybXAxMy5jICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2RtYS90aS9rMy11ZG1hLmMg
ICAgICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvaTJjL3RlZ3JhMTg2X2JwbXBfaTJj
LmMgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9tbWMvYmNtMjgzNV9zZGhjaS5jICAgICAg
ICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL21tYy9mc2xfZXNkaGNfaW14LmMgICAgICAgICAg
ICAgICAgfCAyICstCj4gIGRyaXZlcnMvbW1jL3JvY2tjaGlwX3NkaGNpLmMgICAgICAgICAgICAg
ICB8IDIgKy0KPiAgZHJpdmVycy9uZXQvY2FseGVkYXhnbWFjLmMgICAgICAgICAgICAgICAgIHwg
MiArLQo+ICBkcml2ZXJzL25ldC9kd2NfZXRoX3hnbWFjLmMgICAgICAgICAgICAgICAgfCAyICst
Cj4gIGRyaXZlcnMvbmV0L3FlL2RtX3FlX3VlY19waHkuYyAgICAgICAgICAgICB8IDIgKy0KPiAg
ZHJpdmVycy9uZXQvc25pX25ldHNlYy5jICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2
ZXJzL3BpbmN0cmwvbWVzb24vcGluY3RybC1tZXNvbi1nMTJhLmMgfCAyICstCj4gIGRyaXZlcnMv
cGluY3RybC90ZWdyYS9waW5jdHJsLXRlZ3JhMjAuYyAgICB8IDQgKystLQo+ICBkcml2ZXJzL3Jl
c2V0L3N0bTMyL3N0bTMyLXJlc2V0LW1wMS5jICAgICAgfCAyICstCj4gIGRyaXZlcnMvc3BpL2tp
cmt3b29kX3NwaS5jICAgICAgICAgICAgICAgICB8IDQgKystLQo+ICBkcml2ZXJzL3NwaS9tdmVi
dV9hMzcwMF9zcGkuYyAgICAgICAgICAgICAgfCA0ICsrLS0KPiAgZHJpdmVycy9zeXNyZXNldC9z
eXNyZXNldF9zb2NmcGdhX3NvYzY0LmMgIHwgMiArLQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMt
bWVzb24tZzEyYS5jICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1tZXNv
bi1neGwuYyAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy91c2IvaG9zdC9laGNpLWV4eW5vcy5j
ICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL3VzYi9ob3N0L2VoY2ktbXNtLmMgICAgICAg
ICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvdXNiL2hvc3QvZWhjaS10ZWdyYS5jICAgICAgICAg
ICAgICB8IDIgKy0KPiAgZHJpdmVycy91c2IvaG9zdC9laGNpLXZmLmMgICAgICAgICAgICAgICAg
IHwgMiArLQo+ICBkcml2ZXJzL3VzYi9ob3N0L29oY2ktZGE4eHguYyAgICAgICAgICAgICAgfCAy
ICstCj4gIGRyaXZlcnMvdXNiL211c2ItbmV3L3BpYzMyLmMgICAgICAgICAgICAgICB8IDIgKy0K
PiAgZHJpdmVycy91c2IvbXVzYi1uZXcvc2M1eHguYyAgICAgICAgICAgICAgIHwgMiArLQo+ICBk
cml2ZXJzL3VzYi9tdXNiLW5ldy9zdW54aS5jICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZl
cnMvdmlkZW8vcm9ja2NoaXAvcmszMjg4X21pcGkuYyAgICAgICB8IDQgKystLQo+ICBkcml2ZXJz
L3ZpZGVvL3JvY2tjaGlwL3JrMzM5OV9taXBpLmMgICAgICAgfCA0ICsrLS0KPiAgZHJpdmVycy93
YXRjaGRvZy9hcm1fc21jX3dkdC5jICAgICAgICAgICAgIHwgMiArLQo+ICA0MCBmaWxlcyBjaGFu
Z2VkLCA0NiBpbnNlcnRpb25zKCspLCA0NiBkZWxldGlvbnMoLSkKPgoKUmV2aWV3ZWQtYnk6IFN2
eWF0b3NsYXYgUnloZWwgPGNsYW1vcjk1QGdtYWlsLmNvbT4gIyBUZWdyYQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxp
c3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
