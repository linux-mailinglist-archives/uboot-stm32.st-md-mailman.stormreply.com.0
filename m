Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA148AA7F2
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 07:31:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6808DC6DD67;
	Fri, 19 Apr 2024 05:31:49 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C157C6C859
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 05:31:48 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 11A9A88629;
 Fri, 19 Apr 2024 07:31:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713504707;
 bh=7XlJY68jpa59R3R/wT/DAbab8y/apudOHN8U4ZyLTBY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K/CJcV/NuJXqDr9eCfSQaJ11IccI8AqNmFVmwxWISCR1NbsL6U7uR8q91++2222DQ
 PQrRTi/XhaTrbWTLp0svh9n8Hy0Pw6mSSPnYMrs6ZwV9SjkZG/3FkElZk1339YHGWw
 ISd/L8m6iRC+yvTEM/dPdT5y+q3HOPwtDYjmiDTuqoT+akPsAb7u7377RzfOVn21sd
 nlbgCptGOK3BNdIbTYWBjdjbDLtudVFoxJGbLEvfTwW0VD/OnKXqKsycWNrLvlzxG/
 az8UJlvjBf4VqtiCP2bir/y93zbAyNCURYRK1tRK0S1YH0W7Z/uQp39nNlSqZQrc2q
 UPZnKlaMNB3rg==
Message-ID: <de1e8291-23cd-49d8-8070-d41b429f7cd3@denx.de>
Date: Fri, 19 Apr 2024 05:58:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20240415125541.6547-1-marex@denx.de>
 <f4d25293-e9c6-45de-a0d9-643252e2a0b6@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f4d25293-e9c6-45de-a0d9-643252e2a0b6@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2] ARM: stm32: Initialize TAMP_SMCR
 BKP..PROT fields on STM32MP15xx
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

T24gNC8xOC8yNCA4OjI0IFBNLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAoKSGksCgpb
Li4uXQoKPj4gQEAgLTEzNiw2ICsxNDAsMTggQEAgc3RhdGljIHZvaWQgc2VjdXJpdHlfaW5pdCh2
b2lkKQo+PiDCoMKgwqDCoMKgwqAgKi8KPj4gwqDCoMKgwqDCoCB3cml0ZWwoMHgwLCBUQU1QX0NS
MSk7Cj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICogVEFNUDogQ29uZmlndXJlIG5vbi16ZXJv
IHNlY3VyZSBwcm90ZWN0aW9uIHNldHRpbmdzLiBUaGlzIGlzCj4+ICvCoMKgwqDCoCAqIGNoZWNr
ZWQgYnkgQm9vdFJPTSBmdW5jdGlvbiAzNWFjIG9uIE9UUC1DTE9TRUQgZGV2aWNlIGR1cmluZwo+
PiArwqDCoMKgwqAgKiBDUFUgY29yZSAxIHJlbGVhc2UgZnJvbSBlbmRsZXNzIGxvb3AuIElmIHNl
Y3VyZSBwcm90ZWN0aW9uCj4+ICvCoMKgwqDCoCAqIGZpZWxkcyBhcmUgemVybywgdGhlIGNvcmUg
MSBpcyBub3QgcmVsZWFzZWQgZnJvbSBlbmRsZXNzCj4+ICvCoMKgwqDCoCAqIGxvb3Agb24gc2Vj
b25kIFNHSTAuCj4+ICvCoMKgwqDCoCAqLwo+PiArwqDCoMKgIGNscnNldGJpdHNfbGUzMihUQU1Q
X1NNQ1IsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRBTVBfU01DUl9CS1BSV0RQUk9UIHwg
VEFNUF9TTUNSX0JLUFdEUFJPVCwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRklFTERfUFJF
UChUQU1QX1NNQ1JfQktQUldEUFJPVCwgMHgxMCkgfAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBGSUVMRF9QUkVQKFRBTVBfU01DUl9CS1BXRFBST1QsIDB4MTApKTsKPj4gKwo+PiDCoMKgwqDC
oMKgIC8qIEdQSU9aOiBkZWFjdGl2YXRlIHRoZSBzZWN1cml0eSAqLwo+PiDCoMKgwqDCoMKgIHdy
aXRlbChCSVQoMCksIFJDQ19NUF9BSEI1RU5TRVRSKTsKPj4gwqDCoMKgwqDCoCB3cml0ZWwoMHgw
LCBHUElPWl9TRUNDRkdSKTsKPiAKPiAKPiBUaGUgcmVjb21tZW5kZWQgbWFwcGluZyAodGhlIG1h
cHBpbmcgZG9uZSBpbiBPUC1URUUgZm9yIE9wZW5TVExpbnV4KSBpcyAKPiBkZXNjcmliZWQgaW4g
V2lraSBwYWdlCj4gCj4gLSAxMCBiYWNrdXAgcmVnaXN0ZXIgc2VjdXJlCj4gCj4gLSA0wqAgYmFj
a3VwIHJlZ2lzdGVyIHNlY3VyZSB3cml0ZSAvIG5vbiBzZWN1cmUgcmVhZAo+IAo+IC0gMTcgYmFj
a3VwIHJlZ2lzdGVyIE5vbi1zZWN1cmUKPiAKPiBJdCBpcyBkb25lIGluCj4gCj4gaHR0cHM6Ly9n
aXRodWIuY29tL1NUTWljcm9lbGVjdHJvbmljcy9vcHRlZV9vcy9ibG9iLzMuMTkuMC1zdG0zMm1w
L2NvcmUvYXJjaC9hcm0vcGxhdC1zdG0zMm1wMS9tYWluLmMKPiAKPiB3aXRoCj4gCj4gCj4gc3Rh
dGljIFRFRV9SZXN1bHQgc3RtMzJfY29uZmlndXJlX3RhbXAodm9pZCkKPiB7Cj4gIMKgwqAgwqBU
RUVfUmVzdWx0IHJlcyBfX21heWJlX3VudXNlZCA9IFRFRV9TVUNDRVNTOwo+ICDCoMKgIMKgc3Ry
dWN0IHN0bTMyX2JrcHJlZ3NfY29uZiBia3ByZWdzX2NvbmYgPSB7Cj4gIMKgwqAgwqDCoMKgwqAg
Lm5iX3pvbmUxX3JlZ3MgPSAxMCwgLyogMTAgcmVnaXN0ZXJzIGluIHpvbmUgMSAqLwo+ICDCoMKg
IMKgwqDCoMKgIC5uYl96b25lMl9yZWdzID0gNcKgwqAgLyogNSByZWdpc3RlcnMgaW4gem9uZSAy
ICovCj4gIMKgwqAgwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqDCoCAvKiBab25lMyBhbGwg
cmVtYWluaW5nICovCj4gIMKgwqAgwqB9Owo+IAo+ICDCoMKgIMKgLyogRW5hYmxlIEJLUCBSZWdp
c3RlciBwcm90ZWN0aW9uICovCj4gIMKgwqAgwqBpZiAoc3RtMzJfdGFtcF9zZXRfc2VjdXJlX2Jr
cHJlZ3MoJmJrcHJlZ3NfY29uZikpCj4gIMKgwqAgwqDCoMKgwqAgcGFuaWMoKTsKPiAKPiAKPiBC
dXQgd2hlbiB5b3UgYXJlIGJvb3Rpbmcgd2l0aCBTUEwgVS1ib290LCBhbGwgdGhlIGJvb3QgY2hh
aW4gYW5kIHRoZSAKPiBMaW51eCBrZXJuZWwKPiAKPiBpcyBydW5uaW5nIGluIHNlY3VyZSB3b3Js
ZAo+IAo+IAo+IFNvIHlvdSBoYXZlIG5vIHJlYXNvbiB0byBtYW5hZ2UgYW55IGxpbWl0IGZvciB0
aGUgYWNjZXNzIHRvIGJhY2t1cCAKPiByZWdpc3RlciwKPiAKPiB5b3UgY2FuIGFsbG9jYXRlIGFs
bCB0aGUgYmFja3VwIHJlZ2lzdGVycyAodGhlIDMyIG9uZSkgdG8gc2VjdXJlIHdvcmxkCj4gCj4g
U2VlICJGaWd1cmUgNTUyLiBCYWNrdXAgcmVnaXN0ZXJzIHNlY3VyZSBwcm90ZWN0aW9ucyIgaW4g
cmVmZXJlbmNlIG1uYXVlbAo+IAo+IFByb3RlY3Rpb24gem9uZSAxID0+IHggPSAzMSB3aXRowqAg
QktQUldEUFJPVCA9IDMxCj4gCj4gUHJvdGVjdGlvbiB6b25lIDIgJiAzID0+IGVtcHR5Cj4gCj4g
K8KgwqDCoCBjbHJzZXRiaXRzX2xlMzIoVEFNUF9TTUNSLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFRBTVBfU01DUl9CS1BSV0RQUk9UIHwgVEFNUF9TTUNSX0JLUFdEUFJPVCwKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBGSUVMRF9QUkVQKFRBTVBfU01DUl9CS1BSV0RQUk9ULCAweDIwKSB8
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRklFTERfUFJFUChUQU1QX1NNQ1JfQktQV0RQUk9U
LCAweDIwKSk7Cj4gCj4gCj4gU29ycnkgZm9yIHRoZSBkZWxheSwgSSBuZWVkIGFsc28gdG8gY2hl
Y2sgb24gbXkgc2lkZQo+IAo+IAo+IEJ1dCBhbnl3YXkgeW91ciBwcm9wb3NhbCBpcyBmdW5jdGlv
bmFsLAo+IAo+IFNvIHdpdGggb3Igd2l0aG91dCB0aGUgcHJldmlvdXMgcmVtYXJrCgpUaGFuayB5
b3UgZm9yIHRoZSBkZXRhaWxlZCBleHBsYW5hdGlvbiBhbmQgZm9yIGNoZWNraW5nIHRoaXMuClYz
IGlzIGNvbWluZyBub3cuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
