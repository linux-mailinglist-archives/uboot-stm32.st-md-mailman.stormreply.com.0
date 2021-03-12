Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB6B338C89
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:19:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCA6AC57196;
	Fri, 12 Mar 2021 12:19:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2954FC57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:19:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CC75rZ031009; Fri, 12 Mar 2021 13:19:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=AGSri9Xf0nonextqb0u2pWqD/OGmtHyqErXC9Sf1Qns=;
 b=7gFjhovKWroCQ3v523K1xw4M59DbdM8oBW7zs/cQEvUvB0yCt6xxNoDcs0d5mPt9cV7G
 lz9aVs58QuEnWIV5SOk81i0OC9JKcZ8vt75CfcPDlQrLCv7+AusqLEQ/BMNQxHz6oKYp
 Huk9VuXNNhyAYoRQ3hAoxmUWgw/OqjIdWKg9lqxog3uNqdQLqkNt93adzBKFMyKeKxMz
 3216L1zytiqIFBnFrHusrEZHGpRbY++Zx2YNm0MX2rBxDA/G2lGnBXvfSMN3rtqF7+f6
 Jl6t3aNcF5ai1tFzXXzETWLs7KtWIMPGMy611ki5yHPn+i54qKk8aypi0M1g/FmBnUYa Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrf5s0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:19:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 29DE710002A;
 Fri, 12 Mar 2021 13:19:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2131123C781;
 Fri, 12 Mar 2021 13:19:01 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:19:00 +0100
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210120134205.30488-1-patrice.chotard@foss.st.com>
 <20210120134205.30488-4-patrice.chotard@foss.st.com>
 <45b1bd20-fc86-5a22-ca2c-c4e08731f871@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <25fe8ba0-c434-15e6-6ea8-96a1f5fde7a7@foss.st.com>
Date: Fri, 12 Mar 2021 13:19:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <45b1bd20-fc86-5a22-ca2c-c4e08731f871@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] mtd: nand: Add WATCHDOG_RESET() in
 nanddev_mtd_erase()
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

SGkKCk9uIDEvMjcvMjEgNDoxNSBQTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSBQYXRy
aWNlLAo+IAo+IE9uIDEvMjAvMjEgMjo0MiBQTSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBJ
biBjYXNlIG9mIGJpZyBhcmVhIGVyYXNlZCBvbiBuYW5kLCB3YXRjaGRvZyB0aW1lb3V0IG1heSBv
Y2N1cnMuCj4+IFRvIGZpeCB0aGF0LCBhZGQgV0FUQ0hET0dfUkVTRVQoKSBpbiBuYW5kZGV2X210
ZF9lcmFzZSgpIHRvIGVuc3VyZSB0aGF0Cj4+IHdhdGNoZG9nIGlzIHJlc2V0Lgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4K
Pj4gLS0tCj4+Cj4+IMKgIGRyaXZlcnMvbXRkL25hbmQvY29yZS5jIHwgMiArKwo+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvY29yZS5jCj4+IGluZGV4IDNhYmFlZjIz
YzUuLmVjMTFiZjQ0ZjggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvY29yZS5jCj4+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvY29yZS5jCj4+IEBAIC0xMCw2ICsxMCw3IEBACj4+IMKg
ICNkZWZpbmUgcHJfZm10KGZtdCnCoMKgwqAgIm5hbmQ6ICIgZm10Cj4+IMKgIMKgICNpbmNsdWRl
IDxjb21tb24uaD4KPj4gKyNpbmNsdWRlIDx3YXRjaGRvZy5oPgo+PiDCoCAjaWZuZGVmIF9fVUJP
T1RfXwo+PiDCoCAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+IMKgICNlbmRpZgo+PiBAQCAt
MTYyLDYgKzE2Myw3IEBAIGludCBuYW5kZGV2X210ZF9lcmFzZShzdHJ1Y3QgbXRkX2luZm8gKm10
ZCwgc3RydWN0IGVyYXNlX2luZm8gKmVpbmZvKQo+PiDCoMKgwqDCoMKgIG5hbmRkZXZfb2Zmc190
b19wb3MobmFuZCwgZWluZm8tPmFkZHIsICZwb3MpOwo+PiDCoMKgwqDCoMKgIG5hbmRkZXZfb2Zm
c190b19wb3MobmFuZCwgZWluZm8tPmFkZHIgKyBlaW5mby0+bGVuIC0gMSwgJmxhc3QpOwo+PiDC
oMKgwqDCoMKgIHdoaWxlIChuYW5kZGV2X3Bvc19jbXAoJnBvcywgJmxhc3QpIDw9IDApIHsKPj4g
K8KgwqDCoMKgwqDCoMKgIFdBVENIRE9HX1JFU0VUKCk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXQgPSBuYW5kZGV2X2VyYXNlKG5hbmQsICZwb3MpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KHJldCkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlaW5mby0+ZmFpbF9hZGRyID0g
bmFuZGRldl9wb3NfdG9fb2ZmcyhuYW5kLCAmcG9zKTsKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0
cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MK
PiAKPiBQYXRyaWNrCj4gCkFwcGxpZWQgdG8gdS1ib290LXN0bS9uZXh0CgpUaGFua3MKClBhdHJp
Y2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
