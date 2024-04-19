Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4128AAE13
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:06:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CC51C6DD9A;
	Fri, 19 Apr 2024 12:06:26 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AA23C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:06:25 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9JctI005625; Fri, 19 Apr 2024 14:06:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=y+yAo/fVt2WjM2ffzSMlKRCiWZbHxrcEWX1Lat/6bVY=; b=6U
 Z6uIisgm7N7tsvrsLtB3jxT1cFQxm7K9+gnp4Kidhzu3gYWBROQSsHN+UabVCTzq
 ETbs+KkNaJWfZomsgZyB1zqQE8gnp49CbQXBYdfUgjhX1cUMwkiukUvpvMICDRuh
 fwbm3aV0hGS15JndRhKQvyukbpwi+fsqVdg2cikWZvTY0bTK+nO2xJ8FTpmVV1+f
 5Etn+ONoBI341auefjd8e8lfptQNrfNXzN3BmTbnKHEhYeQh6JJv78oeCltF3tRx
 ln3g/pGaHWqg5Y/Wp79Qu5d2F1GssPeWHHpCEhWzWWHO0Hu+OM7XkUxyeO+bLep6
 eK0tjFkRwtz5khGYkO6Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg50j9cpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:06:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C485440046;
 Fri, 19 Apr 2024 14:06:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2BCEF218626;
 Fri, 19 Apr 2024 14:05:42 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:05:41 +0200
Message-ID: <c392f789-5e04-4f4c-beb7-2af8078c945f@foss.st.com>
Date: Fri, 19 Apr 2024 14:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe ROULLIER <christophe.roullier@foss.st.com>, Marek Vasut
 <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240326120745.27581-1-marex@denx.de>
 <20240326120745.27581-5-marex@denx.de>
 <DU2PR10MB7787AAE9F658F688BE5E94F58F002@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
 <86655f6c-00b0-4cc3-a7ef-c0c971fa3d15@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <86655f6c-00b0-4cc3-a7ef-c0c971fa3d15@foss.st.com>
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
Subject: Re: [Uboot-stm32] [PATCH v2 04/11] net: dwc_eth_qos: Scrub ifdeffery
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

CgpPbiA0LzgvMjQgMDk6MjcsIENocmlzdG9waGUgUk9VTExJRVIgd3JvdGU6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+
PiBTZW50OiBUdWVzZGF5LCBNYXJjaCAyNiwgMjAyNCAxOjA3IFBNCj4+IFRvOiB1LWJvb3RAbGlz
dHMuZGVueC5kZQo+PiBDYzogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+OyBQYXRyaWNlIENI
T1RBUkQgLSBmb3NzIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+OyBDaHJpc3RvcGhlIFJP
VUxMSUVSIDxjaHJpc3RvcGhlLnJvdWxsaWVyQHN0LmNvbT47IEpvZSBIZXJzaGJlcmdlciA8am9l
LmhlcnNoYmVyZ2VyQG5pLmNvbT47IFBhdHJpY2sgREVMQVVOQVkgLSBmb3NzIDxwYXRyaWNrLmRl
bGF1bmF5QGZvc3Muc3QuY29tPjsgUmFtb24gRnJpZWQgPHJmcmllZC5kZXZAZ21haWwuY29tPjsg
dS1ib290QGRoLWVsZWN0cm9uaWNzLmNvbTsgdWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQo+PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMDQvMTFdIG5ldDogZHdjX2V0aF9xb3M6
IFNjcnViIGlmZGVmZmVyeQo+Pgo+PiBSZXBsYWNlIGlmZGVmIENPTkZJR19DTEsgd2l0aCBpZiAo
Q09ORklHX0lTX0VOQUJMRUQoQ0xLKSkgdG8gaW1wcm92ZSBjb2RlIGJ1aWxkIGNvdmVyYWdlLiBT
b21lIG9mIHRoZSBmdW5jdGlvbnMgcHJpbnRlZCBkZWJ1ZygiJXM6IE9LXG4iLCBfX2Z1bmNfXyk7
IG9uIGV4aXQgd2l0aCBhbmQgd2l0aG91dCBDTEsgZW5hYmxlZCwgc29tZSBkaWQgbm90LCBtYWtl
IGl0IGNvbnNpc3RlbnQgYW5kIHByaW50IG5vdGhpbmcgaWYgQ0xLIGlzIGRpc2FibGVkLgo+Pgo+
PiBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5j
b20+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+PiAtLS0K
Pj4gQ2M6IENocmlzdG9waGUgUm91bGxpZXIgPGNocmlzdG9waGUucm91bGxpZXJAc3QuY29tPgo+
PiBDYzogSm9lIEhlcnNoYmVyZ2VyIDxqb2UuaGVyc2hiZXJnZXJAbmkuY29tPgo+PiBDYzogUGF0
cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IENjOiBQYXRyaWNr
IERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+PiBDYzogUmFtb24gRnJp
ZWQgPHJmcmllZC5kZXZAZ21haWwuY29tPgo+PiBDYzogdS1ib290QGRoLWVsZWN0cm9uaWNzLmNv
bQo+PiBDYzogdWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+PiAtLS0K
Pj4gVjI6IEFkZCBSQiBmcm9tIFBhdHJpY2UKPj4gLS0tCj4+IMKgIGRyaXZlcnMvbmV0L2R3Y19l
dGhfcW9zX3N0bTMyLmMgfCAyNSArKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9zX3N0bTMyLmMgYi9kcml2ZXJzL25ldC9kd2Nf
ZXRoX3Fvc19zdG0zMi5jIGluZGV4IDc1MjBhMTM2ZWQwLi5kN2VjMGM5YmUzNiAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9uZXQvZHdjX2V0aF9xb3Nfc3RtMzIuYwo+PiArKysgYi9kcml2ZXJzL25l
dC9kd2NfZXRoX3Fvc19zdG0zMi5jCj4+IEBAIC00NiwyMSArNDYsMjIgQEAKPj4KPj4gwqAgc3Rh
dGljIHVsb25nIGVxb3NfZ2V0X3RpY2tfY2xrX3JhdGVfc3RtMzIoc3RydWN0IHVkZXZpY2UgKmRl
dinCoCB7IC0jaWZkZWYgQ09ORklHX0NMSwo+PiAtwqDCoMKgwqDCoMKgIHN0cnVjdCBlcW9zX3By
aXYgKmVxb3MgPSBkZXZfZ2V0X3ByaXYoZGV2KTsKPj4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgZXFv
c19wcml2IF9fbWF5YmVfdW51c2VkICplcW9zID0gZGV2X2dldF9wcml2KGRldik7Cj4+ICsKPj4g
K8KgwqDCoMKgwqDCoCBpZiAoIUNPTkZJR19JU19FTkFCTEVEKENMSykpCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biBjbGtfZ2V0X3JhdGUoJmVxb3MtPmNsa19tYXN0ZXJfYnVzKTsKPj4gLSNlbHNlCj4+IC3CoMKg
wqDCoMKgwqAgcmV0dXJuIDA7Cj4+IC0jZW5kaWYKPj4gwqAgfQo+Pgo+PiDCoCBzdGF0aWMgaW50
IGVxb3Nfc3RhcnRfY2xrc19zdG0zMihzdHJ1Y3QgdWRldmljZSAqZGV2KcKgIHsgLSNpZmRlZiBD
T05GSUdfQ0xLCj4+IC3CoMKgwqDCoMKgwqAgc3RydWN0IGVxb3NfcHJpdiAqZXFvcyA9IGRldl9n
ZXRfcHJpdihkZXYpOwo+PiArwqDCoMKgwqDCoMKgIHN0cnVjdCBlcW9zX3ByaXYgX19tYXliZV91
bnVzZWQgKmVxb3MgPSBkZXZfZ2V0X3ByaXYoZGV2KTsKPj4gwqDCoMKgwqDCoMKgwqDCoCBpbnQg
cmV0Owo+Pgo+PiArwqDCoMKgwqDCoMKgIGlmICghQ09ORklHX0lTX0VOQUJMRUQoQ0xLKSkKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+ICsKPj4gwqDCoMKgwqDC
oMKgwqDCoCBkZWJ1ZygiJXMoZGV2PSVwKTpcbiIsIF9fZnVuY19fLCBkZXYpOwo+Pgo+PiDCoMKg
wqDCoMKgwqDCoMKgIHJldCA9IGNsa19lbmFibGUoJmVxb3MtPmNsa19tYXN0ZXJfYnVzKTsKPj4g
QEAgLTg5LDEyICs5MCwxMCBAQCBzdGF0aWMgaW50IGVxb3Nfc3RhcnRfY2xrc19zdG0zMihzdHJ1
Y3QgdWRldmljZSAqZGV2KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVxb3MtPmNsa19ja19lbmFibGVkID0g
dHJ1ZTsKPj4gwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IC0jZW5kaWYKPj4KPj4gwqDCoMKgwqDCoMKg
wqDCoCBkZWJ1ZygiJXM6IE9LXG4iLCBfX2Z1bmNfXyk7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIDA7Cj4+Cj4+IC0jaWZkZWYgQ09ORklHX0NMSwo+PiDCoCBlcnJfZGlzYWJsZV9jbGtfdHg6
Cj4+IMKgwqDCoMKgwqDCoMKgwqAgY2xrX2Rpc2FibGUoJmVxb3MtPmNsa190eCk7Cj4+IMKgIGVy
cl9kaXNhYmxlX2Nsa19yeDoKPj4gQEAgLTEwNCwyMCArMTAzLDIwIEBAIGVycl9kaXNhYmxlX2Ns
a19tYXN0ZXJfYnVzOgo+PiDCoCBlcnI6Cj4+IMKgwqDCoMKgwqDCoMKgwqAgZGVidWcoIiVzOiBG
QUlMRUQ6ICVkXG4iLCBfX2Z1bmNfXywgcmV0KTsKPj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
cmV0Owo+PiAtI2VuZGlmCj4+IMKgIH0KPj4KPj4gwqAgc3RhdGljIGludCBlcW9zX3N0b3BfY2xr
c19zdG0zMihzdHJ1Y3QgdWRldmljZSAqZGV2KcKgIHsgLSNpZmRlZiBDT05GSUdfQ0xLCj4+IC3C
oMKgwqDCoMKgwqAgc3RydWN0IGVxb3NfcHJpdiAqZXFvcyA9IGRldl9nZXRfcHJpdihkZXYpOwo+
PiArwqDCoMKgwqDCoMKgIHN0cnVjdCBlcW9zX3ByaXYgX19tYXliZV91bnVzZWQgKmVxb3MgPSBk
ZXZfZ2V0X3ByaXYoZGV2KTsKPj4gKwo+PiArwqDCoMKgwqDCoMKgIGlmICghQ09ORklHX0lTX0VO
QUJMRUQoQ0xLKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+
Cj4+IMKgwqDCoMKgwqDCoMKgwqAgZGVidWcoIiVzKGRldj0lcCk6XG4iLCBfX2Z1bmNfXywgZGV2
KTsKPj4KPj4gwqDCoMKgwqDCoMKgwqDCoCBjbGtfZGlzYWJsZSgmZXFvcy0+Y2xrX3R4KTsKPj4g
wqDCoMKgwqDCoMKgwqDCoCBjbGtfZGlzYWJsZSgmZXFvcy0+Y2xrX3J4KTsKPj4gwqDCoMKgwqDC
oMKgwqDCoCBjbGtfZGlzYWJsZSgmZXFvcy0+Y2xrX21hc3Rlcl9idXMpOwo+PiAtI2VuZGlmCj4+
Cj4+IMKgwqDCoMKgwqDCoMKgwqAgZGVidWcoIiVzOiBPS1xuIiwgX19mdW5jX18pOwo+PiDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiAtLSAKPj4gMi40My4wCj4+Cj4gUmV2aWV3ZWQtYnk6
IENocmlzdG9waGUgUk9VTExJRVIgPGNocmlzdG9waGUucm91bGxpZXJAZm9zcy5zdC5jb20+CgpB
cHBsaWVkIG9uIHUtYm9vdC1zdG0zMi9tYXN0ZXIgCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
