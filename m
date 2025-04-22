Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1281A964C3
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 11:44:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85581C78F67;
	Tue, 22 Apr 2025 09:44:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EABF6C7801A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 09:43:58 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6gAVx003527;
 Tue, 22 Apr 2025 11:43:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 PjJ2F7iqflOaK4liv+7mkmHb6vwWl+NY2o509t7TVeE=; b=FmEATIH/m60Ae1qY
 xy0ZPoIRNBZeUDXZa5xEi7lfiL7sP3UmgOTDQj8hYqMU03QNbawDP1Y5j7sHkSU4
 pVh9a5TVBM0mALRbQTpDqaIW1y8Hiu73ePXdM/7PP9yHTKqNag8ZvguCs2aK3VHv
 vzlExPKB/CSpaJ6NIjfcBXNCBEt4jR+HSlh/DdjVOHUbknXQzHA/9Eg3ghGBGClX
 Myfns9moJch29r7/mxa3MI/mI18zYQHmAqv+W7C4K5kEryKr71uDuEEEN9VIcHig
 kRDHiKcXhYto9ElJ927OQea2FIsc+kE9e7g/mhKm5QBwUcn0cofR2d+uvOm4wy+j
 i7CtDw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 464nd3ycc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 11:43:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CF6AD40061;
 Tue, 22 Apr 2025 11:42:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D7989EB437;
 Tue, 22 Apr 2025 11:42:28 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 11:42:27 +0200
Message-ID: <2be878a1-a4a6-4fd7-9ea7-d2337a4bbad4@foss.st.com>
Date: Tue, 22 Apr 2025 11:42:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250401131413.387139-1-patrice.chotard@foss.st.com>
 <20250401131413.387139-9-patrice.chotard@foss.st.com>
 <993246d8-098b-4849-9c1a-822f2d14f77e@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <993246d8-098b-4849-9c1a-822f2d14f77e@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 08/13] stm32mp1: clk: Update index for DSI
	gate
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

CgpPbiA0LzIyLzI1IDEwOjI0LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpCj4gCj4gT24g
NC8xLzI1IDE1OjE0LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IFNpbmNlIHVwc3RyZWFtIGtl
cm5lbCBjb21taXQgYmRhNzMyZmRhMTkzICgiQVJNOiBkdHM6IHN0bTMyOiBmaXgKPj4gRFNJIHBl
cmlwaGVyYWwgY2xvY2sgb24gc3RtMzJtcDE1IGJvYXJkcyIpLCBEU0kgY2xvY2sgY2FuJ3QgYmUg
ZW5hYmxlZAo+PiBhcyBzaG93biBvbiBmb2xsb3dpbmcgVS1Cb290IGxvZzoKPj4KPj4gTU1DOsKg
wqAgU1RNMzIgU0QvTU1DOiAwCj4+IExvYWRpbmcgRW52aXJvbm1lbnQgZnJvbSBNTUMuLi4gUmVh
ZGluZyBmcm9tIE1NQygwKS4uLiBPSwo+PiBjbGsgaWQgNTcgbm90IGZvdW5kCj4+IHN0bTMyLWRp
c3BsYXktZHNpIGRzaUA1YTAwMDAwMDogcGVyaXBoZXJhbCBjbG9jayBlbmFibGUgZXJyb3IgLTIy
Cj4+IHN0bTMyX2Rpc3BsYXkgZGlzcGxheS1jb250cm9sbGVyQDVhMDAxMDAwOiBwYW5lbCBkZXZp
Y2UgZXJyb3IgLTIyCj4+IEluOsKgwqDCoCBzZXJpYWwKPj4gT3V0OsKgwqAgc2VyaWFsCj4+IEVy
cjrCoMKgIHNlcmlhbAo+PiBOZXQ6wqDCoCBldGgwOiBldGhlcm5ldEA1ODAwYTAwMAo+Pgo+PiBV
cGRhdGUgY2xrLXN0bTMybXAxIGRyaXZlciBhY2NvcmRpbmdseS4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+
Pgo+PiDCoCBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDEuYyB8IDIgKy0KPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDEuYyBiL2RyaXZlcnMvY2xrL3N0bTMy
L2Nsay1zdG0zMm1wMS5jCj4+IGluZGV4IDQwNDRlZGZiNzY4Li4yMDRhNGI3ZGU0NSAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMybXAxLmMKPj4gKysrIGIvZHJpdmVy
cy9jbGsvc3RtMzIvY2xrLXN0bTMybXAxLmMKPj4gQEAgLTU1MCw3ICs1NTAsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHN0bTMybXAxX2Nsa19nYXRlIHN0bTMybXAxX2Nsa19nYXRlW10gPSB7Cj4+
IMKgIMKgwqDCoMKgwqAgU1RNMzJNUDFfQ0xLX1NFVF9DTFJfRihSQ0NfTVBfQVBCNEVOU0VUUiwg
MCwgTFREQ19QWCwgX1BMTDRfUSksCj4+IMKgwqDCoMKgwqAgU1RNMzJNUDFfQ0xLX1NFVF9DTFJf
RihSQ0NfTVBfQVBCNEVOU0VUUiwgNCwgRFNJX1BYLCBfUExMNF9RKSwKPj4gLcKgwqDCoCBTVE0z
Mk1QMV9DTEtfU0VUX0NMUihSQ0NfTVBfQVBCNEVOU0VUUiwgNCwgRFNJX0ssIF9EU0lfU0VMKSwK
Pj4gK8KgwqDCoCBTVE0zMk1QMV9DTEtfU0VUX0NMUihSQ0NfTVBfQVBCNEVOU0VUUiwgNCwgRFNJ
LCBfRFNJX1NFTCksCj4+IMKgwqDCoMKgwqAgU1RNMzJNUDFfQ0xLX1NFVF9DTFIoUkNDX01QX0FQ
QjRFTlNFVFIsIDgsIEREUlBFUkZNLCBfVU5LTk9XTl9TRUwpLAo+PiDCoMKgwqDCoMKgIFNUTTMy
TVAxX0NMS19TRVRfQ0xSKFJDQ19NUF9BUEI0RU5TRVRSLCAxNSwgSVdERzIsIF9VTktOT1dOX1NF
TCksCj4+IMKgwqDCoMKgwqAgU1RNMzJNUDFfQ0xLX1NFVF9DTFIoUkNDX01QX0FQQjRFTlNFVFIs
IDE2LCBVU0JQSFlfSywgX1VTQlBIWV9TRUwpLAo+IAo+IAo+IFNlZSBkb3duIHN0cmVhbSBwYXRo
OiAiY2xrOiBzdG0zMm1wMTogZml4IERTSSBjbG9jayBzZXR0aW5nIgoKUmlnaHQsIGkgbWlzc2Vk
IHRoaXMgb25lLgoKPiAKPiBpbiBmYWN0IGJvdGggY2xvY2ssIERTSV9LIGFuZCBEU0kgYXJlIHN1
cHBvcnRlZCwgd2l0aCB0aGUgb3RoZXIgc291cmNlIGNsb2NrCj4gCj4gwqDCoMKgwqAgU1RNMzJN
UDFfQ0xLX1NFVF9DTFJfRihSQ0NfTVBfQVBCNEVOU0VUUiwgNCwgRFNJX1BYLCBfUExMNF9RKSwK
PiDCoMKgwqDCoFNUTTMyTVAxX0NMS19TRVRfQ0xSKFJDQ19NUF9BUEI0RU5TRVRSLCA0LCBEU0lf
SywgX0RTSV9TRUwpLAo+ICvCoMKgwqAgU1RNMzJNUDFfQ0xLX1NFVF9DTFIoUkNDX01QX0FQQjRF
TlNFVFIsIDQsIERTSSwgX1BMTDRfUCksCj4gwqDCoMKgwqAgU1RNMzJNUDFfQ0xLX1NFVF9DTFIo
UkNDX01QX0FQQjRFTlNFVFIsIDgsIEREUlBFUkZNLCBfVU5LTk9XTl9TRUwpLAo+IMKgwqDCoMKg
IFNUTTMyTVAxX0NMS19TRVRfQ0xSKFJDQ19NUF9BUEI0RU5TRVRSLCAxNSwgSVdERzIsIF9VTktO
T1dOX1NFTCksCj4gCj4gPT4ganVzdCBuZWVkIHRvIGFkZCB0aGUgIkRTSSIgY2xvY2sgd2l0aCBz
YW1lIGJpdCBidXQgd2l0aCAiUExMNF9QIiBhcyBzb3VyY2UKClRoYW5rcwpQYXRyaWNlCgo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0z
MiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9v
dC1zdG0zMgo=
