Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 254D4B14904
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Jul 2025 09:21:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7999BC35E00;
	Tue, 29 Jul 2025 07:21:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D87DFC36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 07:21:37 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T6bKaX030155;
 Tue, 29 Jul 2025 09:21:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Sv2xldQtzkoI/gtB5+jb/R4h6uQmwahEiRhT6IAOcmk=; b=r1RVUv2W+18sqJa3
 CorOqzZejX6Pa6TTQOCwPGAoA9F6VJaumaMCIA0wyzWQiRXkygnIuzg+dIyuPndF
 mMB0i83gaPKheBD+vsSUbdwGugRdzxVcC7m0Vgmcgb2eM84iexYVCiMwscmLXfDI
 0/zoP2L7URfiooQspr4JSOPz7458BJy+l3bSQa54bl7LroSC5saIbf6Z6C9BFJA1
 I8Zbz8RMTv1U1mVH7g+zOjocZ7AZVuGiY9ws0Fp07uo3+kbBZqLTHxxN5TIsOpdm
 SZXYv+90j8W1JXY2T6IsQ2kkl+wtqjOl0dE9hWNJCEstoYaH7L/7D5zjtA/aRwRH
 jKQ/WA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484memkwnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jul 2025 09:21:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6A75640057;
 Tue, 29 Jul 2025 09:20:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8BC4D6B8C9D;
 Tue, 29 Jul 2025 09:19:29 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Jul
 2025 09:19:28 +0200
Message-ID: <d7c98212-4226-4326-a020-024889b0df2e@foss.st.com>
Date: Tue, 29 Jul 2025 09:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, Patrick DELAUNAY
 <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
 <20250512172149.150214-2-marek.vasut@mailbox.org>
 <ce033305-387b-4732-a711-5a4a9f4237e3@foss.st.com>
 <43ba9ad2-e2df-44e3-9bc0-1b7e343ff1b3@mailbox.org>
 <7211233b-a1dd-489a-82fb-73e2d5dbb0cf@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <7211233b-a1dd-489a-82fb-73e2d5dbb0cf@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 01/10] ARM: stm32: Add STM32MP13xx SPL
	Kconfig options
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

CgpPbiA3LzI5LzI1IDA2OjA1LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA2LzI5LzI1IDk6MDgg
UE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IAo+IEhpLAo+IAo+Pj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybS9tYWNoLXN0bTMybXAvS2NvbmZpZy4xM3ggYi9hcmNoL2FybS9tYWNoLSBzdG0zMm1wL0tj
b25maWcuMTN4Cj4+Pj4gaW5kZXggYmM4YjNmOGNmNzcuLmNlY2Y5ZTNiOGM3IDEwMDY0NAo+Pj4+
IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9LY29uZmlnLjEzeAo+Pj4+ICsrKyBiL2FyY2gv
YXJtL21hY2gtc3RtMzJtcC9LY29uZmlnLjEzeAo+Pj4+IEBAIC0yMCw3ICsyMCw4IEBAIGNvbmZp
ZyBUQVJHRVRfU1RfU1RNMzJNUDEzWAo+Pj4+IMKgIGVuZGNob2ljZQo+Pj4+IMKgIGNvbmZpZyBU
RVhUX0JBU0UKPj4+PiAtwqDCoMKgIGRlZmF1bHQgMHhDMDAwMDAwMAo+Pj4+ICvCoMKgwqAgZGVm
YXVsdCAweEMwMDAwMDAwIGlmIFRGQUJPT1QKPj4+PiArwqDCoMKgIGRlZmF1bHQgMHhDMDEwMDAw
MCBpZiAhVEZBQk9PVAo+Pj4+IMKgIGNvbmZpZyBQUkVfQ09OX0JVRl9BRERSCj4+Pj4gwqDCoMKg
wqDCoCBkZWZhdWx0IDB4QzA4MDAwMDAKPj4+Cj4+Pgo+Pj4gSSBkb24ndCB1bmRlcnN0b29kwqAg
d2h5IHlvdSBtb2RpZnkgVEVYVF9CQVNFIGhlcmUuCj4+IExvYWRpbmcgb2YgZGF0YSB0byB0aGUg
dmVyeSBiZWdpbm5pbmcgb2YgRFJBTSBtYXkgZmFpbCBpbiBjYXNlIHRoZSBkYXRhIGFyZSB3cmFw
cGVkIGluIHZhcmlvdXMgY29udGFpbmVyIGltYWdlIHR5cGVzLCBiZWNhdXNlIHRoZSBpbWFnZSBs
b2FkZXIgaW4gU1BMIG1heSB1c2UgdGhlIGFyZWEgYmVmb3JlIHRoZSBkYXRhIGxvYWQgYWRkcmVz
cyB0byBsb2FkIGZvciBleGFtcGxlIGltYWdlIGhlYWRlcihzKSBpbiB0aGVyZS4gVGhpcyBpcyBv
bmUgZXhhbXBsZSBvZiBzdWNoIGhlYWRlciBsb2FkaW5nLCB3aGljaCBpcyB0cmlnZ2VyZWQgb24g
U1RNMzJNUDEzeHggaW4gU1BMOgo+Pgo+PiBodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC91
LWJvb3QvLS9ibG9iL21hc3Rlci9pbmNsdWRlL3NwbF9sb2FkLmgjTDE4Cj4+Cj4+ICIKPj4gwqDC
oDE4wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbGVnYWN5X2ltZ19oZHIgKmhlYWRlciA9Cj4+IMKg
wqAxOcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNwbF9nZXRfbG9hZF9idWZmZXIo
LXNpemVvZigqaGVhZGVyKSwgc2l6ZW9mKCpoZWFkZXIpKTsKPj4gwqDCoDIwwqDCoMKgwqDCoMKg
wqDCoCB1bG9uZyBiYXNlX29mZnNldCwgaW1hZ2Vfb2Zmc2V0LCBvdmVyaGVhZDsKPj4gwqDCoDIx
wqDCoMKgwqDCoMKgwqDCoCBpbnQgcmVhZCwgcmV0Owo+PiDCoMKgMjIKPj4gwqDCoDIzwqDCoMKg
wqDCoMKgwqDCoCBsb2dfZGVidWcoIlxubG9hZGluZyBoZHIgZnJvbSAlbHggdG8gJXBcbiIsICh1
bG9uZylvZmZzZXQsIGhlYWRlcik7Cj4+IMKgwqAyNMKgwqDCoMKgwqDCoMKgwqAgcmVhZCA9IGlu
Zm8tPnJlYWQoaW5mbywgb2Zmc2V0LCBBTElHTihzaXplb2YoKmhlYWRlciksCj4+IMKgwqAyNSBz
cGxfZ2V0X2JsX2xlbihpbmZvKSksIGhlYWRlcik7Cj4+ICIKPj4KPj4gVGhlIGhlYWRlciBpcyBs
b2FkZWQgYXQgQ09ORklHX1RFWFRfQkFTRSAtIHNpemVvZigqaGVhZGVyKS4gSWYgQ09ORklHX1RF
WFRfQkFTRSBpcyBzdGFydCBvZiBEUkFNIHdpdGggbm8gdXNhYmxlIG1lbW9yeSByaWdodCBiZWxv
dyBpdCBBTkQgc2l6ZW9mKCpoZWFkZXIpIGlzIG5vbi16ZXJvLCB0aGVuIHRoaXMgbG9hZGluZyB3
aWxsIGZhaWwuCj4+Cj4+IFRoYXQncyB3aHkgdGhlIFRFWFRfQkFTRSBpcyBzaGlmdGVkIGEgYml0
IGhpZ2hlciBpbiB0aGlzIHBhdGNoLgo+IAo+IEFueSBuZXdzIG9uIHRoaXMgc2VyaWVzID8gSXQg
d291bGQgYmUgZ29vZCB0byBtb3ZlIHRoaXMgYWxvbmcuCj4gCkhpIE1hcmVrCgpTb3JyeSBmb3Ig
dGhlIGRlbGF5LCBpIGFtIGJhY2sgZnJvbSB2YWNhdGlvbi4gSSB3aWxsIHByZXBhcmUgcHVsbCBy
ZXF1ZXN0IHNvb24uCgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
