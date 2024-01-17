Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CF383051B
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Jan 2024 13:23:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5905C6DD74;
	Wed, 17 Jan 2024 12:23:21 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 538AEC6B457
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jan 2024 12:23:20 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40HBhoNc027384; Wed, 17 Jan 2024 13:22:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Mok8pCLhJQ5OvXzenayWxIpT0hkFhZpdNzWOBJg19vA=; b=Om
 qACUTOPbqGvw9yfmFYTJxyFHkTKOgCauYzk0vYTrazrFJJ1T0YXiyaSejzIc7XKB
 GT0Hn3UXLBVOH/W2eztOXBCWzYkrQUhAb7n4jAVFd0DKAn4kwydh8s7PyeW5bdPG
 rBbm82PnCvu9CXPgu3vIUZVWeVyZZrXwX+WjWuWEotsG3YBj8bOgcUECDtHeDmXa
 qo3TPhodho5ooceIDr0MFVh9YEGrxrZr39wbKrUufWV36BEQNGt8gxxPrCkO6inO
 OIpeuXsXN334Y/X3+1A35i+0rUbt5IFos8Mz+TWQcxV2+czdeag7ipFH9uuQJ40S
 +o4275ytWLt1kJPte3QQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vnbqc8y1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jan 2024 13:22:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 68992100079;
 Wed, 17 Jan 2024 13:22:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B065226FA0;
 Wed, 17 Jan 2024 13:22:53 +0100 (CET)
Received: from [10.201.20.205] (10.201.20.205) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 17 Jan
 2024 13:22:52 +0100
Message-ID: <0dc107fb-8c85-4f98-aa8a-35e404bfa21b@foss.st.com>
Date: Wed, 17 Jan 2024 13:22:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
References: <20240116161231.741794-1-patrice.chotard@foss.st.com>
 <CAEUhbmUOy-iJ9SEiA8atU=V5CG+DAAxtQ9HJXO2A5_W=hwe1jw@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAEUhbmUOy-iJ9SEiA8atU=V5CG+DAAxtQ9HJXO2A5_W=hwe1jw@mail.gmail.com>
X-Originating-IP: [10.201.20.205]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_06,2024-01-17_01,2023-05-22_02
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Bin Meng <bmeng@tinylab.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ion Agorria <ion@agorria.com>, Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] common: console: Fix print complete stdio
	device list
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

CgpPbiAxLzE2LzI0IDE3OjI5LCBCaW4gTWVuZyB3cm90ZToKPiBPbiBXZWQsIEphbiAxNywgMjAy
NCBhdCAxMjoxM+KAr0FNIFBhdHJpY2UgQ2hvdGFyZAo+IDxwYXRyaWNlLmNob3RhcmRAZm9zcy5z
dC5jb20+IHdyb3RlOgo+Pgo+PiBJbiBjYXNlIENPTlNPTEVfTVVYIGFuZCBTWVNfQ09OU09MRV9J
U19JTl9FTlYgYXJlIG9uIGFuZAo+PiBzdGRpbiBvciBzdGRvdXQgb3Igc3RkZXJyIGFyZSBtaXNz
aW5nIGluIGVudmlyb25tZW50LCBhcyBmYWxsYmFjaywgZ2V0Cj4+IHRoZXNlIGVpdGhlciBmcm9t
IHN0ZGlvX2RldmljZXNbc3RkXSBvciBzdGRpb19kZXZpY2VzW3N0ZF0tPm5hbWUuCj4+Cj4+IEZp
eGVzOiA2YjM0M2FiMzhkICgiY29uc29sZTogUHJpbnQgb3V0IGNvbXBsZXRlIHN0ZGlvIGRldmlj
ZSBsaXN0IikKPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNo
b3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiAgY29tbW9uL2NvbnNvbGUuYyB8IDIzICsr
KysrKysrKysrLS0tLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgMTIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9jb21tb24vY29uc29sZS5jIGIv
Y29tbW9uL2NvbnNvbGUuYwo+PiBpbmRleCBjYWQ2NTg5MWZjOS4uOGJmY2ZjZTU2NDMgMTAwNjQ0
Cj4+IC0tLSBhL2NvbW1vbi9jb25zb2xlLmMKPj4gKysrIGIvY29tbW9uL2NvbnNvbGUuYwo+PiBA
QCAtMTA0OSw2ICsxMDQ5LDExIEBAIGludCBjb25zb2xlX2NsZWFyKHZvaWQpCj4+ICAgICAgICAg
cmV0dXJuIDA7Cj4+ICB9Cj4+Cj4+ICtzdGF0aWMgY2hhciAqZ2V0X3N0ZGlvKGNvbnN0IHU4IHN0
ZCkKPj4gK3sKPj4gKyAgICAgICByZXR1cm4gc3RkaW9fZGV2aWNlc1tzdGRdID8gc3RkaW9fZGV2
aWNlc1tzdGRdLT5uYW1lIDogIk5vIGRldmljZXMgYXZhaWxhYmxlISI7Cj4+ICt9Cj4+ICsKPj4g
IHN0YXRpYyB2b2lkIHN0ZGlvX3ByaW50X2N1cnJlbnRfZGV2aWNlcyh2b2lkKQo+PiAgewo+PiAg
ICAgICAgIGNoYXIgKnN0ZGlubmFtZSwgKnN0ZG91dG5hbWUsICpzdGRlcnJuYW1lOwo+PiBAQCAt
MTA2MCwxOSArMTA2NSwxMyBAQCBzdGF0aWMgdm9pZCBzdGRpb19wcmludF9jdXJyZW50X2Rldmlj
ZXModm9pZCkKPj4gICAgICAgICAgICAgICAgIHN0ZG91dG5hbWUgPSBlbnZfZ2V0KCJzdGRvdXQi
KTsKPj4gICAgICAgICAgICAgICAgIHN0ZGVycm5hbWUgPSBlbnZfZ2V0KCJzdGRlcnIiKTsKPj4K
Pj4gLSAgICAgICAgICAgICAgIHN0ZGlubmFtZSA9IHN0ZGlubmFtZSA/IDogIk5vIGlucHV0IGRl
dmljZXMgYXZhaWxhYmxlISI7Cj4+IC0gICAgICAgICAgICAgICBzdGRvdXRuYW1lID0gc3Rkb3V0
bmFtZSA/IDogIk5vIG91dHB1dCBkZXZpY2VzIGF2YWlsYWJsZSEiOwo+PiAtICAgICAgICAgICAg
ICAgc3RkZXJybmFtZSA9IHN0ZGVycm5hbWUgPyA6ICJObyBlcnJvciBkZXZpY2VzIGF2YWlsYWJs
ZSEiOwo+PiArICAgICAgICAgICAgICAgc3RkaW5uYW1lID0gc3RkaW5uYW1lID8gOiBnZXRfc3Rk
aW8oc3RkaW4pOwo+PiArICAgICAgICAgICAgICAgc3Rkb3V0bmFtZSA9IHN0ZG91dG5hbWUgPyA6
IGdldF9zdGRpbyhzdGRvdXQpOwo+PiArICAgICAgICAgICAgICAgc3RkZXJybmFtZSA9IHN0ZGVy
cm5hbWUgPyA6IGdldF9zdGRpbyhzdGRlcnIpOwo+PiAgICAgICAgIH0gZWxzZSB7Cj4+IC0gICAg
ICAgICAgICAgICBzdGRpbm5hbWUgPSBzdGRpb19kZXZpY2VzW3N0ZGluXSA/Cj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgIHN0ZGlvX2RldmljZXNbc3RkaW5dLT5uYW1lIDoKPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgIk5vIGlucHV0IGRldmljZXMgYXZhaWxhYmxlISI7Cj4+IC0gICAgICAg
ICAgICAgICBzdGRvdXRuYW1lID0gc3RkaW9fZGV2aWNlc1tzdGRvdXRdID8KPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgc3RkaW9fZGV2aWNlc1tzdGRvdXRdLT5uYW1lIDoKPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgIk5vIG91dHB1dCBkZXZpY2VzIGF2YWlsYWJsZSEiOwo+PiAtICAgICAg
ICAgICAgICAgc3RkZXJybmFtZSA9IHN0ZGlvX2RldmljZXNbc3RkZXJyXSA/Cj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgIHN0ZGlvX2RldmljZXNbc3RkZXJyXS0+bmFtZSA6Cj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICJObyBlcnJvciBkZXZpY2VzIGF2YWlsYWJsZSEiOwo+PiArICAgICAg
ICAgICAgICAgc3RkaW5uYW1lID0gZ2V0X3N0ZGlvKHN0ZGluKTsKPj4gKyAgICAgICAgICAgICAg
IHN0ZG91dG5hbWUgPSBnZXRfc3RkaW8oc3Rkb3V0KTsKPj4gKyAgICAgICAgICAgICAgIHN0ZGVy
cm5hbWUgPSBnZXRfc3RkaW8oc3RkZXJyKTsKPj4gICAgICAgICB9Cj4+Cj4+ICAgICAgICAgLyog
UHJpbnQgaW5mb3JtYXRpb24gKi8KPj4gLS0KPiAKPiBUaGlzIGNhbiBiZSBmdXJ0aGVyIHNpbXBs
aWZpZWQgdG86Cj4gCj4gY2hhciAqc3RkaW5uYW1lID0gTlVMTDsKPiBjaGFyICpzdGRvdXRuYW1l
ID0gTlVMTDsKPiBjaGFyICpzdGRlcnJuYW1lIE5VTEw7Cj4gCj4gICAgIGlmIChDT05GSUdfSVNf
RU5BQkxFRChDT05TT0xFX01VWCkgJiYKPiAgICAgICAgICBDT05GSUdfSVNfRU5BQkxFRChTWVNf
Q09OU09MRV9JU19JTl9FTlYpKSB7Cj4gICAgICAgICAgICAgICAgLyogc3RkaW4gc3Rkb3V0IGFu
ZCBzdGRlcnIgYXJlIGluIGVudmlyb25tZW50ICovCj4gICAgICAgICAgICAgICAgc3RkaW5uYW1l
ICA9IGVudl9nZXQoInN0ZGluIik7Cj4gICAgICAgICAgICAgICAgc3Rkb3V0bmFtZSA9IGVudl9n
ZXQoInN0ZG91dCIpOwo+ICAgICAgICAgICAgICAgIHN0ZGVycm5hbWUgPSBlbnZfZ2V0KCJzdGRl
cnIiKTsKPiAgICAgfQo+IAo+ICAgIHN0ZGlubmFtZSA9IHN0ZGlubmFtZSA/IDogZ2V0X3N0ZGlv
KHN0ZGluKTsKPiAgICBzdGRvdXRuYW1lID0gc3Rkb3V0bmFtZSA/IDogZ2V0X3N0ZGlvKHN0ZG91
dCk7Cj4gICAgc3RkZXJybmFtZSA9IHN0ZGVycm5hbWUgPyA6IGdldF9zdGRpbyhzdGRlcnIpOwo+
IAo+IFJlZ2FyZHMsCj4gQmluCgpSaWdodCwgaSB3aWxsIHNlbmQgYSB2MgpUaGFua3MKClBhdHJp
Y2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
