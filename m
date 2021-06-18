Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7163AC584
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Jun 2021 09:57:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A3C9C597AF;
	Fri, 18 Jun 2021 07:57:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5041C597B0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 07:57:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I7vP1b016524; Fri, 18 Jun 2021 09:57:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=J8Yw2dEvvasrRB4xuJPYnEJle4YQXHfLTqT3+G4sAG0=;
 b=tljBdw2kMOxxjgvMSftq+wmTDbmbePRcaZSVcSdu34sGBUQ1QtOgBwtvXxGkkvUjGJYm
 HHZBuHYibKDXpIj23mZ5STjYvupuKK4FoOlkndkFYyqIBd9curT7NW1a/c1vCs0/EWST
 0FgEmSeE2pjcbEM9eIYr8sRX9Kr1bae9shdpS3Jdrsyng/vRpQF7S9xjiyVxDqSl36Y2
 5thfyUMuFRQHCpl7Qw4E2/oTamb/vLbPGVIqJUSpS/5o/rDXzj4Ah5mMKJI1QnBWcucM
 w4llhq4/wED7Pia1sZLe+tliJk6e3TYKGj13IaU8KwYJsd4U5SZqvFUK9MGjaWpCDBS7 Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3985b756xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 09:57:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6AD3110002A;
 Fri, 18 Jun 2021 09:57:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E73921A205;
 Fri, 18 Jun 2021 09:57:33 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 09:57:32 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
 <20210518151206.4.I44c0cbd50fa01f82729d1d6d435d0f663b9e7dcb@changeid>
 <20c75ee4-fffd-80f5-eab2-93d732a497c5@foss.st.com>
Message-ID: <3d740f32-0404-b3a4-4210-3a3c8f00f9e3@foss.st.com>
Date: Fri, 18 Jun 2021 09:57:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20c75ee4-fffd-80f5-eab2-93d732a497c5@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 04/10] stm32mp: stm32prog: solve
 compilation with CONFIG_FIT_SIGNATURE
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

CgpPbiA1LzI4LzIxIDI6NTMgUE0sIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToKPiBIaSBQYXRyaWNr
Cj4gCj4gT24gNS8xOC8yMSAzOjEyIFBNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+PiBXaGVu
IENPTkZJR19GSVRfU0lHTkFUVVJFIGlzIGFjdGl2YXRlZCwgQ09ORklHX0xFR0FDWV9JTUFHRV9G
T1JNQVQKPj4gaXMgZGVhY3RpdmF0ZWQgYW5kIHRoZSBkZWZpbmUgSU1BR0VfRk9STUFUX0xFR0FD
WSBkb24ndCBleGlzdCB3aXRoCj4+IGluY2x1ZGUvaW1hZ2UuaDoKPj4gICAjaWYgZGVmaW5lZChD
T05GSUdfTEVHQUNZX0lNQUdFX0ZPUk1BVCkKPj4gICAjZGVmaW5lIElNQUdFX0ZPUk1BVF9MRUdB
Q1kJMHgwMQkvKiBsZWdhY3kgaW1hZ2VfaGVhZGVyIGJhc2VkIGZvcm1hdCAqLwo+PiAgICNlbmRp
Zgo+Pgo+PiBUaGlzIHBhdGNoIGFkZHMgdGhlIG5lZWRlZCBjaGVjayBvbiBjb21waWxhdGlvbiBm
bGFnCj4+IENPTkZJR19MRUdBQ1lfSU1BR0VfRk9STUFUIHRvIGF2b2lkIHRoZSBjb21waWxhdGlv
biBlcnJvcgo+PiBmb3IgY29tbWFuZCBzdG0zMnByb2c6Cj4+Cj4+IGNtZF9zdG0zMnByb2cuYzo4
MTo4OiBlcnJvcjog4oCYSU1BR0VfRk9STUFUX0xFR0FDWeKAmSB1bmRlY2xhcmVkCj4+IChmaXJz
dCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhJTUFHRV9GT1JNQVRfRklU
4oCZPwo+PiAgICA4MSB8ICAgIGlmIChJTUFHRV9GT1JNQVRfTEVHQUNZID09Cj4+ICAgICAgIHwg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KPj4gICAgICAgfCAgICAgICAgSU1BR0VfRk9STUFU
X0ZJVAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1
bmF5QGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9jbWRf
c3RtMzJwcm9nL2NtZF9zdG0zMnByb2cuYyB8IDIgKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9jbWRf
c3RtMzJwcm9nL2NtZF9zdG0zMnByb2cuYyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9jbWRfc3Rt
MzJwcm9nL2NtZF9zdG0zMnByb2cuYwo+PiBpbmRleCBlNTg0YmI1MmJkLi5mMzc5MGY5MDBmIDEw
MDY0NAo+PiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvY21kX3N0bTMycHJvZy9jbWRfc3Rt
MzJwcm9nLmMKPj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMnByb2cvY21k
X3N0bTMycHJvZy5jCj4+IEBAIC03NywxMCArNzcsMTIgQEAgc3RhdGljIGludCBkb19zdG0zMnBy
b2coc3RydWN0IGNtZF90YmwgKmNtZHRwLCBpbnQgZmxhZywgaW50IGFyZ2MsCj4+ICAJCWlmICho
ZWFkZXIudHlwZSA9PSBIRUFERVJfU1RNMzJJTUFHRSkgewo+PiAgCQkJc2l6ZSA9IGhlYWRlci5p
bWFnZV9sZW5ndGggKyBCTF9IRUFERVJfU0laRTsKPj4gIAo+PiArI2lmIGRlZmluZWQoQ09ORklH
X0xFR0FDWV9JTUFHRV9GT1JNQVQpCj4+ICAJCQkvKiB1SW1hZ2UgZGV0ZWN0ZWQgaW4gU1RNMzJJ
TUFHRSwgZXhlY3V0ZSB0aGUgc2NyaXB0ICovCj4+ICAJCQlpZiAoSU1BR0VfRk9STUFUX0xFR0FD
WSA9PQo+PiAgCQkJICAgIGdlbmltZ19nZXRfZm9ybWF0KCh2b2lkICopKGFkZHIgKyBCTF9IRUFE
RVJfU0laRSkpKQo+PiAgCQkJCXJldHVybiBpbWFnZV9zb3VyY2Vfc2NyaXB0KGFkZHIgKyBCTF9I
RUFERVJfU0laRSwgInNjcmlwdEAxIik7Cj4+ICsjZW5kaWYKPj4gIAkJfQo+PiAgCX0KPj4gIAo+
Pgo+IFJldmlld2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0
LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNlCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKPiBVYm9vdC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4gaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIKPiAKQXBwbGllZCBv
biB1LWJvb3Qtc3RtMzIvbmV4dAoKVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
