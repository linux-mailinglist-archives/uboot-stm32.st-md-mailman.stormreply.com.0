Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3DA7E7C76
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Nov 2023 14:20:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5373C6B44F;
	Fri, 10 Nov 2023 13:20:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24435C6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 13:20:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AADAguh002479; Fri, 10 Nov 2023 14:20:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=h0tN4jaMzy51YpPv53zw1WyPFUCEhVuQdZX+TZMTqgk=; b=li
 i127MuXf5gWjKJvYTmzgdxpeyJXyvsT6wa8VuJ9cKKNYOJzkKH2PuOhilOdaNBRy
 cW1Z/U7q5fBupL/1AWV022fzkYXCuHnKFftXbr3pyK7h9L/7Zqj2XpppcdXvxzB9
 JMWvq/oq5HFyAeRSbDlnO8Re8pPQzV8N0uovQHClPxuwebRhdySuRU0aWzOfMcI0
 9yu1eQHmFLpxGSfi0z8foFUpyF54z6paOBvAK9xUFlwbuxzA4hUI7SOHqg1tgXhB
 xHQRn6Qza/Cl15F9o8GhJya6anz7gSeOStRSuBQ7/kFwxF36LIiQ/z1rf8XEjPRx
 /nfLdENqEfU7aiqj8Wmg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u7w26p8h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 14:20:41 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 12B9E100056;
 Fri, 10 Nov 2023 14:20:39 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD3C625E535;
 Fri, 10 Nov 2023 14:20:39 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 10 Nov
 2023 14:20:39 +0100
Message-ID: <ffbd0946-57a5-48bd-9ace-d1ff7b9feab3@foss.st.com>
Date: Fri, 10 Nov 2023 14:20:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
 <20231027144304.1002307-2-patrice.chotard@foss.st.com>
 <ca42a456-594f-4b7c-b472-8031412055e7@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ca42a456-594f-4b7c-b472-8031412055e7@foss.st.com>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_10,2023-11-09_01,2023-05-22_02
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAxMS85LzIzIDEwOjExLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDEwLzI3LzIzIDE2OjQyLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IFRoaXMgZml4ZXMgdGhl
IGZvbGxvd2luZyBjb21waWxhdGlvbiBlcnJvciBpbiBBUk02NDoKPj4gYXJjaC9hcm0vbWFjaC1z
dG0zMm1wL2RyYW1faW5pdC5jOiBJbiBmdW5jdGlvbiDigJhib2FyZF9nZXRfdXNhYmxlX3JhbV90
b3DigJk6Cj4+IGFyY2gvYXJtL21hY2gtc3RtMzJtcC9kcmFtX2luaXQuYzo1OTo0NTogZXJyb3I6
IOKAmERDQUNIRV9ERUZBVUxUX09QVElPTuKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbikKPj4gwqDCoMKgIDU5IHzCoCBtbXVfc2V0X3JlZ2lvbl9kY2FjaGVfYmVoYXZp
b3VyKHJlZywgc2l6ZSwgRENBQ0hFX0RFRkFVTFRfT1BUSU9OKTsKPj4gwqDCoMKgwqDCoMKgIHzC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0
LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGFyY2gvYXJtL2luY2x1ZGUvYXNtL3N5c3RlbS5oIHwgMTYg
KysrKysrKystLS0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vc3lz
dGVtLmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zeXN0ZW0uaAo+PiBpbmRleCAwZWFlODU3ZTcz
YS4uNDNmNzUwMzU3MWQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3N5c3Rl
bS5oCj4+ICsrKyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3N5c3RlbS5oCj4+IEBAIC01MTMsMTQg
KzUxMyw2IEBAIGVudW0gZGNhY2hlX29wdGlvbiB7Cj4+IMKgIH07Cj4+IMKgICNlbmRpZgo+PiDC
oCAtI2lmIGRlZmluZWQoQ09ORklHX1NZU19BUk1fQ0FDSEVfV1JJVEVUSFJPVUdIKQo+PiAtI2Rl
ZmluZSBEQ0FDSEVfREVGQVVMVF9PUFRJT07CoMKgwqAgRENBQ0hFX1dSSVRFVEhST1VHSAo+PiAt
I2VsaWYgZGVmaW5lZChDT05GSUdfU1lTX0FSTV9DQUNIRV9XUklURUFMTE9DKQo+PiAtI2RlZmlu
ZSBEQ0FDSEVfREVGQVVMVF9PUFRJT07CoMKgwqAgRENBQ0hFX1dSSVRFQUxMT0MKPj4gLSNlbGlm
IGRlZmluZWQoQ09ORklHX1NZU19BUk1fQ0FDSEVfV1JJVEVCQUNLKQo+PiAtI2RlZmluZSBEQ0FD
SEVfREVGQVVMVF9PUFRJT07CoMKgwqAgRENBQ0hFX1dSSVRFQkFDSwo+PiAtI2VuZGlmCj4+IC0K
Pj4gwqAgLyogU2l6ZSBvZiBhbiBNTVUgc2VjdGlvbiAqLwo+PiDCoCBlbnVtIHsKPj4gwqAgI2lm
ZGVmIENPTkZJR19BUk1WN19MUEFFCj4+IEBAIC01NzgsNiArNTcwLDE0IEBAIHZvaWQgcHNjaV9z
eXN0ZW1fcmVzZXQodm9pZCk7Cj4+IMKgIMKgICNlbmRpZiAvKiBDT05GSUdfQVJNNjQgKi8KPj4g
wqAgKyNpZiBkZWZpbmVkKENPTkZJR19TWVNfQVJNX0NBQ0hFX1dSSVRFVEhST1VHSCkKPj4gKyNk
ZWZpbmUgRENBQ0hFX0RFRkFVTFRfT1BUSU9OwqDCoMKgIERDQUNIRV9XUklURVRIUk9VR0gKPj4g
KyNlbGlmIGRlZmluZWQoQ09ORklHX1NZU19BUk1fQ0FDSEVfV1JJVEVBTExPQykKPj4gKyNkZWZp
bmUgRENBQ0hFX0RFRkFVTFRfT1BUSU9OwqDCoMKgIERDQUNIRV9XUklURUFMTE9DCj4+ICsjZWxp
ZiBkZWZpbmVkKENPTkZJR19TWVNfQVJNX0NBQ0hFX1dSSVRFQkFDSykKPj4gKyNkZWZpbmUgRENB
Q0hFX0RFRkFVTFRfT1BUSU9OwqDCoMKgIERDQUNIRV9XUklURUJBQ0sKPj4gKyNlbmRpZgo+PiAr
Cj4+IMKgICNpZm5kZWYgX19BU1NFTUJMWV9fCj4+IMKgIC8qKgo+PiDCoMKgICogc2F2ZV9ib290
X3BhcmFtcygpIC0gU2F2ZSBib290IHBhcmFtZXRlcnMgYmVmb3JlIHN0YXJ0aW5nIHJlc2V0IHNl
cXVlbmNlCj4gCj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2su
ZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IAo+IApBcHBsaWVk
IHRvIHUtYm9vdC1zdG0zMi9uZXh0CgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJv
b3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
