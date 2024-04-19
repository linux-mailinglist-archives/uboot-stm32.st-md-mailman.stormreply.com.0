Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9248AAE23
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:11:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D155C6DD9A;
	Fri, 19 Apr 2024 12:11:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32084C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:11:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J8F2Sr029437; Fri, 19 Apr 2024 14:11:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=G7RV6DgpgVpTfjzc7nHgkLril1adwAisD5qoBnwJFzU=; b=gg
 fvg1ho1zDMoxDmRsL7iGpQFOTCqXq1gQmmTyGHtRPpNzShw2JzqWrMKDrHR+H6UQ
 y2cNpTcKZpbqXnmNlf5CUZHMfhU2YpGG+fRMpDNY/sjBPqfig1yBHjvWtohPE92I
 v1JNDAbKfLytbxXi8R48J3KXfdrZidb6bU9NSIWNacRusOmKzw5hHkQBxoDuKN6p
 Q2b7ZvjBWLTXPfZ7KzqznEkNIlLOOnto4jzb1ZcHfWZ7WZXaliolpq0ONsEwQ00j
 DgKwCPjHMG9b23ARNbuAnlQGvhfZHUEJd/cB4uNe+06s2bzhEIgy57seDe9/Mw9B
 OFn4mvOjuN9hNLuog2Cw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xgecyraqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:11:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8F77540044;
 Fri, 19 Apr 2024 14:11:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49C512194D5;
 Fri, 19 Apr 2024 14:11:14 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:11:13 +0200
Message-ID: <9392f75a-4cf8-4af8-b2fd-3c997f9721e4@foss.st.com>
Date: Fri, 19 Apr 2024 14:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe ROULLIER <christophe.roullier@foss.st.com>, Marek Vasut
 <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240326120745.27581-1-marex@denx.de>
 <20240326120745.27581-11-marex@denx.de>
 <DU2PR10MB7787E5DD3C53330D616436E68F002@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
 <62fb769e-51fd-4c07-9af6-da751f6f0736@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <62fb769e-51fd-4c07-9af6-da751f6f0736@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: Patrick DELAUNAY - foss <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH v2 10/11] net: dwc_eth_qos: Add support of
 STM32MP13xx platform
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

CgpPbiA0LzgvMjQgMTc6NTEsIENocmlzdG9waGUgUk9VTExJRVIgd3JvdGU6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IE1hcmVrIFZhc3V0PG1hcmV4QGRlbnguZGU+Cj4+
IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDI2LCAyMDI0IDE6MDggUE0KPj4gVG86dS1ib290QGxpc3Rz
LmRlbnguZGUKPj4gQ2M6IENocmlzdG9waGUgUk9VTExJRVI8Y2hyaXN0b3BoZS5yb3VsbGllckBz
dC5jb20+OyBQYXRyaWNlIENIT1RBUkQgLSBmb3NzPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNv
bT47IE1hcmVrIFZhc3V0PG1hcmV4QGRlbnguZGU+OyBKb2UgSGVyc2hiZXJnZXI8am9lLmhlcnNo
YmVyZ2VyQG5pLmNvbT47IFBhdHJpY2sgREVMQVVOQVkgLSBmb3NzPHBhdHJpY2suZGVsYXVuYXlA
Zm9zcy5zdC5jb20+OyBSYW1vbiBGcmllZDxyZnJpZWQuZGV2QGdtYWlsLmNvbT47dS1ib290QGRo
LWVsZWN0cm9uaWNzLmNvbTt1Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cj4+IFN1YmplY3Q6IFtQQVRDSCB2MiAxMC8xMV0gbmV0OiBkd2NfZXRoX3FvczogQWRkIHN1cHBv
cnQgb2YgU1RNMzJNUDEzeHggcGxhdGZvcm0KPj4KPj4gRnJvbTogQ2hyaXN0b3BoZSBSb3VsbGll
cjxjaHJpc3RvcGhlLnJvdWxsaWVyQHN0LmNvbT4KPj4KPj4gQWRkIGNvbXBhdGlibGUgInN0LHN0
bTMybXAxMy1kd21hYyIgdG8gbWFuYWdlIFNUTTMyTVAxMyBib2FyZHMuCj4+Cj4+IFJldmlld2Vk
LWJ5OiBQYXRyaWNlIENob3RhcmQ8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIFJvdWxsaWVyPGNocmlzdG9waGUucm91bGxpZXJAc3QuY29t
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dDxtYXJleEBkZW54LmRlPsKgICMgUmViYXNl
LCByZXNodWZmbGUsIHNxdWFzaCBjb2RlCj4+IC0tLQo+PiBDYzogQ2hyaXN0b3BoZSBSb3VsbGll
cjxjaHJpc3RvcGhlLnJvdWxsaWVyQHN0LmNvbT4KPj4gQ2M6IEpvZSBIZXJzaGJlcmdlcjxqb2Uu
aGVyc2hiZXJnZXJAbmkuY29tPgo+PiBDYzogUGF0cmljZSBDaG90YXJkPHBhdHJpY2UuY2hvdGFy
ZEBmb3NzLnN0LmNvbT4KPj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXk8cGF0cmljay5kZWxhdW5heUBm
b3NzLnN0LmNvbT4KPj4gQ2M6IFJhbW9uIEZyaWVkPHJmcmllZC5kZXZAZ21haWwuY29tPgo+PiBD
Yzp1LWJvb3RAZGgtZWxlY3Ryb25pY3MuY29tCj4+IENjOnVib290LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KPj4gLS0tCj4+IFYyOiBBZGQgUkIgZnJvbSBQYXRyaWNlCj4+IC0t
LQo+PiDCoCBkcml2ZXJzL25ldC9kd2NfZXRoX3Fvcy5jwqDCoMKgwqDCoMKgIHzCoCA0ICsrKysK
Pj4gwqAgZHJpdmVycy9uZXQvZHdjX2V0aF9xb3MuaMKgwqDCoMKgwqDCoCB8wqAgMSArCj4+IMKg
IGRyaXZlcnMvbmV0L2R3Y19ldGhfcW9zX3N0bTMyLmMgfCAxMSArKysrKysrKysrKwo+PiDCoCAz
IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L2R3Y19ldGhfcW9zLmMgYi9kcml2ZXJzL25ldC9kd2NfZXRoX3Fvcy5jIGluZGV4IDIw
M2JmYzA4NDhjLi5lMDIzMTc5MDVlNSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQvZHdjX2V0
aF9xb3MuYwo+PiArKysgYi9kcml2ZXJzL25ldC9kd2NfZXRoX3Fvcy5jCj4+IEBAIC0xNTA1LDYg
KzE1MDUsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1ZGV2aWNlX2lkIGVxb3NfaWRzW10gPSB7
Cj4+IMKgwqDCoMKgwqDCoMKgwqAgfSwKPj4gwqAgI2VuZGlmCj4+IMKgICNpZiBJU19FTkFCTEVE
KENPTkZJR19EV0NfRVRIX1FPU19TVE0zMikKPj4gK8KgwqDCoMKgwqDCoCB7Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5jb21wYXRpYmxlID0gInN0LHN0bTMybXAxMy1kd21hYyIs
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5kYXRhID0gKHVsb25nKSZlcW9zX3N0
bTMybXAxM19jb25maWcKPj4gK8KgwqDCoMKgwqDCoCB9LAo+PiDCoMKgwqDCoMKgwqDCoMKgIHsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNvbXBhdGlibGUgPSAic3Qsc3Rt
MzJtcDEtZHdtYWMiLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZGF0YSA9
ICh1bG9uZykmZXFvc19zdG0zMm1wMTVfY29uZmlnIGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9k
d2NfZXRoX3Fvcy5oIGIvZHJpdmVycy9uZXQvZHdjX2V0aF9xb3MuaCBpbmRleCBiYWZkMGQzMzlm
Yi4uOGIzZDBkNDY0ZDMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9zLmgK
Pj4gKysrIGIvZHJpdmVycy9uZXQvZHdjX2V0aF9xb3MuaAo+PiBAQCAtMjkwLDUgKzI5MCw2IEBA
IGludCBlcW9zX251bGxfb3BzKHN0cnVjdCB1ZGV2aWNlICpkZXYpO8KgIGV4dGVybiBzdHJ1Y3Qg
ZXFvc19jb25maWcgZXFvc19pbXhfY29uZmlnO8KgIGV4dGVybiBzdHJ1Y3QgZXFvc19jb25maWcg
ZXFvc19yb2NrY2hpcF9jb25maWc7wqAgZXh0ZXJuIHN0cnVjdCBlcW9zX2NvbmZpZyBlcW9zX3Fj
b21fY29uZmlnOwo+PiArZXh0ZXJuIHN0cnVjdCBlcW9zX2NvbmZpZyBlcW9zX3N0bTMybXAxM19j
b25maWc7Cj4+IMKgIGV4dGVybiBzdHJ1Y3QgZXFvc19jb25maWcgZXFvc19zdG0zMm1wMTVfY29u
ZmlnO8KgIGV4dGVybiBzdHJ1Y3QgZXFvc19jb25maWcgZXFvc19qaDcxMTBfY29uZmlnOyBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvZHdjX2V0aF9xb3Nfc3RtMzIuYyBiL2RyaXZlcnMvbmV0L2R3
Y19ldGhfcW9zX3N0bTMyLmMgaW5kZXggNWEyMGZlNWJlYTIuLjQzNTQ3M2Y5OWE2IDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL25ldC9kd2NfZXRoX3Fvc19zdG0zMi5jCj4+ICsrKyBiL2RyaXZlcnMv
bmV0L2R3Y19ldGhfcW9zX3N0bTMyLmMKPj4gQEAgLTI3OSw2ICsyNzksMTcgQEAgc3RhdGljIHN0
cnVjdCBlcW9zX29wcyBlcW9zX3N0bTMyX29wcyA9IHsKPj4gwqDCoMKgwqDCoMKgwqDCoCAuZXFv
c19nZXRfdGlja19jbGtfcmF0ZSA9IGVxb3NfZ2V0X3RpY2tfY2xrX3JhdGVfc3RtMzLCoCB9Owo+
Pgo+PiArc3RydWN0IGVxb3NfY29uZmlnIF9fbWF5YmVfdW51c2VkIGVxb3Nfc3RtMzJtcDEzX2Nv
bmZpZyA9IHsKPj4gK8KgwqDCoMKgwqDCoCAucmVnX2FjY2Vzc19hbHdheXNfb2sgPSBmYWxzZSwK
Pj4gK8KgwqDCoMKgwqDCoCAubWRpb193YWl0ID0gMTAwMDAsCj4+ICvCoMKgwqDCoMKgwqAgLnN3
cl93YWl0ID0gNTAsCj4+ICvCoMKgwqDCoMKgwqAgLmNvbmZpZ19tYWMgPSBFUU9TX01BQ19SWFFf
Q1RSTDBfUlhRMEVOX0VOQUJMRURfRENCLAo+PiArwqDCoMKgwqDCoMKgIC5jb25maWdfbWFjX21k
aW8gPSBFUU9TX01BQ19NRElPX0FERFJFU1NfQ1JfMjUwXzMwMCwKPj4gK8KgwqDCoMKgwqDCoCAu
YXhpX2J1c193aWR0aCA9IEVRT1NfQVhJX1dJRFRIXzMyLAo+PiArwqDCoMKgwqDCoMKgIC5pbnRl
cmZhY2UgPSBkZXZfcmVhZF9waHlfbW9kZSwKPj4gK8KgwqDCoMKgwqDCoCAub3BzID0gJmVxb3Nf
c3RtMzJfb3BzCj4+ICt9Owo+PiArCj4+IMKgIHN0cnVjdCBlcW9zX2NvbmZpZyBfX21heWJlX3Vu
dXNlZCBlcW9zX3N0bTMybXAxNV9jb25maWcgPSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgLnJlZ19h
Y2Nlc3NfYWx3YXlzX29rID0gZmFsc2UsCj4+IMKgwqDCoMKgwqDCoMKgwqAgLm1kaW9fd2FpdCA9
IDEwMDAwLAo+PiAtLSAKPj4gMi40My4wCj4+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgUk9V
TExJRVIgPGNocmlzdG9waGUucm91bGxpZXJAZm9zcy5zdC5jb20+CgoKQXBwbGllZCBvbiB1LWJv
b3Qtc3RtMzIvbWFzdGVyIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
