Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EAE417F76
	for <lists+uboot-stm32@lfdr.de>; Sat, 25 Sep 2021 05:06:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD8B2C5A4F4;
	Sat, 25 Sep 2021 03:06:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95A00C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Sep 2021 03:06:29 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AE4BD834E0;
 Sat, 25 Sep 2021 05:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1632539188;
 bh=+t3epBFcFyDRFYnBZhiqZ9X75eYM8AwMF71peHe5z+M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iPp0BlRri8hPSwzGrGmOADwO/AaXl6fvUe3pBe7dochmoAgvwBJWooPzCIf2MXCqO
 aSVjeLmjZ8KvIMM3JqtZNOJiTweR0u+m3a+A+pwnRvgKvxhPlQ6kdK08cyQH5pF0VK
 4oePE7lqokjljNd+Ma3UN2JKmlmLMA+Zdeq6b2FEB8uDfNFEP6Le6E3wbfesZUSiuj
 BywEUZqm8+1m0nkmkV7xw/GK0oNntylOJMo57FkmyXsOdlIxcqYH1Ea0MdTGbBRbj4
 FiHAiHkQhkajf1xOQ6HDIR44eLlOjln70ScXuzvkb7E/6313ui5fSdhLYHC54RllZC
 ZlRzAaI3g69EQ==
To: =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 Tom Rini <trini@konsulko.com>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
 <20210922210536.6c9c2f9e@thinkpad>
 <56df80f7-aa1d-3cff-5b29-16fdafcf7bcf@denx.de>
 <20210922194615.GD31748@bill-the-cat>
 <59ce8fa7-64f2-07c9-ee2b-4b59335b3907@denx.de>
 <20210922200053.GE31748@bill-the-cat>
 <a0fa4277-80be-ce67-73fa-08a5be23088f@denx.de>
 <4f1609c3-0aca-3f49-715b-95c8a3336f61@foss.st.com>
 <20210924182257.GG31748@bill-the-cat> <20210924212559.22006a61@thinkpad>
 <f3c1e30e-a7d7-a492-2ca1-789edf1f9290@denx.de>
 <20210925021200.7d5b62e2@thinkpad>
From: Marek Vasut <marex@denx.de>
Message-ID: <afcc3c67-221e-5f01-7d2d-872866878bda@denx.de>
Date: Sat, 25 Sep 2021 05:06:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210925021200.7d5b62e2@thinkpad>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 0/2] mtd: spi: nor: force mtd name to
	"nor%d"
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

T24gOS8yNS8yMSAyOjEyIEFNLCBNYXJlayBCZWjDum4gd3JvdGU6Cj4gT24gRnJpLCAyNCBTZXAg
MjAyMSAyMjowOToxNSArMDIwMAo+IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPiB3cm90ZToK
PiAKPj4gSSBoYXZlIGEgZmVlbGluZyB0aGUgZGlzY3Vzc2lvbiBpcyBhZ2FpbiBiYW5raW5nIHRv
d2FyZCAibXRkcGFydHMiIGFuZAo+PiAiRFQiLCB3aGljaCByZWFsbHkgaXMgYSBzb2x2ZWQgcHJv
YmxlbSwgb3IgYXQgbGVhc3Qgd2UgYWdyZWVkIHVwb24gdGhlCj4+IHNvbHV0aW9uLgo+IAo+IEkg
d2FzIHRyeWluZyB0byBleHBsYWluIHRvIFBhdHJpY2sgaG93IGhlIGNhbiBjb252ZXJ0IHRoZSBT
VCBib2FyZCBzbwo+IHRoYXQgdGhlIG10ZCBwYXJ0aXRpb25zIHdpbGwgYmUgZGVmaW5lZCBpbiBE
VCBhbmQgYm9hcmQgY29kZSB3b24ndCBuZWVkCj4gbXRkaWRzIGlmIGhlIGFsc28gY29udmVydHMg
dG8gZGlzdHJvIGJvb3QgY29ycmVjdGx5Lgo+IAo+PiBUaGUgcGF0Y2ggaXMgdHJ5aW5nIHRvIGZp
eCBNVERJRFMgYW5kIHRoZWlyIGxvb2sgdXAgaW4KPj4gZ2V0X210ZF9kZXZpY2Vfbm0oKS4gVGhp
cyBpcyBhbGwgVS1Cb290IHN0dWZmLCBpdCBoYXMgbm90aGluZyB0byBkbyB3aXRoCj4+IHBhc3Np
bmcgbXRkIHBhcnRpdGlvbnMgdG8gTGludXggYXQgYWxsLgo+IAo+IFRoZSBzb2x1dGlvbiBoZXJl
IGlzIHRvIGdldCByaWQgb2YgTVRESURTIGFsc28uIEJ1dCBJIGd1ZXNzIHRoaXMgd2lsbAo+IHRh
a2Ugc29tZSB0aW1lLCBzbyBpdCBkb2VzIG1ha2Ugc2Vuc2UgZm9yIGdldF9tdGRfZGV2aWNlX25t
KCkgdG8KPiByZXR1cm4gdGhlIHNhbWUgZGV2aWNlIGFzIHByZXZpb3VzbHkgd2hlbiBnaXZlbiBh
cmd1bWVudCAibm9yTiIuCgpJJ2Qgc2F5IE1URElEUyBpcyB1c2VyIEFCSSwgc28gd2Ugc2hvdWxk
bid0IGJyZWFrIGl0IHVudGlsIHRoZXJlIGlzIApjbGVhciB3YXkgZm9yd2FyZC4gKHllcywgSSBh
Z3JlZSB3aXRoIHByZXR0eSBtdWNoIGFsbCB5b3UgYXJlIHNheWluZywgSSAKanVzdCB3YW50IHRv
IG1ha2UgdGhpcyBjbGVhcikKCj4gVGhlIHJlYXNvbiB3aHkgSSBwdXQgU1BJIE5PUiBuYW1lIGlu
dG8gbXRkLT5uYW1lIHdhcyBiZWNhdXNlIG90aGVyd2lzZQo+IHRoZSBgbXRkIGxpc3RgIGNvbW1h
bmQgZGlkIG5vdCBwcmludCB0aGF0IG5hbWUgYW55d2hlcmUgKHNpbmNlIGl0Cj4gZG9lc24ndCBr
bm93IGhvdywgYmVjYXVzZSB0aGF0IFNQSS1OT1IgZGF0YSBhcmUgcHJpdmF0ZSBmb3IgdGhlCj4g
amVkZWNfc3BpX25vciBkcml2ZXIpLgo+IAo+IFNpbmNlCj4gLSBldmVyeSBtdGQgZGV2aWNlIGhh
cyBtdGQtPnR5cGUsIGZvciBOT1IgZmxhc2ggdGhpcyBpcyBNVERfTk9SRkxBU0gKPiAtIHdlIGNh
biBpdGVyYXRlIG10ZCBkZXZpY2VzIGluIG9yZGVyIHRoZXkgd2VyZSByZWdpc3RlcmVkCj4gICAg
KG10ZF9mb3JfZWFjaF9kZXZpY2UgZG9lcyB0aGlzKQo+IHdlIGNhbiBlYXNpbHkgaW1wbGVtZW50
IGEgZnVuY3Rpb24KPiAgICBnZXRfbXRkX2RldmljZV9ieV90eXBlX2FuZF9pZCgpCgpObywgd2Ug
Y2Fubm90LiBXZSBoYXZlIHRvIG1ha2Ugc3VyZSB0aGUgUGFyYWxsZWwgTk9ScyBnbyBmaXJzdCwg
U1BJIE5PUnMgCnNlY29uZCwgb3RoZXJ3aXNlIHdlIGJyZWFrIHRoZSBvbGQgQUJJLiBUaGF0J3Mg
d2hhdCBQYXRyaWNrIGlzIHZhbGlhbnRseSAKYmF0dGxpbmcgaGVyZS4KCj4gdGhhdCwgd2hlbiBn
aXZlbiBzdHJpbmcgIm5vck4iIHdpbGwgZmluZCB0aGUgTi10aCBtdGQgZGV2aWNlIG9mIHR5cGUK
PiBNVERfTk9SRkxBU0guCj4gCj4gVGhpcyBmdW5jdGlvbiBjb3VsZCB0aGFuIGJlIGNhbGxlZCBm
cm9tIGdldF9tdGRfZGV2aWNlX25tKCkgaWYKPiBldmVyeXRoaW5nIGZhaWxlZCwgb3IgaW4gc29t
ZSBvdGhlciB3YXkuCj4gCj4gVG9tLCBNYXJlaywgUGF0cmljaywgd2hhdCBkbyB5b3UgdGhpbms/
CgpNYXliZSB3ZSBzaG91bGQgZ28gd2l0aCBhIHNpbXBsZXIgY291bnRpbmcgYXBwcm9hY2ggZmly
c3QgKGF0IGxlYXN0IGZvciAKdGhpcyByZWxlYXNlKSBhbmQgdGhlbiBpbXByb3ZlIG9uIHRoYXQg
PyBUaGF0IHdvdWxkIGdpdmUgdXMgc29tZSB0aW1lIHRvIAp0aGluayB0aGUgc29sdXRpb24gdGhy
b3VnaCAuLi4gYXQgd2hpY2ggcG9pbnQgSSB3b3VsZG4ndCBldmVuIGJlIG9wcG9zZWQgCnRvIHBh
c3NpbmcgZnVsbCBEVCBwYXRoIHRvIHViaSBwYXJ0LCBzb21ldGhpbmcgbGlrZToKCnViaSBwYXJ0
IC9zb2MvY29udHJvbGxlckAweDEyMzQvZmxhc2hAMC9wYXJ0aXRpb25AMQoKb3Igc29tZXRoaW5n
IGxpa2UgdGhhdC4gVGhlIGFib3ZlIGlzIGFsd2F5cyBzdGFibGUgYW5kIHVuaXF1ZSBiZWNhdXNl
IGl0IAppcyBoYXJkd2FyZSBwYXRoLCBpdCBkb2VzIGdldCBmbHVzaGVkIHJpZ2h0IGRvd24gdG8g
Z2V0X210ZF9kZXZpY2Vfbm0oKSwgCmFuZCBpdCBiYXNpY2FsbHkgc2tpcHMgTVRESURTLiBXaXRo
IERUIGFsaWFzZXMgeW91IGNhbiBwcm9iYWJseSB3cml0ZSAKc29tZSBzaG9ydGhhbmQgZm9yIGEg
bG9uZyBIVyBwYXRoLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
