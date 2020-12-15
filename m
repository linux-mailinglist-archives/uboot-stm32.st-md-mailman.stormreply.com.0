Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B24952DAF4A
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Dec 2020 15:47:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50829C3087A;
	Tue, 15 Dec 2020 14:47:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F649C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 14:47:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BFEbKjS004178; Tue, 15 Dec 2020 15:47:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : cc : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Y4VgPx+MrcOYzYrf1h2v4Yv8UghfIvDYvBMk9K6ok5Y=;
 b=AJGTtOWea9sfOoPjvIsAJhjnWCBaK2unlgZb+PgjDrQLsGudOqfDYb5pHRzIrNeXVqUq
 KsOn4myxDQV5J0ZlLYg+9PAIdgDez4mvrpZbqodAaSEQTRDJiRAEN8W4NAg4luN6C4GC
 hv0BSU9nUeNeufBcdihBszvrmvxeElptolHiIQLeGYrJR4JZDyqZxAmrP5drd3aPpgTL
 Oc0qxDOAMkAkU5PgVrpAveG9sehnJmNr7Mqb1cgp/meNBn7CnbwvglD4CU+2HlXfP+rJ
 Fx0fmJdAzxaHT+RYU+Ebrkw0OGBCxkIgo9RRaLqOe2iOM0FPEsX4NmUmwdlQ/H24j4mf Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35cpwe3chk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 15:47:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D3FF310002A;
 Tue, 15 Dec 2020 15:47:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C36C0216B98;
 Tue, 15 Dec 2020 15:47:24 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 15 Dec
 2020 15:47:24 +0100
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20201203092032.8124-1-patrick.delaunay@st.com>
 <20201203102027.3.I3e15d39becc5c180a3be52571bb570e29c6b4cd0@changeid>
 <CAPnjgZ33Ahzy_LV8SniyU_=HVGLYggPBRmULMF_h2sLV3jbJwA@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <0e39420f-9c9a-85bc-7120-2fa3998eeff2@foss.st.com>
Date: Tue, 15 Dec 2020 15:47:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ33Ahzy_LV8SniyU_=HVGLYggPBRmULMF_h2sLV3jbJwA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-15_12:2020-12-15,
 2020-12-15 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Anatolij Gustschin <agust@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] console: remove #ifdef
	CONFIG_CONSOLE_RECORD
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

Ck9uIDEyLzEyLzIwIDQ6MzkgUE0sIFNpbW9uIEdsYXNzIHdyb3RlOgo+IEhpIFBhdHJpY2ssCj4K
PiBPbiBUaHUsIDMgRGVjIDIwMjAgYXQgMDI6MjAsIFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2su
ZGVsYXVuYXlAc3QuY29tPiB3cm90ZToKPj4gQWRkIGhlbHBlciBmdW5jdGlvbnMgdG8gYWNjZXNz
IHRvIGdkLT5jb25zb2xlX291dCBhbmQgZ2QtPmNvbnNvbGVfaW4KPj4gd2l0aCBtZW1idWZmIEFQ
SSBhbmQgcmVwbGFjZSB0aGUgI2lmZGVmIENPTkZJR19DT05TT0xFX1JFQ09SRCB0ZXN0Cj4+IGJ5
IGlmIChJU19FTkFCTEVEKENPTkZJR19DT05TT0xFX1JFQ09SRCkpIHRvIHJlc3BlY3QgdGhlIFUt
Qm9vdAo+PiBjb2RpbmcgcnVsZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5h
eSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+Cj4+ICMgQ29uZmxpY3RzOgo+PiAjICAgICAgIGNv
bW1vbi9jb25zb2xlLmMKPj4gLS0tCj4+Cj4+ICAgY29tbW9uL2NvbnNvbGUuYyB8IDg2ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPiBSZXZpZXdlZC1ieTog
U2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4KPiBCdXQgc2VlIGJlbG93Cj4KPj4gZGlm
ZiAtLWdpdCBhL2NvbW1vbi9jb25zb2xlLmMgYi9jb21tb24vY29uc29sZS5jCj4+IGluZGV4IDlh
NjNlYWE2NjQuLjBiODY0NDQ0YmIgMTAwNjQ0Cj4+IC0tLSBhL2NvbW1vbi9jb25zb2xlLmMKPj4g
KysrIGIvY29tbW9uL2NvbnNvbGUuYwo+PiBAQCAtODgsNiArODgsNTYgQEAgc3RhdGljIGludCBv
bl9zaWxlbnQoY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAqdmFsdWUsIGVudW0gZW52X29w
IG9wLAo+PiAgIFVfQk9PVF9FTlZfQ0FMTEJBQ0soc2lsZW50LCBvbl9zaWxlbnQpOwo+PiAgICNl
bmRpZgo+Pgo+PiArI2lmZGVmIENPTkZJR19DT05TT0xFX1JFQ09SRAo+PiArLyogaGVscGVyIGZ1
bmN0aW9uOiBhY2Nlc3MgdG8gZ2QtPmNvbnNvbGVfb3V0IGFuZCBnZC0+Y29uc29sZV9pbiAqLwo+
PiArc3RhdGljIHZvaWQgY29uc29sZV9yZWNvcmRfcHV0Yyhjb25zdCBjaGFyIGMpCj4+ICt7Cj4+
ICsgICAgICAgaWYgIChnZC0+Y29uc29sZV9vdXQuc3RhcnQpCj4+ICsgICAgICAgICAgICAgICBt
ZW1idWZmX3B1dGJ5dGUoKHN0cnVjdCBtZW1idWZmICopJmdkLT5jb25zb2xlX291dCwgYyk7Cj4+
ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIGNvbnNvbGVfcmVjb3JkX3B1dHMoY29uc3QgY2hhciAq
cykKPj4gK3sKPj4gKyAgICAgICBpZiAgKGdkLT5jb25zb2xlX291dC5zdGFydCkKPj4gKyAgICAg
ICAgICAgICAgIG1lbWJ1ZmZfcHV0KChzdHJ1Y3QgbWVtYnVmZiAqKSZnZC0+Y29uc29sZV9vdXQs
IHMsIHN0cmxlbihzKSk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgY29uc29sZV9yZWNvcmRf
Z2V0Yyh2b2lkKQo+PiArewo+PiArICAgICAgIGlmICghZ2QtPmNvbnNvbGVfaW4uc3RhcnQpCj4+
ICsgICAgICAgICAgICAgICByZXR1cm4gLTE7Cj4+ICsKPj4gKyAgICAgICByZXR1cm4gbWVtYnVm
Zl9nZXRieXRlKChzdHJ1Y3QgbWVtYnVmZiAqKSZnZC0+Y29uc29sZV9pbik7Cj4+ICt9Cj4+ICsK
Pj4gK3N0YXRpYyBpbnQgY29uc29sZV9yZWNvcmRfdHN0Yyh2b2lkKQo+PiArewo+PiArICAgICAg
IGlmIChnZC0+Y29uc29sZV9pbi5zdGFydCkgewo+PiArICAgICAgICAgICAgICAgaWYgKG1lbWJ1
ZmZfcGVla2J5dGUoKHN0cnVjdCBtZW1idWZmICopJmdkLT5jb25zb2xlX2luKSAhPSAtMSkKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4+ICsgICAgICAgfQo+PiArICAgICAg
IHJldHVybiAwOwo+PiArfQo+PiArI2Vsc2UKPj4gK3N0YXRpYyB2b2lkIGNvbnNvbGVfcmVjb3Jk
X3B1dGMoY2hhciBjKQo+PiArewo+PiArfQo+PiArCj4+ICtzdGF0aWMgdm9pZCBjb25zb2xlX3Jl
Y29yZF9wdXRzKGNvbnN0IGNoYXIgKnMpCj4+ICt7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQg
Y29uc29sZV9yZWNvcmRfZ2V0Yyh2b2lkKQo+PiArewo+PiArICAgICAgIHJldHVybiAtMTsKPj4g
K30KPj4gKwo+PiArc3RhdGljIGludCBjb25zb2xlX3JlY29yZF90c3RjKHZvaWQpCj4+ICt7Cj4+
ICsgICAgICAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsjZW5kaWYKPj4gKwo+PiAgICNpZiBDT05GSUdf
SVNfRU5BQkxFRChTWVNfQ09OU09MRV9JU19JTl9FTlYpCj4+ICAgLyoKPj4gICAgKiBpZiBvdmVy
d3JpdGVfY29uc29sZSByZXR1cm5zIDEsIHRoZSBzdGRpbiwgc3RkZXJyIGFuZCBzdGRvdXQKPj4g
QEAgLTQyMCwxNSArNDcwLDEzIEBAIGludCBnZXRjaGFyKHZvaWQpCj4+ICAgICAgICAgIGlmICgh
Z2QtPmhhdmVfY29uc29sZSkKPj4gICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPj4KPj4gLSNp
ZmRlZiBDT05GSUdfQ09OU09MRV9SRUNPUkQKPj4gLSAgICAgICBpZiAoZ2QtPmNvbnNvbGVfaW4u
c3RhcnQpIHsKPj4gLSAgICAgICAgICAgICAgIGludCBjaDsKPj4gKyAgICAgICBpZiAoSVNfRU5B
QkxFRChDT05GSUdfQ09OU09MRV9SRUNPUkQpKSB7Cj4+ICsgICAgICAgICAgICAgICBpbnQgY2gg
PSBjb25zb2xlX3JlY29yZF9nZXRjKCk7Cj4+Cj4+IC0gICAgICAgICAgICAgICBjaCA9IG1lbWJ1
ZmZfZ2V0Ynl0ZSgoc3RydWN0IG1lbWJ1ZmYgKikmZ2QtPmNvbnNvbGVfaW4pOwo+PiAgICAgICAg
ICAgICAgICAgIGlmIChjaCAhPSAtMSkKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IDE7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBjaDsKPj4gICAgICAgICAgfQo+
PiAtI2VuZGlmCj4+ICsKPj4gICAgICAgICAgaWYgKGdkLT5mbGFncyAmIEdEX0ZMR19ERVZJTklU
KSB7Cj4+ICAgICAgICAgICAgICAgICAgLyogR2V0IGZyb20gdGhlIHN0YW5kYXJkIGlucHV0ICov
Cj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIGZnZXRjKHN0ZGluKTsKPj4gQEAgLTQ0NSwxMiAr
NDkzLDEwIEBAIGludCB0c3RjKHZvaWQpCj4+Cj4+ICAgICAgICAgIGlmICghZ2QtPmhhdmVfY29u
c29sZSkKPj4gICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPj4gLSNpZmRlZiBDT05GSUdfQ09O
U09MRV9SRUNPUkQKPj4gLSAgICAgICBpZiAoZ2QtPmNvbnNvbGVfaW4uc3RhcnQpIHsKPj4gLSAg
ICAgICAgICAgICAgIGlmIChtZW1idWZmX3BlZWtieXRlKChzdHJ1Y3QgbWVtYnVmZiAqKSZnZC0+
Y29uc29sZV9pbikgIT0gLTEpCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAxOwo+
PiAtICAgICAgIH0KPj4gLSNlbmRpZgo+PiArCj4+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09O
RklHX0NPTlNPTEVfUkVDT1JEKSAmJiBjb25zb2xlX3JlY29yZF90c3RjKCkpCj4+ICsgICAgICAg
ICAgICAgICByZXR1cm4gMTsKPj4gKwo+PiAgICAgICAgICBpZiAoZ2QtPmZsYWdzICYgR0RfRkxH
X0RFVklOSVQpIHsKPj4gICAgICAgICAgICAgICAgICAvKiBUZXN0IHRoZSBzdGFuZGFyZCBpbnB1
dCAqLwo+PiAgICAgICAgICAgICAgICAgIHJldHVybiBmdHN0YyhzdGRpbik7Cj4+IEBAIC01MjEs
MTAgKzU2NywxMCBAQCB2b2lkIHB1dGMoY29uc3QgY2hhciBjKQo+PiAgIHsKPj4gICAgICAgICAg
aWYgKCFnZCkKPj4gICAgICAgICAgICAgICAgICByZXR1cm47Cj4+IC0jaWZkZWYgQ09ORklHX0NP
TlNPTEVfUkVDT1JECj4+IC0gICAgICAgaWYgKChnZC0+ZmxhZ3MgJiBHRF9GTEdfUkVDT1JEKSAm
JiBnZC0+Y29uc29sZV9vdXQuc3RhcnQpCj4+IC0gICAgICAgICAgICAgICBtZW1idWZmX3B1dGJ5
dGUoKHN0cnVjdCBtZW1idWZmICopJmdkLT5jb25zb2xlX291dCwgYyk7Cj4+IC0jZW5kaWYKPj4g
Kwo+PiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19DT05TT0xFX1JFQ09SRCkgJiYgKGdk
LT5mbGFncyAmIEdEX0ZMR19SRUNPUkQpKQo+PiArICAgICAgICAgICAgICAgY29uc29sZV9yZWNv
cmRfcHV0YyhjKTsKPiBHaXZlbiB5b3VyIGZ1bmN0aW9ucyBhYm92ZSBJIHdvbmRlciB3aHkgeW91
IG5lZWQgdGhlIElTX0VOQUJMRUQoKQo+IGhlcmU/IE1heWJlIGV2ZW4gbW92ZSB0aGUgZ2QtLmZs
YWdzIGNoZWNrIGludG8gdGhvc2UgZnVuY3Rpb25zPwoKSW4gZmFjdCBpdCBpcyBub3QgbmVlZGVk
LgoKSSBsaW1pdCB0aGUgZGlmZmVyZW5jZSB0byBlYXN5IHRoZSByZXZpZXcgYW5kIHRvIGJlIGNv
aGVyZW50IHdpdGggb3RoZXIgCnRlc3Qgb24gZmxhZ3MsIGZvciBleGFtcGxlOgoKIMKgwqDCoCBp
ZiAoSVNfRU5BQkxFRChDT05GSUdfRElTQUJMRV9DT05TT0xFKSAmJiAoZ2QtPmZsYWdzICYgCkdE
X0ZMR19ESVNBQkxFX0NPTlNPTEUpKQoKIMKgwqDCoCBpZiAoSVNfRU5BQkxFRChDT05GSUdfU0lM
RU5UX0NPTlNPTEUpICYmIChnZC0+ZmxhZ3MgJiBHRF9GTEdfU0lMRU5UKSkKCkJ1dCB5b3UgYXJl
IHJpZ2h0IGl0IGlzIG1vcmUgZWxlZ2FudCBpZiBJIG1vdmUgdGhlIDIgdGVzdHMgaW4gdGhlIGhl
bHBlciAKZnVuY3Rpb24uCgpJIHdpbGwgZG8gaXQgaXQgaW4gVjIKClJlZ2FyZHMsCgpQYXRyaWNr
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
