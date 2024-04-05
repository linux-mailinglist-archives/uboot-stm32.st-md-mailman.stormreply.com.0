Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 784F189A0BA
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Apr 2024 17:12:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 224F5C6DD6D;
	Fri,  5 Apr 2024 15:12:58 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5998BC6C83C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 15:12:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 16AF588456;
 Fri,  5 Apr 2024 17:12:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1712329975;
 bh=Wbuo586ODIJCc9HyklYmgrdunJ8yNUkGojLIMtPBjjE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GnQ7mFvTW6Bt7lXO0I7FR+iNYyaIDhhEv7mEIwQUZ+LQTNbRodclz9IpWfWSKzk3D
 jF+F+Hy5LoKry3xVm2m9MTGh3qh3GTWMqV77wikQFecM2Ielv6/sjYUvyCosRpsRiC
 I8vHwTR10Kfq9gmAuPSS9zySdMvHI4uHh7CcCQOb2Nt7Gj0ILoJlpr7G1EbSJstIwJ
 2FXey1vrFlFzSLZhtg1g/l862iAY/6DQ2ykj1zAd5JyYjD+KK0J2Aw1RyhAAj1mJUd
 9breb6bea5I3+Hv5CaFR2uYAnghlUHwIEYkMioFPbqCzUTjR0Mp1v4vSfEuKGqablM
 e4xeG+ihutBhA==
Message-ID: <fb5e342b-7aed-40f4-ad62-83d0c775000b@denx.de>
Date: Fri, 5 Apr 2024 17:11:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe ROULLIER <christophe.roullier@foss.st.com>, u-boot@lists.denx.de
References: <20240309021831.264018-1-marex@denx.de>
 <20240309021831.264018-12-marex@denx.de>
 <515d659f-8096-41aa-8749-553fcb8021fe@foss.st.com>
 <DU2PR10MB77870EA1FBA37E465D592EEB8F2A2@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
 <aa1ef1a0-9c2c-40ab-96a9-b4de713ed134@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <aa1ef1a0-9c2c-40ab-96a9-b4de713ed134@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: u-boot@dh-electronics.com, Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick DELAUNAY - foss <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 11/11] net: dwc_eth_qos: Add support of
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

T24gNC81LzI0IDQ6NTYgUE0sIENocmlzdG9waGUgUk9VTExJRVIgd3JvdGU6Cj4+IE9uIDMvOS8y
NCAwMzoxMSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+PiBGcm9tOiBDaHJpc3RvcGhlIFJvdWxsaWVy
IDxjaHJpc3RvcGhlLnJvdWxsaWVyQHN0LmNvbT4KPj4+Cj4+PiBBZGQgY29tcGF0aWJsZSAic3Qs
c3RtMzJtcDEzLWR3bWFjIiB0byBtYW5hZ2UgU1RNMzJNUDEzIGJvYXJkcy4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIFJvdWxsaWVyIDxjaHJpc3RvcGhlLnJvdWxsaWVyQHN0LmNv
bT4KPj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPiAjIFJlYmFz
ZSwgcmVzaHVmZmxlLCBzcXVhc2gKPj4+IGNvZGUKPj4+IC0tLQo+Pj4gQ2M6IENocmlzdG9waGUg
Um91bGxpZXIgPGNocmlzdG9waGUucm91bGxpZXJAc3QuY29tPgo+Pj4gQ2M6IEpvZSBIZXJzaGJl
cmdlciA8am9lLmhlcnNoYmVyZ2VyQG5pLmNvbT4KPj4+IENjOiBQYXRyaWNlIENob3RhcmQgPHBh
dHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4+IENjOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRy
aWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+Pj4gQ2M6IFJhbW9uIEZyaWVkIDxyZnJpZWQuZGV2
QGdtYWlsLmNvbT4KPj4+IENjOiB1LWJvb3RAZGgtZWxlY3Ryb25pY3MuY29tCj4+PiBDYzogdWJv
b3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+Pj4gLS0tCj4+PiDCoCBkcml2
ZXJzL25ldC9kd2NfZXRoX3Fvcy5jwqDCoMKgwqDCoMKgIHzCoCA0ICsrKysKPj4+IMKgIGRyaXZl
cnMvbmV0L2R3Y19ldGhfcW9zLmjCoMKgwqDCoMKgwqAgfMKgIDEgKwo+Pj4gwqAgZHJpdmVycy9u
ZXQvZHdjX2V0aF9xb3Nfc3RtMzIuYyB8IDExICsrKysrKysrKysrCj4+PiDCoCAzIGZpbGVzIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
ZHdjX2V0aF9xb3MuYyBiL2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9zLmMKPj4+IGluZGV4IDIwM2Jm
YzA4NDhjLi5lMDIzMTc5MDVlNSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbmV0L2R3Y19ldGhf
cW9zLmMKPj4+ICsrKyBiL2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9zLmMKPj4+IEBAIC0xNTA1LDYg
KzE1MDUsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1ZGV2aWNlX2lkIGVxb3NfaWRzW10gPSB7
Cj4+PiDCoMKgwqDCoMKgwqAgfSwKPj4+IMKgICNlbmRpZgo+Pj4gwqAgI2lmIElTX0VOQUJMRUQo
Q09ORklHX0RXQ19FVEhfUU9TX1NUTTMyKQo+Pj4gK8KgwqDCoMKgIHsKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLmNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDEzLWR3bWFjIiwKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmRhdGEgPSAodWxvbmcpJmVxb3Nfc3RtMzJtcDEzX2Nv
bmZpZwo+Pj4gK8KgwqDCoMKgIH0sCj4+PiDCoMKgwqDCoMKgwqAgewo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMS1kd21hYyIsCj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5kYXRhID0gKHVsb25nKSZlcW9zX3N0bTMybXAx
NV9jb25maWcgZGlmZiAtLWdpdAo+Pj4gYS9kcml2ZXJzL25ldC9kd2NfZXRoX3Fvcy5oIGIvZHJp
dmVycy9uZXQvZHdjX2V0aF9xb3MuaCBpbmRleAo+Pj4gYmFmZDBkMzM5ZmIuLjhiM2QwZDQ2NGQz
IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9uZXQvZHdjX2V0aF9xb3MuaAo+Pj4gKysrIGIvZHJp
dmVycy9uZXQvZHdjX2V0aF9xb3MuaAo+Pj4gQEAgLTI5MCw1ICsyOTAsNiBAQCBpbnQgZXFvc19u
dWxsX29wcyhzdHJ1Y3QgdWRldmljZSAqZGV2KTvCoCBleHRlcm4KPj4+IHN0cnVjdCBlcW9zX2Nv
bmZpZyBlcW9zX2lteF9jb25maWc7wqAgZXh0ZXJuIHN0cnVjdCBlcW9zX2NvbmZpZwo+Pj4gZXFv
c19yb2NrY2hpcF9jb25maWc7wqAgZXh0ZXJuIHN0cnVjdCBlcW9zX2NvbmZpZyBlcW9zX3Fjb21f
Y29uZmlnOwo+Pj4gK2V4dGVybiBzdHJ1Y3QgZXFvc19jb25maWcgZXFvc19zdG0zMm1wMTNfY29u
ZmlnOwo+Pj4gwqAgZXh0ZXJuIHN0cnVjdCBlcW9zX2NvbmZpZyBlcW9zX3N0bTMybXAxNV9jb25m
aWc7wqAgZXh0ZXJuIHN0cnVjdAo+Pj4gZXFvc19jb25maWcgZXFvc19qaDcxMTBfY29uZmlnOyBk
aWZmIC0tZ2l0Cj4+PiBhL2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9zX3N0bTMyLmMgYi9kcml2ZXJz
L25ldC9kd2NfZXRoX3Fvc19zdG0zMi5jCj4+PiBpbmRleCAwMGJmNmQ0NTU2OC4uZTE2N2E3YmE5
MDEgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL25ldC9kd2NfZXRoX3Fvc19zdG0zMi5jCj4+PiAr
KysgYi9kcml2ZXJzL25ldC9kd2NfZXRoX3Fvc19zdG0zMi5jCj4+PiBAQCAtMzE0LDYgKzMxNCwx
NyBAQCBzdGF0aWMgc3RydWN0IGVxb3Nfb3BzIGVxb3Nfc3RtMzJfb3BzID0gewo+Pj4gwqDCoMKg
wqDCoMKgIC5lcW9zX2dldF90aWNrX2Nsa19yYXRlID0gZXFvc19nZXRfdGlja19jbGtfcmF0ZV9z
dG0zMsKgIH07Cj4+Pgo+Pj4gK3N0cnVjdCBlcW9zX2NvbmZpZyBfX21heWJlX3VudXNlZCBlcW9z
X3N0bTMybXAxM19jb25maWcgPSB7Cj4+PiArwqDCoMKgwqAgLnJlZ19hY2Nlc3NfYWx3YXlzX29r
ID0gZmFsc2UsCj4+PiArwqDCoMKgwqAgLm1kaW9fd2FpdCA9IDEwMDAwLAo+Pj4gK8KgwqDCoMKg
IC5zd3Jfd2FpdCA9IDUwLAo+Pj4gK8KgwqDCoMKgIC5jb25maWdfbWFjID0gRVFPU19NQUNfUlhR
X0NUUkwwX1JYUTBFTl9FTkFCTEVEX0RDQiwKPj4+ICvCoMKgwqDCoCAuY29uZmlnX21hY19tZGlv
ID0gRVFPU19NQUNfTURJT19BRERSRVNTX0NSXzI1MF8zMDAsCj4+PiArwqDCoMKgwqAgLmF4aV9i
dXNfd2lkdGggPSBFUU9TX0FYSV9XSURUSF8zMiwKPj4+ICvCoMKgwqDCoCAuaW50ZXJmYWNlID0g
ZGV2X3JlYWRfcGh5X21vZGUsCj4+PiArwqDCoMKgwqAgLm9wcyA9ICZlcW9zX3N0bTMyX29wcwo+
Pj4gK307Cj4+PiArCj4+PiDCoCBzdHJ1Y3QgZXFvc19jb25maWcgX19tYXliZV91bnVzZWQgZXFv
c19zdG0zMm1wMTVfY29uZmlnID0gewo+Pj4gwqDCoMKgwqDCoMKgIC5yZWdfYWNjZXNzX2Fsd2F5
c19vayA9IGZhbHNlLAo+Pj4gwqDCoMKgwqDCoMKgIC5tZGlvX3dhaXQgPSAxMDAwMCwKPiAKPiBS
ZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBST1VMTElFUiA8Y2hyaXN0b3BoZS5yb3VsbGllckBmb3Nz
LnN0LmNvbT4KClRoYW5rIHlvdS4gVGhlcmUgaXMgYSBWMiBzZXJpZXMgc3VibWl0dGVkLCBjYW4g
eW91IGFkZCB0aG9zZSB0YWdzIHRoZXJlIAp0b28gPwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
