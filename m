Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA9E520F60
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 10:06:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE5BFC035BD;
	Tue, 10 May 2022 08:06:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67446C035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 08:06:16 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A5663K023267;
 Tue, 10 May 2022 10:06:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5B8q4l9dQUlGMisRycQ3vj5GvbeSJMZqPG2ncxI7usw=;
 b=VQkKvLXZ2uvGU9xTssT7BYkcb+zxoqSGomy2JTz4d5oeg08O5fZKBnEKz6Sk+UV4cFKK
 Nfgtca550nq9WZsspzWQ5gCCqXZGKXYStP4JgzTBX8GaXOvFsyGCg6WTEi+FIyoka9jw
 ALkBJD34LI6UzY+QcehQuVjiMDupt+WQWZR7R4vG8rV26uFyUJa9AKM5789Z5Xz4nboi
 KYKnyx0z+qKsEexYJpPvWLcneopc0djDVR2Ezq1+nrr251M5DvbmGo+IG1emU0HrbqHu
 6rjbugE4xwNPtn2g3HrXjeENVQ0XFkd0TEOqjdwblD2fmcSJAjssqnegvry+ZNVFxRik nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwg40xd6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 10:06:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2299610002A;
 Tue, 10 May 2022 10:06:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D2F2212FC7;
 Tue, 10 May 2022 10:06:14 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 10:06:13 +0200
Message-ID: <1277aff5-e08d-637e-3c42-69e53af8814d@foss.st.com>
Date: Tue, 10 May 2022 10:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220422073831.15538-1-patrice.chotard@foss.st.com>
 <cdf59467-ec70-1ffa-55c0-e5298ffa36ee@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <cdf59467-ec70-1ffa-55c0-e5298ffa36ee@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] pinctrl: pinctrl_stm32: Update
	pinmux_mode definition
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

CgpPbiA1LzYvMjIgMTA6MzcsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCj4gCj4gT24g
NC8yMi8yMiAwOTozOCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBwaW5tdXhfbW9kZVtdIGlz
IGxpbmtlZCB0byBncGlvX2Z1bmN0aW9uW10gZGVmaW5lZCBpbiBncGlvLXVjbGFzcy5jCj4+IFNv
IHJldXNlIHRoZSBzYW1lIGdwaW9fZnVuY190IGVudW0gdmFsdWUKPj4KPj4gU2lnbmVkLW9mZi1i
eTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+
Pgo+PiDCoCBkcml2ZXJzL3BpbmN0cmwvcGluY3RybF9zdG0zMi5jIHwgMTMgKysrKysrLS0tLS0t
LQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmxfc3RtMzIuYyBiL2RyaXZl
cnMvcGluY3RybC9waW5jdHJsX3N0bTMyLmMKPj4gaW5kZXggNTcyOTc5OWIxMi4uNWQ4ZTE1NmQ2
MiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmxfc3RtMzIuYwo+PiArKysg
Yi9kcml2ZXJzL3BpbmN0cmwvcGluY3RybF9zdG0zMi5jCj4+IEBAIC00MiwxMyArNDIsMTIgQEAg
c3RydWN0IHN0bTMyX2dwaW9fYmFuayB7Cj4+IMKgICNpZm5kZWYgQ09ORklHX1NQTF9CVUlMRAo+
PiDCoCDCoCBzdGF0aWMgY2hhciBwaW5fbmFtZVtQSU5OQU1FX1NJWkVdOwo+PiAtI2RlZmluZSBQ
SU5NVVhfTU9ERV9DT1VOVMKgwqDCoMKgwqDCoMKgIDUKPj4gLXN0YXRpYyBjb25zdCBjaGFyICog
Y29uc3QgcGlubXV4X21vZGVbUElOTVVYX01PREVfQ09VTlRdID0gewo+PiAtwqDCoMKgICJncGlv
IGlucHV0IiwKPj4gLcKgwqDCoCAiZ3BpbyBvdXRwdXQiLAo+PiAtwqDCoMKgICJhbmFsb2ciLAo+
PiAtwqDCoMKgICJ1bmtub3duIiwKPj4gLcKgwqDCoCAiYWx0IGZ1bmN0aW9uIiwKPj4gK3N0YXRp
YyBjb25zdCBjaGFyICogY29uc3QgcGlubXV4X21vZGVbR1BJT0ZfQ09VTlRdID0gewo+PiArwqDC
oMKgIFtHUElPRl9JTlBVVF0gPSAiZ3BpbyBpbnB1dCIsCj4+ICvCoMKgwqAgW0dQSU9GX09VVFBV
VF0gPSAiZ3BpbyBvdXRwdXQiLAo+PiArwqDCoMKgIFtHUElPRl9VTlVTRURdID0gImFuYWxvZyIs
Cj4+ICvCoMKgwqAgW0dQSU9GX1VOS05PV05dID0gInVua25vd24iLAo+PiArwqDCoMKgIFtHUElP
Rl9GVU5DXSA9ICJhbHQgZnVuY3Rpb24iLAo+PiDCoCB9Owo+PiDCoCDCoCBzdGF0aWMgY29uc3Qg
Y2hhciAqIGNvbnN0IHBpbm11eF9iaWFzW10gPSB7Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJp
Y2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4g
UGF0cmljawo+IAo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMgoKVGhhbmtzClBhdHJpY2UKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIg
bWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qt
c3RtMzIK
