Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8283B6E7460
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Apr 2023 09:51:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EA3AC6B460;
	Wed, 19 Apr 2023 07:51:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5F36C6B456
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Apr 2023 07:51:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33J3Rl7I010017; Wed, 19 Apr 2023 09:51:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=p4WYOBY9oCPG8pwqBEvcwodmsk/VMPJPZrUHYq8OUT4=;
 b=xDlzabz29sW54WIEDGvOliEtE2TOtQc00YTvJ4zXjsLx31vBrWZjkCQ+2bOGBUCoc12h
 qfbyII7oi1qN1UKtmAfmRBBxQFuVORROE9wcVWBSndZysCyad4wizUI3riEofKiYIK8j
 ZxQoKlb2wlMwf+rUQnGazksKNEUoV6IVpk8tru9gfdX0IRIvY0P4rF40/aY6HzqeXAjE
 7B6ds4btqCuhpbAyWLnFQw34lKXSucDBGzOEFq7W1E1MvfEG+Md26I0vd0QqSxxik6N1
 59gcGtcHrrUOOaUB18nPTv2/5mjCngtsMuj7vnkUbCoegG+V/3zbKHipyBCFCrGMA5+L 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q1rhry3q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Apr 2023 09:51:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7378810002A;
 Wed, 19 Apr 2023 09:51:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CD59211F21;
 Wed, 19 Apr 2023 09:51:03 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 19 Apr
 2023 09:51:03 +0200
Message-ID: <639018c2-3fe2-e21c-de72-a2eff78a22de@foss.st.com>
Date: Wed, 19 Apr 2023 09:51:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230327074641.44900-1-patrice.chotard@foss.st.com>
 <c4ee6ff3-fbbe-d01c-93be-dbb04282b760@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <c4ee6ff3-fbbe-d01c-93be-dbb04282b760@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_04,2023-04-18_01,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] pinctrl: pinctrl_stm32: Add slew rate
 support for stm32_pinctrl_get_pin_muxing()
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

CgpPbiAzLzMwLzIzIDEzOjI5LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDMvMjcvMjMgMDk6NDYsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gRm9yIGRlYnVnIHB1cnBv
c2UsIGl0IHNob3VsZCBiZSB1c2VmdWwgdG8gaW5kaWNhdGUgdGhlIHNsZXcgcmF0ZSBmb3IKPj4g
ZWFjaCBwaW5zLgo+PiBBZGQgb3NwZWVkIHJlZ2lzdGVyIGluZm9ybWF0aW9uIGZvciBwaW5zIHdo
aWNoIGFyZSBjb25maWd1cmVkIGluCj4+IGVpdGhlciBhbHRlcm5hdGUgZnVuY3Rpb24gb3IgZ3Bp
byBvdXRwdXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5j
aG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgZHJpdmVycy9waW5jdHJsL3BpbmN0
cmxfc3RtMzIuYyB8IDE5ICsrKysrKysrKysrKysrKy0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3BpbmN0cmwvcGluY3RybF9zdG0zMi5jIGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmxfc3Rt
MzIuYwo+PiBpbmRleCBiNzU1ZmE0MmI0Zi4uYjA2ZGE1MGIyY2QgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvcGluY3RybC9waW5jdHJsX3N0bTMyLmMKPj4gKysrIGIvZHJpdmVycy9waW5jdHJsL3Bp
bmN0cmxfc3RtMzIuYwo+PiBAQCAtNjEsNiArNjEsMTMgQEAgc3RhdGljIGNvbnN0IGNoYXIgKiBj
b25zdCBwaW5tdXhfb3R5cGVbXSA9IHsKPj4gwqDCoMKgwqDCoCBbU1RNMzJfR1BJT19PVFlQRV9P
RF0gPSAib3Blbi1kcmFpbiIsCj4+IMKgIH07Cj4+IMKgICtzdGF0aWMgY29uc3QgY2hhciAqIGNv
bnN0IHBpbm11eF9zcGVlZFtdID0gewo+PiArwqDCoMKgIFtTVE0zMl9HUElPX1NQRUVEXzJNXSA9
ICJMb3cgc3BlZWQiLAo+PiArwqDCoMKgIFtTVE0zMl9HUElPX1NQRUVEXzI1TV0gPSAiTWVkaXVt
IHNwZWVkIiwKPj4gK8KgwqDCoCBbU1RNMzJfR1BJT19TUEVFRF81ME1dID0gIkhpZ2ggc3BlZWQi
LAo+PiArwqDCoMKgIFtTVE0zMl9HUElPX1NQRUVEXzEwME1dID0gIlZlcnktaGlnaCBzcGVlZCIs
Cj4+ICt9Owo+PiArCj4+IMKgIHN0YXRpYyBpbnQgc3RtMzJfcGluY3RybF9nZXRfYWYoc3RydWN0
IHVkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IG9mZnNldCkKPj4gwqAgewo+PiDCoMKgwqDCoMKg
IHN0cnVjdCBzdG0zMl9ncGlvX3ByaXYgKnByaXYgPSBkZXZfZ2V0X3ByaXYoZGV2KTsKPj4gQEAg
LTIwMSw2ICsyMDgsNyBAQCBzdGF0aWMgaW50IHN0bTMyX3BpbmN0cmxfZ2V0X3Bpbl9tdXhpbmco
c3RydWN0IHVkZXZpY2UgKmRldiwKPj4gwqDCoMKgwqDCoCBpbnQgYWZfbnVtOwo+PiDCoMKgwqDC
oMKgIHVuc2lnbmVkIGludCBncGlvX2lkeDsKPj4gwqDCoMKgwqDCoCB1MzIgcHVwZCwgb3R5cGU7
Cj4+ICvCoMKgwqAgdTggc3BlZWQ7Cj4+IMKgIMKgwqDCoMKgwqAgLyogbG9vayB1cCBmb3IgdGhl
IGJhbmsgd2hpY2ggb3ducyB0aGUgcmVxdWVzdGVkIHBpbiAqLwo+PiDCoMKgwqDCoMKgIGdwaW9f
ZGV2ID0gc3RtMzJfcGluY3RybF9nZXRfZ3Bpb19kZXYoZGV2LCBzZWxlY3RvciwgJmdwaW9faWR4
KTsKPj4gQEAgLTIxNCw2ICsyMjIsNyBAQCBzdGF0aWMgaW50IHN0bTMyX3BpbmN0cmxfZ2V0X3Bp
bl9tdXhpbmcoc3RydWN0IHVkZXZpY2UgKmRldiwKPj4gwqDCoMKgwqDCoCBwcml2ID0gZGV2X2dl
dF9wcml2KGdwaW9fZGV2KTsKPj4gwqDCoMKgwqDCoCBwdXBkID0gKHJlYWRsKCZwcml2LT5yZWdz
LT5wdXBkcikgPj4gKGdwaW9faWR4ICogMikpICYgUFVQRF9NQVNLOwo+PiDCoMKgwqDCoMKgIG90
eXBlID0gKHJlYWRsKCZwcml2LT5yZWdzLT5vdHlwZXIpID4+IGdwaW9faWR4KSAmIE9UWVBFX01T
SzsKPj4gK8KgwqDCoCBzcGVlZCA9IChyZWFkbCgmcHJpdi0+cmVncy0+b3NwZWVkcikgPj4gZ3Bp
b19pZHggKiAyKSAmIE9TUEVFRF9NQVNLOwo+PiDCoCDCoMKgwqDCoMKgIHN3aXRjaCAobW9kZSkg
ewo+PiDCoMKgwqDCoMKgIGNhc2UgR1BJT0ZfVU5LTk9XTjoKPj4gQEAgLTIyMiwxMyArMjMxLDE1
IEBAIHN0YXRpYyBpbnQgc3RtMzJfcGluY3RybF9nZXRfcGluX211eGluZyhzdHJ1Y3QgdWRldmlj
ZSAqZGV2LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDCoMKgwqAgY2FzZSBH
UElPRl9GVU5DOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYWZfbnVtID0gc3RtMzJfcGluY3RybF9n
ZXRfYWYoZ3Bpb19kZXYsIGdwaW9faWR4KTsKPj4gLcKgwqDCoMKgwqDCoMKgIHNucHJpbnRmKGJ1
Ziwgc2l6ZSwgIiVzICVkICVzICVzIiwgcGlubXV4X21vZGVbbW9kZV0sIGFmX251bSwKPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5tdXhfb3R5cGVbb3R5cGVdLCBwaW5tdXhfYmlhc1tw
dXBkXSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzbnByaW50ZihidWYsIHNpemUsICIlcyAlZCAlcyAl
cyAlcyIsIHBpbm11eF9tb2RlW21vZGVdLCBhZl9udW0sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcGlubXV4X290eXBlW290eXBlXSwgcGlubXV4X2JpYXNbcHVwZF0sCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcGlubXV4X3NwZWVkW3NwZWVkXSk7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBicmVhazsKPj4gwqDCoMKgwqDCoCBjYXNlIEdQSU9GX09VVFBVVDoKPj4gLcKgwqDCoMKg
wqDCoMKgIHNucHJpbnRmKGJ1Ziwgc2l6ZSwgIiVzICVzICVzICVzIiwKPj4gK8KgwqDCoMKgwqDC
oMKgIHNucHJpbnRmKGJ1Ziwgc2l6ZSwgIiVzICVzICVzICVzICVzIiwKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwaW5tdXhfbW9kZVttb2RlXSwgcGlubXV4X290eXBlW290eXBlXSwK
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5tdXhfYmlhc1twdXBkXSwgbGFiZWwgPyBs
YWJlbCA6ICIiKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5tdXhfYmlhc1twdXBk
XSwgbGFiZWwgPyBsYWJlbCA6ICIiLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbm11
eF9zcGVlZFtzcGVlZF0pOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDCoMKg
wqAgY2FzZSBHUElPRl9JTlBVVDoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNucHJpbnRmKGJ1Ziwg
c2l6ZSwgIiVzICVzICVzIiwgcGlubXV4X21vZGVbbW9kZV0sCj4gCj4gCj4gCj4gUmV2aWV3ZWQt
Ynk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4g
VGhhbmtzCj4gUGF0cmljawo+IAoKQXBwbGllZCBvbiB1LWJvb3Qtc3RtL21hc3RlciwgdGhhbmtz
LgoKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby91Ym9vdC1zdG0zMgo=
