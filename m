Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E49C65C423
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 17:43:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 381D5C65E56;
	Tue,  3 Jan 2023 16:43:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47285C65E55
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 16:43:50 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303GC478011172; Tue, 3 Jan 2023 17:43:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=FzxBYwQH/NZlydceuVFlH/JRNg1fNMbsxKi8t1HQT6o=;
 b=iamBnCx28Z+ZhaSzNoQrgaUluckFL/zzxwkVO5boQPrBCf99aDjiMgNlc2I58IHwmjiY
 gO7WIWsRIBDI/f7MWmGeN4SZ9mUVu+2a6tWZpawTW4wDN4ywRrsPBjaeWfI9gLrfaqO+
 yDIjGlZJLPnh408zZ/dse6OAbKG2xLPHptpXabakswxECatCODsT1GtrwcMTXyuSRwj2
 2FBGZs/+aCP/Kih3H2VkX3D/yhiGfudhczM54aFILrgLGmSEha2spRQ7gGukIS+EV6Yy
 kjBsCO7Ji3Y1wUv5l38c0IUeBXHNz4PhaU4N5sH2Vibgl149v0HyUVfHDpNocsKi02jv Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtda65ypa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 17:43:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9E9DD10002A;
 Tue,  3 Jan 2023 17:43:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93DE422D172;
 Tue,  3 Jan 2023 17:43:48 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 17:43:47 +0100
Message-ID: <17e909a1-7771-3a5e-f187-968b102ff882@foss.st.com>
Date: Tue, 3 Jan 2023 17:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221212104437.15838-1-fabrice.gasnier@foss.st.com>
 <20221212104437.15838-4-fabrice.gasnier@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20221212104437.15838-4-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_05,2023-01-03_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32: add support for
 USB2514B onboard hub on stm32mp157c-ev1
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

SGksCgpPbiAxMi8xMi8yMiAxMTo0NCwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgo+IEFkZCBzdXBw
b3J0IGZvciBVU0IyNTE0QiBvbmJvYXJkIGh1YiBvbiBzdG0zMm1wMTU3YyBFVjEgYm9hcmQuIFRo
ZSBIVUIKPiBpcyBzdXBwbGllZCBieSBhIDN2MyBQTUlDIHJlZ3VsYXRvci4KPgo+IFtiYWNrcG9y
dCBmcm9tIGxpbnV4IGFkOTU5MWIwMWQyNF0KPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEdhc25p
ZXIgPGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KPiAtLS0KPgo+ICAgYXJjaC9hcm0vZHRz
L3N0bTMybXAxNTdjLWV2MS5kdHMgfCA4ICsrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWV2
MS5kdHMgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2MtZXYxLmR0cwo+IGluZGV4IGQxNDJkZDMw
ZTE2Yi4uMDdiY2Q3YzUwNjcyIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3
Yy1ldjEuZHRzCj4gKysrIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMKPiBAQCAt
MzYyLDYgKzM2MiwxNCBAQAo+ICAgJnVzYmhfZWhjaSB7Cj4gICAJcGh5cyA9IDwmdXNicGh5Y19w
b3J0MD47Cj4gICAJc3RhdHVzID0gIm9rYXkiOwo+ICsJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4g
Kwkjc2l6ZS1jZWxscyA9IDwwPjsKPiArCS8qIG9uYm9hcmQgSFVCICovCj4gKwlodWJAMSB7Cj4g
KwkJY29tcGF0aWJsZSA9ICJ1c2I0MjQsMjUxNCI7Cj4gKwkJcmVnID0gPDE+Owo+ICsJCXZkZC1z
dXBwbHkgPSA8JnYzdjM+Owo+ICsJfTsKPiAgIH07Cj4gICAKPiAgICZ1c2JvdGdfaHMgewoKClJl
dmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29t
PgpUZXN0ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5j
b20+CgoKSSBqdXN0IHRlc3QgdGhlIHN1cHBseSByZWd1bGF0b3Igc3VwcG9ydCBvbiBFVjEgd2hl
biB0aGUgcG9ydCBpcyB1c2VkCgphbmQgdGhlIHJlZ3VsYXRvciBpcyBubyBtb3JlIGFsd2F5cy1v
bi4KCndpdGggbW9kaWZpY2F0aW9uIGluIC4vYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWVkMS5k
dHM6MjI0CgogwqDCoCDCoMKgwqDCoCDCoMKgwqAgdjN2MzogYnVjazQgewogwqDCoCDCoMKgwqDC
oCDCoMKgwqAgwqDCoMKgIHJlZ3VsYXRvci1uYW1lID0gInYzdjMiOwotwqDCoCDCoMKgwqDCoCDC
oMKgwqAgwqDCoMKgIHJlZ3VsYXRvci1hbHdheXMtb247CgoKVGhhbmtzClBhdHJpY2sKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
