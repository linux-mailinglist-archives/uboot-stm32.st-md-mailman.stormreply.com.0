Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EB074E06F
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Jul 2023 23:50:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AFC6C6B459;
	Mon, 10 Jul 2023 21:50:09 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF3E4C6A61D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 21:50:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E73E7867A0;
 Mon, 10 Jul 2023 23:50:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1689025807;
 bh=LCex50n1niiC2Wsr52CNFnHSuprq2WgDMPQWty010rc=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=ZAAVHxH2vadbT0bpK8RitolkPdx3bHBei3DA4OvVzd0XN0e/GzNq3TNLciFoiwSWd
 etWqfXi4PosSbC4TLMXTz4yFPchY46OWEbDFkQvemMi9wmsKICHw9ZbH89epVjUCGh
 dJWiJUMqXzUYn+78Q0QHYsqi0RihvBxXuERlWsMZxticsQWSB19sQmAU8llF4RMAfI
 smWtYnL2u94eEIqk+uaTxPqp9zvk6jTO0xD2w+NmOBUUUqOh/VzSTrWEWcM9ise5EG
 HlyumNupQLouDyiRcoxKSoYKX1klXpJNrjbGrpojkXzEmo3ElJSbLl9bw4x0/lRH13
 qL23XFzD068Aw==
Message-ID: <80feeb5a-0bbb-86ab-bb73-eb322b90f527@denx.de>
Date: Mon, 10 Jul 2023 23:45:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
References: <20230517220239.329807-1-marex@denx.de>
 <586cdbf2-e994-70f5-43a9-1af8214c9118@denx.de>
In-Reply-To: <586cdbf2-e994-70f5-43a9-1af8214c9118@denx.de>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Power cycle Buck3 in reset on
	DHSOM
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

T24gNy80LzIzIDIzOjU1LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA1LzE4LzIzIDAwOjAyLCBN
YXJlayBWYXN1dCB3cm90ZToKPj4gSW4gY2FzZSB0aGUgREhTT00gaXMgaW4gc3VzcGVuZCBzdGF0
ZSBhbmQgZWl0aGVyIHJlc2V0IGJ1dHRvbiBpcyBwdXNoZWQKPj4gb3IgSVdERzIgdHJpZ2dlcnMg
YSB3YXRjaGRvZyByZXNldCwgdGhlbiBEUkFNIGluaXRpYWxpemF0aW9uIGNvdWxkIGZhaWwKPj4g
YXMgZm9sbG93czoKPj4KPj4gwqDCoCAiCj4+IMKgwqAgUkFNOiBERFIzTCAzMmJpdHMgMng0R2Ig
NTMzTUh6Cj4+IMKgwqAgRERSIGludmFsaWQgc2l6ZSA6IDB4NCwgZXhwZWN0ZWQgMHg0MDAwMDAw
MAo+PiDCoMKgIERSQU0gaW5pdCBmYWlsZWQ6IC0yMgo+PiDCoMKgICMjIyBFUlJPUiAjIyMgUGxl
YXNlIFJFU0VUIHRoZSBib2FyZCAjIyMKPj4gwqDCoCAiCj4+Cj4+IEF2b2lkIHRoaXMgZmFpbHVy
ZSBieSBub3Qga2VlcGluZyBhbnkgQnVjayByZWd1bGF0b3JzIGVuYWJsZWQgZHVyaW5nIAo+PiBy
ZXNldCwKPj4gbGV0IHRoZSBTb0MgYW5kIERSQU1zIHBvd2VyIGN5Y2xlIGZ1bGx5LiBTaW5jZSB0
aGUgY2hhbmdlIHdoaWNoIGtlZXBzIAo+PiBCdWNrMwo+PiBWREQgZW5hYmxlZCBkdXJpbmcgcmVz
ZXQgaXMgU1Qgc3BlY2lmaWMsIG1vdmUgdGhpcyBhZGRpdGlvbiB0byBTVCAKPj4gc3BlY2lmaWMK
Pj4gU1BMIGJvYXJkIGluaXRpYWxpemF0aW9uIHNvIHRoYXQgaXQgd291bGRuJ3QgYWZmZWN0IHRo
ZSBESFNPTSAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRl
Pgo+PiAtLS0KPj4gTk9URTogVGhpcyBpcyAyMDIzLjA3IG1hdGVyaWFsCj4gCj4gSSBkb24ndCBz
ZWUgdGhpcyBvbmUgaW4gMjAyMy4wNyB5ZXQsIGNhbiB5b3UgcGxlYXNlIHBpY2sgaXQgYW5kIHNl
bmQgUFI/CgpTYWRseSwgdGhpcyBidWdmaXggaGFzIG5vdCBtYWRlIGl0IGludG8gMjAyMy4wNywg
ZXZlbiB0aG91Z2ggdGhlIGZpeCB3YXMgCnBvc3RlZCBhIG1vbnRoIGFuZCBoYWxmIGJlZm9yZSB0
aGUgYWN0dWFsIHJlbGVhc2UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
