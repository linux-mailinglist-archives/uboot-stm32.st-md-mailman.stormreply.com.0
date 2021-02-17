Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EBF31D6C5
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Feb 2021 09:57:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FD87C5718A;
	Wed, 17 Feb 2021 08:57:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B871C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Feb 2021 08:57:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11H8q3pH007829; Wed, 17 Feb 2021 09:57:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=BR5P+WEQFq3rWgwcNvI1EqCrvUq34F+E4uBTPojz/LU=;
 b=U1YHeygjj5DPynG9Hk+bp2/LJG9WCudqdX7bW4tLEXd5mk6K+s4FW8QC1xF+UoKfZfHg
 DvdJCjuPDDOkq9pHbtAeDCOoNSzuYBjxmzFAF2Rt0NtXoZmUAsWhRSKXicI8wJ4EQL4f
 vwzm6jvy84wR/QonfwmW+3fsuGY1PGAMgjHqP5KvRqAmBaidua1siFq3aJ1rKWKbJ4QO
 6FW7aBruquGmkNQWr6fEOYe4Jl78nfNxBnADN1HSyO3aV4mZu4vh7X+iWwYtxmn0mOC9
 /XEAAB5bZSBpKLVcMz8hJSJGyl/z1d1U3BFkzt6QFn5vxyLtf5hKxkXEQuUMwox1oyv1 Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p547mphj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 09:57:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E39710002A;
 Wed, 17 Feb 2021 09:57:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 06DD0223094;
 Wed, 17 Feb 2021 09:57:17 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Feb
 2021 09:57:16 +0100
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20210210141759.5641-1-patrice.chotard@foss.st.com>
 <ec67a889-1639-5652-2766-aeb0badb70d3@denx.de>
 <7b665909-b1d6-323c-f6a4-4221fca616c7@foss.st.com>
 <7b1e8706-8fa3-44e3-4bed-ff418e9d803d@denx.de>
 <457ca91c-8fd3-929c-be24-90b7d0d87670@foss.st.com>
 <df8a5842-0f25-35b2-c7fc-a767e9f493d8@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <e6774c57-0000-024f-287b-3cd64575e5c8@foss.st.com>
Date: Wed, 17 Feb 2021 09:57:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <df8a5842-0f25-35b2-c7fc-a767e9f493d8@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-17_08:2021-02-16,
 2021-02-17 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] usb: gadget: dwc2_udc_otg: Fix
	dwc2_gadget_start()
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

SGkgTWFyZWsKCk9uIDIvMTYvMjEgMTA6MTUgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDIv
MTYvMjEgNjozMiBQTSwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+PiBIaSBNYXJlawo+IAo+IEhp
LAo+IAo+PiBPbiAyLzExLzIxIDEyOjI2IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IE9uIDIv
MTEvMjEgMTA6NTggQU0sIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToKPj4+PiBIaSBNYXJlawo+Pj4+
Cj4+Pj4gT24gMi8xMC8yMSAzOjI2IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+Pj4gT24gMi8x
MC8yMSAzOjE3IFBNLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+Pj4+PiBTaW5jZSBjb21taXQg
ODc0NWI5ZWJjY2FlICgidXNiOiBnYWRnZXQ6IGFkZCBzdXBlciBzcGVlZCBzdXBwb3J0IikKPj4+
Pj4+IHVtcyB3YXMgbm8gbW9yZSBmdW5jdGlvbmFsIG9uIHBsYXRmb3JtIHdoaWNoIHVzZSBkd2My
X3VkY19vdGcgZHJpdmVyLgo+Pj4+Pj4KPj4+Pj4+IFJlbW92ZSB0aGUgc3BlZWQgdGVzdCBpbiBk
d2MyX2dhZGdldF9zdGFydCgpIHRvIGZpeCBpdC4KPj4+Pj4+IFRlc3RlZCBvbiBzdG0zMm1wMTU3
Yy1ldjEgYm9hcmQuCj4+Pj4+Cj4+Pj4+IElzbid0IHRoZSBzcGVlZCBjaGVjayBjb3JyZWN0IHRo
b3VnaCA/Cj4+Pj4KPj4+PiBJIGFtIG5vdCBzdXJlIHRoaXMgc3BlZWQgdGVzdCBpcyBuZWVkZWQu
Cj4+Pj4KPj4+Pj4KPj4+Pj4gV2hhdCBpcyByZWFsbHkgZ29pbmcgb24gd2hlbiB0aGlzIGZhaWxz
ID8KPj4+Pgo+Pj4+Cj4+Pj4gU2luY2UgODc0NWI5ZWJjY2FlICgidXNiOiBnYWRnZXQ6IGFkZCBz
dXBlciBzcGVlZCBzdXBwb3J0IiksCj4+Pj4gZHJpdmVyLT5zcGVlZCBpcyBub3cgc2V0IHRvIFVT
Ql9TUEVFRF9TVVBFUiBpbiBkcml2ZXJzL3VzYi9nYWRnZXQvY29tcG9zaXRlLmMKPj4+Pgo+Pj4+
IGFuZCB0aGlzIGZvcmJpZHMgZHdjMl91ZGNfb3RnLmMgdG8gYmUgcmVnaXN0ZXJlZC4KPj4+Cj4+
PiBUaGF0IHNvdW5kcyBsaWtlIGEgYnVnIGluIHRoZSBVU0IgZ2FkZ2V0L290ZyBjb3JlICwgbm8g
Pwo+Pgo+PiBBZnRlciBhbmFseXNpcywgaWYgaSBjb3JyZWN0bHkgdW5kZXJzdG9vZCwgdGhlIHNw
ZWVkIHRlc3QgZG9uZSBpbiBib3RoIHVzYl9nYWRnZXRfcmVnaXN0ZXJfZHJpdmVyKCkKPj4gYW5k
IGluIGR3YzJfZ2FkZ2V0X3N0YXJ0KCkgaW4gZHdjMl91ZGNfb3RnLmMgaXMgdG9vIHJlc3RyaWN0
aXZlIGFuZCBhY2NlcHRzIG9ubHkgZ2FkZ2V0IGRyaXZlciB3aXRoCj4+IG1heCBzcGVlZCBlcXVh
bCB0byBVU0JfU1BFRURfRlVMTCBvciBVU0JfU1BFRURfSElHSC4KPiAKPiBUaGF0IHNob3VsZCBi
ZSBmaW5lIGZvciB0aGUgRFdDMiBJUCwgd2hpY2ggaXMgTFMvRlMvSFMuCj4gCj4+IFNvIGFsbCBn
YWRnZXQgZHJpdmVyIHdpdGggbWF4IHNwZWVkIHNldCB0byBoaWdoZXIgc3BlZWQgdGhhbiBVU0Jf
U1BFRURfSElHSCAoVVNCX1NQRUVEX1NVUEVSIGluIGNhc2Ugb2YKPj4gY29tcG9zaXRlIGdhZGdl
dCBkcml2ZXIpIGFyZSBub3QgYWxsb3dlZCwgd2hpY2ggaXMgd3JvbmcuCj4+Cj4+IFRoaXMgdGVz
dCBzaG91bGQgY2hlY2sgdGhhdCB0aGUgZ2FkZ2V0IGRyaXZlciBtYXggc3BlZWQgaXMgaGlnaGVy
IG9yIGVxdWFsIHRvIHRoZSBtaW4gc3BlZWQgc3VwcG9ydGVkIGJ5Cj4+IGR3YzJfdWRjX290ZyBk
cml2ZXIsIGllIFVTQl9TUEVFRF9GVUxMLgo+Pgo+PiBTbyB0aGUgdGVzdCBzaG91bGQgYmUgOgo+
Pgo+PiBAQCAtMjQ3LDEyICsyNDcsMTEgQEAgaW50IHVzYl9nYWRnZXRfcmVnaXN0ZXJfZHJpdmVy
KHN0cnVjdCB1c2JfZ2FkZ2V0X2RyaXZlciAqZHJpdmVyKQo+PiDCoMKgwqDCoMKgIHVuc2lnbmVk
IGxvbmcgZmxhZ3MgPSAwOwo+PiDCoCDCoMKgwqDCoMKgIGRlYnVnX2NvbmQoREVCVUdfU0VUVVAg
IT0gMCwgIiVzOiAlc1xuIiwgX19mdW5jX18sICJubyBuYW1lIik7Cj4+IMKgIMKgwqDCoMKgwqAg
aWYgKCFkcml2ZXIKPj4gLcKgwqDCoMKgwqDCoMKgIHx8IChkcml2ZXItPnNwZWVkICE9IFVTQl9T
UEVFRF9GVUxMCj4+IC3CoMKgwqDCoMKgwqDCoCAmJiBkcml2ZXItPnNwZWVkICE9IFVTQl9TUEVF
RF9ISUdIKQo+PiArwqDCoMKgwqDCoMKgwqAgfHwgZHJpdmVyLT5zcGVlZCA8IFVTQl9TUEVFRF9G
VUxMCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB8fCAhZHJpdmVyLT5iaW5kIHx8ICFkcml2ZXItPmRp
c2Nvbm5lY3QgfHwgIWRyaXZlci0+c2V0dXApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
LUVJTlZBTDsKPj4gwqDCoMKgwqDCoCBpZiAoIWRldikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRU5PREVWOwo+PiDCoMKgwqDCoMKgIGlmIChkZXYtPmRyaXZlcikKPj4gQEAgLTMxOSwx
MiArMzE4LDExIEBAIHN0YXRpYyBpbnQgZHdjMl9nYWRnZXRfc3RhcnQoc3RydWN0IHVzYl9nYWRn
ZXQgKmcsCj4+IMKgwqDCoMKgwqAgc3RydWN0IGR3YzJfdWRjICpkZXYgPSB0aGVfY29udHJvbGxl
cjsKPj4gwqAgwqDCoMKgwqDCoCBkZWJ1Z19jb25kKERFQlVHX1NFVFVQICE9IDAsICIlczogJXNc
biIsIF9fZnVuY19fLCAibm8gbmFtZSIpOwo+PiDCoCDCoMKgwqDCoMKgIGlmICghZHJpdmVyIHx8
Cj4+IC3CoMKgwqDCoMKgwqDCoCAoZHJpdmVyLT5zcGVlZCAhPSBVU0JfU1BFRURfRlVMTCAmJgo+
PiAtwqDCoMKgwqDCoMKgwqDCoCBkcml2ZXItPnNwZWVkICE9IFVTQl9TUEVFRF9ISUdIKSB8fAo+
PiArwqDCoMKgwqDCoMKgwqAgZHJpdmVyLT5zcGVlZCA8IFVTQl9TUEVFRF9GVUxMIHx8Cj4gCj4g
VGhlIERXQzIgY2FuJ3Qgb3BlcmF0ZSBpbiBMUyBnYWRnZXQgbW9kZSAsIGkuZS4gZW11bGF0ZSBz
b21lIG9sZCBrZXlib2FyZCA/IE1heWJlIHdoYXQgeW91IHdhbnQgaXMgZHJpdmVyLT5zcGVlZCA+
IFVTQl9TUEVFRF9ISUdIIGluc3RlYWQgPwpUaGUgdGVzdCBpcyBjb3JyZWN0LCBpbiBjYXNlIGRy
aXZlci0+c3BlZWQgaXMgbG93ZXIgdGhhbiBGUywgd2UgcmV0dXJuIC1FSU5WQUwuCkFsbCBvdGhl
cnMgc3BlZWQgRlMvSFMvU1MgYW5kIGhpZ2hlciBhcmUgYWxsb3dlZC4KCj4gCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCAhZHJpdmVyLT5iaW5kIHx8ICFkcml2ZXItPmRpc2Nvbm5lY3QgfHwgIWRyaXZl
ci0+c2V0dXApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gwqAgwqDC
oMKgwqDCoCBpZiAoIWRldikKPj4KPj4gSSB5b3UgYXJlIGFncmVlLCBpIHdpbGwgc2VuZCBhIHYy
IHdpdGggdGhpcy4KPiAKPiBZZXMgcGxlYXNlLiBCdXQgeW91IHJlYWxseSB3YW50IHRvIGdldCBB
Qi9SQiBmcm9tIEx1a2Fzeiwgc2luY2UgaGUgZG9lcyB0aGUgZ2FkZ2V0IHN0dWZmLgoKT2ssIGkg
d2lsbCBhZGQgTHVrYXN6IGZvciB0aGUgVjIgcmV2aWV3LgoKVGhhbmtzClBhdHJpY2UKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFp
bGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3Rt
MzIK
