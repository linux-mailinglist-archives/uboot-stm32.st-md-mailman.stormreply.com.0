Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F226520FDF
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 10:42:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09718C035BE;
	Tue, 10 May 2022 08:42:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42075C035BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 08:42:37 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A8GIlr021577;
 Tue, 10 May 2022 10:42:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0ypgm2A1uX695CQQosfNulZolfqZ+RTi9REMDX3ttjE=;
 b=dPp7ck31dd4hzGJXTf3Rzc/H7QSDWdRhTZWNb8uLZb6E19E2VhjEImm2Errrc1J4huCl
 q6r+F/zvy7CpITZzGtc4Ci22PYvPjkzZOJhwBzEyHtzw1DzXcW1j6L5sPZOXvxgpgAbn
 yb54Wi/18/9N/aiEL7/hjmTiRONVBcKmahYGdi1gCFZOUB61s0SO9BEfzK6JV5wwPmHD
 lWF3d6cJgQzFVahWz/MEwikmEIoda0rhSBZsxN7crfJr7er+x5ChFIJo6tRoBdB6jqKD
 pbZIhY7TdLxEH1TjIJ/sbZfvxG9zO7TatlTs0cUOZrKzymy+oaWwSxOuyNnRE2cELDBX wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwg40xn6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 10:42:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8294100034;
 Tue, 10 May 2022 10:42:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 976B2214D23;
 Tue, 10 May 2022 10:42:34 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 10:42:34 +0200
Message-ID: <4b5e968d-6db6-0092-9c1a-968c957703de@foss.st.com>
Date: Tue, 10 May 2022 10:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220422073918.15918-1-patrice.chotard@foss.st.com>
 <0884576b-f850-1bf2-2b72-0db328d61c51@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <0884576b-f850-1bf2-2b72-0db328d61c51@foss.st.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: st: stm32mp1: Consider USB cable
 connected when boot device is USB
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

CgpPbiA1LzYvMjIgMTA6NTEsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCj4gCj4gT24g
NC8yMi8yMiAwOTozOSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBBbHdheXMgY29uc2lkZXIg
VVNCIGNhYmxlIGlzIGNvbm5lY3RlZCB3aGVuIFVTQiBib290IGRldmljZSBpcyBkZXRlY3RlZC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9z
cy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBib2FyZC9zdC9zdG0zMm1wMS9zdG0zMm1wMS5jIHwg
NyArKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL2JvYXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmMgYi9ib2FyZC9zdC9zdG0zMm1w
MS9zdG0zMm1wMS5jCj4+IGluZGV4IGZmZjE4ODBlNWIuLjYyYTVmYzIzZTYgMTAwNjQ0Cj4+IC0t
LSBhL2JvYXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmMKPj4gKysrIGIvYm9hcmQvc3Qvc3RtMzJt
cDEvc3RtMzJtcDEuYwo+PiBAQCAtMTk5LDYgKzE5OSwxMyBAQCBpbnQgZ19kbmxfYm9hcmRfdXNi
X2NhYmxlX2Nvbm5lY3RlZCh2b2lkKQo+PiDCoMKgwqDCoMKgIGlmICghSVNfRU5BQkxFRChDT05G
SUdfVVNCX0dBREdFVF9EV0MyX09URykpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVO
T0RFVjsKPj4gwqAgK8KgwqDCoCAvKgo+PiArwqDCoMKgwqAgKiBJbiBjYXNlIG9mIFVTQiBib290
IGRldmljZSBpcyBkZXRlY3RlZCwgY29uc2lkZXIgVVNCIGNhYmxlIGlzCj4+ICvCoMKgwqDCoCAq
IGNvbm5lY3RlZAo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCBpZiAoKGdldF9ib290bW9kZSgp
ICYgVEFNUF9CT09UX0RFVklDRV9NQVNLKSA9PSBCT09UX1NFUklBTF9VU0IpCj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4gKwo+PiDCoMKgwqDCoMKgIC8qIGlmIHR5cGVjIHN0dXNi
MTYweCBpcyBwcmVzZW50LCBtZWFucyBESzEgb3IgREsyIGJvYXJkICovCj4+IMKgwqDCoMKgwqAg
cmV0ID0gc3R1c2IxNjB4X2NhYmxlX2Nvbm5lY3RlZCgpOwo+PiDCoMKgwqDCoMKgIGlmIChyZXQg
Pj0gMCkKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxh
dW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCj4gCkFwcGxpZWQgdG8g
dS1ib290LXN0bTMyCgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
