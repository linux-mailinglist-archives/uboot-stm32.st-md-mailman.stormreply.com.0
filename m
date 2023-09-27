Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B007AFAE2
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Sep 2023 08:19:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57198C6B462;
	Wed, 27 Sep 2023 06:19:00 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 035EBC6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 06:18:58 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38QIPSuR016376; Wed, 27 Sep 2023 08:18:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=X0KaTSaWtindSnJC1PSnp6kthTBtNN9ipoqoPl2ouMI=; b=Jk
 FEZtASxUpbys/FBScJc2Z/55Qk0ggskAxNfzYEnmwVMuEsSjj+0/JMo4U00JFN83
 aV2xGsZ4G9O43VK5J/kxW+r+ea2ZjehKAYCaOon24XBnIHXUEPWlL0enki0a+tUL
 Hsnuoy6zZGU0F4W7vmqnQNkZBQrSfeiOjV4bAJiIc/8O4FOovoGiDaIHEQsqQQKx
 Zv8MK4llP4Q0Am3px3TTsaw8ALi2bIQPh0nyEu/V/oXBiWfkhrQ9JYHlGOASSPEn
 +I68OnEbqFvQQvQxrM1phjv+9+DqexZ8QXjZ2CpzN0WDelAbqW7E76t+1Nm/Dtqt
 4hXv++TL75U27ntqLAfw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3taayhp0a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 08:18:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4CAD9100058;
 Wed, 27 Sep 2023 08:18:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3970A210F76;
 Wed, 27 Sep 2023 08:18:57 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 08:18:56 +0200
Message-ID: <a8ddbc7e-6b2f-f6de-6646-e13ed2d4b13d@foss.st.com>
Date: Wed, 27 Sep 2023 08:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230825162439.776710-1-patrice.chotard@foss.st.com>
 <f596b4b2-407a-c36d-97fa-105957499733@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <f596b4b2-407a-c36d-97fa-105957499733@foss.st.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_03,2023-09-26_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32f769-disco: Enable
	VIDEO_LOGO flag
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

CgpPbiA4LzI5LzIzIDE3OjI0LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDgvMjUvMjMgMTg6MjQsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gVGhlIHBhdGNoIHJlbW92
ZXMgdGhlIGxlZ2FjeSBtb2RlIG9mIGRpc3BsYXlpbmcgdGhlIFNUIGxvZ28gYW5kIGFkb3B0cwo+
PiB0aGUgYXBwcm9hY2ggaW50cm9kdWNlZCBieSB0aGUgY29tbWl0IDI4NGIwOGZiNTFiNiAoImJv
YXJkOiBzdG0zMm1wMTogYWRkCj4+IHNwbGFzaCBzY3JlZW4gd2l0aCBzdG1pY3JvZWxlY3Ryb25p
Y3MgbG9nbyIpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2Uu
Y2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGNvbmZpZ3Mvc3RtMzJmNzY5LWRp
c2NvX2RlZmNvbmZpZ8KgwqDCoMKgIHwgMiArLQo+PiDCoCBjb25maWdzL3N0bTMyZjc2OS1kaXNj
b19zcGxfZGVmY29uZmlnIHwgMiArLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mvc3RtMzJmNzY5
LWRpc2NvX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvc3RtMzJmNzY5LWRpc2NvX2RlZmNvbmZpZwo+PiBp
bmRleCA3MmVmMTMzZmU0YS4uMjBkYmIxYWY2MzAgMTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3Mvc3Rt
MzJmNzY5LWRpc2NvX2RlZmNvbmZpZwo+PiArKysgYi9jb25maWdzL3N0bTMyZjc2OS1kaXNjb19k
ZWZjb25maWcKPj4gQEAgLTU2LDYgKzU2LDcgQEAgQ09ORklHX1NQST15Cj4+IMKgIENPTkZJR19E
TV9TUEk9eQo+PiDCoCBDT05GSUdfU1RNMzJfUVNQST15Cj4+IMKgIENPTkZJR19WSURFTz15Cj4+
ICtDT05GSUdfVklERU9fTE9HTz15Cj4+IMKgIENPTkZJR19CQUNLTElHSFRfR1BJTz15Cj4+IMKg
IENPTkZJR19WSURFT19MQ0RfT1JJU0VURUNIX09UTTgwMDlBPXkKPj4gwqAgQ09ORklHX1ZJREVP
X1NUTTMyPXkKPj4gQEAgLTY0LDcgKzY1LDYgQEAgQ09ORklHX1ZJREVPX1NUTTMyX01BWF9YUkVT
PTQ4MAo+PiDCoCBDT05GSUdfVklERU9fU1RNMzJfTUFYX1lSRVM9ODAwCj4+IMKgIENPTkZJR19T
UExBU0hfU0NSRUVOPXkKPj4gwqAgQ09ORklHX1NQTEFTSF9TQ1JFRU5fQUxJR049eQo+PiAtQ09O
RklHX1ZJREVPX0JNUF9STEU4PXkKPj4gwqAgQ09ORklHX0JNUF8xNkJQUD15Cj4+IMKgIENPTkZJ
R19CTVBfMjRCUFA9eQo+PiDCoCBDT05GSUdfQk1QXzMyQlBQPXkKPj4gZGlmZiAtLWdpdCBhL2Nv
bmZpZ3Mvc3RtMzJmNzY5LWRpc2NvX3NwbF9kZWZjb25maWcgYi9jb25maWdzL3N0bTMyZjc2OS1k
aXNjb19zcGxfZGVmY29uZmlnCj4+IGluZGV4IGRkMTdjYWQ3MzYyLi5hNTI5OGU3Y2RjMSAxMDA2
NDQKPj4gLS0tIGEvY29uZmlncy9zdG0zMmY3NjktZGlzY29fc3BsX2RlZmNvbmZpZwo+PiArKysg
Yi9jb25maWdzL3N0bTMyZjc2OS1kaXNjb19zcGxfZGVmY29uZmlnCj4+IEBAIC04Miw2ICs4Miw3
IEBAIENPTkZJR19ETV9TUEk9eQo+PiDCoCBDT05GSUdfU1RNMzJfUVNQST15Cj4+IMKgIENPTkZJ
R19TUExfVElNRVI9eQo+PiDCoCBDT05GSUdfVklERU89eQo+PiArQ09ORklHX1ZJREVPX0xPR089
eQo+PiDCoCBDT05GSUdfQkFDS0xJR0hUX0dQSU89eQo+PiDCoCBDT05GSUdfVklERU9fTENEX09S
SVNFVEVDSF9PVE04MDA5QT15Cj4+IMKgIENPTkZJR19WSURFT19TVE0zMj15Cj4+IEBAIC05MCw3
ICs5MSw2IEBAIENPTkZJR19WSURFT19TVE0zMl9NQVhfWFJFUz00ODAKPj4gwqAgQ09ORklHX1ZJ
REVPX1NUTTMyX01BWF9ZUkVTPTgwMAo+PiDCoCBDT05GSUdfU1BMQVNIX1NDUkVFTj15Cj4+IMKg
IENPTkZJR19TUExBU0hfU0NSRUVOX0FMSUdOPXkKPj4gLUNPTkZJR19WSURFT19CTVBfUkxFOD15
Cj4+IMKgIENPTkZJR19CTVBfMTZCUFA9eQo+PiDCoCBDT05GSUdfQk1QXzI0QlBQPXkKPj4gwqAg
Q09ORklHX0JNUF8zMkJQUD15Cj4gCj4gCj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVs
YXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmlj
awo+IAo+IApBcHBseSBvbiBzdG0zMi9uZXh0CgpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9v
dC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
