Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E40360E1BA
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Oct 2022 15:16:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFDB9C03FC6;
	Wed, 26 Oct 2022 13:16:19 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70F99C035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Oct 2022 13:16:18 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8FF0C84D43;
 Wed, 26 Oct 2022 15:16:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666790178;
 bh=+TE7bWmPfNEQ/yo+etOwRRcpWDS7yiTI22ZvmHJxY3k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BbmzsdHDn9Pc/BqP8d2h6Spji0kshkHRdydtRZMic8FBzZEJeAA9n5sYt4PPyOcKq
 NTnuLwv8ddrjhlwsXaGbcQ7dWYzlvTbZKFD4z3VKVBY3qYmFbC4eI5ECG8otky/Xp1
 qHdWUHFM0tP3iidenGor/Mx3Son0k/aWsceQMP0zzymmZbi9Y7R/5mUq8yyPMpV0BN
 TUDLduY80620XdyBLFaQ12PyPSExSvTlisbOlnkvJgaNeI5kDDMWjXQCKo2IhSOzZX
 h8XAAEQW2Z67JLfrdbrpSYDRdf4lB9sBX4FXWCQRVsqwVS/YDUnUvN1MRagqh8hQhW
 sgh1JgfDh+uEg==
Message-ID: <00804040-8b17-0179-f738-94d49c51dfa5@denx.de>
Date: Wed, 26 Oct 2022 15:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220920133954.1.Iff08cf94aa6c6d3678acb28a8dd012d466184b42@changeid>
 <f895a545-158e-8ce1-c08e-0556841cd9e7@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f895a545-158e-8ce1-c08e-0556841cd9e7@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] phy: usbphyc: use
 regulator_set_enable_if_allowed for disabling vbus supply
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

T24gMTAvMjYvMjIgMTU6MDksIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGkgTWFyZWssCj4g
Cj4gT24gOS8yMC8yMiAxMzozOSwgUGF0cmljayBEZWxhdW5heSB3cm90ZToKPj4gVXNlIHJlZ3Vs
YXRvcl9zZXRfZW5hYmxlX2lmX2FsbG93ZWQoKSBhcGkgaW5zdGVhZCBvZiAKPj4gcmVndWxhdG9y
X3NldF9lbmFibGUoKQo+PiB3aGlsZSBkaXNhYmxpbmcgdmJ1cyBzdXBwbHkuIFRoaXMgd2F5IHRo
ZSBkcml2ZXIgZG9lc24ndCBzZWUgYW4gZXJyb3IKPj4gd2hlbiBpdCBkaXNhYmxlIGFuIGFsd2F5
cy1vbiByZWd1bGF0b3IgZm9yIFZCVVMuCj4+Cj4+IFRoaXMgcGF0Y2ggaXMgbmVlZGVkIGZvciBT
VE0zMk1QMTU3Qy1ESzIgYm9hcmQgd2hlbiB0aGUgcmVndWxhdG9yCj4+IHYzdjM6IGJ1Y2s0IHVz
ZWQgYXMgdGhlIHBoeSB2YnVzIHN1cHBseSBpbiBrZXJuZWwgZGV2aWNlIHRyZWUKPj4gaXMgYWx3
YXlzIG9uIHdpdGggdGhlIG5leHQgaGFjayBmb3IgbG93IHBvd2VyIHVzZS1jYXNlOgo+Pgo+PiAm
dXNicGh5Y19wb3J0MCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgLi4uCj4+IMKgwqDCoMKgLyoKPj4g
wqDCoMKgwqAgKiBIYWNrIHRvIGtlZXAgaHViIGFjdGl2ZSB1bnRpbCBhbGwgY29ubmVjdGVkIGRl
dmljZXMgYXJlIHN1c3BlbmRlZAo+PiDCoMKgwqDCoCAqIG90aGVyd2lzZSB0aGUgaHViIHdpbGwg
YmUgcG93ZXJlZCBvZmYgYXMgc29vbiBhcyB0aGUgdjN2MyBpcyAKPj4gZGlzYWJsZWQKPj4gwqDC
oMKgwqAgKiBhbmQgaXQgY2FuIGRpc3R1cmIgY29ubmVjdGVkIGRldmljZXMuCj4+IMKgwqDCoMKg
ICovCj4+IMKgwqDCoMKgY29ubmVjdG9yIHsKPj4gwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9
ICJ1c2ItYS1jb25uZWN0b3IiOwo+PiDCoMKgwqDCoMKgwqDCoCB2YnVzLXN1cHBseSA9IDwmdjN2
Mz47Cj4+IMKgwqDCoMKgfTsKPj4gfTsKPj4KPj4gV2l0aG91dCB0aGlzIHBhdGNoIGFuZCB0aGUg
cHJldmlvdXMgdXBkYXRlIGluIERUIHRoZSBjb21tYW5kCj4+ICJ1c2Igc3RvcCIgZmFpbGVkIGFu
ZCB0aGUgbmV4dCBjb21tYW5kICJ1c2Igc3RhcnQiIGNhdXNlIGEgY3Jhc2guCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+
Cj4+IC0tLQo+Pgo+PiDCoCBkcml2ZXJzL3BoeS9waHktc3RtMzItdXNicGh5Yy5jIHwgMiArLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L3BoeS1zdG0zMi11c2JwaHljLmMgCj4+IGIvZHJpdmVy
cy9waHkvcGh5LXN0bTMyLXVzYnBoeWMuYwo+PiBpbmRleCA5ZjBiN2Q3MTE4Ny4uZGNmMjE5NGU5
YTcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvcGh5L3BoeS1zdG0zMi11c2JwaHljLmMKPj4gKysr
IGIvZHJpdmVycy9waHkvcGh5LXN0bTMyLXVzYnBoeWMuYwo+PiBAQCAtMzc1LDcgKzM3NSw3IEBA
IHN0YXRpYyBpbnQgc3RtMzJfdXNicGh5Y19waHlfcG93ZXJfb2ZmKHN0cnVjdCBwaHkgCj4+ICpw
aHkpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gwqDCoMKgwqDCoCBpZiAodXNi
cGh5Y19waHktPnZidXMpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IHJlZ3VsYXRvcl9zZXRf
ZW5hYmxlKHVzYnBoeWNfcGh5LT52YnVzLCBmYWxzZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXQg
PSByZWd1bGF0b3Jfc2V0X2VuYWJsZV9pZl9hbGxvd2VkKHVzYnBoeWNfcGh5LT52YnVzLCBmYWxz
ZSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gcmV0Owo+PiDCoMKgwqDCoMKgIH0KPiAKPiAKPiBDYW4geW91IHJldmll
d2VkIHRoaXMgbWlub3IgcGF0Y2ggZm9yIHYyMDIzLjAxLXJjMSA/CgpTZWVtcyBPSyB0byBtZToK
ClJldmlld2VkLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KClRoYW5rcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWls
aW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0z
Mgo=
