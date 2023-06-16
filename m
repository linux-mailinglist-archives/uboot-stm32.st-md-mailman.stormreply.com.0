Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D5A73305A
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jun 2023 13:48:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B851EC65E58;
	Fri, 16 Jun 2023 11:48:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 440C9C64110
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 11:48:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35GBei14021579; Fri, 16 Jun 2023 13:48:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=uB0fUOkwqUC6qLF+Ppk0PPbW7aPbNslLMlU5HNUrzSI=;
 b=7Eh7mXYtcn24FxaXiTtGqowctI9NAJk3odPpmLNCKStPhoymIyTiEoNhwzeyETXz2tnn
 S9fWartsMwunvg5w+2etulSXTuxCqadw5A81soArrPsV2jntzPqBpqhDzUnpfjVPTe7/
 3uUb5TijB3/3fQO5x0k+zpjMfiv7l2ZLnA20kT1ftj/nqGmyAbkEbrYNZ7W6l5BEEhk8
 rN5Wh8qtuknVAI+3xJuRXMYMdKRT+Ppsiz5drgUdGsCflGKf75ZXqofdGfJwioVrldhk
 rBKTOncpbKAoOk2aZYnQSfpo+/3Gsykl2Qd4NRVWx7mdbwjXdFLmysxtguStkdlLIA5D kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r8kx2hfkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 13:48:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED6E510002A;
 Fri, 16 Jun 2023 13:48:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E600A232FE9;
 Fri, 16 Jun 2023 13:48:14 +0200 (CEST)
Received: from [10.252.4.57] (10.252.4.57) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 16 Jun
 2023 13:48:14 +0200
Message-ID: <4cf0dd87-23df-4fa4-8334-17c4cefdc9fe@foss.st.com>
Date: Fri, 16 Jun 2023 13:48:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230424142110.788029-1-patrick.delaunay@foss.st.com>
 <20230424162102.v2.2.Id975ebfa1953ef54fc7558442f64a693fa74bc3a@changeid>
 <2576e151-6789-81f1-8b6b-adab49481fec@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <2576e151-6789-81f1-8b6b-adab49481fec@denx.de>
X-Originating-IP: [10.252.4.57]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] ARM: dts: stm32mp: alignment with
	v6.3
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

CgpPbiA0LzI1LzIzIDE4OjUyLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA0LzI0LzIzIDE2OjIx
LCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+PiBEZXZpY2UgdHJlZSBhbGlnbm1lbnQgd2l0aCBM
aW51eCBrZXJuZWwgdjYuMzoKPj4gLSBmNWEwNTgwMjMyMzkgLSBBUk06IGR0czogc3RtMzI6IGFk
ZCBpMmMgbm9kZXMgaW50byBzdG0zMm1wMTMxLmR0c2kKPj4gLSA4NTM5ZWJiNDM1YTUgLSBBUk06
IGR0czogc3RtMzI6IGVuYWJsZSBpMmMxIGFuZCBpMmM1IG9uCj4+IMKgwqAgc3RtMzJtcDEzNWYt
ZGsuZHRzCj4+IC0gODUzOWViYjQzNWE1IC0gQVJNOiBkdHM6IHN0bTMyOiBhZGQgc3BpIG5vZGVz
IGludG8gc3RtMzJtcDEzMS5kdHNpCj4+IC0gMTVmNzJlMGRhNGRhIC0gQVJNOiBkdHM6IHN0bTMy
OiBhZGQgcGluY3RybCBhbmQgZGlzYWJsZWQgc3BpNSBub2RlIGluCj4+IMKgwqAgc3RtMzJtcDEz
NWYtZGsKPj4gLSBlYTk5YTVhMDJlYmMgLSBBUk06IGR0czogc3RtMzI6IENyZWF0ZSBzZXBhcmF0
ZSBwaW5tdXggZm9yIHFzcGkgY3MgcGluCj4+IMKgwqAgaW4gc3RtMzJtcDE1LXBpbmN0cmwuZHRz
aQo+PiAtIGEzMDZkODk2MmEyNCAtIEFSTTogZHRzOiBzdG0zMjogUmVuYW1lIG1kaW8wIHRvIG1k
aW8KPj4gLSAwYTVlYmIxZjMzNjcgLSBBUk06IGR0czogc3RtMzI6IFJlcGxhY2UgU0FJIGZvcm1h
dCB3aXRoIGRhaS1mb3JtYXQgRFQKPj4gwqDCoCBwcm9wZXJ0eQo+PiAtIGNjZGFiMTk3MzhhNiAt
IEFSTTogZHRzOiBzdG0zMjogYWRkIGFkYyBzdXBwb3J0IHRvIHN0bTMybXAxMwo+PiAtIDAyMjkz
MmFiNTVmZCAtIEFSTTogZHRzOiBzdG0zMjogYWRkIGFkYyBwaW5zIG11eGluZyBvbiBzdG0zMm1w
MTM1Zi1kawo+PiAtIGFiMjgwNmRkYWQ5ZCAtIEFSTTogZHRzOiBzdG0zMjogYWRkIGR1bW15IHZk
ZF9hZGMgcmVndWxhdG9yIG9uCj4+IMKgwqAgc3RtMzJtcDEzNWYtZGsKPj4gLSBlNDZhMTgwYzA2
MGYgLSBBUk06IGR0czogc3RtMzI6IGFkZCBhZGMgc3VwcG9ydCBvbiBzdG0zMm1wMTM1Zi1kawo+
PiAtIDllYmYyMTVmYmFlMSAtIEFSTTogZHRzOiBzdG0zMjogYWRkIFBXUiBmaXhlZCByZWd1bGF0
b3JzIG9uIHN0bTMybXAxMzEKPj4gLSAxNmY0ZmY2MDUxOWEgLSBBUk06IGR0czogc3RtMzI6IGFk
ZCBVU0JQSFlDIGFuZCBkdWFsIFVTQiBIUyBQSFkgc3VwcG9ydAo+PiDCoMKgIG9uIHN0bTMybXAx
MzEKPj4gLSA0YTQ3ZjBmM2U5MzYgLSBBUk06IGR0czogc3RtMzI6IGFkZCBVQlNIIEVIQ0kgYW5k
IE9IQ0kgc3VwcG9ydCBvbgo+PiDCoMKgIHN0bTMybXAxMzEKPj4gLSAyYTQ2YmI2NmM0N2YgLSBB
Uk06IGR0czogc3RtMzI6IGFkZCBVU0IgT1RHIEhTIHN1cHBvcnQgb24gc3RtMzJtcDEzMQo+PiAt
IDllYmYyMTVmYmFlMSAtIEFSTTogZHRzOiBzdG0zMjogYWRkIGZpeGVkIHJlZ3VsYXRvcnMgdG8g
c3VwcG9ydCB1c2Igb24KPj4gwqDCoCBzdG0zMm1wMTM1Zi1kawo+PiAtIDE2ZjRmZjYwNTE5YSAt
IEFSTTogZHRzOiBzdG0zMjogZW5hYmxlIFVTQiBIUyBwaHlzIG9uIHN0bTMybXAxMzVmLWRrCj4+
IC0gYzRlNzI1NGNmNmRjIC0gQVJNOiBkdHM6IHN0bTMyOiBlbmFibGUgVVNCIEhvc3QgRUhDSSBv
biBzdG0zMm1wMTM1Zi1kawo+PiAtIDQ0OTc4ZTEzNTkxNiAtIEFSTTogZHRzOiBzdG0zMjogYWRk
IHBpbnMgZm9yIHN0bTMyZzAgdHlwZWMgY29udHJvbGxlciBvbiBzdG0zMm1wMTMKPj4gLSA0ZjUz
MjQwM2IxZTUgLSBBUk06IGR0czogc3RtMzI6IGVuYWJsZSBVU0IgT1RHIGluIGR1YWwgcm9sZSBt
b2RlIG9uCj4+IMKgwqAgc3RtMzJtcDEzNWYtZGsKPj4gLSBlMWYxNTU3MWM5NmMgLSBBUk06IGR0
czogc3RtMzI6IGFkZCBtY3AyMzAxNyBwaW5jdHJsIGVudHJ5IGZvciBzdG0zMm1wMTMKPj4gLSA2
Y2M3MTM3NDAwMmUgLSBBUk06IGR0czogc3RtMzI6IGFkZCBtY3AyMzAxNyBJTyBleHBhbmRlciBv
biBJMkMxIG9uCj4+IMKgwqAgc3RtMzJtcDEzNWYtZGsKPj4gLSA3ZmZkMjI2NmJkMzIgLSBBUk06
IGR0czogc3RtMzI6IEZpeCBxc3BpIHBpbmN0cmwgcGhhbmRsZSBmb3IKPj4gwqDCoCBzdG0zMm1w
MTV4eC1kaGNvci1zb20KPj4gLSAyMWQ4MzUxMmJmMmIgLSBBUk06IGR0czogc3RtMzI6IEZpeCBx
c3BpIHBpbmN0cmwgcGhhbmRsZSBmb3IKPj4gwqDCoCBzdG0zMm1wMTV4eC1kaGNvbS1zb20KPj4g
LSA3MzJkYmNmNTJmNzQgLSBBUk06IGR0czogc3RtMzI6IEZpeCBxc3BpIHBpbmN0cmwgcGhhbmRs
ZSBmb3IKPj4gwqDCoCBzdG0zMm1wMTUxYS1wcnR0MWwKPj4gLSAwMDNiN2M2YjI0ZjQgLSBBUk06
IGR0czogc3RtMzI6IHJlbW92ZSBzYWkga2VybmVsIGNsb2NrIG9uCj4+IMKgwqAgc3RtMzJtcDE1
eHgtZGt4Cj4+IC0gZjJiMTdiMzliZmZmIC0gQVJNOiBkdHM6IHN0bTMyOiByZW5hbWUgc291bmQg
Y2FyZCBvbiBzdG0zMm1wMTV4eC1ka3gKPj4gLSBkZWUzY2I3NTlkM2QgLSBBUk06IGR0czogc3Rt
MzI6IFJlbW92ZSB0aGUgcGlucy1hcmUtbnVtYmVyZWQgcHJvcGVydHkKPj4gLSBhZThjZjNiNDg3
MjcgLSBBUk06IGR0czogc3RtMzI6IGFkZCBpMnMgbm9kZXMgb24gc3RtMzJtcDEzMQo+PiAtIDYx
OTc0NmEyN2JkMCAtIEFSTTogZHRzOiBzdG0zMjogYWRkIHNhaSBub2RlcyBvbiBzdG0zMm1wMTMx
Cj4+IC0gYzVlMDVkMDhlZjkwIC0gQVJNOiBkdHM6IHN0bTMyOiBhZGQgc3BkaWZyeCBub2RlIG9u
IHN0bTMybXAxMzEKPj4gLSAwYTVhZmQzZWUwZDAgLSBBUk06IGR0czogc3RtMzI6IGFkZCBkZnNk
bSBub2RlIG9uIHN0bTMybXAxMzEKPj4gLSBiZjlkODc2YmVhMmUgLSBBUk06IGR0czogc3RtMzI6
IGFkZCB0aW1lcnMgc3VwcG9ydCBvbiBzdG0zMm1wMTMxCj4+IC0gYTMxODM3NDgzNzFkIC0gQVJN
OiBkdHM6IHN0bTMyOiBhZGQgdGltZXIgcGlucyBtdXhpbmcgZm9yIHN0bTMybXAxMzVmLWRrCj4+
IC0gYTkwNjBjMTMyNmJjIC0gQVJNOiBkdHM6IHN0bTMyOiBhZGQgdGltZXJzIHN1cHBvcnQgb24g
c3RtMzJtcDEzNWYtZGsKPj4gLSBhMTIxNTQwNThmNzUgLSBBUk06IGR0czogc3RtMzI6IEZpeCBV
c2VyIGJ1dHRvbiBvbiBzdG0zMm1wMTM1Zi1kawo+PiAtIDJmMzNkZjg4OWU5OSAtIEFSTTogZHRz
OiBzdG0zMjogVXNlIG5ldyBtZWRpYSBidXMgdHlwZSBtYWNyb3MKPj4gLSAzNjYzODRlNDk1NTEg
LSBBUk06IGR0czogc3RtMzI6IFVwZGF0ZSBwYXJ0IG51bWJlciBOVk1FTSBkZXNjcmlwdGlvbiBv
bgo+PiDCoMKgIHN0bTMybXAxMzEKPiAKPiBUaGFua3MuCj4gCj4gUmV2aWV3ZWQtYnk6IE1hcmVr
IFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IAo+IFlvdSByZWFsbHkgY291bGQndmUganVzdCBpbmNs
dWRlZCB0aGUgb25lIExpbnV4IDYuMyBjb21taXQgaGFzaCBhbmQgd3JvdGUgdGhpcyBpcyBzeW5j
ZWQgd2l0aCBMaW51eCA2LjMsIHNpbmNlIGFsbCB0aGUgY29tbWl0cyBsaXN0ZWQgYWJvdmUgd291
bGQgYmUgcGFydCBvZiB0aGUgTGludXggNi4zIGNvbW1pdCBoYXNoIGFueXdheSAuIEl0IHdvdWxk
IG1ha2UgdGhlIGNvbW1pdCBtZXNzYWdlIHNob3J0ZXIsIGJ1dCB0aGlzIHZhcmlhbnQgaXMgYWxz
byBmaW5lLgoKCkFwcGxpZWQgdG8gdS1ib290LXN0bS9uZXh0CgpUaGFua3MKUGF0cmljZQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
