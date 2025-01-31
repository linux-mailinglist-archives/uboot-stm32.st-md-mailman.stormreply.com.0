Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E54A23A7C
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2025 09:12:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7DC8C78002;
	Fri, 31 Jan 2025 08:12:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F335C71292
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 08:12:24 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V80ujS022400;
 Fri, 31 Jan 2025 09:12:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 8+QqdUWKBnK/Muv5RBrkMQUFbgNIwn+vqXbGJv/b/H0=; b=QEgBAYn/Gs61ITdm
 kKRA4W2k3n45uWvvGMuAjd8zWgU+0cCWSPifPKQIKI4rMQGjwPbvIOQcor+siUpE
 yoXuT7uYmBhoHVlFZIIPnoFHUcaiCkIUVzyWxyiMWTuwPQshzk9EIXjQky2wKl0r
 X4wOpYM6QTDqZs5GK02y7aXdprWB0DNFj2/o3ieaNdXRIlD9XGijpAxWdcrqYS8Y
 MpTjOimoIkwt2+8YP6eZeev0D4B1AMX+x4xY8iBwutDyeLCjom9c0o0HzzdYR9bi
 oPp8Qgzx2XTjKEXk0yDZYFazKEmT7dcYStkNiKKJxjCFVo5fMsuFm1DCEGq5gMBX
 ASh/KQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44gf7c9u1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 09:12:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7A0ED40065;
 Fri, 31 Jan 2025 09:11:27 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34F8E29E869;
 Fri, 31 Jan 2025 09:06:58 +0100 (CET)
Received: from [10.252.27.7] (10.252.27.7) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 31 Jan
 2025 09:06:57 +0100
Message-ID: <8185e1f2-daa7-43c1-aae8-2f9d37b84b0b@foss.st.com>
Date: Fri, 31 Jan 2025 09:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241211080936.1133105-1-patrice.chotard@foss.st.com>
 <20241211080936.1133105-2-patrice.chotard@foss.st.com>
 <47929bfc-5a76-490e-a445-d0a0e991cc13@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <47929bfc-5a76-490e-a445-d0a0e991cc13@foss.st.com>
X-Originating-IP: [10.252.27.7]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_03,2025-01-30_01,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 2/2] configs: stm32f469-disco: Set
 CYCLIC_MAX_CPU_TIME_US to 50000 for stm32f469-disco
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

CgpPbiAxLzgvMjUgMTk6NTMsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MTIvMTEvMjQgMDk6MDksIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gVXBkYXRpbmcgdGhlIGZy
YW1lYnVmZmVyIHRha2VzIHF1aXRlIGEgbG9uZyB0aW1lIG9uIHRoaXMgc2xvdyBwYXRmb3JtLAo+
PiBzZXQgQ1lDTElDX01BWF9DUFVfVElNRV9VUyB0byA1MDAwMCBmb3Igc3RtMzJmNDY5LWRpc2Nv
IHRvIGF2b2lkCj4+IGZvbGxvd2luZyBjeWNsaWMgd2FybmluZzoKPj4KPj4gImN5Y2xpYyBmdW5j
dGlvbiB2aWRlb19pbml0IHRvb2sgdG9vIGxvbmc6IDQ2Nzg0dXMgdnMgNTAwMHVzIG1heCIKPj4K
Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5z
dC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBjb25maWdzL3N0bTMyZjQ2OS1kaXNjb3ZlcnlfZGVmY29u
ZmlnIHwgMSArCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvY29uZmlncy9zdG0zMmY0NjktZGlzY292ZXJ5X2RlZmNvbmZpZyBiL2NvbmZpZ3Mv
c3RtMzJmNDY5LWRpc2NvdmVyeV9kZWZjb25maWcKPj4gaW5kZXggOTgzOTk0MTZmYTUuLmIwMTQ0
NzYzZDM3IDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL3N0bTMyZjQ2OS1kaXNjb3ZlcnlfZGVmY29u
ZmlnCj4+ICsrKyBiL2NvbmZpZ3Mvc3RtMzJmNDY5LWRpc2NvdmVyeV9kZWZjb25maWcKPj4gQEAg
LTE0LDYgKzE0LDcgQEAgQ09ORklHX0RJU1RST19ERUZBVUxUUz15Cj4+IMKgIENPTkZJR19CT09U
REVMQVk9Mwo+PiDCoCBDT05GSUdfU1lTX1BCU0laRT0xMDUwCj4+IMKgICMgQ09ORklHX0RJU1BM
QVlfQ1BVSU5GTyBpcyBub3Qgc2V0Cj4+ICtDT05GSUdfQ1lDTElDX01BWF9DUFVfVElNRV9VUz01
MDAwMAo+PiDCoCBDT05GSUdfTUlTQ19JTklUX1I9eQo+PiDCoCBDT05GSUdfU1lTX1BST01QVD0i
VS1Cb290ID4gIgo+PiDCoCBDT05GSUdfQ01EX0lNTFM9eQo+IAo+IAo+IFJldmlld2VkLWJ5OiBQ
YXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5r
cwo+IFBhdHJpY2sKPiAKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFzdGVyCgpUaGFua3MK
UGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpV
Ym9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby91Ym9vdC1zdG0zMgo=
