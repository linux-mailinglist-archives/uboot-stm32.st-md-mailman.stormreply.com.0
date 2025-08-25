Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F5AB344B5
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Aug 2025 16:55:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E16FCC3FAD7;
	Mon, 25 Aug 2025 14:55:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C59EC349C3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 14:55:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PEn0Sx011055;
 Mon, 25 Aug 2025 16:55:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Xy1BVsRmOPVRI+fkqlCz035H/h35ZfPH0eFcWaJ++3s=; b=lAalALpCHTsPqwiU
 aSpjgkp8pu743+UCRULsmxQki/dCpbjgRMIf0TjMczCEog3esF/XZzt8bQoqt4Hi
 vKqh+nEl2TfO1bhp0uvW1m/YM8QViQEiy5XPJSPgTPmb4cR3a0AQzYrbMRv0FOjI
 SzJtdO9pRnIDZSJnlzPApQrWNqmnuAKjOfdVCVSCp0UTMKgdMd006wyRGMoAHfUQ
 5gX/+CJTZtYSeZDmKj7xN6adVvGp4LSbzyFryAmxfu9hXX2/FRkWaAQZXgKnsjYc
 7G2Qy6pzBZW8Lz+kHerII4xf0xp5FpxYu5WfV761IqRpeAjjLPnPDyN/rcHldWDc
 CbgxlQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48q626evjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Aug 2025 16:55:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3923C40044;
 Mon, 25 Aug 2025 16:54:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C1496C25EF;
 Mon, 25 Aug 2025 16:53:59 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 25 Aug
 2025 16:53:58 +0200
Message-ID: <476e3428-254b-4df2-8ff1-37d28fc0eb1d@foss.st.com>
Date: Mon, 25 Aug 2025 16:53:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250814120938.1358059-1-patrice.chotard@foss.st.com>
 <a10f97cf-72d8-4f82-870f-cb845e5cb72e@mailbox.org>
 <626aac73-10f5-4514-a6ea-0b67a7b2d45b@foss.st.com>
 <81059c20-971d-43ce-ac98-421329efe938@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <81059c20-971d-43ce-ac98-421329efe938@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] configs: stm32mp25: Enable
	OF_UPSTREAM_BUILD_VENDOR
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

CgpPbiA4LzE5LzI1IDEyOjU0LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA4LzE0LzI1IDU6MjMg
UE0sIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToKPj4KPj4KPj4gT24gOC8xNC8yNSAxNTozNywgTWFy
ZWsgVmFzdXQgd3JvdGU6Cj4+PiBPbiA4LzE0LzI1IDI6MDkgUE0sIFBhdHJpY2UgQ2hvdGFyZCB3
cm90ZToKPj4+PiBJbml0aWFsbHksIG9ubHkgb25lIFNUTTMyTVAyNSBiYXNlZCBib2FyZCB3YXMg
YXZhaWxhYmxlLCB0aGUKPj4+PiBzdG0zMm1wMjU3Zi1ldjEgYm9hcmQgd2hpY2ggd2FzIHNldCBi
eSBkZWZhdWx0IGluIHN0bTMybXAyNV9kZWZjb25maWcuCj4+Pj4KPj4+PiBTaW5jZSBjb21taXQg
NzlmM2U3NzEzM2JkICgiU3VidHJlZSBtZXJnZSB0YWcgJ3Y2LjE2LWR0cycgb2YgZHRzIHJlcG8g
WzFdIGludG8gZHRzL3Vwc3RyZWFtIikKPj4+PiB3ZSBpbmhlcml0ZWQgb2YgYSBzZWNvbmQgTVAy
NSBiYXNlZCBib2FyZCB3aGljaCBpcyB0aGUgc3RtMzJtcDI1N2YtZGsgYm9hcmQuCj4+Pj4KPj4+
PiBFbmFibGUgT0ZfVVBTVFJFQU1fQlVJTERfVkVORE9SIGFuZCBzZXQgT0ZfVVBTVFJFQU1fVkVO
RE9SIHRvIGFsbG93IGFsbAo+Pj4+IFNUTWljcm9lbGVjdHJvbmljcyBEVCBjb21waWxhdGlvbi4K
Pj4+IElmIEkgYnVpbGQgc3RtMzJtcDI1X2RlZmNvbmZpZyAsIEkgY2FuIHJ1biB0aGUgcmVzdWx0
IG9uIGJvdGggRVYxIGFuZCBESyBub3cgPwo+Pj4KPj4KPj4gV2l0aCB0aGlzIHBhdGNoIHllcwo+
Pgo+Pj4gSXQgc2VlbXMgb25seSB0aGUgRVYxIERUIGlzIGJ1aWx0IGludG8gdGhlIGJpbmFyeSwg
c28gd2h5IGNvbXBpbGUgYWxsIERUcyA/Cj4+Cj4+IEJ5IGRlZmF1bHQgeWVzLCBvbmx5IEVWMSBE
VCBpcyBidWlsdC4gdGhhdCdzIHdoeSBPRl9VUFNUUkVBTV9CVUlMRF9WRU5ET1IgaXMgbmVlZGVk
IHRvCj4+IGFsbG93IGFsbCBvdGhlciBzdC8qLmR0YiB0byBiZSBidWlsdC4KPj4KPj4+Cj4+PiAk
IGdyZXAgVFJFRSBjb25maWdzL3N0bTMybXAyNV9kZWZjb25maWcKPj4+IENPTkZJR19ERUZBVUxU
X0RFVklDRV9UUkVFPSJzdC9zdG0zMm1wMjU3Zi1ldjEiCj4+Pgo+Pgo+PiBDdXJyZW50bHkgaWYg
eW91IHRyeSB0byBidWlsZCBVLUJvb3QgZm9yIHN0bTMybXAyNTdmLWRrIGJvYXJkIHVzaW5nIHRo
ZSBmb2xsb3dpbmcgY29tbWFuZHM6Cj4+Cj4+IG1ha2Ugc3RtMzJtcDI1X2RlZmNvbmZpZwo+PiBt
YWtlIERFVklDRV9UUkVFPXN0L3N0bTMybXAyNTdmLWRrCj4gCj4gUGxlYXNlIGludHJvZHVjZSBk
ZWZjb25maWcgZm9yIGVhY2ggYm9hcmQgaW5zdGVhZCBvZiB0aGlzIGhhY2thZ2UgLgo+IAo+IExv
b2sgYXQgdGhpcyBleGFtcGxlIG9uIGhvdyB0byB1c2UgI2luY2x1ZGUgaW4gZGVmY29uZmlnIGZp
bGVzLCBpdCBldmVuIHN1cHBvcnRzIG11bHRpcGxlIGxldmVscyBvZiBjb25maWcgc3RydWN0dXJl
IGZvciBkZWR1cGxpY2F0aW9uIHB1cnBvc2VzOgoKCkkga25vdywgYnV0IGluIGRvd25zdHJlYW0g
d2UgYWxyZWFkeSB1c2Ugb25seSBvbmUgZGVmY29uZmlnIGZvciBhbGwgb3VyIFNUTTMyTVAvMTMv
MTUvMjUgU29Dcy4KSXQgaGFzIGltcGFjdCBvbiBvdXIgaW50ZXJuYWwgYnVpbGQgcHJvY2VzcyBh
bmQgd2UgcHJlZmVyIHRvIGtlZXAgdGhlIHNhbWUgZm9yIGFsbCBvdXIgU29DcyBmYW1pbHkgCgpQ
YXRyaWNlCgo+IAo+ICTCoCBnaXQgZ3JlcCBpbmNsdWRlIGNvbmZpZ3MvaW14KmRoKgo+IGNvbmZp
Z3MvaW14Nl9kaGNvbV9kcmMwMl9kZWZjb25maWc6I2luY2x1ZGUgPGNvbmZpZ3MvZGhfaW14Ni5j
b25maWc+Cj4gY29uZmlncy9pbXg2X2RoY29tX3BkazJfZGVmY29uZmlnOiNpbmNsdWRlIDxjb25m
aWdzL2RoX2lteDYuY29uZmlnPgo+IGNvbmZpZ3MvaW14Nl9kaGNvbV9waWNvaXR4X2RlZmNvbmZp
ZzojaW5jbHVkZSA8Y29uZmlncy9kaF9pbXg2LmNvbmZpZz4KPiBjb25maWdzL2lteDhtcF9kaGNv
bV9kcmMwMl9kZWZjb25maWc6I2luY2x1ZGUgPGNvbmZpZ3MvaW14OG1wX2Roc29tLmNvbmZpZz4K
PiBjb25maWdzL2lteDhtcF9kaGNvbV9wZGsyX2RlZmNvbmZpZzojaW5jbHVkZSA8Y29uZmlncy9p
bXg4bXBfZGhzb20uY29uZmlnPgo+IGNvbmZpZ3MvaW14OG1wX2RoY29tX3BkazNfZGVmY29uZmln
OiNpbmNsdWRlIDxjb25maWdzL2lteDhtcF9kaHNvbS5jb25maWc+Cj4gY29uZmlncy9pbXg4bXBf
ZGhjb21fcGljb2l0eF9kZWZjb25maWc6I2luY2x1ZGUgPGNvbmZpZ3MvaW14OG1wX2Roc29tLmNv
bmZpZz4KPiBjb25maWdzL2lteDhtcF9kaHNvbS5jb25maWc6I2luY2x1ZGUgPGNvbmZpZ3MvaW14
X2Roc29tLmNvbmZpZz4KPiBjb25maWdzL2lteF9kaHNvbS5jb25maWc6I2luY2x1ZGUgPGNvbmZp
Z3MvZGhzb20uY29uZmlnPgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
