Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1908AAE0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:06:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0098C6DD72;
	Fri, 19 Apr 2024 12:06:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61705C69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:06:05 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43JAuZx7020533; Fri, 19 Apr 2024 14:05:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=z/Cj0+Naf5va9Pm/bvt/AoYZ6GVY/zMIMXplrjayKvQ=; b=QN
 AwuH4NbO1Eq6Lhr5U7j9zbsUpxv2PUhSbbfZocWGd/Z2mrDxB801Felqtd3q1roX
 8kTTUNGvrGQte+HUydSjcPexb3RLmMKux+OpOclCCpjkSl3XropDa9G0Amy3i8Iv
 9tF1i5YEmtoiin43m+EkJfKKOcnA2mvOf/3u5SNdFK60RsgY4k1kvNjJBbkw1+O4
 5DfEMWeewaw6Vw5fwj8N3JUoMzht+VGrYCfRGQPxndRS7Eb0fuoEDHmnFYxf9ysc
 dbqgo0dHZGSgq2nLMikwGzBrydXoyDXLSxtZYDj/3tIjiOf4TlCaMsnuSUvGUxpD
 LcjwcdM/NCMfFczlqs0A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg3m127p1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:05:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1B60640045;
 Fri, 19 Apr 2024 14:05:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93009218618;
 Fri, 19 Apr 2024 14:05:24 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:05:23 +0200
Message-ID: <0894c3a7-bc0f-4e66-a1a0-13c6371e9d7f@foss.st.com>
Date: Fri, 19 Apr 2024 14:05:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe ROULLIER <christophe.roullier@foss.st.com>, Marek Vasut
 <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240326120745.27581-1-marex@denx.de>
 <20240326120745.27581-3-marex@denx.de>
 <DU2PR10MB7787578063068AFCDA4543388F002@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
 <36109f71-081a-4dca-b852-c14ac39a318f@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <36109f71-081a-4dca-b852-c14ac39a318f@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: u-boot@dh-electronics.com, Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick DELAUNAY - foss <patrick.delaunay@foss.st.com>,
 Christophe ROULLIER <christophe.roullier@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 02/11] net: dwc_eth_qos: Rename
 eqos_stm32_config to eqos_stm32mp15_config
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

CgpPbiA0LzgvMjQgMDk6MjYsIENocmlzdG9waGUgUk9VTExJRVIgd3JvdGU6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IE1hcmVrIFZhc3V0PG1hcmV4QGRlbnguZGU+Cj4+
IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDI2LCAyMDI0IDE6MDcgUE0KPj4gVG86dS1ib290QGxpc3Rz
LmRlbnguZGUKPj4gQ2M6IE1hcmVrIFZhc3V0PG1hcmV4QGRlbnguZGU+OyBQYXRyaWNlIENIT1RB
UkQgLSBmb3NzPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT47IENocmlzdG9waGUgUk9VTExJ
RVI8Y2hyaXN0b3BoZS5yb3VsbGllckBzdC5jb20+OyBKb2UgSGVyc2hiZXJnZXI8am9lLmhlcnNo
YmVyZ2VyQG5pLmNvbT47IFBhdHJpY2sgREVMQVVOQVkgLSBmb3NzPHBhdHJpY2suZGVsYXVuYXlA
Zm9zcy5zdC5jb20+OyBSYW1vbiBGcmllZDxyZnJpZWQuZGV2QGdtYWlsLmNvbT47dS1ib290QGRo
LWVsZWN0cm9uaWNzLmNvbTt1Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cj4+IFN1YmplY3Q6IFtQQVRDSCB2MiAwMi8xMV0gbmV0OiBkd2NfZXRoX3FvczogUmVuYW1lIGVx
b3Nfc3RtMzJfY29uZmlnIHRvIGVxb3Nfc3RtMzJtcDE1X2NvbmZpZwo+Pgo+PiBUaGUgY3VycmVu
dCBnbHVlIGNvZGUgaXMgc3BlY2lmaWMgdG8gU1RNMzJNUDE1eHgsIHRoZSB1cGNvbWluZyBTVE0z
Mk1QMTN4eCB3aWxsIGludHJvZHVjZSBhbm90aGVyIGVudHJ5IHNwZWNpZmljIHRvIHRoZSBTVE0z
Mk1QMTN4eC4gUmVuYW1lIHRoZSBjdXJyZW50IGVudHJ5IHRvIGVxb3Nfc3RtMzJtcDE1X2NvbmZp
ZyBpbiBwcmVwYXJhdGlvbiBmb3IgU1RNMzJNUDEzeHggYWRkaXRpb24uIE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlLgo+Pgo+PiBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkPHBhdHJpY2UuY2hvdGFy
ZEBmb3NzLnN0LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQ8bWFyZXhAZGVueC5k
ZT4KPj4gLS0tCj4+IENjOiBDaHJpc3RvcGhlIFJvdWxsaWVyPGNocmlzdG9waGUucm91bGxpZXJA
c3QuY29tPgo+PiBDYzogSm9lIEhlcnNoYmVyZ2VyPGpvZS5oZXJzaGJlcmdlckBuaS5jb20+Cj4+
IENjOiBQYXRyaWNlIENob3RhcmQ8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiBDYzog
UGF0cmljayBEZWxhdW5heTxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+PiBDYzogUmFt
b24gRnJpZWQ8cmZyaWVkLmRldkBnbWFpbC5jb20+Cj4+IENjOnUtYm9vdEBkaC1lbGVjdHJvbmlj
cy5jb20KPj4gQ2M6dWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+PiAt
LS0KPj4gVjI6IEFkZCBSQiBmcm9tIFBhdHJpY2UKPj4gLS0tCj4+IMKgIGRyaXZlcnMvbmV0L2R3
Y19ldGhfcW9zLmPCoMKgwqDCoMKgwqAgfCAyICstCj4+IMKgIGRyaXZlcnMvbmV0L2R3Y19ldGhf
cW9zLmjCoMKgwqDCoMKgwqAgfCAyICstCj4+IMKgIGRyaXZlcnMvbmV0L2R3Y19ldGhfcW9zX3N0
bTMyLmMgfCAyICstCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZHdjX2V0aF9xb3MuYyBi
L2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9zLmMgaW5kZXggNTMzYzJiZjA3MGIuLjIwM2JmYzA4NDhj
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9kd2NfZXRoX3Fvcy5jCj4+ICsrKyBiL2RyaXZl
cnMvbmV0L2R3Y19ldGhfcW9zLmMKPj4gQEAgLTE1MDcsNyArMTUwNyw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgdWRldmljZV9pZCBlcW9zX2lkc1tdID0ge8KgICNpZiBJU19FTkFCTEVEKENPTkZJ
R19EV0NfRVRIX1FPU19TVE0zMikKPj4gwqDCoMKgwqDCoMKgwqDCoCB7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5jb21wYXRpYmxlID0gInN0LHN0bTMybXAxLWR3bWFjIiwK
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmRhdGEgPSAodWxvbmcpJmVxb3Nfc3Rt
MzJfY29uZmlnCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5kYXRhID0gKHVsb25n
KSZlcW9zX3N0bTMybXAxNV9jb25maWcKPj4gwqDCoMKgwqDCoMKgwqDCoCB9LAo+PiDCoCAjZW5k
aWYKPj4gwqAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0RXQ19FVEhfUU9TX0lNWCkKPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9zLmggYi9kcml2ZXJzL25ldC9kd2NfZXRoX3Fv
cy5oIGluZGV4IGE2MDg3ZjE5MWFiLi5iYWZkMGQzMzlmYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9uZXQvZHdjX2V0aF9xb3MuaAo+PiArKysgYi9kcml2ZXJzL25ldC9kd2NfZXRoX3Fvcy5oCj4+
IEBAIC0yOTAsNSArMjkwLDUgQEAgaW50IGVxb3NfbnVsbF9vcHMoc3RydWN0IHVkZXZpY2UgKmRl
dik7wqAgZXh0ZXJuIHN0cnVjdCBlcW9zX2NvbmZpZyBlcW9zX2lteF9jb25maWc7wqAgZXh0ZXJu
IHN0cnVjdCBlcW9zX2NvbmZpZyBlcW9zX3JvY2tjaGlwX2NvbmZpZzvCoCBleHRlcm4gc3RydWN0
IGVxb3NfY29uZmlnIGVxb3NfcWNvbV9jb25maWc7IC1leHRlcm4gc3RydWN0IGVxb3NfY29uZmln
IGVxb3Nfc3RtMzJfY29uZmlnOwo+PiArZXh0ZXJuIHN0cnVjdCBlcW9zX2NvbmZpZyBlcW9zX3N0
bTMybXAxNV9jb25maWc7Cj4+IMKgIGV4dGVybiBzdHJ1Y3QgZXFvc19jb25maWcgZXFvc19qaDcx
MTBfY29uZmlnOyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZHdjX2V0aF9xb3Nfc3RtMzIuYyBi
L2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9zX3N0bTMyLmMgaW5kZXggY2ZkYTc1NzEzM2UuLmZkMjlh
NjA0OTg3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9kd2NfZXRoX3Fvc19zdG0zMi5jCj4+
ICsrKyBiL2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9zX3N0bTMyLmMKPj4gQEAgLTE4NCw3ICsxODQs
NyBAQCBzdGF0aWMgc3RydWN0IGVxb3Nfb3BzIGVxb3Nfc3RtMzJfb3BzID0gewo+PiDCoMKgwqDC
oMKgwqDCoMKgIC5lcW9zX2dldF90aWNrX2Nsa19yYXRlID0gZXFvc19nZXRfdGlja19jbGtfcmF0
ZV9zdG0zMsKgIH07Cj4+Cj4+IC1zdHJ1Y3QgZXFvc19jb25maWcgX19tYXliZV91bnVzZWQgZXFv
c19zdG0zMl9jb25maWcgPSB7Cj4+ICtzdHJ1Y3QgZXFvc19jb25maWcgX19tYXliZV91bnVzZWQg
ZXFvc19zdG0zMm1wMTVfY29uZmlnID0gewo+PiDCoMKgwqDCoMKgwqDCoMKgIC5yZWdfYWNjZXNz
X2Fsd2F5c19vayA9IGZhbHNlLAo+PiDCoMKgwqDCoMKgwqDCoMKgIC5tZGlvX3dhaXQgPSAxMDAw
MCwKPj4gwqDCoMKgwqDCoMKgwqDCoCAuc3dyX3dhaXQgPSA1MCwKPj4gLS0gCj4+IDIuNDMuMAo+
Pgo+IFJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIFJPVUxMSUVSIDxjaHJpc3RvcGhlLnJvdWxsaWVy
QGZvc3Muc3QuY29tPgoKQXBwbGllZCBvbiB1LWJvb3Qtc3RtMzIvbWFzdGVyIApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5n
IGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
