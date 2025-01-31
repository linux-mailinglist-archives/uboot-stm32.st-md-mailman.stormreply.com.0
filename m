Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE2FA23A60
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2025 09:00:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07E96C78002;
	Fri, 31 Jan 2025 08:00:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84158C71292
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 08:00:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V7ox6c029612;
 Fri, 31 Jan 2025 08:59:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 SrqJbJ2FzgNlfPaMGutmohvsgEf0ZHxi/JVJcO6jMkc=; b=ay8oIPRBlaCrzFi/
 XA7U39gTNXVc90SBPkBHs++k7uGW/Md82qy0HNri2IX6CMxoobdhI/bNfv2z5BR0
 VhWaOgw5VQjbXww8hlvE3MHOu33k9k4fl6rHNtSH7a/wAsqiO3fOtWwQt1xmrlrk
 NH8NDBp1z2Pes3zZbSuasl80h+OdWeCmxV5/3IBVBkfEEZO0sxPRFvA3vnMgHD4M
 Q8hkCVSTjGNtnfV+F7rcrDFw/CBRrZ/GT2LKmEdbdXJBKAf6TStUxrVnR8NcjbQT
 g7CsN+Y2BK8CCrnBqRXgDMWP3CNCDVqMq+o/POuEPprCtvVg4CKJYP5vcd7QxHtm
 gyuGyw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44gf7e1r22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 08:59:58 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 83CA640046;
 Fri, 31 Jan 2025 08:59:04 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88E4A2B3612;
 Fri, 31 Jan 2025 08:57:11 +0100 (CET)
Received: from [10.252.27.7] (10.252.27.7) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 31 Jan
 2025 08:57:11 +0100
Message-ID: <9840e776-5c24-4177-8acf-87f924181a7d@foss.st.com>
Date: Fri, 31 Jan 2025 08:57:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241129122711.411917-1-patrice.chotard@foss.st.com>
 <20241129122711.411917-6-patrice.chotard@foss.st.com>
 <4660eb40-18c9-46e4-9305-420b486f01de@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <4660eb40-18c9-46e4-9305-420b486f01de@foss.st.com>
X-Originating-IP: [10.252.27.7]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_03,2025-01-30_01,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v1 5/6] configs: stm32mp15: enable
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

CgpPbiAxLzgvMjUgMTk6NDksIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCj4gCj4gT24g
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
Y29tPgo+PiAtLS0KPj4KPj4gwqAgY29uZmlncy9zdG0zMm1wMTVfYmFzaWNfZGVmY29uZmlnwqDC
oCB8IDEgKwo+PiDCoCBjb25maWdzL3N0bTMybXAxNV9kZWZjb25maWfCoMKgwqDCoMKgwqDCoMKg
IHwgMSArCj4+IMKgIGNvbmZpZ3Mvc3RtMzJtcDE1X3RydXN0ZWRfZGVmY29uZmlnIHwgMSArCj4+
IMKgIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9j
b25maWdzL3N0bTMybXAxNV9iYXNpY19kZWZjb25maWcgYi9jb25maWdzL3N0bTMybXAxNV9iYXNp
Y19kZWZjb25maWcKPj4gaW5kZXggMWMwZDBkMGEwNzMuLmE4ODYxZmFhYjBlIDEwMDY0NAo+PiAt
LS0gYS9jb25maWdzL3N0bTMybXAxNV9iYXNpY19kZWZjb25maWcKPj4gKysrIGIvY29uZmlncy9z
dG0zMm1wMTVfYmFzaWNfZGVmY29uZmlnCj4+IEBAIC05NSw2ICs5NSw3IEBAIENPTkZJR19URlRQ
X1RTSVpFPXkKPj4gwqAgQ09ORklHX1VTRV9TRVJWRVJJUD15Cj4+IMKgIENPTkZJR19TRVJWRVJJ
UD0iMTkyLjE2OC4xLjEiCj4+IMKgIENPTkZJR19TVE0zMl9BREM9eQo+PiArQ09ORklHX1NZU182
NEJJVF9MQkE9eQo+PiDCoCBDT05GSUdfQlVUVE9OPXkKPj4gwqAgQ09ORklHX0JVVFRPTl9HUElP
PXkKPj4gwqAgQ09ORklHX1NFVF9ERlVfQUxUX0lORk89eQo+PiBkaWZmIC0tZ2l0IGEvY29uZmln
cy9zdG0zMm1wMTVfZGVmY29uZmlnIGIvY29uZmlncy9zdG0zMm1wMTVfZGVmY29uZmlnCj4+IGlu
ZGV4IGY1OGE1MTQzMDhiLi5kMzEzNDllM2YyYiAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy9zdG0z
Mm1wMTVfZGVmY29uZmlnCj4+ICsrKyBiL2NvbmZpZ3Mvc3RtMzJtcDE1X2RlZmNvbmZpZwo+PiBA
QCAtNjksNiArNjksNyBAQCBDT05GSUdfVEZUUF9UU0laRT15Cj4+IMKgIENPTkZJR19VU0VfU0VS
VkVSSVA9eQo+PiDCoCBDT05GSUdfU0VSVkVSSVA9IjE5Mi4xNjguMS4xIgo+PiDCoCBDT05GSUdf
U1RNMzJfQURDPXkKPj4gK0NPTkZJR19TWVNfNjRCSVRfTEJBPXkKPj4gwqAgQ09ORklHX0JVVFRP
Tj15Cj4+IMKgIENPTkZJR19CVVRUT05fR1BJTz15Cj4+IMKgIENPTkZJR19DTEtfU0NNST15Cj4+
IGRpZmYgLS1naXQgYS9jb25maWdzL3N0bTMybXAxNV90cnVzdGVkX2RlZmNvbmZpZyBiL2NvbmZp
Z3Mvc3RtMzJtcDE1X3RydXN0ZWRfZGVmY29uZmlnCj4+IGluZGV4IDJlOTliOGU2YTg1Li4xZjgw
N2YzN2M2OSAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy9zdG0zMm1wMTVfdHJ1c3RlZF9kZWZjb25m
aWcKPj4gKysrIGIvY29uZmlncy9zdG0zMm1wMTVfdHJ1c3RlZF9kZWZjb25maWcKPj4gQEAgLTcw
LDYgKzcwLDcgQEAgQ09ORklHX1RGVFBfVFNJWkU9eQo+PiDCoCBDT05GSUdfVVNFX1NFUlZFUklQ
PXkKPj4gwqAgQ09ORklHX1NFUlZFUklQPSIxOTIuMTY4LjEuMSIKPj4gwqAgQ09ORklHX1NUTTMy
X0FEQz15Cj4+ICtDT05GSUdfU1lTXzY0QklUX0xCQT15Cj4+IMKgIENPTkZJR19CVVRUT049eQo+
PiDCoCBDT05GSUdfQlVUVE9OX0dQSU89eQo+PiDCoCBDT05GSUdfQ0xLX1NDTUk9eQo+IAo+IAo+
IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3Qu
Y29tPgo+IAo+IFRoYW5rcwo+IFBhdHJpY2sKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFz
dGVyCgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
