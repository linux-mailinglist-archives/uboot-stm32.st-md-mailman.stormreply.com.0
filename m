Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB97D8AAE57
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:21:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9ACBAC6DD9A;
	Fri, 19 Apr 2024 12:21:52 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0218FC6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:21:50 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9MgiH005448; Fri, 19 Apr 2024 14:21:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=i6b6Re3mbJ4rbI5lH1AE3PU35xYbzHB52NyBgBxNd7U=; b=Z2
 sHSeqwvmBaF/qQsTEOPjYbp5rv6I1pXfl2YN0Zw5ZflGyEzoEcj/mdGJ+84uHfHK
 ShfKkDKHqAeC+2Bd/Z5JKbokN99hkPxd44MylNivOHdrAYoP55c4p001bofK5Dvc
 r/LgN8L3iDkj4bTSjtngA8pY75JxutRAzypWeZWpdxprFSvjd9cUOv21KtvRV6Ls
 js9Ixb05I2Loy4/bnryo4aNk1swB8x83bElYZm8QbpG1z/dxgguIoc2jyzy+azEd
 i3yqX9O+dmTcNgxiPWkKsqIfemFsBvHJSL60KLA6NtMxcQ1Ykr8x2ridFZzt/QAD
 f0LDz3Fhde31VwU4ERIg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg50j9esc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:21:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E202E40045;
 Fri, 19 Apr 2024 14:21:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D2EB21A8E6;
 Fri, 19 Apr 2024 14:21:31 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:21:31 +0200
Message-ID: <cd1722ab-0d3a-47f4-8e73-0204044f81f9@foss.st.com>
Date: Fri, 19 Apr 2024 14:21:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-13-patrice.chotard@foss.st.com>
 <1441dbdb-deb2-4b92-9852-7b73940041d4@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <1441dbdb-deb2-4b92-9852-7b73940041d4@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 12/25] ARM: dts: stm32: Update red led
 node for stm32mp157a-dk1-scmi-u-boot
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

CgpPbiA0LzE3LzI0IDExOjA4LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvOS8yNCAxNzowMiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBBcyBpbmRpY2F0ZWQgaW4g
a2VybmVsIGxlZCBkdC1iaW5kaW5ncywgbGFiZWwgaXMgYSBkZXByZWNhdGVkCj4+IHByb3BlcnR5
LCBzbyByZW1vdmUgaXQgYW5kIHVzZSByZWQgbGVkIG5vZGUncyBuYW1lIGluc3RlYWQKPj4gZm9y
IHUtYm9vdCxlcnJvci1sZWQgcHJvcGVydHkuCj4+IFJlbmFtZSAicmVkIiBsZWQgbm9kZSdzIG5h
bWUgdG8gImxlZC1yZWQiLgo+PiBSZW1vdmUgc3RhdHVzIHByb3BlcnR5IHdoaWNoIGlzIHVzZWxl
c3MuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJk
QGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdhLWRr
MS1zY21pLXUtYm9vdC5kdHNpIHwgNiArKy0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0
cy9zdG0zMm1wMTU3YS1kazEtc2NtaS11LWJvb3QuZHRzaSBiL2FyY2gvYXJtL2R0cy9zdG0zMm1w
MTU3YS1kazEtc2NtaS11LWJvb3QuZHRzaQo+PiBpbmRleCA4NzYwZDZjN2Q5My4uZTYxODE0ZmQ2
NmUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3YS1kazEtc2NtaS11LWJv
b3QuZHRzaQo+PiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2EtZGsxLXNjbWktdS1ib290
LmR0c2kKPj4gQEAgLTE0LDcgKzE0LDcgQEAKPj4gwqAgwqDCoMKgwqDCoCBjb25maWcgewo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgdS1ib290LGJvb3QtbGVkID0gImhlYXJ0YmVhdCI7Cj4+IC3CoMKg
wqDCoMKgwqDCoCB1LWJvb3QsZXJyb3ItbGVkID0gImVycm9yIjsKPj4gK8KgwqDCoMKgwqDCoMKg
IHUtYm9vdCxlcnJvci1sZWQgPSAibGVkLXJlZCI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB1LWJv
b3QsbW1jLWVudi1wYXJ0aXRpb24gPSAidS1ib290LWVudiI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBzdCxhZGNfdXNiX3BkID0gPCZhZGMxIDE4PiwgPCZhZGMxIDE5PjsKPj4gwqDCoMKgwqDCoCB9
Owo+PiBAQCAtMzYsMTAgKzM2LDggQEAKPj4gwqDCoMKgwqDCoCB9Owo+PiDCoCDCoMKgwqDCoMKg
IGxlZCB7Cj4+IC3CoMKgwqDCoMKgwqDCoCByZWQgewo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBsYWJlbCA9ICJlcnJvciI7Cj4+ICvCoMKgwqDCoMKgwqDCoCBsZWQtcmVkIHsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3Bpb3MgPSA8JmdwaW9hIDEzIEdQSU9fQUNUSVZFX0xPVz47
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIH07Cj4+IMKgwqDCoMKgwqAgfTsKPj4gwqAgfTsKPiAKPiAKPiAKPiBSZXZpZXdl
ZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAK
PiBUaGFua3MKPiBQYXRyaWNrCj4gCgpBcHBsaWVkIG9uIHUtYm9vdC1zdG0zMi9tYXN0ZXIgCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMy
IG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290
LXN0bTMyCg==
