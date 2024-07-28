Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1EF93E8F5
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Jul 2024 21:02:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73762C6DD96;
	Sun, 28 Jul 2024 19:02:24 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74994C6B460
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Jul 2024 19:02:17 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4266dc7591fso9562075e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Jul 2024 12:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722193337; x=1722798137;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WyLS4y9iJuROkNAp+unWORCf9hCeHmyoOzji1v/BwLU=;
 b=DPbW1X0e0PlSbDdSTLoCXj67yY+cQSICFJbhfln8ZDQA6sGthWuUUAMttSGUK9XVvb
 v9n+/dFTqTQfxwW1raW4p3hCK5d3PSSKQKFuHg30WwKjzx+o1Plx0EnIlLdmhIXOfK3e
 CorvX7rmXW+vugjWEwKGG9dnwUWrhU9wX/Wifk44Sk0C70OIqGE+pC2NdK3b6V1rfL4/
 vSVvypkJ+ywqTziKgtFMinYy6d/Vfx+F16kNUvLZmZcxB/M5GoJcL8Ah5eZzsMnSFmlw
 m7k5jAmdnnodqtNj3i6Kd8u89e1ydbbT1/u1i5gVH0cA7P8U4CLjFgY3zsjmWqaBo+Aw
 aHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722193337; x=1722798137;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WyLS4y9iJuROkNAp+unWORCf9hCeHmyoOzji1v/BwLU=;
 b=HuQvO9BWi7WB1MrXFi7Ko18IO59y+ONlKJPkxpkc81BvyD1OiGm5xoerPflDfIAd++
 V8wDYUtwrenpMCoHU9e9K8hFIldSqQ7c3x57PvjFMKEz2BFqnybt8Y6Nv+ziC+ecVN+i
 ii2orIh9CobtL6r8b3I5tklSav2O82RGq93RpCUrif3hZnTZNp7GDUHQ3M4+x7yVlP0n
 5g9jgMIACArSNoqRymn88n01w8D+p59SH/y0vdYOuVsgEv5sAkXPIqH44QTdh9AL5dOZ
 am0gs6cVPLSDHdTInFW2XyozB3QLI63P7j9g24F7nLD1op84bfS0sbyDflgoozJ7Sgz1
 0uUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP/6dKSIK2RAjQYtmDDXpwTqm9wBl9iMU3WOLxjdiumJ9olOjb2/4c2bHrqCGaXAohDvTV1uO+rXqKqBmgS89GmdAiDSLw5byfQYQw594/4drXhH6In67+
X-Gm-Message-State: AOJu0Yylpmj0tcL5mcY1Z29AqACaq7MVt3YXfg6Yq71WW6xC6uyz9HBA
 drIA1LXqVSR8V8+3XqbS6SKEdyU6dTSQOt3YZTMXf0qb/JjR7Y6l
X-Google-Smtp-Source: AGHT+IGnZnmBAIVRuhr5m4qHpEpfUm2i9qzZDvt9ZHB6sVD8IJkFmIXZ/U8HMXd7kcxFf6QnmDpN6Q==
X-Received: by 2002:a05:600c:354a:b0:426:6c70:dd9c with SMTP id
 5b1f17b1804b1-42811e0b770mr39089175e9.31.1722193336685; 
 Sun, 28 Jul 2024 12:02:16 -0700 (PDT)
Received: from [127.0.0.1] ([46.211.159.236]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428057a6c81sm153186835e9.34.2024.07.28.12.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Jul 2024 12:02:16 -0700 (PDT)
Date: Sun, 28 Jul 2024 22:02:15 +0300
From: Svyatoslav <clamor95@gmail.com>
To: Marek Vasut <marex@denx.de>
User-Agent: K-9 Mail for Android
In-Reply-To: <0910419d-e8ab-4bf9-a083-dc2783afaca1@denx.de>
References: <20240626235717.272219-1-marex@denx.de>
 <a73dffe5-87e3-4e96-965f-9d029f2af8ed@denx.de>
 <CAPVz0n0C6TPdBRUEvJmgAUGAKoetuzr1j=0cMXweP2EqMTwn=g@mail.gmail.com>
 <0910419d-e8ab-4bf9-a083-dc2783afaca1@denx.de>
Message-ID: <4D07A6E5-F156-44C3-A26D-0F2D913CE92D@gmail.com>
MIME-Version: 1.0
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>, u-boot@lists.denx.de,
 Max Krummenacher <max.krummenacher@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dragan Simic <dsimic@manjaro.org>,
 Tom Rini <trini@konsulko.com>, u-boot-qcom@groups.io,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Kostya Porotchkin <kostap@marvell.com>,
 Ben Wolsieffer <benwolsieffer@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Jonas Karlman <jonas@kwiboo.se>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Chris Morgan <macromorgan@hotmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, u-boot@dh-electronics.com,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Simon Glass <sjg@chromium.org>,
 Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/4] power: regulator: Trigger probe of
 regulators which are always-on or boot-on
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

CgoyOCDQu9C40L/QvdGPIDIwMjTigK/RgC4gMjE6MzU6MjcgR01UKzAzOjAwLCBNYXJlayBWYXN1
dCA8bWFyZXhAZGVueC5kZT4g0L3QsNC/0LjRgdCw0LIoLdC70LApOgo+T24gNy8yOC8yNCA3OjU1
IFBNLCBTdnlhdG9zbGF2IFJ5aGVsIHdyb3RlOgo+PiDQvdC0LCAyOCDQu9C40L8uIDIwMjTigK/R
gC4g0L4gMTk6MzggTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+INC/0LjRiNC1Ogo+Pj4gCj4+
PiBPbiA2LzI3LzI0IDE6NTUgQU0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4+IEluIGNhc2UgYSBy
ZWd1bGF0b3IgRFQgbm9kZSBjb250YWlucyByZWd1bGF0b3ItYWx3YXlzLW9uIG9yIHJlZ3VsYXRv
ci1ib290LW9uCj4+Pj4gcHJvcGVydHksIG1ha2Ugc3VyZSB0aGUgcmVndWxhdG9yIGdldHMgY29y
cmVjdGx5IGNvbmZpZ3VyZWQgYnkgVS1Cb290IG9uIHN0YXJ0Cj4+Pj4gdXAuIFVuY29uZGl0aW9u
YWxseSBwcm9iZSBzdWNoIHJlZ3VsYXRvciBkcml2ZXJzLiBUaGlzIGlzIGEgcHJlcGFyYXRvcnkg
cGF0Y2gKPj4+PiBmb3IgaW50cm9kdWN0aW9uIG9mIC5yZWd1bGF0b3JfcG9zdF9wcm9iZSgpIHdo
aWNoIHdvdWxkIHRyaWdnZXIgdGhlIHJlZ3VsYXRvcgo+Pj4+IGNvbmZpZ3VyYXRpb24uCj4+Pj4g
Cj4+Pj4gUGFyc2luZyBvZiByZWd1bGF0b3ItYWx3YXlzLW9uIGFuZCByZWd1bGF0b3ItYm9vdC1v
biBEVCBwcm9wZXJ0eSBoYXMgYmVlbgo+Pj4+IG1vdmVkIHRvIHJlZ3VsYXRvcl9wb3N0X2JpbmQo
KSBhcyB0aGUgaW5mb3JtYXRpb24gaXMgcmVxdWlyZWQgZWFybHksIHRoZQo+Pj4+IHJlc3Qgb2Yg
dGhlIERUIHBhcnNpbmcgaGFzIGJlZW4ga2VwdCBpbiByZWd1bGF0b3JfcHJlX3Byb2JlKCkgdG8g
YXZvaWQKPj4+PiBzbG93aW5nIGRvd24gdGhlIGJvb3QgcHJvY2Vzcy4KPj4+IAo+Pj4gSXMgdGhl
cmUgYW55dGhpbmcgYmxvY2tpbmcgdGhpcyBzZXJpZXMgZnJvbSBiZWluZyBhcHBsaWVkID8KPj4g
Cj4+IFRoaXMgcGF0Y2hzZXQgY2F1c2VzIFBNSUMgcmVndWxhdG9ycyBwcm9iZSB0b28gZWFybHkg
d2hpY2ggcmVzdWx0cyBpbgo+PiBpMmMgbGluZSBzZXR1cCBmYWlsdXJlLiBUaGVzZSBwYXRjaGVz
IE1VU1QgTk9UIGJlIGFwcGxpZWQgaW4gdGhpcyBmb3JtCj4+IHNpbmNlIHRoZXkgd2lsbCBicmVh
ayBhdCBsZWFzdCAxNSBUZWdyYSAzIGRldmljZXMgd2hpY2ggdXNlIERNIFBNSUMsCj4+IG1heWJl
IG1vcmUuCj4KPlRoYW5rIHlvdSBmb3IgdGVzdGluZy4gSSBkbyBub3QgaGF2ZSBhbnkgdGVncmEg
MyBkZXZpY2VzLCBidXQgdGhpcyBwYXRjaHNldCBkb2VzIG5vdCBkbyBhbnl0aGluZyB3aXRoIHBp
bm11eGluZy4gSWYgYSByZWd1bGF0b3IgaXMgcHJvYmVkLCBhbGwgb2YgaXRzIGRlcGVuZGVuY2ll
cyAoaTJjIGJ1cywgcGlubXV4IGNvbmZpZ3VyYXRpb24sIGV0Yy4pIHNob3VsZCBiZSBwcm9iZWQg
YXMgd2VsbC4gQ2FuIHlvdSBoYXZlIGEgbG9vayBhdCB3aGF0IHRoZSBwcm9ibGVtIHdpdGggcGlu
bXV4aW5nIGlzIG9uIHRlZ3JhIDM/IEl0IHNlZW1zIGl0IG1pZ2h0IGJlIHVucmVsYXRlZCB0byB0
aGlzIHBhdGNoc2V0IGFuZCB3b3VsZCBldmVudHVhbGx5IHNob3cgdXAgZWxzZXdoZXJlPwoKUGlu
bXV4PyBXZHltLCBJIHdyb3RlIGFib3V0IGEgUE1JQyB3aGljaCBpcyB1c3VhbGx5IGxvY2F0ZWQg
b24gaTJjIGxpbmUuCgo8aHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290
L3BhdGNoLzIwMjMxMDAzMDYyMTI2LjQyMDI2LTQtY2xhbW9yOTVAZ21haWwuY29tLz4KClRoaXMg
aXMgYSBzaW1pbGFyIHBhdGNoLgoKWW91IG1heSBiZSBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgaXNz
dWUgSSBmYWNlIGlmIHlvdSBoYXZlIGEgZGV2aWNlIHdoaWNoIHVzZXMgU1BMIGFuZCBoYXMgRE0g
UE1JQyB3aXRoIHJlZ3VsYXRvcnMgdGhhdCBuZWVkIGFsd2F5cy1vbi9ib290LW9uIHByb3BlcnRp
ZXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290
LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3Vib290LXN0bTMyCg==
