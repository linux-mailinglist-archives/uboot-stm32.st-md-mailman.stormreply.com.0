Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C77FC35F648
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Apr 2021 16:36:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7932AC57B76;
	Wed, 14 Apr 2021 14:36:21 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BACB5C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Apr 2021 14:36:19 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 56CC981DC8;
 Wed, 14 Apr 2021 16:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1618410978;
 bh=LLgFmTlaHFoPb7MeHeolVZOm5yccyUkh1A3eTiUHYqA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Mzl76/R71hlu2s+2b/1bpTB6DGmHopiMr68oDelzxwDy+aQs580JS71Mfr0NL4lLv
 PYHacRAxvtJg6iJtS3Xic8rhpj+sH5ecDaNHQOm3xobxvNB1+nItVWqOcr5MzYeTQQ
 T0X28YwdyQvYPMdxJSEIbXGT/8TLVqTlnlk6GBdZZtzZROLZhw0/hbR5AJEyEvtjao
 UAR533/s+2LYRHUZBpL17/ekF0um8h5UqYPSDnHQTQvWeipFEOROL6YnXO26VdrPuf
 DiwULrXpZsLrsl+YV/2/uB6pA5JB19LtqDUQpqRD5F605P6W284W0ATSnX/Iv7x2Ce
 JVGEnwGpW/rEw==
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210409100022.1.I93dea8b89ea632e7d8f2640a6eca6f6e69fed319@changeid>
 <bf1fcbd0-b54e-b03f-1ac2-27475ee747e2@denx.de>
 <68133a1e-5440-0a5d-d5a4-2c1d85ef0c1b@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <5deab9a1-3326-5115-71e2-569aa4077ab6@denx.de>
Date: Wed, 14 Apr 2021 16:36:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <68133a1e-5440-0a5d-d5a4-2c1d85ef0c1b@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Stephen Warren <swarren@nvidia.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 Ramon Fried <rfried.dev@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add support of device
 tree configuration for reset delay
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

T24gNC8xNC8yMSA0OjA3IFBNLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAoKSGksCgo+
IE9uIDQvOS8yMSAyOjIyIFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gNC85LzIxIDEwOjAw
IEFNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+Pj4gVGhlIGdwaW8gcmVzZXQgYXNzZXJ0L2Rl
YXNzZXJ0IGRlbGF5IGFyZSB0b2RheSBoYXJjb2RlZCBpbiBVLUJvb3QgZHJpdmVyCj4+PiBidXQg
dGhlIHZhbHVlIHNob3VsZCBiZSByZWFkIGZyb20gRFQuCj4+Pgo+Pj4gU1RNMzIgdXNlIHRoZSBn
ZW5lcmljIGJpbmRpbmcgZGVmaW5lZCBpbiBsaW51eDoKPj4+IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9uZXQvZXRoZXJuZXQtcGh5LnlhbWwKPj4+Cj4+PiDCoMKgIHJlc2V0LWdw
aW9zOgo+Pj4gwqDCoMKgwqAgbWF4SXRlbXM6IDEKPj4+IMKgwqDCoMKgIGRlc2NyaXB0aW9uOgo+
Pj4gwqDCoMKgwqDCoMKgIFRoZSBHUElPIHBoYW5kbGUgYW5kIHNwZWNpZmllciBmb3IgdGhlIFBI
WSByZXNldCBzaWduYWwuCj4+Pgo+Pj4gwqDCoCByZXNldC1hc3NlcnQtdXM6Cj4+PiDCoMKgwqDC
oCBkZXNjcmlwdGlvbjoKPj4+IMKgwqDCoMKgwqDCoCBEZWxheSBhZnRlciB0aGUgcmVzZXQgd2Fz
IGFzc2VydGVkIGluIG1pY3Jvc2Vjb25kcy4gSWYgdGhpcwo+Pj4gwqDCoMKgwqDCoMKgIHByb3Bl
cnR5IGlzIG1pc3NpbmcgdGhlIGRlbGF5IHdpbGwgYmUgc2tpcHBlZC4KPj4+Cj4+PiDCoMKgIHJl
c2V0LWRlYXNzZXJ0LXVzOgo+Pj4gwqDCoMKgwqAgZGVzY3JpcHRpb246Cj4+PiDCoMKgwqDCoMKg
wqAgRGVsYXkgYWZ0ZXIgdGhlIHJlc2V0IHdhcyBkZWFzc2VydGVkIGluIG1pY3Jvc2Vjb25kcy4g
SWYKPj4+IMKgwqDCoMKgwqDCoCB0aGlzIHByb3BlcnR5IGlzIG1pc3NpbmcgdGhlIGRlbGF5IHdp
bGwgYmUgc2tpcHBlZC4KPj4+Cj4+PiBTZWUgYWxzbyBVLUJvb3Q6IGRvYy9kZXZpY2UtdHJlZS1i
aW5kaW5ncy9uZXQvcGh5LnR4dAo+Pgo+PiBTaW5jZSB0aGlzIGlzIGEgUEhZIHByb3BlcnR5LCBz
aG91bGRuJ3QgdGhhdCBiZSBoYW5kbGVkIGluIAo+PiBkcml2ZXJzL25ldC9waHkvIGluc3RlYWQg
b2YgTUFDIGRyaXZlciA/Cj4gCj4gCj4gSSB3YXMgbXkgZmlyc3QgaWRlYSBidXQgSSBkb24ndCBm
b3VuZCBmb3VuZCB0aGUgY29ycmVjdCBsb2NhdGlvbiBpbiBwaHkgCj4gKGRyaXZlciBvciB1Y2xh
c3MpCj4gCj4gdG8gbWFuYWdlIHRoZXNlIGdlbmVyaWMgcHJvcGVydHkgYW5kIHRoZSBnZW5lcmlj
IHByb3BlcnR5ICJyZXNldC1ncGlvcyIgCj4gd2FzIGFscmVhZHkKPiAKPiBtYW5hZ2VkIGluIGV0
aCBkcml2ZXIsIHNvIEkgY29udGludWUgdG8gcGF0Y2ggdGhlIGRyaXZlci4KPiAKPiAKPiBCdXQg
SSBjb21lIGJhY2sgdG8gdGhpcyBpZGVhIGFmdGVyIHlvdXIgcmVtYXJrLi4uLgo+IAo+ID0+IGlu
IGxpbnV4IHRoZXNlIHByb3BlcnR5IGFyZSBtYW5hZ2VkIGluCj4gCj4gIMKgwqDCoCBkcml2ZXJz
L25ldC9tZGlvL29mX21kaW8uYzo6b2ZfbWRpb2J1c19waHlfZGV2aWNlX3JlZ2lzdGVyCj4gCj4g
IMKgwqDCoCDCoMKgwqAgcGFyc2UgRFQgbm9kZSBhbmQgYWRkIGluZm8gaW4gbWRpbwo+IAo+ICDC
oMKgwqAgZHJpdmVycy9uZXQvcGh5L21kaW9fZGV2aWNlLmM6Om1kaW9fZGV2aWNlX3Jlc2V0Cj4g
Cj4gIMKgwqDCoCDCoMKgwqAgY2FsbGVkIGluwqAgbWRpb19wcm9iZSAvIG1kaW9fcmVtb3ZlCj4g
Cj4gCj4gSW4gbXkgZmlyc3Qgc2VhcmNoLCBJIGRvbid0IGZvdW5kIHRoZSBzYW1lIGxldmVsIGlu
IHRoZSBVLUJvb3QgZHJpdmVycyAKPiBpbiBkcml2ZXJzL25ldC9waHkvCgpOb3RlIHRoYXQgdGhp
cyBpcyBNRElPLXdpZGUgUEhZIHJlc2V0IChlLmcuIHlvdSBjYW4gaGF2ZSBzaW5nbGUgcmVzZXQg
CmxpbmUgY29ubmVjdGVkIHRvIG11bHRpcGxlIFBIWXMgb24gc2luZ2xlIE1ESU8gYnVzKSwgdGhp
cyBpcyBub3QgClBIWS1zcGVjaWZpYyByZXNldC4KCj4gYnV0IEkgbWlzcyB0aGUgdWNsYXNzIGRl
ZmluZWQgaW4gZHJpdmVycy9uZXQvZXRoLXBoeS11Y2xhc3MuYwo+IAo+IAo+IEZpbmFsbHkgSSB0
aGluayBJIG5lZWQgdG8gbWFuYWdlIHRoZSBnZW5lcmljIGJpbmRpbmcgcHJvcGVydHkKPiAKPiAo
cmVzZXQtZ3Bpb3MsIHJlc2V0LWFzc2VydC11cywgcmVzZXQtZGVhc3NlcnQtdXMpIGRpcmVjdGx5
wqAgaW4KPiAKPiA9PiBkcml2ZXJzL25ldC9tZGlvLXVjbGFzcwo+IAo+IAo+IFRoZSBHUElPIFJF
U0VUIHdpbGwgYmUgbWFuYWdlZCBpbiBtZGlvwqAgb3BzOiBwcmVfcHJvYmUvIHBvc3RfcmVtb3Zl
Cj4gCj4gYXMgaXQgaXMgZG9uZSBpbiBsaW51eAo+IAo+IHdhcm5pbmc6IHRvZGF5IHBvc3RfcmVt
b3ZlIG9wcyBkb24ndCBleGl0IGluIHUtY2xhc3MuCj4gCj4gCj4gRG8geW91IHRoaW5rIGl0IGlz
IHRoZSBjb3JyZWN0IGxvY2F0aW9uID8KCkZvciBzaW5nbGUtUEhZIHJlc2V0LCB0aGUgY29ycmVj
dCBsb2NhdGlvbiBpcyBpbiBkcml2ZXJzL25ldC9waHkvIHNvbWV3aGVyZS4KCj4gRG8geW91IHRo
aW5rIGl0IHNob3VsZCBiZSBhIG5ldyBzZXJpZSAobWlncmF0ZSB0aGUgZXFvcyBwcm9wZXJ0eSBp
biBtZGlvKQo+IAo+IGFmdGVyIHRoaXMgZXFvcyBpcyBhY2NlcHRlZAo+IAo+IG9yIEkgc2hvdWRs
IHNlbnQgYSBuZXcgc2VyaWUgdG8gcmVwbGFjZSB0aGlzIHNlcmllLgoKSSdsbCBsZWF2ZSB0aGF0
IGRlY2lzaW9uIHRvIFJhbW9uL0pvZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
