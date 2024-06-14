Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CA8908789
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2024 11:34:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07BE8C6C83A;
	Fri, 14 Jun 2024 09:34:06 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B09CC5E2CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:34:05 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E7aUih027856;
 Fri, 14 Jun 2024 11:34:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 hIG8v2SrcgkP98b1v9d9rpONwtFSzszjUIpY9UVkL4A=; b=hU+Anx6Ml38ymCRY
 803PixTO1RbKrC9w9+8UG1gnCic/iKFvvPeXW16Nnyuj1WamajUg+9W2TdBcOiGq
 JjIEQe/tQKqlb+Eq+0Nnb7E+rG9Swsqgk0UwgKM1fanau6FRX7q6f29aUznfBO7S
 u3fLlAOH3NEaHEIwML/77e5FEt6vqwFhxys9YuyB0jqJHltWOH9sslgdME22hI2e
 Qo+FU1eR5CGGcuW1biQe5or8tjNwgvCXr3VZ24T+/Ddr46TmnxsUNvCj9EneW0ZC
 4WbDdmqniai8DUgyA4Z6mnAKLyKiZDrcxnoLJaAk7d5ItqU/3JbqwBwXlMAha8Cv
 YUrDYw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp2qv19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 11:34:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9722D40045;
 Fri, 14 Jun 2024 11:33:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2604210F9D;
 Fri, 14 Jun 2024 11:33:44 +0200 (CEST)
Received: from [10.252.18.60] (10.252.18.60) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 14 Jun
 2024 11:33:44 +0200
Message-ID: <983174d3-a99e-4c85-b0d4-9c02971b7cd5@foss.st.com>
Date: Fri, 14 Jun 2024 11:33:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240611095239.16026-1-patrice.chotard@foss.st.com>
 <a19faecc-1d0a-4369-b51e-428ffaf00451@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <a19faecc-1d0a-4369-b51e-428ffaf00451@foss.st.com>
X-Originating-IP: [10.252.18.60]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] stm32mp1: spl: Fix compilation
	warnings
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

CgpPbiA2LzE0LzI0IDA5OjU5LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpIFBhdHJpY2Us
Cj4gCj4gT24gNi8xMS8yNCAxMTo1MiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBGaXggdGhl
IGZvbGxvd2luZyBjb21waWxhdGlvbiB3YXJuaW5ncyA6Cj4+Cj4+IC4uL2FyY2gvYXJtL21hY2gt
c3RtMzJtcC9zdG0zMm1wMS9zcGwuYzogSW4gZnVuY3Rpb24gJ3N0bTMyX2luaXRfdHpjX2Zvcl9v
cHRlZSc6Cj4+IC4uL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9zcGwuYzoxNDg6Mzc6
IHdhcm5pbmc6ICdvcHRlZV9zaXplJyBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIFstV21heWJl
LXVuaW5pdGlhbGl6ZWRdCj4+IMKgwqAgMTQ4IHzCoMKgwqDCoMKgwqDCoMKgIHRlZV9zaG1lbV9i
YXNlID0gb3B0ZWVfYmFzZSArIG9wdGVlX3NpemUgLSBDRkdfU0hNRU1fU0laRTsKPj4gwqDCoMKg
wqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB+fn5+fn5+fn5+fl5+fn5+fn5+fn5+fgo+PiAuLi9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3Rt
MzJtcDEvc3BsLmM6MTM3OjMwOiBub3RlOiAnb3B0ZWVfc2l6ZScgd2FzIGRlY2xhcmVkIGhlcmUK
Pj4gwqDCoCAxMzcgfMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3Qgb3B0ZWVfYmFzZSwgb3B0ZWVf
c2l6ZSwgdGVlX3NobWVtX2Jhc2U7Cj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+Cj4+IC4u
L2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9zcGwuYzoxNDg6Mzc6IHdhcm5pbmc6ICdv
cHRlZV9iYXNlJyBtYXkgYmUgdXNlZAo+PiB1bmluaXRpYWxpemVkIFstV21heWJlLXVuaW5pdGlh
bGl6ZWRdCj4+IMKgwqAgMTQ4IHzCoMKgwqDCoMKgwqDCoMKgIHRlZV9zaG1lbV9iYXNlID0gb3B0
ZWVfYmFzZSArIG9wdGVlX3NpemUgLSBDRkdfU0hNRU1fU0laRTsKPj4gwqDCoMKgwqDCoMKgIHzC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB+fn5+fn5+
fn5+fl5+fn5+fn5+fn5+fgo+PiAuLi9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDEvc3Bs
LmM6MTM3OjE4OiBub3RlOiAnb3B0ZWVfYmFzZScgd2FzIGRlY2xhcmVkIGhlcmUKPj4gwqDCoCAx
MzcgfMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3Qgb3B0ZWVfYmFzZSwgb3B0ZWVfc2l6ZSwgdGVl
X3NobWVtX2Jhc2U7Cj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBefn5+fn5+fn5+Cj4+Cj4+IEZpeCBhbHNvIHRoZSBmb2xsb3dpbmcgY2hlY2twYXRj
aCAiY2hlY2siIDoKPj4KPj4gQ0hFQ0s6IFByZWZlciBrZXJuZWwgdHlwZSAndTMyJyBvdmVyICd1
aW50MzJfdCcKPj4gMzc6IEZJTEU6IGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9zcGwu
YzoxMzc6Cj4+ICvCoMKgwqAgdWludDMyX3Qgb3B0ZWVfYmFzZSA9IDAsIG9wdGVlX3NpemUgPSAw
LCB0ZWVfc2htZW1fYmFzZTsKPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxw
YXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBhcmNoL2FybS9tYWNo
LXN0bTMybXAvc3RtMzJtcDEvc3BsLmMgfCAyICstCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFj
aC1zdG0zMm1wL3N0bTMybXAxL3NwbC5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAx
L3NwbC5jCj4+IGluZGV4IDZjNzkyNTliMmM4Li4xMGFiYmVkODdmMCAxMDA2NDQKPj4gLS0tIGEv
YXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL3NwbC5jCj4+ICsrKyBiL2FyY2gvYXJtL21h
Y2gtc3RtMzJtcC9zdG0zMm1wMS9zcGwuYwo+PiBAQCAtMTM0LDcgKzEzNCw3IEBAIHZvaWQgc3Rt
MzJfaW5pdF90emNfZm9yX29wdGVlKHZvaWQpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBjb25zdCB1
aW50MzJfdCBkcmFtX3NpemUgPSBzdG0zMm1wX2dldF9kcmFtX3NpemUoKTsKPj4gwqDCoMKgwqDC
oCBjb25zdCB1aW50cHRyX3QgZHJhbV90b3AgPSBTVE0zMl9ERFJfQkFTRSArIChkcmFtX3NpemUg
LSAxKTsKPj4gLcKgwqDCoCB1aW50MzJfdCBvcHRlZV9iYXNlLCBvcHRlZV9zaXplLCB0ZWVfc2ht
ZW1fYmFzZTsKPj4gK8KgwqDCoCB1MzIgb3B0ZWVfYmFzZSA9IDAsIG9wdGVlX3NpemUgPSAwLCB0
ZWVfc2htZW1fYmFzZTsKPj4gwqDCoMKgwqDCoCBjb25zdCB1aW50cHRyX3QgdHpjID0gU1RNMzJf
VFpDX0JBU0U7Cj4+IMKgwqDCoMKgwqAgaW50IHJldDsKPj4gwqAgCj4gCj4gUmV2aWV3ZWQtYnk6
IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhh
bmtzCj4gUGF0cmljawo+IAo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9tYXN0ZXIKClRoYW5r
cwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3Vib290LXN0bTMyCg==
