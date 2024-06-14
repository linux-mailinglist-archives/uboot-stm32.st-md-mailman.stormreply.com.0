Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC2908CF0
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2024 16:03:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82698C6B460;
	Fri, 14 Jun 2024 14:03:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 084ECC5E2CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 14:03:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EClKEn024201;
 Fri, 14 Jun 2024 16:03:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 PvDmdYdSJueNoUDrju5J94Xhbl38hPuHF46j5VbtUs8=; b=s/I3AnzMqExqpd8q
 Lppr7bUNZ3i2WNbxKFcAELKoZworAj2ihIi2SBPGpUaIuQQXTuWChGfzHNw3KDOu
 2POjX0DEnylh81KgNNIhD1aewjvQYu0QPBgO0JTHz17r8ij17giD1RhCyoI+3C0F
 r15qBcmWAjCyMlnsR85H7o4NnVcqvhKssb2f0b+PJ5hlEavGKbSGMJ5kJcCVDIh3
 jx8ZZ9HrWGvlTfNSE1itF5Yo9FnE4gAnErCsyT//XJDfkDWGfcb2Sq6MLwPVvF4o
 HdPCdzMqMN+wKnRSumdpc0WEHxl0Icmt1/o12QvIHjCyrdumVC3btiViitYDatNu
 OS0AGQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp4gvtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 16:03:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BBE9040044;
 Fri, 14 Jun 2024 16:03:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF74C2165F7;
 Fri, 14 Jun 2024 16:02:33 +0200 (CEST)
Received: from [10.252.18.60] (10.252.18.60) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 14 Jun
 2024 16:02:33 +0200
Message-ID: <64efe66a-40d9-4df2-aad6-60e75eb3b0c4@foss.st.com>
Date: Fri, 14 Jun 2024 16:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240419220331.277574-1-marex@denx.de>
 <433560cb-8d8a-4db4-bc9b-d49a05da127b@foss.st.com>
 <ca3c6071-2adf-452b-b4af-574fa57443f9@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ca3c6071-2adf-452b-b4af-574fa57443f9@denx.de>
X-Originating-IP: [10.252.18.60]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_12,2024-06-14_03,2024-05-17_01
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Ping IWDG on exit from PSCI
	suspend code
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

CgpPbiA2LzE0LzI0IDE1OjA2LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA2LzE0LzI0IDI6MDAg
UE0sIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToKPj4KPj4KPj4gT24gNC8yMC8yNCAwMDowMywgTWFy
ZWsgVmFzdXQgd3JvdGU6Cj4+PiBNYWtlIHN1cmUgdGhlIE9TIHdvdWxkIG5vdCBnZXQgYW55IHNw
dXJpb3VzIElXREcgcHJldGltZW91dCBJUlEKPj4+IHJpZ2h0IGFmdGVyIHRoZSBzeXN0ZW0gd2Fr
ZXMgdXAuIFRoaXMgbWF5IGhhcHBlbiBpbiBjYXNlIHRoZSBTb0MKPj4+IGdvdCB3b2tlbiB1cCBi
eSBhbm90aGVyIHNvdXJjZSB0aGFuIHRoZSBJV0RHIHByZXRpbWVvdXQgYW5kIHRoZQo+Pj4gcHJl
dGltZW91dCBJUlEgYXJyaXZlZCBpbW1lZGlhdGVseSBhZnRlcndhcmQsIGJ1dCB0b28gbGF0ZSB0
byBiZQo+Pj4gaGFuZGxlZCBieSB0aGUgc3VzcGVuZCBtYWluIGxvb3AuIEluIGNhc2UgZWl0aGVy
IG9mIHRoZSBJV0RHIGlzCj4+PiBlbmFibGVkLCBwaW5nIGl0IGZpcnN0IGFuZCB0aGVuIHJldHVy
biB0byB0aGUgT1MuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRl
bnguZGU+Cj4+PiAtLS0KPj4+IENjOiBJZ29yIE9wYW5pdWsgPGlnb3Iub3Bhbml1a0Bmb3VuZHJp
ZXMuaW8+Cj4+PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5j
b20+Cj4+PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNv
bT4KPj4+IENjOiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4KPj4+IENjOiBUb20gUmlu
aSA8dHJpbmlAa29uc3Vsa28uY29tPgo+Pj4gQ2M6IHUtYm9vdEBkaC1lbGVjdHJvbmljcy5jb20K
Pj4+IENjOiB1Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+PiAtLS0K
Pj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9wc2NpLmMgfCAyMSArKysrKysr
KysrKysrKysrKysrKysKPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9wc2NpLmMg
Yi9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDEvcHNjaS5jCj4+PiBpbmRleCA0ZjIzNzlk
ZjQ1Zi4uZTk5MTAzOTEwZDkgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAv
c3RtMzJtcDEvcHNjaS5jCj4+PiArKysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDEv
cHNjaS5jCj4+PiBAQCAtODA4LDYgKzgwOCwyNyBAQCB2b2lkIF9fc2VjdXJlIHBzY2lfc3lzdGVt
X3N1c3BlbmQodTMyIF9fYWx3YXlzX3VudXNlZCBmdW5jdGlvbl9pZCwKPj4+IMKgwqDCoMKgwqAg
d3JpdGVsKFNZU0NGR19DTVBFTlJfTVBVRU4sIFNUTTMyX1NZU0NGR19CQVNFICsgU1lTQ0ZHX0NN
UEVOU0VUUik7Cj4+PiDCoMKgwqDCoMKgIGNscmJpdHNfbGUzMihTVE0zMl9TWVNDRkdfQkFTRSAr
IFNZU0NGR19DTVBDUiwgU1lTQ0ZHX0NNUENSX1NXX0NUUkwpOwo+Pj4gwqAgK8KgwqDCoCAvKgo+
Pj4gK8KgwqDCoMKgICogTWFrZSBzdXJlIHRoZSBPUyB3b3VsZCBub3QgZ2V0IGFueSBzcHVyaW91
cyBJV0RHIHByZXRpbWVvdXQgSVJRCj4+PiArwqDCoMKgwqAgKiByaWdodCBhZnRlciB0aGUgc3lz
dGVtIHdha2VzIHVwLiBUaGlzIG1heSBoYXBwZW4gaW4gY2FzZSB0aGUgU29DCj4+PiArwqDCoMKg
wqAgKiBnb3Qgd29rZW4gdXAgYnkgYW5vdGhlciBzb3VyY2UgdGhhbiB0aGUgSVdERyBwcmV0aW1l
b3V0IGFuZCB0aGUKPj4+ICvCoMKgwqDCoCAqIHByZXRpbWVvdXQgSVJRIGFycml2ZWQgaW1tZWRp
YXRlbHkgYWZ0ZXJ3YXJkLCBidXQgdG9vIGxhdGUgdG8gYmUKPj4+ICvCoMKgwqDCoCAqIGhhbmRs
ZWQgYnkgdGhlIG1haW4gbG9vcCBhYm92ZS4gSW4gY2FzZSBlaXRoZXIgb2YgdGhlIElXREcgaXMK
Pj4+ICvCoMKgwqDCoCAqIGVuYWJsZWQsIHBpbmcgaXQgZmlyc3QgYW5kIHRoZW4gcmV0dXJuIHRv
IHRoZSBPUy4KPj4+ICvCoMKgwqDCoCAqLwo+Pj4gKwo+Pj4gK8KgwqDCoCAvKiBQaW5nIElXREcx
IGFuZCBBQ0sgcHJldGltZXIgSVJRICovCj4+PiArwqDCoMKgIGlmIChnaWNfZW5hYmxlZFs0XSAm
IEJJVCgyMikpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZWwoSVdER19LUl9SRUxPQURfS0VZ
LCBTVE0zMl9JV0RHMV9CQVNFICsgSVdER19LUik7Cj4+PiArwqDCoMKgwqDCoMKgwqAgd3JpdGVs
KElXREdfRVdDUl9FV0lDLCBTVE0zMl9JV0RHMV9CQVNFICsgSVdER19FV0NSKTsKPj4+ICvCoMKg
wqAgfQo+Pj4gKwo+Pj4gK8KgwqDCoCAvKiBQaW5nIElXREcyIGFuZCBBQ0sgcHJldGltZXIgSVJR
ICovCj4+PiArwqDCoMKgIGlmIChnaWNfZW5hYmxlZFs0XSAmIEJJVCgyMykpIHsKPj4+ICvCoMKg
wqDCoMKgwqDCoCB3cml0ZWwoSVdER19LUl9SRUxPQURfS0VZLCBTVE0zMl9JV0RHMl9CQVNFICsg
SVdER19LUik7Cj4+PiArwqDCoMKgwqDCoMKgwqAgd3JpdGVsKElXREdfRVdDUl9FV0lDLCBTVE0z
Ml9JV0RHMl9CQVNFICsgSVdER19FV0NSKTsKPj4+ICvCoMKgwqAgfQo+Pj4gKwo+Pj4gwqDCoMKg
wqDCoCAvKgo+Pj4gwqDCoMKgwqDCoMKgICogVGhlIHN5c3RlbSBoYXMgcmVzdW1lZCBzdWNjZXNz
ZnVsbHkuIFJld3JpdGUgTFIgcmVnaXN0ZXIgc3RvcmVkCj4+PiDCoMKgwqDCoMKgwqAgKiBvbiBz
dGFjayB3aXRoICdlcCcgdmFsdWUsIHNvIHRoYXQgb24gcmV0dXJuIGZyb20gdGhpcyBQU0NJIGNh
bGwsCj4+IEFwcGxpZWQgdG8gdS1ib290LXN0bTMyL25leHQKPiAKPiBUaGlzIGlzIGEgZml4LCBz
aG91bGQgZ28gaW50byAvbWFzdGVyIC4KCkFoIHllcyA6LSggLCBpIHdpbGwgc2VuZCBhbm90aGVy
IFBSIGZvciBmaXhlcyBvbiBtb25kYXkKClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcwoKUEF0cmlj
ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1z
dG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91
Ym9vdC1zdG0zMgo=
