Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD807790043
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Sep 2023 17:59:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2140C6A61D;
	Fri,  1 Sep 2023 15:59:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E183AC6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 15:59:35 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2DAD984698;
 Fri,  1 Sep 2023 17:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1693583975;
 bh=PVh7DUH3VOQHx7lwhF2Q3ytkGLJ0Bs6v4Q4iXbp8CS0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NT+cujMl+1A5LB4IyiGeDI9mSL0YLNdRtEhNVZILW5ammIoM614dYyHXJ1vjDQ6VT
 OYusOSclqqWkP08OSitBKlzmkmkTnOjOs507fKclvi4hc0hpLQlQBFLjqgJseGTmWG
 ZmJ9s7hfRjUb1P8ZqQpeSmsr0BLTaXqGUlvfJ8zpmcABZ7JAaJp6j6rb9Ym0msKZCh
 3maiVh6QWthyVoKGbmQ/ubp8jxYVaypoYXyVBDvhNVqXJlTnEqnuZrG5eLdblnFs8Z
 vi9Iwh0zfORUb6CHZreq0Y/L238q9/UBoTvICA+Tq8jBU7JKreAEnoHomTf2x38Fnh
 arOU5/6j7g/VQ==
Message-ID: <541f6ca4-9ee5-e2c9-7a9e-bc8f13562a8c@denx.de>
Date: Fri, 1 Sep 2023 17:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, u-boot@lists.denx.de
References: <20230830080150.473374-1-fabrice.gasnier@foss.st.com>
 <84041468-abf2-9b68-6701-6605f4948bf5@denx.de>
 <2e1cf0cd-1d98-16fe-97e8-96604bbb009c@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2e1cf0cd-1d98-16fe-97e8-96604bbb009c@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: host: ohci-generic: Make usage of
 clock/reset bulk() API
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

T24gOS8xLzIzIDE0OjA1LCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6Cj4gT24gOC8zMC8yMyAxNzox
OCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDgvMzAvMjMgMTA6MDEsIEZhYnJpY2UgR2Fzbmll
ciB3cm90ZToKPj4+IE1ha2UgdXNhZ2Ugb2YgY2xvY2sgYW5kIHJlc2V0IGJ1bGsgQVBJIGluIG9y
ZGVyIHRvIHNpbXBsaWZ5IHRoZSBjb2RlCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBH
YXNuaWVyIDxmYWJyaWNlLmdhc25pZXJAZm9zcy5zdC5jb20+Cj4+PiAtLS0KPj4+Cj4+PiAgwqAg
ZHJpdmVycy91c2IvaG9zdC9vaGNpLWdlbmVyaWMuYyB8IDkyICsrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA2
MyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC9vaGNp
LWdlbmVyaWMuYwo+Pj4gYi9kcml2ZXJzL3VzYi9ob3N0L29oY2ktZ2VuZXJpYy5jCj4+PiBpbmRl
eCAyZDhkMzhjZTlhNDAuLjk1YWE2MDhkOGMxOSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvdXNi
L2hvc3Qvb2hjaS1nZW5lcmljLmMKPj4+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3Qvb2hjaS1nZW5l
cmljLmMKPj4+IEBAIC0xNiw3NSArMTYsNDEgQEAKPj4+ICDCoCDCoCBzdHJ1Y3QgZ2VuZXJpY19v
aGNpIHsKPj4+ICDCoMKgwqDCoMKgIG9oY2lfdCBvaGNpOwo+Pj4gLcKgwqDCoCBzdHJ1Y3QgY2xr
ICpjbG9ja3M7wqDCoMKgIC8qIGNsb2NrIGxpc3QgKi8KPj4+IC3CoMKgwqAgc3RydWN0IHJlc2V0
X2N0bCAqcmVzZXRzOyAvKiByZXNldCBsaXN0ICovCj4+PiArwqDCoMKgIHN0cnVjdCBjbGtfYnVs
ayBjbG9ja3M7wqDCoMKgIC8qIGNsb2NrIGxpc3QgKi8KPj4+ICvCoMKgwqAgc3RydWN0IHJlc2V0
X2N0bF9idWxrIHJlc2V0czsgLyogcmVzZXQgbGlzdCAqLwo+Pj4gIMKgwqDCoMKgwqAgc3RydWN0
IHBoeSBwaHk7Cj4+PiAtwqDCoMKgIGludCBjbG9ja19jb3VudDvCoMKgwqAgLyogbnVtYmVyIG9m
IGNsb2NrIGluIGNsb2NrIGxpc3QgKi8KPj4+IC3CoMKgwqAgaW50IHJlc2V0X2NvdW50O8KgwqDC
oCAvKiBudW1iZXIgb2YgcmVzZXQgaW4gcmVzZXQgbGlzdCAqLwo+Pj4gIMKgIH07Cj4+PiAgwqAg
wqAgc3RhdGljIGludCBvaGNpX3VzYl9wcm9iZShzdHJ1Y3QgdWRldmljZSAqZGV2KQo+Pj4gIMKg
IHsKPj4+ICDCoMKgwqDCoMKgIHN0cnVjdCBvaGNpX3JlZ3MgKnJlZ3MgPSBkZXZfcmVhZF9hZGRy
X3B0cihkZXYpOwo+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IGdlbmVyaWNfb2hjaSAqcHJpdiA9IGRl
dl9nZXRfcHJpdihkZXYpOwo+Pj4gLcKgwqDCoCBpbnQgaSwgZXJyLCByZXQsIGNsb2NrX25iLCBy
ZXNldF9uYjsKPj4+IC0KPj4+IC3CoMKgwqAgZXJyID0gMDsKPj4+IC3CoMKgwqAgcHJpdi0+Y2xv
Y2tfY291bnQgPSAwOwo+Pj4gLcKgwqDCoCBjbG9ja19uYiA9IGRldl9jb3VudF9waGFuZGxlX3dp
dGhfYXJncyhkZXYsICJjbG9ja3MiLAo+Pj4gIiNjbG9jay1jZWxscyIsCj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwKTsKPj4+IC3CoMKg
wqAgaWYgKGNsb2NrX25iID4gMCkgewo+Pj4gLcKgwqDCoMKgwqDCoMKgIHByaXYtPmNsb2NrcyA9
IGRldm1fa2NhbGxvYyhkZXYsIGNsb2NrX25iLCBzaXplb2Yoc3RydWN0IGNsayksCj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsK
Pj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoIXByaXYtPmNsb2NrcykKPj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+Pj4gLQo+Pj4gLcKgwqDCoMKgwqDCoMKgIGZvciAo
aSA9IDA7IGkgPCBjbG9ja19uYjsgaSsrKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBl
cnIgPSBjbGtfZ2V0X2J5X2luZGV4KGRldiwgaSwgJnByaXYtPmNsb2Nrc1tpXSk7Cj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZXJyIDwgMCkKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYnJlYWs7Cj4+PiAtCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIg
PSBjbGtfZW5hYmxlKCZwcml2LT5jbG9ja3NbaV0pOwo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKGVyciAmJiBlcnIgIT0gLUVOT1NZUykgewo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBlbmFibGUgY2xvY2sgJWRcbiIsIGkp
Owo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbGtfZnJlZSgmcHJpdi0+Y2xv
Y2tzW2ldKTsKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBjbGtfZXJy
Owo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcHJpdi0+Y2xvY2tfY291bnQrKzsKPj4+IC3CoMKgwqDCoMKgwqDCoCB9Cj4+PiAtwqDCoMKg
IH0gZWxzZSBpZiAoY2xvY2tfbmIgIT0gLUVOT0VOVCkgewo+Pj4gLcKgwqDCoMKgwqDCoMKgIGRl
dl9lcnIoZGV2LCAiZmFpbGVkIHRvIGdldCBjbG9jayBwaGFuZGxlKCVkKVxuIiwgY2xvY2tfbmIp
Owo+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBjbG9ja19uYjsKPj4+ICvCoMKgwqAgaW50IGVy
ciwgcmV0Owo+Pj4gKwo+Pj4gK8KgwqDCoCByZXQgPSBjbGtfZ2V0X2J1bGsoZGV2LCAmcHJpdi0+
Y2xvY2tzKTsKPj4+ICvCoMKgwqAgaWYgKHJldCAmJiByZXQgIT0gLUVOT0VOVCkgewo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBjbG9ja3MgKHJldD0lZClc
biIsIHJldCk7Cj4+Cj4+IFBsdXJhbCBvZiAnY2xvY2snIGlzIHN0aWxsICdjbG9jaycgLCBwbGVh
c2UgZml4IGp1c3QgdGhlIHRleHQsIGtlZXAgdGhlCj4+IHZhcmlhYmxlIG5hbWUgLgo+IAo+IEhp
IE1hcmVrLAo+IAo+IEFyZSB5b3Ugc3VyZSA/IFRha2luZyBhIGNsb3NlciBsb29rIG9uIHRoZSB3
ZWIsIGFsc28gaW4gTGludXggb3IgdS1ib290LAo+IEkgY2FuIHNlZSBwbHVyYWwgb2YgY2xvY2sg
aXMgY2xvY2tzLiBEb2N1bWVudGF0aW9uIGFsc28gZGVhbHMgd2l0aAo+IG11bHRpcGxlIGNsb2Nr
cyB0b28uCgpJIGFsc28gbG9va2VkIGl0IHVwIGluIGEgZGljdGlvbmFyeSBub3cgYW5kIGV2ZW4g
YXNrZWQgYWJvdXQgaXQsIApjbGVhcmx5LCBJIGFtIHdyb25nLiBTb3JyeS4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
