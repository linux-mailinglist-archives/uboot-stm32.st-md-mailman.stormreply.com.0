Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCC58AAE0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:05:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E35FEC6DD72;
	Fri, 19 Apr 2024 12:05:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2405C69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:05:51 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43JAuo9W023460; Fri, 19 Apr 2024 14:05:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=5dt9imA5geoLqQQYo7hmipESSFFlZLkPAiIFhfvVNUQ=; b=hl
 DhNGJIb33N3v0JpGkMJhDKoWkh/B5fj18irRYHB5ebkYDuqvrAWsjON/bz7mhFg/
 rhbhDWPK3J2b5YLNkID1RLELRsQ7Yreh3XECqKlJYziJ3kMDYRO6NZQeM3hhxzaG
 GVhpuWpCh3gEDHUdIu0Z0Pn6fE/P7dn9fhDyyahoYWGz315hgXBjNwUhWaN/81Z9
 V0a+9SbyfSqRX4HArDQv9SqsKa/JxFWYGdp8qZnj8UScbsn5cOglu5wNjAFqEAnb
 Uy3xXO+SK2/R1TsMZ4W7J/tqKhLfzf1xbirkKhA2skZVDBychhOl6MPt2lfSVwFP
 rcUPPBpuQPmcTQWJ7pGw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg3m127my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:05:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 71EDE40044;
 Fri, 19 Apr 2024 14:05:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BCAB1218606;
 Fri, 19 Apr 2024 14:05:10 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:05:10 +0200
Message-ID: <69368c59-8221-44c6-a04e-0663a6f01985@foss.st.com>
Date: Fri, 19 Apr 2024 14:05:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe ROULLIER <christophe.roullier@foss.st.com>, Marek Vasut
 <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240326120745.27581-1-marex@denx.de>
 <20240326120745.27581-2-marex@denx.de>
 <DU2PR10MB77878C017B43BB5074AD7CA38F002@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
 <1130a47f-e63d-47fe-929c-1c27a3fe617e@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <1130a47f-e63d-47fe-929c-1c27a3fe617e@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: Patrick DELAUNAY - foss <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH v2 01/11] net: dwc_eth_qos: Split STM32
 glue into separate file
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

CgpPbiA0LzgvMjQgMDk6MjQsIENocmlzdG9waGUgUk9VTExJRVIgd3JvdGU6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IE1hcmVrIFZhc3V0PG1hcmV4QGRlbnguZGU+Cj4+
IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDI2LCAyMDI0IDE6MDcgUE0KPj4gVG86dS1ib290QGxpc3Rz
LmRlbnguZGUKPj4gQ2M6IE1hcmVrIFZhc3V0PG1hcmV4QGRlbnguZGU+OyBQYXRyaWNlIENIT1RB
UkQgLSBmb3NzPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT47IENocmlzdG9waGUgUk9VTExJ
RVI8Y2hyaXN0b3BoZS5yb3VsbGllckBzdC5jb20+OyBKb2UgSGVyc2hiZXJnZXI8am9lLmhlcnNo
YmVyZ2VyQG5pLmNvbT47IFBhdHJpY2sgREVMQVVOQVkgLSBmb3NzPHBhdHJpY2suZGVsYXVuYXlA
Zm9zcy5zdC5jb20+OyBSYW1vbiBGcmllZDxyZnJpZWQuZGV2QGdtYWlsLmNvbT47dS1ib290QGRo
LWVsZWN0cm9uaWNzLmNvbTt1Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cj4+IFN1YmplY3Q6IFtQQVRDSCB2MiAwMS8xMV0gbmV0OiBkd2NfZXRoX3FvczogU3BsaXQgU1RN
MzIgZ2x1ZSBpbnRvIHNlcGFyYXRlIGZpbGUKPj4KPj4gTW92ZSBTVE0zMiBnbHVlIGNvZGUgaW50
byBzZXBhcmF0ZSBmaWxlIHRvIGNvbnRhaW4gdGhlIFNUTTMyIHNwZWNpZmljIGNvZGUgb3V0c2lk
ZSBvZiB0aGUgRFdNQUMgY29yZSBjb2RlLiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPj4KPj4gUmV2
aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0PG1hcmV4QGRlbnguZGU+Cj4+IC0tLQo+PiBDYzog
Q2hyaXN0b3BoZSBSb3VsbGllcjxjaHJpc3RvcGhlLnJvdWxsaWVyQHN0LmNvbT4KPj4gQ2M6IEpv
ZSBIZXJzaGJlcmdlcjxqb2UuaGVyc2hiZXJnZXJAbmkuY29tPgo+PiBDYzogUGF0cmljZSBDaG90
YXJkPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXk8
cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4gQ2M6IFJhbW9uIEZyaWVkPHJmcmllZC5k
ZXZAZ21haWwuY29tPgo+PiBDYzp1LWJvb3RAZGgtZWxlY3Ryb25pY3MuY29tCj4+IENjOnVib290
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4gLS0tCj4+IFYyOiBBZGQgUkIg
ZnJvbSBQYXRyaWNlCj4+IC0tLQo+PiDCoCBkcml2ZXJzL25ldC9NYWtlZmlsZcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+IMKgIGRyaXZlcnMvbmV0L2R3Y19ldGhfcW9zLmPCoMKg
wqDCoMKgwqAgfCAxNjUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IMKgIGRyaXZlcnMv
bmV0L2R3Y19ldGhfcW9zLmjCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+IMKgIGRyaXZlcnMvbmV0
L2R3Y19ldGhfcW9zX3N0bTMyLmMgfCAxOTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPj4gwqAgNCBmaWxlcyBjaGFuZ2VkLCAxOTggaW5zZXJ0aW9ucygrKSwgMTY1IGRlbGV0aW9u
cygtKcKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL25ldC9kd2NfZXRoX3Fvc19zdG0zMi5j
Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9NYWtlZmlsZSBiL2RyaXZlcnMvbmV0L01h
a2VmaWxlIGluZGV4IDY2NzczNjZlYmQ2Li5kYzM0MDQ1MTlkNiAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9uZXQvTWFrZWZpbGUKPj4gKysrIGIvZHJpdmVycy9uZXQvTWFrZWZpbGUKPj4gQEAgLTIz
LDYgKzIzLDcgQEAgb2JqLSQoQ09ORklHX0RXQ19FVEhfUU9TX0lNWCkgKz0gZHdjX2V0aF9xb3Nf
aW14Lm8KPj4gwqAgb2JqLSQoQ09ORklHX0RXQ19FVEhfUU9TX1JPQ0tDSElQKSArPSBkd2NfZXRo
X3Fvc19yb2NrY2hpcC5vCj4+IMKgIG9iai0kKENPTkZJR19EV0NfRVRIX1FPU19RQ09NKSArPSBk
d2NfZXRoX3Fvc19xY29tLm8KPj4gwqAgb2JqLSQoQ09ORklHX0RXQ19FVEhfUU9TX1NUQVJGSVZF
KSArPSBkd2NfZXRoX3Fvc19zdGFyZml2ZS5vCj4+ICtvYmotJChDT05GSUdfRFdDX0VUSF9RT1Nf
U1RNMzIpICs9IGR3Y19ldGhfcW9zX3N0bTMyLm8KPj4gwqAgb2JqLSQoQ09ORklHX0UxMDAwKSAr
PSBlMTAwMC5vCj4+IMKgIG9iai0kKENPTkZJR19FMTAwMF9TUEkpICs9IGUxMDAwX3NwaS5vCj4+
IMKgIG9iai0kKENPTkZJR19FRVBSTzEwMCkgKz0gZWVwcm8xMDAubwo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvZHdjX2V0aF9xb3MuYyBiL2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9zLmMgaW5k
ZXggOWIzYmNlMWRjODcuLjUzM2MyYmYwNzBiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9k
d2NfZXRoX3Fvcy5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9zLmMKPj4gQEAgLTI5
NSw1OCArMjk1LDYgQEAgZXJyOgo+PiDCoCAjZW5kaWYKPj4gwqAgfQo+Pgo+PiAtc3RhdGljIGlu
dCBlcW9zX3N0YXJ0X2Nsa3Nfc3RtMzIoc3RydWN0IHVkZXZpY2UgKmRldikgLXsgLSNpZmRlZiBD
T05GSUdfQ0xLCj4+IC3CoMKgwqDCoMKgwqAgc3RydWN0IGVxb3NfcHJpdiAqZXFvcyA9IGRldl9n
ZXRfcHJpdihkZXYpOwo+PiAtwqDCoMKgwqDCoMKgIGludCByZXQ7Cj4+IC0KPj4gLcKgwqDCoMKg
wqDCoCBkZWJ1ZygiJXMoZGV2PSVwKTpcbiIsIF9fZnVuY19fLCBkZXYpOwo+PiAtCj4+IC3CoMKg
wqDCoMKgwqAgcmV0ID0gY2xrX2VuYWJsZSgmZXFvcy0+Y2xrX21hc3Rlcl9idXMpOwo+PiAtwqDC
oMKgwqDCoMKgIGlmIChyZXQgPCAwKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHByX2VycigiY2xrX2VuYWJsZShjbGtfbWFzdGVyX2J1cykgZmFpbGVkOiAlZCIsIHJldCk7Cj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyOwo+PiAtwqDCoMKgwqDCoMKg
IH0KPj4gLQo+PiAtwqDCoMKgwqDCoMKgIHJldCA9IGNsa19lbmFibGUoJmVxb3MtPmNsa19yeCk7
Cj4+IC3CoMKgwqDCoMKgwqAgaWYgKHJldCA8IDApIHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcHJfZXJyKCJjbGtfZW5hYmxlKGNsa19yeCkgZmFpbGVkOiAlZCIsIHJldCk7Cj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX2Rpc2FibGVfY2xrX21hc3Rl
cl9idXM7Cj4+IC3CoMKgwqDCoMKgwqAgfQo+PiAtCj4+IC3CoMKgwqDCoMKgwqAgcmV0ID0gY2xr
X2VuYWJsZSgmZXFvcy0+Y2xrX3R4KTsKPj4gLcKgwqDCoMKgwqDCoCBpZiAocmV0IDwgMCkgewo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcl9lcnIoImNsa19lbmFibGUoY2xrX3R4
KSBmYWlsZWQ6ICVkIiwgcmV0KTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290
byBlcnJfZGlzYWJsZV9jbGtfcng7Cj4+IC3CoMKgwqDCoMKgwqAgfQo+PiAtCj4+IC3CoMKgwqDC
oMKgwqAgaWYgKGNsa192YWxpZCgmZXFvcy0+Y2xrX2NrKSAmJiAhZXFvcy0+Y2xrX2NrX2VuYWJs
ZWQpIHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gY2xrX2VuYWJsZSgm
ZXFvcy0+Y2xrX2NrKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCA8
IDApIHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBy
X2VycigiY2xrX2VuYWJsZShjbGtfY2spIGZhaWxlZDogJWQiLCByZXQpOwo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfZGlzYWJsZV9jbGtf
dHg7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZXFvcy0+Y2xrX2NrX2VuYWJsZWQgPSB0cnVlOwo+PiAtwqDCoMKgwqDC
oMKgIH0KPj4gLSNlbmRpZgo+PiAtCj4+IC3CoMKgwqDCoMKgwqAgZGVidWcoIiVzOiBPS1xuIiwg
X19mdW5jX18pOwo+PiAtwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiAtCj4+IC0jaWZkZWYgQ09O
RklHX0NMSwo+PiAtZXJyX2Rpc2FibGVfY2xrX3R4Ogo+PiAtwqDCoMKgwqDCoMKgIGNsa19kaXNh
YmxlKCZlcW9zLT5jbGtfdHgpOwo+PiAtZXJyX2Rpc2FibGVfY2xrX3J4Ogo+PiAtwqDCoMKgwqDC
oMKgIGNsa19kaXNhYmxlKCZlcW9zLT5jbGtfcngpOwo+PiAtZXJyX2Rpc2FibGVfY2xrX21hc3Rl
cl9idXM6Cj4+IC3CoMKgwqDCoMKgwqAgY2xrX2Rpc2FibGUoJmVxb3MtPmNsa19tYXN0ZXJfYnVz
KTsKPj4gLWVycjoKPj4gLcKgwqDCoMKgwqDCoCBkZWJ1ZygiJXM6IEZBSUxFRDogJWRcbiIsIF9f
ZnVuY19fLCByZXQpOwo+PiAtwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+IC0jZW5kaWYKPj4g
LX0KPj4gLQo+PiDCoCBzdGF0aWMgaW50IGVxb3Nfc3RvcF9jbGtzX3RlZ3JhMTg2KHN0cnVjdCB1
ZGV2aWNlICpkZXYpwqAge8KgICNpZmRlZiBDT05GSUdfQ0xLIEBAIC0zNjUsMjIgKzMxMyw2IEBA
IHN0YXRpYyBpbnQgZXFvc19zdG9wX2Nsa3NfdGVncmExODYoc3RydWN0IHVkZXZpY2UgKmRldikK
Pj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gwqAgfQo+Pgo+PiAtc3RhdGljIGludCBl
cW9zX3N0b3BfY2xrc19zdG0zMihzdHJ1Y3QgdWRldmljZSAqZGV2KSAteyAtI2lmZGVmIENPTkZJ
R19DTEsKPj4gLcKgwqDCoMKgwqDCoCBzdHJ1Y3QgZXFvc19wcml2ICplcW9zID0gZGV2X2dldF9w
cml2KGRldik7Cj4+IC0KPj4gLcKgwqDCoMKgwqDCoCBkZWJ1ZygiJXMoZGV2PSVwKTpcbiIsIF9f
ZnVuY19fLCBkZXYpOwo+PiAtCj4+IC3CoMKgwqDCoMKgwqAgY2xrX2Rpc2FibGUoJmVxb3MtPmNs
a190eCk7Cj4+IC3CoMKgwqDCoMKgwqAgY2xrX2Rpc2FibGUoJmVxb3MtPmNsa19yeCk7Cj4+IC3C
oMKgwqDCoMKgwqAgY2xrX2Rpc2FibGUoJmVxb3MtPmNsa19tYXN0ZXJfYnVzKTsKPj4gLSNlbmRp
Zgo+PiAtCj4+IC3CoMKgwqDCoMKgwqAgZGVidWcoIiVzOiBPS1xuIiwgX19mdW5jX18pOwo+PiAt
wqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiAtfQo+PiAtCj4+IMKgIHN0YXRpYyBpbnQgZXFvc19z
dGFydF9yZXNldHNfdGVncmExODYoc3RydWN0IHVkZXZpY2UgKmRldinCoCB7Cj4+IMKgwqDCoMKg
wqDCoMKgwqAgc3RydWN0IGVxb3NfcHJpdiAqZXFvcyA9IGRldl9nZXRfcHJpdihkZXYpOyBAQCAt
NDkzLDE3ICs0MjUsNiBAQCBzdGF0aWMgdWxvbmcgZXFvc19nZXRfdGlja19jbGtfcmF0ZV90ZWdy
YTE4NihzdHJ1Y3QgdWRldmljZSAqZGV2KcKgICNlbmRpZsKgIH0KPj4KPj4gLXN0YXRpYyB1bG9u
ZyBlcW9zX2dldF90aWNrX2Nsa19yYXRlX3N0bTMyKHN0cnVjdCB1ZGV2aWNlICpkZXYpIC17IC0j
aWZkZWYgQ09ORklHX0NMSwo+PiAtwqDCoMKgwqDCoMKgIHN0cnVjdCBlcW9zX3ByaXYgKmVxb3Mg
PSBkZXZfZ2V0X3ByaXYoZGV2KTsKPj4gLQo+PiAtwqDCoMKgwqDCoMKgIHJldHVybiBjbGtfZ2V0
X3JhdGUoJmVxb3MtPmNsa19tYXN0ZXJfYnVzKTsKPj4gLSNlbHNlCj4+IC3CoMKgwqDCoMKgwqAg
cmV0dXJuIDA7Cj4+IC0jZW5kaWYKPj4gLX0KPj4gLQo+PiDCoCBzdGF0aWMgaW50IGVxb3Nfc2V0
X2Z1bGxfZHVwbGV4KHN0cnVjdCB1ZGV2aWNlICpkZXYpwqAgewo+PiDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBlcW9zX3ByaXYgKmVxb3MgPSBkZXZfZ2V0X3ByaXYoZGV2KTsgQEAgLTE0MTUsNTcg
KzEzMzYsNiBAQCBlcnJfZnJlZV9yZXNldF9lcW9zOgo+PiDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biByZXQ7Cj4+IMKgIH0KPj4KPj4gLXN0YXRpYyBpbnQgZXFvc19wcm9iZV9yZXNvdXJjZXNfc3Rt
MzIoc3RydWN0IHVkZXZpY2UgKmRldikgLXsKPj4gLcKgwqDCoMKgwqDCoCBzdHJ1Y3QgZXFvc19w
cml2ICplcW9zID0gZGV2X2dldF9wcml2KGRldik7Cj4+IC3CoMKgwqDCoMKgwqAgaW50IHJldDsK
Pj4gLcKgwqDCoMKgwqDCoCBwaHlfaW50ZXJmYWNlX3QgaW50ZXJmYWNlOwo+PiAtCj4+IC3CoMKg
wqDCoMKgwqAgZGVidWcoIiVzKGRldj0lcCk6XG4iLCBfX2Z1bmNfXywgZGV2KTsKPj4gLQo+PiAt
wqDCoMKgwqDCoMKgIGludGVyZmFjZSA9IGVxb3MtPmNvbmZpZy0+aW50ZXJmYWNlKGRldik7Cj4+
IC0KPj4gLcKgwqDCoMKgwqDCoCBpZiAoaW50ZXJmYWNlID09IFBIWV9JTlRFUkZBQ0VfTU9ERV9O
QSkgewo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcl9lcnIoIkludmFsaWQgUEhZ
IGludGVyZmFjZVxuIik7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAt
RUlOVkFMOwo+PiAtwqDCoMKgwqDCoMKgIH0KPj4gLQo+PiAtwqDCoMKgwqDCoMKgIHJldCA9IGJv
YXJkX2ludGVyZmFjZV9ldGhfaW5pdChkZXYsIGludGVyZmFjZSk7Cj4+IC3CoMKgwqDCoMKgwqAg
aWYgKHJldCkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7
Cj4+IC0KPj4gLcKgwqDCoMKgwqDCoCByZXQgPSBjbGtfZ2V0X2J5X25hbWUoZGV2LCAic3RtbWFj
ZXRoIiwgJmVxb3MtPmNsa19tYXN0ZXJfYnVzKTsKPj4gLcKgwqDCoMKgwqDCoCBpZiAocmV0KSB7
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX2VycigiY2xrX2dldF9ieV9uYW1l
KG1hc3Rlcl9idXMpIGZhaWxlZDogJWQiLCByZXQpOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIGVycl9wcm9iZTsKPj4gLcKgwqDCoMKgwqDCoCB9Cj4+IC0KPj4gLcKgwqDC
oMKgwqDCoCByZXQgPSBjbGtfZ2V0X2J5X25hbWUoZGV2LCAibWFjLWNsay1yeCIsICZlcW9zLT5j
bGtfcngpOwo+PiAtwqDCoMKgwqDCoMKgIGlmIChyZXQpIHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcHJfZXJyKCJjbGtfZ2V0X2J5X25hbWUocngpIGZhaWxlZDogJWQiLCByZXQp
Owo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9wcm9iZTsKPj4gLcKg
wqDCoMKgwqDCoCB9Cj4+IC0KPj4gLcKgwqDCoMKgwqDCoCByZXQgPSBjbGtfZ2V0X2J5X25hbWUo
ZGV2LCAibWFjLWNsay10eCIsICZlcW9zLT5jbGtfdHgpOwo+PiAtwqDCoMKgwqDCoMKgIGlmIChy
ZXQpIHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfZXJyKCJjbGtfZ2V0X2J5
X25hbWUodHgpIGZhaWxlZDogJWQiLCByZXQpOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBnb3RvIGVycl9wcm9iZTsKPj4gLcKgwqDCoMKgwqDCoCB9Cj4+IC0KPj4gLcKgwqDCoMKg
wqDCoCAvKsKgIEdldCBFVEhfQ0xLIGNsb2NrcyAob3B0aW9uYWwpICovCj4+IC3CoMKgwqDCoMKg
wqAgcmV0ID0gY2xrX2dldF9ieV9uYW1lKGRldiwgImV0aC1jayIsICZlcW9zLT5jbGtfY2spOwo+
PiAtwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHByX3dhcm4oIk5vIHBoeSBjbG9jayBwcm92aWRlZCAlZCIsIHJldCk7Cj4+IC0KPj4gLcKgwqDC
oMKgwqDCoCBkZWJ1ZygiJXM6IE9LXG4iLCBfX2Z1bmNfXyk7Cj4+IC3CoMKgwqDCoMKgwqAgcmV0
dXJuIDA7Cj4+IC0KPj4gLWVycl9wcm9iZToKPj4gLQo+PiAtwqDCoMKgwqDCoMKgIGRlYnVnKCIl
czogcmV0dXJucyAlZFxuIiwgX19mdW5jX18sIHJldCk7Cj4+IC3CoMKgwqDCoMKgwqAgcmV0dXJu
IHJldDsKPj4gLX0KPj4gLQo+PiDCoCBzdGF0aWMgcGh5X2ludGVyZmFjZV90IGVxb3NfZ2V0X2lu
dGVyZmFjZV90ZWdyYTE4Nihjb25zdCBzdHJ1Y3QgdWRldmljZSAqZGV2KcKgIHsKPj4gwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gUEhZX0lOVEVSRkFDRV9NT0RFX01JSTsKPj4gQEAgLTE0ODQsMTIg
KzEzNTQsNiBAQCBzdGF0aWMgaW50IGVxb3NfcmVtb3ZlX3Jlc291cmNlc190ZWdyYTE4NihzdHJ1
Y3QgdWRldmljZSAqZGV2KQo+PiDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiDCoCB9Cj4+
Cj4+IC1zdGF0aWMgaW50IGVxb3NfcmVtb3ZlX3Jlc291cmNlc19zdG0zMihzdHJ1Y3QgdWRldmlj
ZSAqZGV2KSAtewo+PiAtwqDCoMKgwqDCoMKgIGRlYnVnKCIlcyhkZXY9JXApOlxuIiwgX19mdW5j
X18sIGRldik7Cj4+IC3CoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IC19Cj4+IC0KPj4gwqAgc3Rh
dGljIGludCBlcW9zX3Byb2JlKHN0cnVjdCB1ZGV2aWNlICpkZXYpwqAgewo+PiDCoMKgwqDCoMKg
wqDCoMKgIHN0cnVjdCBlcW9zX3ByaXYgKmVxb3MgPSBkZXZfZ2V0X3ByaXYoZGV2KTsgQEAgLTE2
MzMsMzUgKzE0OTcsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGVxb3NfY29uZmlnIF9fbWF5YmVf
dW51c2VkIGVxb3NfdGVncmExODZfY29uZmlnID0gewo+PiDCoMKgwqDCoMKgwqDCoMKgIC5vcHMg
PSAmZXFvc190ZWdyYTE4Nl9vcHMKPj4gwqAgfTsKPj4KPj4gLXN0YXRpYyBzdHJ1Y3QgZXFvc19v
cHMgZXFvc19zdG0zMl9vcHMgPSB7Cj4+IC3CoMKgwqDCoMKgwqAgLmVxb3NfaW52YWxfZGVzYyA9
IGVxb3NfaW52YWxfZGVzY19nZW5lcmljLAo+PiAtwqDCoMKgwqDCoMKgIC5lcW9zX2ZsdXNoX2Rl
c2MgPSBlcW9zX2ZsdXNoX2Rlc2NfZ2VuZXJpYywKPj4gLcKgwqDCoMKgwqDCoCAuZXFvc19pbnZh
bF9idWZmZXIgPSBlcW9zX2ludmFsX2J1ZmZlcl9nZW5lcmljLAo+PiAtwqDCoMKgwqDCoMKgIC5l
cW9zX2ZsdXNoX2J1ZmZlciA9IGVxb3NfZmx1c2hfYnVmZmVyX2dlbmVyaWMsCj4+IC3CoMKgwqDC
oMKgwqAgLmVxb3NfcHJvYmVfcmVzb3VyY2VzID0gZXFvc19wcm9iZV9yZXNvdXJjZXNfc3RtMzIs
Cj4+IC3CoMKgwqDCoMKgwqAgLmVxb3NfcmVtb3ZlX3Jlc291cmNlcyA9IGVxb3NfcmVtb3ZlX3Jl
c291cmNlc19zdG0zMiwKPj4gLcKgwqDCoMKgwqDCoCAuZXFvc19zdG9wX3Jlc2V0cyA9IGVxb3Nf
bnVsbF9vcHMsCj4+IC3CoMKgwqDCoMKgwqAgLmVxb3Nfc3RhcnRfcmVzZXRzID0gZXFvc19udWxs
X29wcywKPj4gLcKgwqDCoMKgwqDCoCAuZXFvc19zdG9wX2Nsa3MgPSBlcW9zX3N0b3BfY2xrc19z
dG0zMiwKPj4gLcKgwqDCoMKgwqDCoCAuZXFvc19zdGFydF9jbGtzID0gZXFvc19zdGFydF9jbGtz
X3N0bTMyLAo+PiAtwqDCoMKgwqDCoMKgIC5lcW9zX2NhbGlicmF0ZV9wYWRzID0gZXFvc19udWxs
X29wcywKPj4gLcKgwqDCoMKgwqDCoCAuZXFvc19kaXNhYmxlX2NhbGlicmF0aW9uID0gZXFvc19u
dWxsX29wcywKPj4gLcKgwqDCoMKgwqDCoCAuZXFvc19zZXRfdHhfY2xrX3NwZWVkID0gZXFvc19u
dWxsX29wcywKPj4gLcKgwqDCoMKgwqDCoCAuZXFvc19nZXRfZW5ldGFkZHIgPSBlcW9zX251bGxf
b3BzLAo+PiAtwqDCoMKgwqDCoMKgIC5lcW9zX2dldF90aWNrX2Nsa19yYXRlID0gZXFvc19nZXRf
dGlja19jbGtfcmF0ZV9zdG0zMgo+PiAtfTsKPj4gLQo+PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBl
cW9zX2NvbmZpZyBfX21heWJlX3VudXNlZCBlcW9zX3N0bTMyX2NvbmZpZyA9IHsKPj4gLcKgwqDC
oMKgwqDCoCAucmVnX2FjY2Vzc19hbHdheXNfb2sgPSBmYWxzZSwKPj4gLcKgwqDCoMKgwqDCoCAu
bWRpb193YWl0ID0gMTAwMDAsCj4+IC3CoMKgwqDCoMKgwqAgLnN3cl93YWl0ID0gNTAsCj4+IC3C
oMKgwqDCoMKgwqAgLmNvbmZpZ19tYWMgPSBFUU9TX01BQ19SWFFfQ1RSTDBfUlhRMEVOX0VOQUJM
RURfQVYsCj4+IC3CoMKgwqDCoMKgwqAgLmNvbmZpZ19tYWNfbWRpbyA9IEVRT1NfTUFDX01ESU9f
QUREUkVTU19DUl8yNTBfMzAwLAo+PiAtwqDCoMKgwqDCoMKgIC5heGlfYnVzX3dpZHRoID0gRVFP
U19BWElfV0lEVEhfNjQsCj4+IC3CoMKgwqDCoMKgwqAgLmludGVyZmFjZSA9IGRldl9yZWFkX3Bo
eV9tb2RlLAo+PiAtwqDCoMKgwqDCoMKgIC5vcHMgPSAmZXFvc19zdG0zMl9vcHMKPj4gLX07Cj4+
IC0KPj4gwqAgc3RhdGljIGNvbnN0IHN0cnVjdCB1ZGV2aWNlX2lkIGVxb3NfaWRzW10gPSB7wqAg
I2lmIElTX0VOQUJMRUQoQ09ORklHX0RXQ19FVEhfUU9TX1RFR1JBMTg2KQo+PiDCoMKgwqDCoMKg
wqDCoMKgIHsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9zLmggYi9kcml2
ZXJzL25ldC9kd2NfZXRoX3Fvcy5oIGluZGV4IGUzMjIyZTFlMTdlLi5hNjA4N2YxOTFhYiAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQvZHdjX2V0aF9xb3MuaAo+PiArKysgYi9kcml2ZXJzL25l
dC9kd2NfZXRoX3Fvcy5oCj4+IEBAIC0yOTAsNCArMjkwLDUgQEAgaW50IGVxb3NfbnVsbF9vcHMo
c3RydWN0IHVkZXZpY2UgKmRldik7wqAgZXh0ZXJuIHN0cnVjdCBlcW9zX2NvbmZpZyBlcW9zX2lt
eF9jb25maWc7wqAgZXh0ZXJuIHN0cnVjdCBlcW9zX2NvbmZpZyBlcW9zX3JvY2tjaGlwX2NvbmZp
ZzvCoCBleHRlcm4gc3RydWN0IGVxb3NfY29uZmlnIGVxb3NfcWNvbV9jb25maWc7Cj4+ICtleHRl
cm4gc3RydWN0IGVxb3NfY29uZmlnIGVxb3Nfc3RtMzJfY29uZmlnOwo+PiDCoCBleHRlcm4gc3Ry
dWN0IGVxb3NfY29uZmlnIGVxb3Nfamg3MTEwX2NvbmZpZzsgZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L2R3Y19ldGhfcW9zX3N0bTMyLmMgYi9kcml2ZXJzL25ldC9kd2NfZXRoX3Fvc19zdG0zMi5j
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAwLi5jZmRhNzU3MTMzZQo+PiAt
LS0gL2Rldi9udWxsCj4+ICsrKyBiL2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9zX3N0bTMyLmMKPj4g
QEAgLTAsMCArMSwxOTYgQEAKPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
Cj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChDKSAyMDI0LCBNYXJlayBWYXN1dDxtYXJleEBkZW54
LmRlPgo+PiArICoKPj4gKyAqIFRoaXMgaXMgY29kZSBtb3ZlZCBmcm9tIGRyaXZlcnMvbmV0L2R3
Y19ldGhfcW9zLmMgLCB3aGljaCBpczoKPj4gKyAqIENvcHlyaWdodCAoYykgMjAxNiwgTlZJRElB
IENPUlBPUkFUSU9OLgo+PiArICovCj4+ICsKPj4gKyNpbmNsdWRlIDxjb21tb24uaD4KPj4gKyNp
bmNsdWRlIDxhc20vY2FjaGUuaD4KPj4gKyNpbmNsdWRlIDxhc20vZ3Bpby5oPgo+PiArI2luY2x1
ZGUgPGFzbS9pby5oPgo+PiArI2luY2x1ZGUgPGNsay5oPgo+PiArI2luY2x1ZGUgPGNwdV9mdW5j
Lmg+Cj4+ICsjaW5jbHVkZSA8ZG0uaD4KPj4gKyNpbmNsdWRlIDxkbS9kZXZpY2VfY29tcGF0Lmg+
Cj4+ICsjaW5jbHVkZSA8ZXJybm8uaD4KPj4gKyNpbmNsdWRlIDxldGhfcGh5Lmg+Cj4+ICsjaW5j
bHVkZSA8bG9nLmg+Cj4+ICsjaW5jbHVkZSA8bWFsbG9jLmg+Cj4+ICsjaW5jbHVkZSA8bWVtYWxp
Z24uaD4KPj4gKyNpbmNsdWRlIDxtaWlwaHkuaD4KPj4gKyNpbmNsdWRlIDxuZXQuaD4KPj4gKyNp
bmNsdWRlIDxuZXRkZXYuaD4KPj4gKyNpbmNsdWRlIDxwaHkuaD4KPj4gKyNpbmNsdWRlIDxyZXNl
dC5oPgo+PiArI2luY2x1ZGUgPHdhaXRfYml0Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvZGVsYXku
aD4KPj4gKwo+PiArI2luY2x1ZGUgImR3Y19ldGhfcW9zLmgiCj4+ICsKPj4gK3N0YXRpYyB1bG9u
ZyBlcW9zX2dldF90aWNrX2Nsa19yYXRlX3N0bTMyKHN0cnVjdCB1ZGV2aWNlICpkZXYpIHsgI2lm
ZGVmCj4+ICtDT05GSUdfQ0xLCj4+ICvCoMKgwqDCoMKgwqAgc3RydWN0IGVxb3NfcHJpdiAqZXFv
cyA9IGRldl9nZXRfcHJpdihkZXYpOwo+PiArCj4+ICvCoMKgwqDCoMKgwqAgcmV0dXJuIGNsa19n
ZXRfcmF0ZSgmZXFvcy0+Y2xrX21hc3Rlcl9idXMpOwo+PiArI2Vsc2UKPj4gK8KgwqDCoMKgwqDC
oCByZXR1cm4gMDsKPj4gKyNlbmRpZgo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IGVxb3Nfc3Rh
cnRfY2xrc19zdG0zMihzdHJ1Y3QgdWRldmljZSAqZGV2KSB7ICNpZmRlZgo+PiArQ09ORklHX0NM
Swo+PiArwqDCoMKgwqDCoMKgIHN0cnVjdCBlcW9zX3ByaXYgKmVxb3MgPSBkZXZfZ2V0X3ByaXYo
ZGV2KTsKPj4gK8KgwqDCoMKgwqDCoCBpbnQgcmV0Owo+PiArCj4+ICvCoMKgwqDCoMKgwqAgZGVi
dWcoIiVzKGRldj0lcCk6XG4iLCBfX2Z1bmNfXywgZGV2KTsKPj4gKwo+PiArwqDCoMKgwqDCoMKg
IHJldCA9IGNsa19lbmFibGUoJmVxb3MtPmNsa19tYXN0ZXJfYnVzKTsKPj4gK8KgwqDCoMKgwqDC
oCBpZiAocmV0IDwgMCkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcl9lcnIo
ImNsa19lbmFibGUoY2xrX21hc3Rlcl9idXMpIGZhaWxlZDogJWQiLCByZXQpOwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycjsKPj4gK8KgwqDCoMKgwqDCoCB9Cj4+ICsK
Pj4gK8KgwqDCoMKgwqDCoCByZXQgPSBjbGtfZW5hYmxlKCZlcW9zLT5jbGtfcngpOwo+PiArwqDC
oMKgwqDCoMKgIGlmIChyZXQgPCAwKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHByX2VycigiY2xrX2VuYWJsZShjbGtfcngpIGZhaWxlZDogJWQiLCByZXQpOwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9kaXNhYmxlX2Nsa19tYXN0ZXJfYnVzOwo+
PiArwqDCoMKgwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgwqDCoMKgIHJldCA9IGNsa19lbmFibGUo
JmVxb3MtPmNsa190eCk7Cj4+ICvCoMKgwqDCoMKgwqAgaWYgKHJldCA8IDApIHsKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfZXJyKCJjbGtfZW5hYmxlKGNsa190eCkgZmFpbGVk
OiAlZCIsIHJldCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX2Rp
c2FibGVfY2xrX3J4Owo+PiArwqDCoMKgwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgwqDCoMKgIGlm
IChjbGtfdmFsaWQoJmVxb3MtPmNsa19jaykgJiYgIWVxb3MtPmNsa19ja19lbmFibGVkKSB7Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGNsa19lbmFibGUoJmVxb3MtPmNs
a19jayk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKSB7Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcl9lcnIoImNs
a19lbmFibGUoY2xrX2NrKSBmYWlsZWQ6ICVkIiwgcmV0KTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX2Rpc2FibGVfY2xrX3R4Owo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGVxb3MtPmNsa19ja19lbmFibGVkID0gdHJ1ZTsKPj4gK8KgwqDCoMKgwqDCoCB9Cj4+
ICsjZW5kaWYKPj4gKwo+PiArwqDCoMKgwqDCoMKgIGRlYnVnKCIlczogT0tcbiIsIF9fZnVuY19f
KTsKPj4gK8KgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gKwo+PiArI2lmZGVmIENPTkZJR19DTEsK
Pj4gK2Vycl9kaXNhYmxlX2Nsa190eDoKPj4gK8KgwqDCoMKgwqDCoCBjbGtfZGlzYWJsZSgmZXFv
cy0+Y2xrX3R4KTsKPj4gK2Vycl9kaXNhYmxlX2Nsa19yeDoKPj4gK8KgwqDCoMKgwqDCoCBjbGtf
ZGlzYWJsZSgmZXFvcy0+Y2xrX3J4KTsKPj4gK2Vycl9kaXNhYmxlX2Nsa19tYXN0ZXJfYnVzOgo+
PiArwqDCoMKgwqDCoMKgIGNsa19kaXNhYmxlKCZlcW9zLT5jbGtfbWFzdGVyX2J1cyk7Cj4+ICtl
cnI6Cj4+ICvCoMKgwqDCoMKgwqAgZGVidWcoIiVzOiBGQUlMRUQ6ICVkXG4iLCBfX2Z1bmNfXywg
cmV0KTsKPj4gK8KgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiArI2VuZGlmCj4+ICt9Cj4+ICsK
Pj4gK3N0YXRpYyBpbnQgZXFvc19zdG9wX2Nsa3Nfc3RtMzIoc3RydWN0IHVkZXZpY2UgKmRldikg
eyAjaWZkZWYKPj4gK0NPTkZJR19DTEsKPj4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgZXFvc19wcml2
ICplcW9zID0gZGV2X2dldF9wcml2KGRldik7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoCBkZWJ1Zygi
JXMoZGV2PSVwKTpcbiIsIF9fZnVuY19fLCBkZXYpOwo+PiArCj4+ICvCoMKgwqDCoMKgwqAgY2xr
X2Rpc2FibGUoJmVxb3MtPmNsa190eCk7Cj4+ICvCoMKgwqDCoMKgwqAgY2xrX2Rpc2FibGUoJmVx
b3MtPmNsa19yeCk7Cj4+ICvCoMKgwqDCoMKgwqAgY2xrX2Rpc2FibGUoJmVxb3MtPmNsa19tYXN0
ZXJfYnVzKTsKPj4gKyNlbmRpZgo+PiArCj4+ICvCoMKgwqDCoMKgwqAgZGVidWcoIiVzOiBPS1xu
IiwgX19mdW5jX18pOwo+PiArwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiArfQo+PiArCj4+ICtz
dGF0aWMgaW50IGVxb3NfcHJvYmVfcmVzb3VyY2VzX3N0bTMyKHN0cnVjdCB1ZGV2aWNlICpkZXYp
IHsKPj4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgZXFvc19wcml2ICplcW9zID0gZGV2X2dldF9wcml2
KGRldik7Cj4+ICvCoMKgwqDCoMKgwqAgaW50IHJldDsKPj4gK8KgwqDCoMKgwqDCoCBwaHlfaW50
ZXJmYWNlX3QgaW50ZXJmYWNlOwo+PiArCj4+ICvCoMKgwqDCoMKgwqAgZGVidWcoIiVzKGRldj0l
cCk6XG4iLCBfX2Z1bmNfXywgZGV2KTsKPj4gKwo+PiArwqDCoMKgwqDCoMKgIGludGVyZmFjZSA9
IGVxb3MtPmNvbmZpZy0+aW50ZXJmYWNlKGRldik7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoCBpZiAo
aW50ZXJmYWNlID09IFBIWV9JTlRFUkZBQ0VfTU9ERV9OQSkgewo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBwcl9lcnIoIkludmFsaWQgUEhZIGludGVyZmFjZVxuIik7Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiArwqDCoMKgwqDCoMKg
IH0KPj4gKwo+PiArwqDCoMKgwqDCoMKgIHJldCA9IGJvYXJkX2ludGVyZmFjZV9ldGhfaW5pdChk
ZXYsIGludGVyZmFjZSk7Cj4+ICvCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoCBy
ZXQgPSBjbGtfZ2V0X2J5X25hbWUoZGV2LCAic3RtbWFjZXRoIiwgJmVxb3MtPmNsa19tYXN0ZXJf
YnVzKTsKPj4gK8KgwqDCoMKgwqDCoCBpZiAocmV0KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHByX2VycigiY2xrX2dldF9ieV9uYW1lKG1hc3Rlcl9idXMpIGZhaWxlZDogJWQi
LCByZXQpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9wcm9iZTsK
Pj4gK8KgwqDCoMKgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoCByZXQgPSBjbGtfZ2V0X2J5
X25hbWUoZGV2LCAibWFjLWNsay1yeCIsICZlcW9zLT5jbGtfcngpOwo+PiArwqDCoMKgwqDCoMKg
IGlmIChyZXQpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfZXJyKCJjbGtf
Z2V0X2J5X25hbWUocngpIGZhaWxlZDogJWQiLCByZXQpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBnb3RvIGVycl9wcm9iZTsKPj4gK8KgwqDCoMKgwqDCoCB9Cj4+ICsKPj4gK8Kg
wqDCoMKgwqDCoCByZXQgPSBjbGtfZ2V0X2J5X25hbWUoZGV2LCAibWFjLWNsay10eCIsICZlcW9z
LT5jbGtfdHgpOwo+PiArwqDCoMKgwqDCoMKgIGlmIChyZXQpIHsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcHJfZXJyKCJjbGtfZ2V0X2J5X25hbWUodHgpIGZhaWxlZDogJWQiLCBy
ZXQpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9wcm9iZTsKPj4g
K8KgwqDCoMKgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoCAvKsKgIEdldCBFVEhfQ0xLIGNs
b2NrcyAob3B0aW9uYWwpICovCj4+ICvCoMKgwqDCoMKgwqAgcmV0ID0gY2xrX2dldF9ieV9uYW1l
KGRldiwgImV0aC1jayIsICZlcW9zLT5jbGtfY2spOwo+PiArwqDCoMKgwqDCoMKgIGlmIChyZXQp
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX3dhcm4oIk5vIHBoeSBjbG9jayBw
cm92aWRlZCAlZCIsIHJldCk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoCBkZWJ1ZygiJXM6IE9LXG4i
LCBfX2Z1bmNfXyk7Cj4+ICvCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+ICsKPj4gK2Vycl9wcm9i
ZToKPj4gKwo+PiArwqDCoMKgwqDCoMKgIGRlYnVnKCIlczogcmV0dXJucyAlZFxuIiwgX19mdW5j
X18sIHJldCk7Cj4+ICvCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gK30KPj4gKwo+PiArc3Rh
dGljIGludCBlcW9zX3JlbW92ZV9yZXNvdXJjZXNfc3RtMzIoc3RydWN0IHVkZXZpY2UgKmRldikg
ewo+PiArwqDCoMKgwqDCoMKgIGRlYnVnKCIlcyhkZXY9JXApOlxuIiwgX19mdW5jX18sIGRldik7
Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArc3RhdGljIHN0
cnVjdCBlcW9zX29wcyBlcW9zX3N0bTMyX29wcyA9IHsKPj4gK8KgwqDCoMKgwqDCoCAuZXFvc19p
bnZhbF9kZXNjID0gZXFvc19pbnZhbF9kZXNjX2dlbmVyaWMsCj4+ICvCoMKgwqDCoMKgwqAgLmVx
b3NfZmx1c2hfZGVzYyA9IGVxb3NfZmx1c2hfZGVzY19nZW5lcmljLAo+PiArwqDCoMKgwqDCoMKg
IC5lcW9zX2ludmFsX2J1ZmZlciA9IGVxb3NfaW52YWxfYnVmZmVyX2dlbmVyaWMsCj4+ICvCoMKg
wqDCoMKgwqAgLmVxb3NfZmx1c2hfYnVmZmVyID0gZXFvc19mbHVzaF9idWZmZXJfZ2VuZXJpYywK
Pj4gK8KgwqDCoMKgwqDCoCAuZXFvc19wcm9iZV9yZXNvdXJjZXMgPSBlcW9zX3Byb2JlX3Jlc291
cmNlc19zdG0zMiwKPj4gK8KgwqDCoMKgwqDCoCAuZXFvc19yZW1vdmVfcmVzb3VyY2VzID0gZXFv
c19yZW1vdmVfcmVzb3VyY2VzX3N0bTMyLAo+PiArwqDCoMKgwqDCoMKgIC5lcW9zX3N0b3BfcmVz
ZXRzID0gZXFvc19udWxsX29wcywKPj4gK8KgwqDCoMKgwqDCoCAuZXFvc19zdGFydF9yZXNldHMg
PSBlcW9zX251bGxfb3BzLAo+PiArwqDCoMKgwqDCoMKgIC5lcW9zX3N0b3BfY2xrcyA9IGVxb3Nf
c3RvcF9jbGtzX3N0bTMyLAo+PiArwqDCoMKgwqDCoMKgIC5lcW9zX3N0YXJ0X2Nsa3MgPSBlcW9z
X3N0YXJ0X2Nsa3Nfc3RtMzIsCj4+ICvCoMKgwqDCoMKgwqAgLmVxb3NfY2FsaWJyYXRlX3BhZHMg
PSBlcW9zX251bGxfb3BzLAo+PiArwqDCoMKgwqDCoMKgIC5lcW9zX2Rpc2FibGVfY2FsaWJyYXRp
b24gPSBlcW9zX251bGxfb3BzLAo+PiArwqDCoMKgwqDCoMKgIC5lcW9zX3NldF90eF9jbGtfc3Bl
ZWQgPSBlcW9zX251bGxfb3BzLAo+PiArwqDCoMKgwqDCoMKgIC5lcW9zX2dldF9lbmV0YWRkciA9
IGVxb3NfbnVsbF9vcHMsCj4+ICvCoMKgwqDCoMKgwqAgLmVxb3NfZ2V0X3RpY2tfY2xrX3JhdGUg
PSBlcW9zX2dldF90aWNrX2Nsa19yYXRlX3N0bTMyIH07Cj4+ICsKPj4gK3N0cnVjdCBlcW9zX2Nv
bmZpZyBfX21heWJlX3VudXNlZCBlcW9zX3N0bTMyX2NvbmZpZyA9IHsKPj4gK8KgwqDCoMKgwqDC
oCAucmVnX2FjY2Vzc19hbHdheXNfb2sgPSBmYWxzZSwKPj4gK8KgwqDCoMKgwqDCoCAubWRpb193
YWl0ID0gMTAwMDAsCj4+ICvCoMKgwqDCoMKgwqAgLnN3cl93YWl0ID0gNTAsCj4+ICvCoMKgwqDC
oMKgwqAgLmNvbmZpZ19tYWMgPSBFUU9TX01BQ19SWFFfQ1RSTDBfUlhRMEVOX0VOQUJMRURfQVYs
Cj4+ICvCoMKgwqDCoMKgwqAgLmNvbmZpZ19tYWNfbWRpbyA9IEVRT1NfTUFDX01ESU9fQUREUkVT
U19DUl8yNTBfMzAwLAo+PiArwqDCoMKgwqDCoMKgIC5heGlfYnVzX3dpZHRoID0gRVFPU19BWElf
V0lEVEhfNjQsCj4+ICvCoMKgwqDCoMKgwqAgLmludGVyZmFjZSA9IGRldl9yZWFkX3BoeV9tb2Rl
LAo+PiArwqDCoMKgwqDCoMKgIC5vcHMgPSAmZXFvc19zdG0zMl9vcHMKPj4gK307Cj4+IC0tIAo+
PiAyLjQzLjAKPj4KPiBSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBST1VMTElFUjxjaHJpc3RvcGhl
LnJvdWxsaWVyQGZvc3Muc3QuY29tPgoKQXBwbGllZCBvbiB1LWJvb3Qtc3RtMzIvbWFzdGVyIApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0z
MiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9v
dC1zdG0zMgo=
