Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE4C10A47
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 May 2019 17:52:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3574DC28E31
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 May 2019 15:52:06 +0000 (UTC)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85D0EC28E30
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2019 15:52:04 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id o33so5946300uae.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 May 2019 08:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EbjnJpg1aipj/ZHmjg7Uy9XOIUSknkdVphFvl3Nr4ik=;
 b=RFjBDx4Y+ViedVBTNET5YH5FmAbkt1yJ/XsBvGETnYhDEwRVAwfne+wHqCiAHquGv6
 oBtonzmRTgNOreZz1aTYbLKJp3V9n/V6dTuTQWRIMQcbFZNBfk6eYP05f6HdIDL4lR9j
 17IAWzLEcSA0e0s1E/DuSJtXRM9/88PJqghYoDjCLTiEq4k9Z16PcLw7CNcXMMCzQtbZ
 N+p7suqMEzJPw6RZkEhacuqjhF1bv/lRmKLaqGTlOBKrra+/+R9gk00o9Xkil4ft9wdD
 pDvESCLTOx9CbamU1GPmCfXU2c0ClBHyRe009kMZthbajJbagBV25YskLK/RIbF4s4Fh
 PL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EbjnJpg1aipj/ZHmjg7Uy9XOIUSknkdVphFvl3Nr4ik=;
 b=Scftefl7mq1zGg9CMqINJPMvBRg83jzSHq+EMuwFtrEgy7qb/Knlz33qukCrWwq+GW
 faUWptngmEG1WhHdSb1VY8B3eY0gEorPMD1rNv/5bkC2J6hdnIBcXT/SCZay8NIlnpFU
 zYo7lM0QaSkfDS/IzJeRZQ2leKdMj0WhYWGr/Sw2XWaBkdW/OJwdKCoKs7KpVQ9+CPEi
 bjdt3Q02ReWTpYPjNBLvDhv5tnvjacux+O5QJiMpS6c1SY4037Fv5E6Q3tuXIm9A47yx
 UeGvaenK1/LWmiC+W2iCRjPq3i4Et2PYyRhNMCb4YOwLzqsjTbov2qfp1UHNYg5UEN90
 FCvA==
X-Gm-Message-State: APjAAAVfWFfswIiKIQeAuFRwDSAD6ULA3SZ7nAuOz6rDNdcRpPr+jq1m
 ZAghgsZwqVRIY6Czsnk5mMgQddOP6Zf41ZebLm4=
X-Google-Smtp-Source: APXvYqy4NR9ui6RO2+rQm88e3jyb1PEvWpzAjuFa6laqzaNngXnewYID8QL6Lu2b9ZukD89mXFQ4UNBmbkJkSifARds=
X-Received: by 2002:ab0:7298:: with SMTP id w24mr3814237uao.119.1556725923243; 
 Wed, 01 May 2019 08:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190501075827.12992-1-alex.kiernan@gmail.com>
 <20190501144926.GX31207@bill-the-cat>
In-Reply-To: <20190501144926.GX31207@bill-the-cat>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 1 May 2019 16:51:51 +0100
Message-ID: <CAO5Uq5TFWjwBe0v35PRvEH57eL=hxNoPqFwkk7osoYn+19jTcA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Ken Lin <Ken.Lin@advantech.com.tw>,
 Vanessa Maegima <vanessa.maegima@nxp.com>, u-boot <u-boot@lists.denx.de>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Chris Packham <judge.packham@gmail.com>,
 Richard Hu <richard.hu@technexion.com>, Marek Vasut <marex@denx.de>,
 Akshay Saraswat <akshay.s@samsung.com>, Stephen Warren <swarren@nvidia.com>,
 Stefan Agner <stefan.agner@toradex.com>, Ingo Schroeck <open-source@samtec.de>,
 Toradex ARM Support <support.arm@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ian Ray <ian.ray@ge.com>, Simone CIANNI <simone.cianni@bticino.it>,
 Ramon Fried <ramon.fried@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Raffaele RECALCATI <raffaele.recalcati@bticino.it>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Akshay Bhat <akshaybhat@timesys.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3] Convert
	CONFIG_SUPPORT_EMMC_BOOT to Kconfig
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

T24gV2VkLCBNYXkgMSwgMjAxOSBhdCAzOjQ5IFBNIFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5j
b20+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMDc6NTg6MjdBTSArMDAwMCwg
QWxleCBLaWVybmFuIHdyb3RlOgo+ID4gVGhpcyBjb252ZXJ0cyB0aGUgZm9sbG93aW5nIHRvIEtj
b25maWc6Cj4gPiAgICBDT05GSUdfU1VQUE9SVF9FTU1DX0JPT1QKPiA+Cj4gPiBBcyByZXF1ZXN0
ZWQgYnkgTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAeGlsaW54LmNvbT4sIHRoZXNlIGJvYXJk
cwo+ID4gaGF2ZSBubyBlTU1DIHNvIENPTkZJR19TVVBQT1JUX0VNTUNfQk9PVCBoYXMgbm90IGJl
ZW4gbWlncmF0ZWQ6Cj4gPgo+ID4gICB4aWxpbnhfenlucW1wX3pjMTI3NV9yZXZCCj4gPiAgIHhp
bGlueF96eW5xbXBfemMxNzUxX3htMDE4X2RjNAo+ID4gICB4aWxpbnhfenlucW1wX3pjMTc1MV94
bTAxOV9kYzUKPiA+ICAgeGlsaW54X3p5bnFtcF96Y3UxMDBfcmV2Qwo+ID4gICB4aWxpbnhfenlu
cW1wX3pjdTEwMl9yZXYxXzAKPiA+ICAgeGlsaW54X3p5bnFtcF96Y3UxMDJfcmV2QQo+ID4gICB4
aWxpbnhfenlucW1wX3pjdTEwMl9yZXZCCj4gPiAgIHhpbGlueF96eW5xbXBfemN1MTA0X3JldkEK
PiA+ICAgeGlsaW54X3p5bnFtcF96Y3UxMDRfcmV2Qwo+ID4gICB4aWxpbnhfenlucW1wX3pjdTEw
Nl9yZXZBCj4gPiAgIHhpbGlueF96eW5xbXBfemN1MTExX3JldkEKPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4IEtpZXJuYW4gPGFsZXgua2llcm5hbkBnbWFpbC5jb20+Cj4gPiBBY2tlZC1ieTog
THVrYXN6IE1hamV3c2tpIDxsdWttYUBkZW54LmRlPgo+ID4gQWNrZWQtYnk6IFBhdHJpY2sgRGVs
YXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPgo+ID4gQWNrZWQtYnk6IFJhbW9uIEZyaWVk
IDxyYW1vbi5mcmllZEBnbWFpbC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtv
IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Cj4gPiBUZXN0ZWQtYnk6IFPDqWJh
c3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiA+IC0t
LQo+ID4gR3JlZW4gdHJhdmlzIGJ1aWxkOgo+ID4KPiA+IGh0dHBzOi8vdHJhdmlzLWNpLm9yZy9h
a2llcm5hbi91LWJvb3QvYnVpbGRzLzUyNjU5MTUzNQo+ID4KPiA+IFRlc3RpbmcgZm9yIGNvbmZp
Z3VyYXRpb24gY2hhbmdlcyBzaG93cyBqdXN0IHRoZSBleHBlY3RlZCB4aWxpbnhfenlucW1wCj4g
PiBib2FyZHM6Cj4KPiBTbywgRldJVywgd2hhdCBJIGRvIChhbmQgd2lsbCBkbyBmb3IgdGhpcyBw
YXRjaCB3aGVuIEkgY2hlY2sgaXQgb3V0Cj4gYmVmb3JlIHB1c2hpbmcpIGVuZHMgdXAgYXM6Cj4g
JCBleHBvcnQgU09VUkNFX0RBVEVfRVBPQ0g9YGRhdGUgKyVzYAo+ICQgLi90b29scy9idWlsZG1h
bi9idWlsZG1hbiAtbyAvdG1wL3Rlc3QgLWIgbWFzdGVyIC0tZm9yY2UtYnVpbGQgLS1zdGVwIDAg
XAo+ICAgLVNDZHZlbCBcCj4gICAnYXJjfGFybXxzYW5kYm94fHg4NnxhYXJjaDY0fHBvd2VycGN8
bTY4a3xuaW9zMnxuZHMzMnxzaHxtaXBzfHh0ZW5zYXxyaXNjdicKPiAkIC4vdG9vbHMvYnVpbGRt
YW4vYnVpbGRtYW4gLW8gL3RtcC90ZXN0IC1iIG1hc3RlciAtLXN0ZXAgMCAtU3NkZWwgXAo+ICAg
J2FyY3xhcm18c2FuZGJveHx4ODZ8YWFyY2g2NHxwb3dlcnBjfG02OGt8bmlvczJ8bmRzMzJ8c2h8
bWlwc3x4dGVuc2F8cmlzY3YnCj4KPiBXaXRoIHRoZSBwYXRjaCBhcHBsaWVkIGluIHNvbWUgYnJh
bmNoIHRoYXQgaGFzICdtYXN0ZXInIGFzIHRoZSB1cHN0cmVhbS4KPiBUaGlzIGlzIGJhc2ljYWxs
eSBhIHdvcmxkLWJ1aWxkIGFuZCB3aWxsIHNpemUgY29tcGFyZSBiZWZvcmUvYWZ0ZXIsCj4gbm90
aW5nIGNoYW5nZXMuICBJZiBJIHNlZSBhIHNpemUgZGlmZmVyZW5jZSAob3V0c2lkZSBvZiBhIGZl
dyBib2FyZHMKPiB0aGF0IGluY2x1ZGUgdGhlIGNvbmZpZyBpbiB0aGUgYmluYXJ5IGFuZCBzbyBn
cm93IHNsaWdodGx5IG9uCj4gY29udmVyc2lvbnMpLCBJIHVzZToKPiAkIGV4cG9ydCBTT1VSQ0Vf
REFURV9FUE9DSD1gZGF0ZSArJXNgCj4gJCAuL3Rvb2xzL2J1aWxkbWFuL2J1aWxkbWFuIC1vIC90
bXAvYnJkIC1iIG1hc3RlciAtLXN0ZXAgMCAtU0JDZGV2bGsgQk9BUkQKPiAkIC4vdG9vbHMvYnVp
bGRtYW4vYnVpbGRtYW4gLW8gL3RtcC9icmQgLWIgbWFzdGVyIC0tc3RlcCAwIC1Tc0JkZXZsayBC
T0FSRAo+Cj4gV2hpY2ggcHJvYmFibHkgaGFzIGEgZmV3IG1vcmUgZmxhZ3MgdGhhbiByZXF1aXJl
ZCBidXQgd2lsbCBhbHNvIHRlbGwKPiB3aGljaCBmdW5jdGlvbnMgd2l0aGluIHRoZSBiaW5hcnkg
aGF2ZSBjaGFuZ2VkIGFuZCBzbyBhIGdvb2QgcGxhY2UgdG8KPiBodW50IGRvd24gd2hhdCBkaWRu
J3QgY29udmVydCBjb3JyZWN0bHkgYW5kIHdoeS4KPgoKVGhhdCdzIGEgdXNlZnVsIHNldCBvZiBz
bmlwcGV0cyAtIHRoYW5rcyEKCi0tIApBbGV4IEtpZXJuYW4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
