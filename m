Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C52028AAE2C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:12:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D235C6DD9A;
	Fri, 19 Apr 2024 12:12:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4267C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:12:07 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43JBeR1U019795; Fri, 19 Apr 2024 14:11:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=2Owq1sIcToq99KTElPC01MYU3JQQJVkxGzeBgG6HGPc=; b=vq
 iyemBaZYYf+T3AOkCNMlRn3FbSskYQGgvvHb6kh5NGb/3EqpTXiimHyn5OGu7UxX
 VLkA48gTlt4KpEolHtc/uIW7AW+o8GA6MgqVgfYtk1nYpNFFO/FNNqmkLigj5k7T
 O/jkMQy4B48QO4da1RaLuHex5DPgZp9OrOdURLS4EQTwA6CgKLs080p9ht4FmvDC
 5O8c2QLav5Nme/ZXD/9YrSWtSb8aR1I2xTElGum7SsSK3XxRnz5mzqhmzc3GVtqI
 eFU8b6gvuunij9WKHzskXA7oHMfGdB2FZ70GRbizIXF172dWwVou62PwM2cC5SU3
 H7jB51YyBUvglA+HNJWg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xfhcx43hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:11:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 907F740044;
 Fri, 19 Apr 2024 14:11:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A6C22194D8;
 Fri, 19 Apr 2024 14:11:26 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:11:25 +0200
Message-ID: <a2512ea7-c1e9-4d3e-8518-a05a6963c4d5@foss.st.com>
Date: Fri, 19 Apr 2024 14:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe ROULLIER <christophe.roullier@foss.st.com>, Marek Vasut
 <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240326120745.27581-1-marex@denx.de>
 <20240326120745.27581-12-marex@denx.de>
 <DU2PR10MB7787D22F0E32E7ADB04C3E9E8F002@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
 <f643acf7-bb3b-4e77-9a92-c65c24ff496e@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <f643acf7-bb3b-4e77-9a92-c65c24ff496e@foss.st.com>
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
Subject: Re: [Uboot-stm32] [PATCH v2 11/11] net: dwc_eth_qos: Add support
 for st, ext-phyclk property
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

CgpPbiA0LzgvMjQgMTc6NTIsIENocmlzdG9waGUgUk9VTExJRVIgd3JvdGU6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IE1hcmVrIFZhc3V0PG1hcmV4QGRlbnguZGU+Cj4+
IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDI2LCAyMDI0IDE6MDggUE0KPj4gVG86dS1ib290QGxpc3Rz
LmRlbnguZGUKPj4gQ2M6IE1hcmVrIFZhc3V0PG1hcmV4QGRlbnguZGU+OyBDaHJpc3RvcGhlIFJP
VUxMSUVSPGNocmlzdG9waGUucm91bGxpZXJAc3QuY29tPjsgSm9lIEhlcnNoYmVyZ2VyPGpvZS5o
ZXJzaGJlcmdlckBuaS5jb20+OyBQYXRyaWNlIENIT1RBUkQgLSBmb3NzPHBhdHJpY2UuY2hvdGFy
ZEBmb3NzLnN0LmNvbT47IFBhdHJpY2sgREVMQVVOQVkgLSBmb3NzPHBhdHJpY2suZGVsYXVuYXlA
Zm9zcy5zdC5jb20+OyBSYW1vbiBGcmllZDxyZnJpZWQuZGV2QGdtYWlsLmNvbT47dS1ib290QGRo
LWVsZWN0cm9uaWNzLmNvbTt1Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cj4+IFN1YmplY3Q6IFtQQVRDSCB2MiAxMS8xMV0gbmV0OiBkd2NfZXRoX3FvczogQWRkIHN1cHBv
cnQgZm9yIHN0LGV4dC1waHljbGsgcHJvcGVydHkKPj4KPj4gVGhlICJzdCxleHQtcGh5Y2xrIiBw
cm9wZXJ0eSBpcyBhIHVuaWZpY2F0aW9uIG9mICJzdCxldGgtY2xrLXNlbCIKPj4gYW5kICJzdCxl
dGgtcmVmLWNsay1zZWwiIHByb3BlcnRpZXMuIEFsbCB0aHJlZSBwcm9wZXJ0aWVzIGRlZmluZSBF
VEggQ0sgY2xvY2sgZGlyZWN0aW9uLCBob3dldmVyOgo+PiAtICJzdCxldGgtY2xrLXNlbCIgc2Vs
ZWN0cyBjbG9jayBkaXJlY3Rpb24gZm9yIEdNSUkvUkdNSUkgbW9kZQo+PiAtICJzdCxldGgtcmVm
LWNsay1zZWwiIHNlbGVjdHMgY2xvY2sgZGlyZWN0aW9uIGZvciBSTUlJIG1vZGUKPj4gLSAic3Qs
ZXh0LXBoeWNsayIgc2VsZWN0cyBjbG9jayBkaXJlY3Rpb24gZm9yIGFsbCBSTUlJL0dNSUkvUkdN
SUkgbW9kZXMgVGhlICJzdCxleHQtcGh5Y2xrIiBpcyB0aGUgcHJlZmVycmFibGUgcHJvcGVydHkg
dG8gdXNlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dDxtYXJleEBkZW54LmRlPgo+
PiAtLS0KPj4gQ2M6IENocmlzdG9waGUgUm91bGxpZXI8Y2hyaXN0b3BoZS5yb3VsbGllckBzdC5j
b20+Cj4+IENjOiBKb2UgSGVyc2hiZXJnZXI8am9lLmhlcnNoYmVyZ2VyQG5pLmNvbT4KPj4gQ2M6
IFBhdHJpY2UgQ2hvdGFyZDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IENjOiBQYXRy
aWNrIERlbGF1bmF5PHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IENjOiBSYW1vbiBG
cmllZDxyZnJpZWQuZGV2QGdtYWlsLmNvbT4KPj4gQ2M6dS1ib290QGRoLWVsZWN0cm9uaWNzLmNv
bQo+PiBDYzp1Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+IC0tLQo+
PiBWMjogTmV3IHBhdGNoCj4+IC0tLQo+PiDCoCBkcml2ZXJzL25ldC9kd2NfZXRoX3Fvc19zdG0z
Mi5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAyNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvZHdjX2V0aF9xb3Nfc3RtMzIuYyBiL2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9z
X3N0bTMyLmMgaW5kZXggNDM1NDczZjk5YTYuLjllZTgyYjU0YzYyIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL25ldC9kd2NfZXRoX3Fvc19zdG0zMi5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L2R3Y19l
dGhfcW9zX3N0bTMyLmMKPj4gQEAgLTE0MCw2ICsxNDAsOCBAQCBzdGF0aWMgaW50IGVxb3NfcHJv
YmVfc3lzY2ZnX3N0bTMyKHN0cnVjdCB1ZGV2aWNlICpkZXYsCj4+IMKgwqDCoMKgwqDCoMKgwqAg
Y29uc3QgYm9vbCBpc19tcDEzID0gZGV2aWNlX2lzX2NvbXBhdGlibGUoZGV2LCAic3Qsc3RtMzJt
cDEzLWR3bWFjIik7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgLyogR2lnYWJpdCBFdGhlcm5ldCAxMjVN
SHogY2xvY2sgc2VsZWN0aW9uLiAqLwo+PiDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IGJvb2wgZXRo
X2Nsa19zZWwgPSBkZXZfcmVhZF9ib29sKGRldiwgInN0LGV0aC1jbGstc2VsIik7Cj4+ICvCoMKg
wqDCoMKgwqAgLyogRXRoZXJuZXQgY2xvY2sgc291cmNlIGlzIFJDQy4gKi8KPj4gK8KgwqDCoMKg
wqDCoCBjb25zdCBib29sIGV4dF9waHljbGsgPSBkZXZfcmVhZF9ib29sKGRldiwgInN0LGV4dC1w
aHljbGsiKTsKPj4gwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4+IMKg
wqDCoMKgwqDCoMKgwqAgdTMyIHJlZ21hcF9tYXNrOwo+PiDCoMKgwqDCoMKgwqDCoMKgIHUzMiB2
YWx1ZTsKPj4gQEAgLTE1Niw2ICsxNTgsMTIgQEAgc3RhdGljIGludCBlcW9zX3Byb2JlX3N5c2Nm
Z19zdG0zMihzdHJ1Y3QgdWRldmljZSAqZGV2LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkZXZfZGJnKGRldiwgIlBIWV9JTlRFUkZBQ0VfTU9ERV9NSUlcbiIpOwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWx1ZSA9IEZJRUxEX1BSRVAoU1lTQ0ZHX1BN
Q1NFVFJfRVRIX1NFTF9NQVNLLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNZU0NGR19QTUNTRVRSX0VUSF9T
RUxfR01JSV9NSUkpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogU1RNMzJNUDE1eHggc3VwcG9ydHMgYm90aCBN
SUkgYW5kIEdNSUksIFNUTTMyTVAxM3h4IE1JSSBvbmx5Lgo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICogU1lTQ0ZHX1BNQ1NFVFIgRVRIX1NFTE1JSSBpcyBwcmVzZW50IG9ubHkg
b24gU1RNMzJNUDE1eHggYW5kCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBh
Y3RzIGFzIGEgc2VsZWN0b3IgYmV0d2VlbiAwOkdNSUkgYW5kIDE6TUlJLiBBcyBTVE0zMk1QMTN4
eAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogc3VwcG9ydHMgb25seSBNSUks
IEVUSF9TRUxNSUkgaXMgbm90IHByZXNlbnQuCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKi8KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFpc19tcDEz
KcKgwqAgLyogU2VsZWN0IE1JSSBtb2RlIG9uIFNUTTMyTVAxNXh4ICovCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWx1ZSB8PSBTWVNDRkdfUE1D
U0VUUl9FVEhfU0VMTUlJOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVh
azsKPj4gQEAgLTE2MywxNCArMTcxLDI1IEBAIHN0YXRpYyBpbnQgZXFvc19wcm9iZV9zeXNjZmdf
c3RtMzIoc3RydWN0IHVkZXZpY2UgKmRldiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZGV2X2RiZyhkZXYsICJQSFlfSU5URVJGQUNFX01PREVfR01JSVxuIik7Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhbHVlID0gRklFTERfUFJFUChTWVNDRkdfUE1D
U0VUUl9FVEhfU0VMX01BU0ssCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1lTQ0ZHX1BNQ1NFVFJfRVRIX1NF
TF9HTUlJX01JSSk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChldGhfY2xr
X3NlbCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqIElmIGV0aF9jbGtfc2VsIGlzIHNldCwgdXNlIGludGVybmFs
IEVUSF9DTEt4IGNsb2NrIGZyb20gUkNDLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICogb3RoZXJ3aXNlIHVzZSBleHRlcm5hbCBjbG9jayBmcm9tIElPIHBpbiAocmVxdWlyZXMg
bWF0Y2hpbmcKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIEdQSU8gYmxvY2sg
QUYgc2V0dGluZyBvZiB0aGF0IHBpbikuCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGV0aF9jbGtfc2VsIHx8
IGV4dF9waHljbGspCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB2YWx1ZSB8PSBTWVNDRkdfUE1DU0VUUl9FVEhfQ0xLX1NFTDsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgY2FzZSBQ
SFlfSU5URVJGQUNFX01PREVfUk1JSToKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZGV2X2RiZyhkZXYsICJQSFlfSU5URVJGQUNFX01PREVfUk1JSVxuIik7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhbHVlID0gRklFTERfUFJFUChTWVNDRkdfUE1DU0VU
Ul9FVEhfU0VMX01BU0ssCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1lTQ0ZHX1BNQ1NFVFJfRVRIX1NFTF9S
TUlJKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGV0aF9yZWZfY2xrX3Nl
bCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqIElmIGV0aF9yZWZfY2xrX3NlbCBpcyBzZXQsIHVzZSBpbnRlcm5h
bCBjbG9jayBmcm9tIFJDQywKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIG90
aGVyd2lzZSB1c2UgZXh0ZXJuYWwgY2xvY2sgZnJvbSBFVEhuX1JYX0NMSy9FVEhuX1JFRl9DTEsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIElPIHBpbiAocmVxdWlyZXMgbWF0
Y2hpbmcgR1BJTyBibG9jayBBRiBzZXR0aW5nIG9mIHRoYXQKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqIHBpbikuCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Ki8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGV0aF9yZWZfY2xrX3NlbCB8
fCBleHRfcGh5Y2xrKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdmFsdWUgfD0gU1lTQ0ZHX1BNQ1NFVFJfRVRIX1JFRl9DTEtfU0VMOwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gwqDCoMKgwqDCoMKgwqDCoCBj
YXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9SR01JSToKPj4gQEAgLTE4MCw3ICsxOTksMTIgQEAgc3Rh
dGljIGludCBlcW9zX3Byb2JlX3N5c2NmZ19zdG0zMihzdHJ1Y3QgdWRldmljZSAqZGV2LAo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZGJnKGRldiwgIlBIWV9JTlRFUkZB
Q0VfTU9ERV9SR01JSVxuIik7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZh
bHVlID0gRklFTERfUFJFUChTWVNDRkdfUE1DU0VUUl9FVEhfU0VMX01BU0ssCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgU1lTQ0ZHX1BNQ1NFVFJfRVRIX1NFTF9SR01JSSk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChldGhfY2xrX3NlbCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLyoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIElmIGV0aF9jbGtf
c2VsIGlzIHNldCwgdXNlIGludGVybmFsIEVUSF9DTEt4IGNsb2NrIGZyb20gUkNDLAo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogb3RoZXJ3aXNlIHVzZSBleHRlcm5hbCBjbG9j
ayBmcm9tIEVUSHhfQ0xLMTI1IHBpbiAocmVxdWlyZXMKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIG1hdGNoaW5nIEdQSU8gYmxvY2sgQUYgc2V0dGluZyBvZiB0aGF0IHBpbiku
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGV0aF9jbGtfc2VsIHx8IGV4dF9waHljbGspCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWx1ZSB8PSBTWVNDRkdf
UE1DU0VUUl9FVEhfQ0xLX1NFTDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoKPj4gLS0gCj4+IDIuNDMuMAo+Pgo+
IFJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIFJPVUxMSUVSIDxjaHJpc3RvcGhlLnJvdWxsaWVyQGZv
c3Muc3QuY29tPgoKQXBwbGllZCBvbiB1LWJvb3Qtc3RtMzIvbWFzdGVyIApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxp
c3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
