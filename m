Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F0F9F6303
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 11:31:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C97BBC78012;
	Wed, 18 Dec 2024 10:31:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9624C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:31:12 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI7p9Iw007677;
 Wed, 18 Dec 2024 11:30:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Qj8nYAeLKnxt3XIsgesskRCyvYRpkGFs0X60og4r6hg=; b=0xt5HHHkgmVNx6jP
 yDbowyh1VlJ+JtI+UTrm3x3bWOaMuOjGGWg3y1TdO6l27TCmDw6YZty4PGPGwzth
 d0l06+klkfjNR505VYigIeQvCWyUiLZNiPeOSCBvnNfpYS0tzSC+R7J8FzL6Gb/9
 KeDG5xbEXSbfb1iJ2hpENQxtQs/1K1Gym/53utaSnWvSdorAOUbl/nWjXQrzZrFW
 ryQpJeUWgoQ6OLrnde/o4GCEyWGwcAJaUOo6riqJeScGFE85kzyY5EL3FgnYSp/5
 qUKAoB4Sww5L4P+uoXC69z4pjlcIbwQq87C90Aqh/1gRmDpZwtW3i7JPdHtElW8X
 U7IbnA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ktca0qkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 11:30:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7783F40075;
 Wed, 18 Dec 2024 11:29:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E717425C24A;
 Wed, 18 Dec 2024 11:28:08 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 11:28:08 +0100
Message-ID: <290b3572-bc50-410d-bba0-3e204e68bc56@foss.st.com>
Date: Wed, 18 Dec 2024 11:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20241218075833.2049241-1-patrice.chotard@foss.st.com>
 <268def1b-0b7f-453b-b079-885ea3e49bb4@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <268def1b-0b7f-453b-b079-885ea3e49bb4@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Greg Malysa <greg.malysa@timesys.com>, Paul Kocialkowski <contact@paulk.fr>,
 Hiago De Franco <hiago.franco@toradex.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Subject: Re: [Uboot-stm32] [PATCH] Kconfig: Set STACK_SIZE to 16KB for STM32
	MCUs
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

CgpPbiAxMi8xOC8yNCAxMDo1OSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaQo+IAo+IE9u
IDEyLzE4LzI0IDA4OjU4LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IFNpbmNlIGNvbW1pdCA2
NTM0ZDI2ZWU5YTUgKCJsbWI6IGRvIGF3YXkgd2l0aCBhcmNoX2xtYl9yZXNlcnZlKCkiKSwKPj4g
U1RNMzJGNzQ2LWRpc2NvIGhhbmdzIHdoZW4gbG9hZGluZyBkZXZpY2UgdHJlZSBqdXN0IGJlZm9y
ZSBzdGFydGluZwo+PiBrZXJuZWw6Cj4+Cj4+IFJldHJpZXZpbmcgZmlsZTogL3N0bTMyZjc0Ni1k
aXNjby5kdGIKPj4gS2VybmVsIGltYWdlIEAgMHhjMDAwODAwMCBbIDB4MDAwMDAwIC0gMHgxOWFl
MDAgXQo+PiBGbGF0dGVuZWQgRGV2aWNlIFRyZWUgYmxvYiBhdCBjMDQwODAwMAo+PiDCoMKgwqAg
Qm9vdGluZyB1c2luZyB0aGUgZmR0IGJsb2IgYXQgMHhjMDQwODAwMAo+PiBXb3JraW5nIEZEVCBz
ZXQgdG8gYzA0MDgwMDAKPj4gwqDCoMKgIExvYWRpbmcgRGV2aWNlIFRyZWUgdG8gYzA1ZjgwMDAs
IGVuZCBjMDVmZjcxYyAuLi4KPj4KPj4gQWRqdXN0IFNUQUNLX1NJWkUgdG8gMTZLQiBmb3IgU1RN
MzIgTUNVcyAoRjQvRjcgYW5kIEg3KSBib2FyZHMKPj4gdG8gZml4IGtlcm5lbCBib290IHByb2Nl
c3MgYXMgc29tZSBvZiB0aGVzZSBib2FyZHMgZW1iZWRzIGEgbGltaXRlZAo+PiBhbW91bnQgb2Yg
bWVtb3J5Lgo+Pgo+PiBGaXhlczogNjUzNGQyNmVlOWE1ICgibG1iOiBkbyBhd2F5IHdpdGggYXJj
aF9sbWJfcmVzZXJ2ZSgpIikKPiAKPiAKPiBJIHRoaW5rIGl0IGlzIGFsc28gbGlua2VkIHRvIGFu
IG90aGVyIGNvbW1pdAo+IAo+IEZpeGVzOjc0Yjg2OWJhZTc0YyAoImVmaV9sb2FkZXI6IHVzZSBD
T05GSUdfU1RBQ0tfU0laRSBpbiB0aGUgVUVGSSBzdWItc3lzdGVtIikKPiAKPiBiZWZvcmUgdGhl
IHBhdGNoIENPTkZJR19TRVRfU1RBQ0tfU0laRSB3YXMgbm90IGRlZmluZWQgZm9yIEFMTCBBUk0g
cGxhdGZvcm0KPiAKPiBTbyBDT05GSUdfU1RBQ0tfU0laRSB3YXMgbm90IGRlZmluZWTCoCAvIGFu
ZCB3YXMgbm8gdXNlZCBpbiBwbGF0Zm9ybQo+IAo+IChVLUJvb3Qgc3RhY2sgdXAgdG8gZW5kIG9m
IHRoZSBVLUJvb3QgYXJlYSkKPiAKPiBhZnRlciB0aGUgcGF0Y2ggdGhlIENPTkZJR19TVEFDS19T
SVpFaXMgc2V0IGEgMTZNQiBmb3IgYWxsIHBsYXRmb3JtLCBldmVuIGlmIEVGSSBpcyBub3QgdXNl
ZAo+IAo+IAo+ICtjb25maWcgU1RBQ0tfU0laRQo+ICvCoMKgwqAgaGV4ICJEZWZpbmUgbWF4IHN0
YWNrIHNpemUgdGhhdCBjYW4gYmUgdXNlZCBieSBVLUJvb3QiCj4gCj4gK8KgwqDCoCBkZWZhdWx0
IDB4NDAwMDAwMCBpZiBBUkNIX1ZFUlNBTCB8fCBBUkNIX1pZTlFNUAo+ICvCoMKgwqAgZGVmYXVs
dCAweDIwMDAwMCBpZiBNSUNST0JMQVpFCj4gK8KgwqDCoCBkZWZhdWx0IDB4MTAwMDAwMAo+IAo+
IAo+IDE2TUIgaXMgbmVlZGVkIE9OTFkgZm9yIEVGSSBsb2FkZXIgY2FzZXMsIGZvciBvdGhlciBw
bGF0Zm9ybSB0aGF0IHNlZW1zIGh1Z2UuCj4gCj4gCj4gQEhlaW5yaWNoOiBkbyB5b3UgdGhpbmsg
eW91IGNhbiBhZGQgdGhpcyBjb25kaXRpb24gQ09ORklHX0VGSV9MT0FERVIgdG8gYXZvaWQgaXNz
dWUgZm9yIG90aGVyIHBsYXRmb3JtcyA9Cj4gCj4gU28gdXNlIDE2TUIgKHByZXZpb3VzbHkgaGFy
ZGNvZGVkIGluIGxpYi9lZmlfbG9hZGVyL2VmaV9tZW1vcnkuYyB3aXRoIGFkZF91X2Jvb3RfYW5k
X3J1bnRpbWUoKSApCj4gCj4gwqDCoMKgIGRlZmF1bHQgMHgxMDAwMDAwIGlmIEVGSV9MT0FERVIK
PiAKPiAKPiBhbmQgc28gZm9yY2UgdGhlIG90aGVyIHBsYXRmb3JtcyB0byBkZWZpbmUgdGhlIENP
TkZJR19TVEFDS19TSVpFIChub3cgdXNlZCBpbiBMTUIpIHdpdGggYW4gYWRlcXVhdGUgdmFsdWUg
Pwo+IAo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hv
dGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIEtjb25maWcgfCAxICsKPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9LY29uZmlnIGIv
S2NvbmZpZwo+PiBpbmRleCAxZjViMGYxOTcyZC4uYzA4N2E0MjBhMjQgMTAwNjQ0Cj4+IC0tLSBh
L0tjb25maWcKPj4gKysrIGIvS2NvbmZpZwo+PiBAQCAtNTc4LDYgKzU3OCw3IEBAIGNvbmZpZyBT
VEFDS19TSVpFCj4+IMKgwqDCoMKgwqAgaGV4ICJEZWZpbmUgbWF4IHN0YWNrIHNpemUgdGhhdCBj
YW4gYmUgdXNlZCBieSBVLUJvb3QiCj4+IMKgwqDCoMKgwqAgZGVmYXVsdCAweDQwMDAwMDAgaWYg
QVJDSF9WRVJTQUxfTkVUIHx8IEFSQ0hfVkVSU0FMIHx8IEFSQ0hfWllOUU1QCj4+IMKgwqDCoMKg
wqAgZGVmYXVsdCAweDIwMDAwMCBpZiBNSUNST0JMQVpFCj4+ICvCoMKgwqAgZGVmYXVsdCAweDQw
MDAgaWYgQVJDSF9TVE0zMgo+PiDCoMKgwqDCoMKgIGRlZmF1bHQgMHgxMDAwMDAwCj4+IMKgwqDC
oMKgwqAgaGVscAo+PiDCoMKgwqDCoMKgwqDCoCBEZWZpbmUgTWF4IHN0YWNrIHNpemUgdGhhdCBj
YW4gYmUgdXNlZCBieSBVLUJvb3QuIFRoaXMgdmFsdWUgaXMgdXNlZAo+IAo+IAo+IEFueXdheSBm
b3IgdGhpcyBTVE0zMiBNQ1UgcGF0Y2g6Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVs
YXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmlj
awo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9uZXh0CgpUaGFua3MKUGF0cmljZQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWls
aW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0z
Mgo=
