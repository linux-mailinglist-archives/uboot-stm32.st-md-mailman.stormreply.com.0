Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7D1879317
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Mar 2024 12:36:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9322CC6C855;
	Tue, 12 Mar 2024 11:36:26 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44403C6C83C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 11:36:25 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42C96B3A006852; Tue, 12 Mar 2024 12:36:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Hj2d4wu6VcDJqNdPpKJFwxzCMaIUQcyVkHiHm1Z6HYw=; b=Kt
 EFH6oH2AjgMCXVCFHZvEtzDKx7pFl8BNYsRWur4ZWHFJ1qzvDJQuBhxwhtOfhK2h
 6OKR4y/vXykPqH4QOtJsRlk8bPgoydvOaO7PX9Az0odDYrQYOwS8DO2li+hq0G40
 Abm8mYev7RgUW/S5AoKAxbYuEXlQAIOnSZuaG7zGRGWYMRRmYarlNJwyRWRXrc3i
 5skN07dOqZaQRQPNvukYHCPfsVULHHIJDmco6J/Xbn5GyaKRAZZtSS5QSyM53afE
 4h2AbZIaDgbejq1tc9V8VpjpYh81QaT0lDF+pYfX7991GWbTqZ+5d4zFvB5N7rT7
 1t57LcZ26hYfNdoeandA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ws3knt3w7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Mar 2024 12:36:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 36C4640045;
 Tue, 12 Mar 2024 12:36:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DA6A25F7D8;
 Tue, 12 Mar 2024 12:35:48 +0100 (CET)
Received: from [10.201.20.71] (10.201.20.71) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Mar
 2024 12:35:48 +0100
Message-ID: <244cd370-a772-454e-b676-b7b2ad5671c7@foss.st.com>
Date: Tue, 12 Mar 2024 12:35:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Kumar, Udit" <u-kumar1@ti.com>, <u-boot@lists.denx.de>
References: <20240311143918.2927406-1-patrice.chotard@foss.st.com>
 <32e8bffc-dbe7-48d9-985f-d794aa6a4848@ti.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <32e8bffc-dbe7-48d9-985f-d794aa6a4848@ti.com>
X-Originating-IP: [10.201.20.71]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_08,2024-03-12_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Michal Simek <michal.simek@amd.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] lmb: Avoid to add identical region in
 lmb_add_region_flags()
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

CgpPbiAzLzExLzI0IDE2OjM2LCBLdW1hciwgVWRpdCB3cm90ZToKPiAKPiBPbiAzLzExLzIwMjQg
ODowOSBQTSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBJbiBjYXNlIGxtYl9hZGRfcmVnaW9u
X2ZsYWdzKCkgaXMgY2FsbGVkIHdpdGggdGhlIHNhbWUgcGFyYW1ldGVyIHRoYW4KPj4gYW4gYWxy
ZWFkeSBleGlzdGluZyBsbWIgYW5kIHRoaXMgbG1iIGlzIGFkamFjZW50IHRvIGl0cyBwcmV2aW91
cyBsbWIgd2l0aAo+PiBkaWZmZXJlbnQgZmxhZywgdGhpcyBsbWIgaXMgYWRkZWQgYWdhaW4uCj4g
Cj4gCj4gU2FtZSBwYXJhbWV0ZXIgbWVhbnMgLCBhZGRyIGFuZCBzaXplIGFuZCBkaWZmZXJlbnQg
ZmxhZ3MgY29ycmVjdCA/CgpIaSBVZGl0LAoKU2FtZSBwYXJhbWV0ZXJzIG1lYW5zIHNhbWUgYWRk
ciwgc2FtZSBzaXplIGFuZCBzYW1lIGZsYWdzLgoKPiAKPiAKPj4gSW5zdGVhZCBicmVha2luZyB0
aGUgbG9vcCwgY29udGludWUsIGF0IHRoZSBuZXh0IGl0ZXJhdGlvbiwgd2UgYXJlIGFibGUKPj4g
dG8gZGV0ZWN0IHRoYXQgdGhpcyByZWdpb24gYWxyZWFkeSBleGlzdC4KPiAKPiBPbmNlIHJlZ2lv
biBhbHJlYWR5IGV4aXN0IGRldGVjdGVkLCB0aGVuIHlvdSBjYW4gdGhpbmsgb2YgcmV0dXJuaW5n
IGVycm9yICwgbm8gPwoKQmVmb3JlIGRldGVjdGluZyB0aGlzIHJlZ2lvbiBpcyBhbHJlYWR5IHBy
ZXNlbnQsIGl0J3MgZGV0ZWN0ZWQgCnRoYXQgdGhpcyByZWdpb24gd2Ugd2FudCB0byBhZGQgaXMg
YWRqYWNlbnQgdG8gYSByZWdpb24gcHJlc2VudCBpbiByZ25bXSBhcnJheS4KClRoYXQncyB3aHkg
aSByZXBsYWNlIHRoZSAiYnJlYWsiIGJ5IGEgImNvbnRpbnVlIiB0byBiZSBhYmxlIHRvIGRldGVj
dCB0aGlzIHJlZ2lvbiBpcyBhbHJlYWR5CnByZXNlbnQgaW4gcmduW10gaW4gdGhlIG5leHQgaXRl
cmF0aW9uLgoKVGhhbmtzClBhdHJpY2UKCj4gCj4gCj4+IElzc3VlIHJlcHJvZHVjZWQgb24gU1RN
MzJNUDE1Ny1ESzIgd2l0aCBTQ01JIERULCBiZGluZm8gY29tbWFuZCdzIG91dHB1dAo+PiBzaG93
czoKPj4KPj4gQmVmb3JlIHRoaXMgcGF0Y2gsIHRoZSBsYXN0IExNQiBbMHhkZTAwMDAwMC0weGRm
ZmZmZmZmXSBpcyBkdXBsaWNhdGVkOgo+PiAuLi4KPj4gbG1iX2R1bXBfYWxsOm5ubgo+PiDCoCBt
ZW1vcnkuY250ID0gMHgxIC8gbWF4ID0gMHgyCj4+IMKgIG1lbW9yeVswXcKgwqDCoMKgwqAgWzB4
YzAwMDAwMDAtMHhkZmZmZmZmZl0sIDB4MjAwMDAwMDAgYnl0ZXMgZmxhZ3M6IDAKPj4gwqAgcmVz
ZXJ2ZWQuY250ID0gMHg2IC8gbWF4ID0gMHgxMAo+PiDCoCByZXNlcnZlZFswXcKgwqDCoCBbMHgx
MDAwMDAwMC0weDEwMDQ1ZmZmXSwgMHgwMDA0NjAwMCBieXRlcyBmbGFnczogNAo+PiDCoCByZXNl
cnZlZFsxXcKgwqDCoCBbMHgzMDAwMDAwMC0weDMwMDNmZmZmXSwgMHgwMDA0MDAwMCBieXRlcyBm
bGFnczogNAo+PiDCoCByZXNlcnZlZFsyXcKgwqDCoCBbMHgzODAwMDAwMC0weDM4MDBmZmZmXSwg
MHgwMDAxMDAwMCBieXRlcyBmbGFnczogNAo+PiDCoCByZXNlcnZlZFszXcKgwqDCoCBbMHhkYWFk
ZjAwMC0weGRmZmZmZmZmXSwgMHgwNTUyMTAwMCBieXRlcyBmbGFnczogMAo+PiDCoCByZXNlcnZl
ZFs0XcKgwqDCoCBbMHhkZTAwMDAwMC0weGRmZmZmZmZmXSwgMHgwMjAwMDAwMCBieXRlcyBmbGFn
czogNAo+PiDCoCByZXNlcnZlZFs1XcKgwqDCoCBbMHhkZTAwMDAwMC0weGRmZmZmZmZmXSwgMHgw
MjAwMDAwMCBieXRlcyBmbGFnczogNAo+PiAuLi4KPj4KPj4gQWZ0ZXIgdGhpcyBwYXRjaDoKPj4g
Li4uCj4+IGxtYl9kdW1wX2FsbDoKPj4gwqAgbWVtb3J5LmNudCA9IDB4MSAvIG1heCA9IDB4Mgo+
PiDCoCBtZW1vcnlbMF3CoMKgwqDCoMKgIFsweGMwMDAwMDAwLTB4ZGZmZmZmZmZdLCAweDIwMDAw
MDAwIGJ5dGVzIGZsYWdzOiAwCj4+IMKgIHJlc2VydmVkLmNudCA9IDB4NSAvIG1heCA9IDB4MTAK
Pj4gwqAgcmVzZXJ2ZWRbMF3CoMKgwqAgWzB4MTAwMDAwMDAtMHgxMDA0NWZmZl0sIDB4MDAwNDYw
MDAgYnl0ZXMgZmxhZ3M6IDQKPj4gwqAgcmVzZXJ2ZWRbMV3CoMKgwqAgWzB4MzAwMDAwMDAtMHgz
MDAzZmZmZl0sIDB4MDAwNDAwMDAgYnl0ZXMgZmxhZ3M6IDQKPj4gwqAgcmVzZXJ2ZWRbMl3CoMKg
wqAgWzB4MzgwMDAwMDAtMHgzODAwZmZmZl0sIDB4MDAwMTAwMDAgYnl0ZXMgZmxhZ3M6IDQKPj4g
wqAgcmVzZXJ2ZWRbM13CoMKgwqAgWzB4ZGFhZGYwMDAtMHhkZmZmZmZmZl0sIDB4MDU1MjEwMDAg
Ynl0ZXMgZmxhZ3M6IDAKPj4gwqAgcmVzZXJ2ZWRbNF3CoMKgwqAgWzB4ZGUwMDAwMDAtMHhkZmZm
ZmZmZl0sIDB4MDIwMDAwMDAgYnl0ZXMgZmxhZ3M6IDQKPj4gLi4uCj4+Cj4+IEZpeGVzOiA1OWMw
ZWE1ZGYzM2YgKCJsbWI6IEFkZCBzdXBwb3J0IG9mIGZsYWdzIGZvciBuby1tYXAgcHJvcGVydGll
cyIpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJk
QGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgbGliL2xtYi5jIHwgNCArKy0tCj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9saWIvbG1iLmMgYi9saWIvbG1iLmMKPj4gaW5kZXggNDRmOTgyMDUzMTAuLmI2YWZi
NzMxNDQwIDEwMDY0NAo+PiAtLS0gYS9saWIvbG1iLmMKPj4gKysrIGIvbGliL2xtYi5jCj4+IEBA
IC0yODUsMTQgKzI4NSwxNCBAQCBzdGF0aWMgbG9uZyBsbWJfYWRkX3JlZ2lvbl9mbGFncyhzdHJ1
Y3QgbG1iX3JlZ2lvbiAqcmduLCBwaHlzX2FkZHJfdCBiYXNlLAo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgYWRqYWNlbnQgPSBsbWJfYWRkcnNfYWRqYWNlbnQoYmFzZSwgc2l6ZSwgcmduYmFzZSwgcmdu
c2l6ZSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoYWRqYWNlbnQgPiAwKSB7Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChmbGFncyAhPSByZ25mbGFncykKPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb250aW51ZTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmduLT5yZWdp
b25baV0uYmFzZSAtPSBzaXplOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZ24tPnJl
Z2lvbltpXS5zaXplICs9IHNpemU7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvYWxl
c2NlZCsrOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIH0gZWxzZSBpZiAoYWRqYWNlbnQgPCAwKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChmbGFncyAhPSByZ25mbGFncykKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250
aW51ZTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmduLT5yZWdpb25baV0uc2l6ZSAr
PSBzaXplOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb2FsZXNjZWQrKzsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
