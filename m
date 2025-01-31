Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 550C9A23A61
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2025 09:00:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BD5EC78002;
	Fri, 31 Jan 2025 08:00:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C4C1C71292
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 08:00:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V7oxtK028280;
 Fri, 31 Jan 2025 09:00:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 K6y7wS4FJSA3ZDq+cwP1GjRN4GyLjYmmg6BrEcKtkhQ=; b=nTUcsiI5opJDuzcY
 ZQx45vbMmjvPEekGAVU1qcDmlwZ/BPbIkBlc4Y/VSGtTOqPLgfe4vdUHc6Wxw1hm
 VOtiB6RsD+BtnH4JO2DxHwNSDHiYexO4UOYiHA/gYRqTwa/fxGH8wUU6+9DZJlXh
 bv+m+DUCw0+wwkiTcy+OxUo/GwRDTCbU6nGgxcrc/wGzBcLQQ75aJ5RswuIv2wkj
 dcsQPbc8aZvvD5IriKcIAckWmEKij9G4U+hLo0XHKkt0YzF2qQw0wgajvflt+1Tc
 meZkIKm6IBoyr2F9eVpEJTPwB7G/DREwvIHEreW9kjVEVkPY8ZZ1ov2M/cDKnEm+
 leMbHg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44gf7d9r24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 09:00:19 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B0B9D40048;
 Fri, 31 Jan 2025 08:59:20 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 217E82C420C;
 Fri, 31 Jan 2025 08:57:23 +0100 (CET)
Received: from [10.252.27.7] (10.252.27.7) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 31 Jan
 2025 08:57:22 +0100
Message-ID: <379b470e-b3bc-4c8a-8de2-e49cde7811e9@foss.st.com>
Date: Fri, 31 Jan 2025 08:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241129122711.411917-1-patrice.chotard@foss.st.com>
 <20241129122711.411917-7-patrice.chotard@foss.st.com>
 <f4b3ff28-5c7a-4ca2-9dfe-ab3c7d64f50c@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <f4b3ff28-5c7a-4ca2-9dfe-ab3c7d64f50c@foss.st.com>
X-Originating-IP: [10.252.27.7]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_03,2025-01-30_01,2024-11-22_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v1 6/6] configs: stm32mp25: enable
	CONFIG_SYS_64BIT_LBA
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

CgpPbiAxLzgvMjUgMTk6NTAsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MTEvMjkvMjQgMTM6MjcsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gSW4gYXJjaC9hcm0vbWFj
aC1zdG0zMm1wL2NtZF9zdG0zMnByb2cvc3RtMzJwcm9nLmMsIGluIGluaXRfZGV2aWNlKCksCj4+
IGluIGNhc2Ugb2YgUkFXX0lNQUdFLCBwYXJ0LT5zaXplID0gYmxvY2tfZGV2LT5sYmEgKiBibG9j
a19kZXYtPmJsa3N6Lgo+Pgo+PiDCoMKgIF8gcGFydC0+c2l6ZSBpcyBkZWNsYXJlZCBhcyB1NjQu
Cj4+IMKgwqAgXyBibG9ja19kZXYtPmxiYSBpcyBkZWNsYXJlZCBhcyBsYmFpbnRfdCB3aGljaCBp
cyB1aW50NjRfdAo+PiDCoMKgwqDCoCBpZiBDT05GSUdfU1lTXzY0QklUX0xCQSBpcyBlbmFibGUs
IG90aGVyd2lzZSB1bG9uZy4KPj4gwqDCoCBfIGJsb2NrX2Rldi0+Ymxrc3ogaXMgZGVjbGFyZWQg
YXMgdW5zaWduZWQgbG9uZy4KPj4KPj4gRm9yIGV4YW1wbGUsIGluIGNhc2UgYmxvY2tfZGV2LT5s
YmEgPSAweDFkYWNjMDAsIGJsb2NrX2Rldi0+Ymxrc3ogPSAweDIwMAo+PiB0aGVuIHBhcnQtPnNp
emUgMHg1OTgwMDAwIHdoaWNoIGlzIGluY29ycmVjdCBhcyBib3RoIGFyZSBkZWNsYXJlZCBhcyB1
bG9uZy4KPj4KPj4gVG8gZml4IHRoaXMgb3ZlcmZsb3cgaXNzdWUsIGVuYWJsZSBDT05GSUdfU1lT
XzY0QklUX0xCQSwgYmxvY2tfZGV2LT5sYmEgaXMKPj4gdGhlbiBkZWNsYXJlZCBhcyB1aW50NjRf
dCBhbmQgcGFydC0+c2l6ZSBnZXQgdGhlIGNvcnJlY3QgdmFsdWUgMHgzYjU5ODAwMDAuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3Qu
Y29tPgo+PiAtLS0KPj4KPj4gwqAgY29uZmlncy9zdG0zMm1wMjVfZGVmY29uZmlnIHwgMSArCj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvY29u
Zmlncy9zdG0zMm1wMjVfZGVmY29uZmlnIGIvY29uZmlncy9zdG0zMm1wMjVfZGVmY29uZmlnCj4+
IGluZGV4IGQzZjBjMDg4MTU3Li4wNzMxNzJjMzgwNCAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy9z
dG0zMm1wMjVfZGVmY29uZmlnCj4+ICsrKyBiL2NvbmZpZ3Mvc3RtMzJtcDI1X2RlZmNvbmZpZwo+
PiBAQCAtMzMsNiArMzMsNyBAQCBDT05GSUdfQ01EX1JFR1VMQVRPUj15Cj4+IMKgIENPTkZJR19D
TURfTE9HPXkKPj4gwqAgQ09ORklHX09GX0xJVkU9eQo+PiDCoCBDT05GSUdfTk9fTkVUPXkKPj4g
K0NPTkZJR19TWVNfNjRCSVRfTEJBPXkKPj4gwqAgQ09ORklHX0dQSU9fSE9HPXkKPj4gwqAgQ09O
RklHX0RNX0kyQz15Cj4+IMKgIENPTkZJR19TWVNfSTJDX1NUTTMyRjc9eQo+IAo+IAo+IAo+IFJl
dmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29t
Pgo+IAo+IFRoYW5rcwo+IFBhdHJpY2sKPiAKPiAKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIv
bWFzdGVyCgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
