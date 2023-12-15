Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32163814A26
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Dec 2023 15:12:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8B5AC6DD6D;
	Fri, 15 Dec 2023 14:12:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8120EC6DD6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 14:12:46 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BF9b4Mk028439; Fri, 15 Dec 2023 15:12:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=BEOeenzKA4OB1w+LsG5+JBtGetax5kbKMIN0N7yrbn8=; b=Gc
 XRWCQI3ugmom2NkNdb/33REHUNqWO6Wz2ZPkZwXEi9kWZzvbf+xPb6f1hPeVxZaN
 ZIhXKVjbyjMRDumTwd3cMWRutKGVFM+v9wZiGe0Amlw8kaq7OhnROlnwTIfir3tS
 2cTLPbr1LdtV+u5cYDMFlwTWcsw2jRXh+6fRNwosFi3/42zgPlBSm+3BcGbF4Tf1
 gJTP65MWZkgFyQk7IQ1IgOmyugT6rEbSU79F7WlrumlE5nypz0Kp+sBuF4u4QAWu
 KiaNqFfiIflMQJeGZYQW3eFubr7V/sCPzGmU14jpWU0rv6OSz9cWvVVzta3lH2mI
 YhduaojAvGPFUbvEZEcQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvehmtmyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 15:12:45 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 87CF2100052;
 Fri, 15 Dec 2023 15:12:44 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 800512278B3;
 Fri, 15 Dec 2023 15:12:44 +0100 (CET)
Received: from [10.252.23.141] (10.252.23.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 15:12:44 +0100
Message-ID: <85143540-3b4b-4d3e-bcf6-e1084f605336@foss.st.com>
Date: Fri, 15 Dec 2023 15:12:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20231117170107.1147598-1-patrice.chotard@foss.st.com>
 <20231117170107.1147598-2-patrice.chotard@foss.st.com>
 <7137cd11-03ee-4a3c-8ff6-4e5c9268981d@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <7137cd11-03ee-4a3c-8ff6-4e5c9268981d@foss.st.com>
X-Originating-IP: [10.252.23.141]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_08,2023-12-14_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] board: st: common: simplify MTD
	device parsing
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

CgpPbiAxMi8xNS8yMyAxMjo1MywgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPiAKPiBP
biAxMS8xNy8yMyAxODowMSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBTaW1wbGlmeSB0aGUg
d2F5IGFsbCBNVEQgZGV2aWNlcyBhcmUgcGFyc2VkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRy
aWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKg
IGJvYXJkL3N0L2NvbW1vbi9zdG0zMm1wX2RmdS5jIHwgMTkgKystLS0tLS0tLS0tLS0tLS0tLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2JvYXJkL3N0L2NvbW1vbi9zdG0zMm1wX2RmdS5jIGIvYm9hcmQvc3Qv
Y29tbW9uL3N0bTMybXBfZGZ1LmMKPj4gaW5kZXggZGVkM2JmODE5NjEuLjc3ZWRiODZlNzhjIDEw
MDY0NAo+PiAtLS0gYS9ib2FyZC9zdC9jb21tb24vc3RtMzJtcF9kZnUuYwo+PiArKysgYi9ib2Fy
ZC9zdC9jb21tb24vc3RtMzJtcF9kZnUuYwo+PiBAQCAtMTIzLDI0ICsxMjMsOSBAQCB2b2lkIHNl
dF9kZnVfYWx0X2luZm8oY2hhciAqaW50ZXJmYWNlLCBjaGFyICpkZXZzdHIpCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCAvKiBwcm9iZSBhbGwgTVREIGRldmljZXMgKi8KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIG10ZF9wcm9iZV9kZXZpY2VzKCk7Cj4+IMKgIC3CoMKgwqDCoMKgwqDCoCAvKiBwcm9iZSBT
UEkgZmxhc2ggZGV2aWNlIG9uIGEgYnVzICovCj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoIXVjbGFz
c19nZXRfZGV2aWNlKFVDTEFTU19TUElfRkxBU0gsIDAsICZkZXYpKSB7Cj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG10ZCA9IGdldF9tdGRfZGV2aWNlX25tKCJub3IwIik7Cj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICghSVNfRVJSX09SX05VTEwobXRkKSkKPj4gK8KgwqDCoMKgwqDC
oMKgIG10ZF9mb3JfZWFjaF9kZXZpY2UobXRkKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoIW10ZF9pc19wYXJ0aXRpb24obXRkKSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBib2FyZF9nZXRfYWx0X2luZm9fbXRkKG10ZCwgYnVmKTsKPj4gLQo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtdGQgPSBnZXRfbXRkX2RldmljZV9ubSgibm9yMSIpOwo+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIUlTX0VSUl9PUl9OVUxMKG10ZCkpCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9hcmRfZ2V0X2FsdF9pbmZvX210ZChtdGQsIGJ1Zik7
Cj4+IC3CoMKgwqDCoMKgwqDCoCB9Cj4+IC0KPj4gLcKgwqDCoMKgwqDCoMKgIG10ZCA9IGdldF9t
dGRfZGV2aWNlX25tKCJuYW5kMCIpOwo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCFJU19FUlJfT1Jf
TlVMTChtdGQpKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib2FyZF9nZXRfYWx0X2luZm9f
bXRkKG10ZCwgYnVmKTsKPj4gLQo+PiAtwqDCoMKgwqDCoMKgwqAgbXRkID0gZ2V0X210ZF9kZXZp
Y2Vfbm0oInNwaS1uYW5kMCIpOwo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCFJU19FUlJfT1JfTlVM
TChtdGQpKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib2FyZF9nZXRfYWx0X2luZm9fbXRk
KG10ZCwgYnVmKTsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIMKgwqDCoMKgwqAgaWYgKElTX0VOQUJM
RUQoQ09ORklHX0RGVV9WSVJUKSkgewo+IAo+IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERl
bGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBhdHJp
Y2sKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbmV4dAoKVGhhbmtzClBhdHJpY2UKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFp
bGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3Rt
MzIK
