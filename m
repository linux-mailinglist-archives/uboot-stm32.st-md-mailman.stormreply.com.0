Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FC37E6655
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Nov 2023 10:11:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2B1AC6B47A;
	Thu,  9 Nov 2023 09:11:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32DA3C6B463
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Nov 2023 09:11:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3A95ZWei023669; Thu, 9 Nov 2023 10:11:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=mes6WEkHQA0LThhK0RPfQMEfWhGzU3DNOYaCc3TuD9M=; b=g9
 zdVF4AV9uhUChUQSdQsGXMhYjD4dz6rIQ8upFZlEtUPXUYVkkcZ0T+UNXctMsu0z
 x+njlhGbOWeeIMG9toI6P+H+k7EjHdZ6Apiaz8Vv6NtESZZmpekhQFOoxfEfoHZP
 vN+NALMgc4XHkOMtAZcjMYbOkojWC+ls4Ch14JHVM5i+0O9ceRkwPS7tZHDq/liC
 rWcreLxxg2ztO+cNSic05Oay5IwE9ZVpvx8TN8X7JP7wktmNd+VdQAQSOEWVUNwN
 0fhjbjFDaVk2fM/bMYUSn1Lc1usmnPCkTO/wbo/sBmMDy5l/CwGr15s5ZVxN0MQt
 C2or+N37l5cf322SxzWQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u8sdns072-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Nov 2023 10:11:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A341110005A;
 Thu,  9 Nov 2023 10:11:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7CFE42053B5;
 Thu,  9 Nov 2023 10:11:16 +0100 (CET)
Received: from [10.201.22.165] (10.201.22.165) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 9 Nov
 2023 10:11:16 +0100
Message-ID: <ca42a456-594f-4b7c-b472-8031412055e7@foss.st.com>
Date: Thu, 9 Nov 2023 10:11:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
 <20231027144304.1002307-2-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20231027144304.1002307-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_07,2023-11-08_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/9] arm: caches: Make
 DCACHE_DEFAULT_OPTION accessible for ARM64 arch
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

SGksCgpPbiAxMC8yNy8yMyAxNjo0MiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+IFRoaXMgZml4
ZXMgdGhlIGZvbGxvd2luZyBjb21waWxhdGlvbiBlcnJvciBpbiBBUk02NDoKPiBhcmNoL2FybS9t
YWNoLXN0bTMybXAvZHJhbV9pbml0LmM6IEluIGZ1bmN0aW9uIOKAmGJvYXJkX2dldF91c2FibGVf
cmFtX3RvcOKAmToKPiBhcmNoL2FybS9tYWNoLXN0bTMybXAvZHJhbV9pbml0LmM6NTk6NDU6IGVy
cm9yOiDigJhEQ0FDSEVfREVGQVVMVF9PUFRJT07igJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGlu
IHRoaXMgZnVuY3Rpb24pCj4gICAgIDU5IHwgIG1tdV9zZXRfcmVnaW9uX2RjYWNoZV9iZWhhdmlv
dXIocmVnLCBzaXplLCBEQ0FDSEVfREVGQVVMVF9PUFRJT04pOwo+ICAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3Nz
LnN0LmNvbT4KPiAtLS0KPgo+ICAgYXJjaC9hcm0vaW5jbHVkZS9hc20vc3lzdGVtLmggfCAxNiAr
KysrKysrKy0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3N5c3RlbS5o
IGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vc3lzdGVtLmgKPiBpbmRleCAwZWFlODU3ZTczYS4uNDNm
NzUwMzU3MWQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vc3lzdGVtLmgKPiAr
KysgYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zeXN0ZW0uaAo+IEBAIC01MTMsMTQgKzUxMyw2IEBA
IGVudW0gZGNhY2hlX29wdGlvbiB7Cj4gICB9Owo+ICAgI2VuZGlmCj4gICAKPiAtI2lmIGRlZmlu
ZWQoQ09ORklHX1NZU19BUk1fQ0FDSEVfV1JJVEVUSFJPVUdIKQo+IC0jZGVmaW5lIERDQUNIRV9E
RUZBVUxUX09QVElPTglEQ0FDSEVfV1JJVEVUSFJPVUdICj4gLSNlbGlmIGRlZmluZWQoQ09ORklH
X1NZU19BUk1fQ0FDSEVfV1JJVEVBTExPQykKPiAtI2RlZmluZSBEQ0FDSEVfREVGQVVMVF9PUFRJ
T04JRENBQ0hFX1dSSVRFQUxMT0MKPiAtI2VsaWYgZGVmaW5lZChDT05GSUdfU1lTX0FSTV9DQUNI
RV9XUklURUJBQ0spCj4gLSNkZWZpbmUgRENBQ0hFX0RFRkFVTFRfT1BUSU9OCURDQUNIRV9XUklU
RUJBQ0sKPiAtI2VuZGlmCj4gLQo+ICAgLyogU2l6ZSBvZiBhbiBNTVUgc2VjdGlvbiAqLwo+ICAg
ZW51bSB7Cj4gICAjaWZkZWYgQ09ORklHX0FSTVY3X0xQQUUKPiBAQCAtNTc4LDYgKzU3MCwxNCBA
QCB2b2lkIHBzY2lfc3lzdGVtX3Jlc2V0KHZvaWQpOwo+ICAgCj4gICAjZW5kaWYgLyogQ09ORklH
X0FSTTY0ICovCj4gICAKPiArI2lmIGRlZmluZWQoQ09ORklHX1NZU19BUk1fQ0FDSEVfV1JJVEVU
SFJPVUdIKQo+ICsjZGVmaW5lIERDQUNIRV9ERUZBVUxUX09QVElPTglEQ0FDSEVfV1JJVEVUSFJP
VUdICj4gKyNlbGlmIGRlZmluZWQoQ09ORklHX1NZU19BUk1fQ0FDSEVfV1JJVEVBTExPQykKPiAr
I2RlZmluZSBEQ0FDSEVfREVGQVVMVF9PUFRJT04JRENBQ0hFX1dSSVRFQUxMT0MKPiArI2VsaWYg
ZGVmaW5lZChDT05GSUdfU1lTX0FSTV9DQUNIRV9XUklURUJBQ0spCj4gKyNkZWZpbmUgRENBQ0hF
X0RFRkFVTFRfT1BUSU9OCURDQUNIRV9XUklURUJBQ0sKPiArI2VuZGlmCj4gKwo+ICAgI2lmbmRl
ZiBfX0FTU0VNQkxZX18KPiAgIC8qKgo+ICAgICogc2F2ZV9ib290X3BhcmFtcygpIC0gU2F2ZSBi
b290IHBhcmFtZXRlcnMgYmVmb3JlIHN0YXJ0aW5nIHJlc2V0IHNlcXVlbmNlCgoKClJldmlld2Vk
LWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgoKVGhh
bmtzClBhdHJpY2sKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
