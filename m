Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F70C814A27
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Dec 2023 15:13:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E572FC6DD6D;
	Fri, 15 Dec 2023 14:13:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16082C6DD6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 14:13:02 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BF9dlJF028436; Fri, 15 Dec 2023 15:13:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=6xCcXQyn99iRhLZ8grv5OFshDt5uJrWpGPlmJk9r4Zg=; b=2W
 IOo0roxy6f2LRe2LM7n7GPnLwY7VCf3oqEi+nozEXGVK4RoAprOtxYeiVAiDfONE
 PrsPB08tQosMvbVk6vpv11BgdsBn4aPcizlyYCHUZfN3AAayO+STggHXYA8CpDfe
 ESnCKpFBSkrRgVJieYchbyl7vUxZRKgerkzVeHwaNG9f9Du+QSX03Fv49HgNQjvA
 L0Mdo9eZ0cr4DoTjoag3iFZeIypNLwVvZjaXavDr1NiL6lW2Xk6JfUQITNv37+OS
 U0xTxHouc6h53CBKpdzQz9Ae6cdLvVmfn495yXAAnKiZJlKvh9gAmiLgjgzAGjz5
 zPfsG22SuMroZ4y7O8eQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvehmtn0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 15:13:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0857E100058;
 Fri, 15 Dec 2023 15:13:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F31E42278B6;
 Fri, 15 Dec 2023 15:13:00 +0100 (CET)
Received: from [10.252.23.141] (10.252.23.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 15:13:00 +0100
Message-ID: <593de0a9-9c11-445e-8254-372d485b011a@foss.st.com>
Date: Fri, 15 Dec 2023 15:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20231117170107.1147598-1-patrice.chotard@foss.st.com>
 <7e2b0b40-1193-4a4f-8397-0ccc99d9122a@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <7e2b0b40-1193-4a4f-8397-0ccc99d9122a@foss.st.com>
X-Originating-IP: [10.252.23.141]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_08,2023-12-14_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] board: st: common: Fix
	board_get_alt_info_mtd()
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

CgpPbiAxMi8xNS8yMyAxMjo1MiwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPiAKPiBP
biAxMS8xNy8yMyAxODowMSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBTaW5jZSBNVEQgZGV2
aWNlcyBhcmUgcGFydGlvbmVkLCB3ZSBnb3QgdGhlIGZvbGxvd2luZwo+PiBlcnJvciB3aGVuIGNv
bW1hbmQgImRmdSAwIiBpcyBleGVjdXRlZDoKPj4KPj4gREZVIGFsdCBpbmZvIHNldHRpbmc6IGRv
bmUKPj4gRVJST1I6IFRvbyBtYW55IGFyZ3VtZW50cyBmb3Igbm9yMAo+PiBFUlJPUjogREZVIGVu
dGl0aWVzIGNvbmZpZ3VyYXRpb24gZmFpbGVkIQo+PiBFUlJPUjogKHBhcnRpdGlvbiB0YWJsZSBk
b2VzIG5vdCBtYXRjaCBkZnVfYWx0X2luZm8/KQo+Pgo+PiBGaXhlczogMzEzMjVlMWI4YjljICgi
c3RtMzJtcDE6IGR5bmFtaWNhbGx5IGJ1aWxkIERGVV9BTFRfSU5GTyIpCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAt
LS0KPj4KPj4gwqAgYm9hcmQvc3QvY29tbW9uL3N0bTMybXBfZGZ1LmMgfCA5ICsrLS0tLS0tLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvYm9hcmQvc3QvY29tbW9uL3N0bTMybXBfZGZ1LmMgYi9ib2FyZC9zdC9j
b21tb24vc3RtMzJtcF9kZnUuYwo+PiBpbmRleCBhOGViOGQ1Y2FlMi4uZGVkM2JmODE5NjEgMTAw
NjQ0Cj4+IC0tLSBhL2JvYXJkL3N0L2NvbW1vbi9zdG0zMm1wX2RmdS5jCj4+ICsrKyBiL2JvYXJk
L3N0L2NvbW1vbi9zdG0zMm1wX2RmdS5jCj4+IEBAIC03Myw3ICs3Myw2IEBAIHN0YXRpYyB2b2lk
IGJvYXJkX2dldF9hbHRfaW5mb19tbWMoc3RydWN0IHVkZXZpY2UgKmRldiwgY2hhciAqYnVmKQo+
PiDCoCBzdGF0aWMgdm9pZCBib2FyZF9nZXRfYWx0X2luZm9fbXRkKHN0cnVjdCBtdGRfaW5mbyAq
bXRkLCBjaGFyICpidWYpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgbXRkX2luZm8gKnBh
cnQ7Cj4+IC3CoMKgwqAgYm9vbCBmaXJzdCA9IHRydWU7Cj4+IMKgwqDCoMKgwqAgY29uc3QgY2hh
ciAqbmFtZTsKPj4gwqDCoMKgwqDCoCBpbnQgbGVuLCBwYXJ0bnVtID0gMDsKPj4gwqAgQEAgLTg2
LDE3ICs4NSwxMyBAQCBzdGF0aWMgdm9pZCBib2FyZF9nZXRfYWx0X2luZm9fbXRkKHN0cnVjdCBt
dGRfaW5mbyAqbXRkLCBjaGFyICpidWYpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJt
dGQgJXM9IiwgbmFtZSk7Cj4+IMKgIMKgwqDCoMKgwqAgbGVuICs9IHNucHJpbnRmKGJ1ZiArIGxl
biwgREZVX0FMVF9CVUZfTEVOIC0gbGVuLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiJXMg
cmF3IDB4MCAweCVsbHggIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIiVzIHJhdyAweDAg
MHglbGx4IiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmFtZSwgbXRkLT5zaXplKTsK
Pj4gwqAgwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KHBhcnQsICZtdGQtPnBhcnRpdGlv
bnMsIG5vZGUpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHBhcnRudW0rKzsKPj4gLcKgwqDCoMKg
wqDCoMKgIGlmICghZmlyc3QpCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxlbiArPSBzbnBy
aW50ZihidWYgKyBsZW4sIERGVV9BTFRfQlVGX0xFTiAtIGxlbiwgIjsiKTsKPj4gLcKgwqDCoMKg
wqDCoMKgIGZpcnN0ID0gZmFsc2U7Cj4+IC0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGxlbiArPSBz
bnByaW50ZihidWYgKyBsZW4sIERGVV9BTFRfQlVGX0xFTiAtIGxlbiwKPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAiJXNfJXMgcGFydCAlZCIsCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgIjslc18lcyBwYXJ0ICVkIiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBuYW1lLCBwYXJ0LT5uYW1lLCBwYXJ0bnVtKTsKPj4gwqDCoMKgwqDCoCB9
Cj4+IMKgIH0KPiAKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmlj
ay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCkFwcGxpZWQg
dG8gdS1ib290LXN0bTMyL25leHQKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9v
dC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
