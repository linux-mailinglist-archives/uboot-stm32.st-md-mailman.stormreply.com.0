Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BC8338C85
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:18:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 712B6C57196;
	Fri, 12 Mar 2021 12:18:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76E0BC57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:18:17 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CC7A0G023581; Fri, 12 Mar 2021 13:18:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=E6zZRcEAn6FMpWF36fvLlTtIx5Tkl6b2GfhKNSGgYfc=;
 b=OVj496VYVYIOHSuZDFJslszqNTEfLDN9TdLr0VoqjtlL6KEhrTw3RT2s5luwgb84uTH6
 565ic8HXOwFiewQ7+NV1TFp0tFvlCqvlcNa5TsTYFzwgKjob3H14dj4YsWhxK11L9VIp
 fIXxYMJD4QLeexFXJd+nVRUBqMmoSuywT8jpBwhD+sxykgsPPddTtvIr++dUfn5l1cbd
 Z/JU+0HIyAqXIsXrqB14cOqwH1PW99UPOcIeolpgItRwQbVuwNt54rwrkd4Ttfl4zVgn
 c+UaTBUTATF8R9ivm+pNizmranunPgojidXVEoI0xZ1ZUhEPa1WwEmusYu4dPBU1CpV/ 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 374037cybe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:18:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2920110002A;
 Fri, 12 Mar 2021 13:18:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0558223C77F;
 Fri, 12 Mar 2021 13:18:15 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:18:14 +0100
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210120134205.30488-1-patrice.chotard@foss.st.com>
 <20210120134205.30488-2-patrice.chotard@foss.st.com>
 <98b9466b-eeb4-2060-6b9d-8992c3ec3e39@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <bd2b1382-8a8b-1f1d-7c0c-0e747fada91c@foss.st.com>
Date: Fri, 12 Mar 2021 13:18:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <98b9466b-eeb4-2060-6b9d-8992c3ec3e39@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vignesh R <vigneshr@ti.com>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] mtd: spi-nor: Add WATCHDOG_RESET() in
 spi_nor_core callbacks
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

SGkKCk9uIDEvMjcvMjEgNDoxNCBQTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSBQYXRy
aWNlLAo+IAo+IE9uIDEvMjAvMjEgMjo0MiBQTSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBJ
biBjYXNlIG9mIGJpZyBhcmVhIHdyaXRlL2VyYXNlIG9uIHNwaSBub3IsIHdhdGNoZG9nIHRpbWVv
dXQgbWF5IG9jY3Vycy4KPj4gSXNzdWUgcmVwcm9kdWNlZCBvbiBzdG0zMm1wMTU3Yy1ldjEgd2l0
aCBmb2xsb3dpbmcgY29tbWFuZHM6Cj4+Cj4+IHNmIHdyaXRlIDB4QzAwMDAwMDAgMCAweDMwMDAw
MDAKPj4gb3IKPj4gc2YgZXJhc2UgMCAweDEwMDAwMDAKPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0
cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDC
oCBkcml2ZXJzL210ZC9zcGkvc3BpLW5vci1jb3JlLmMgfCAzICsrKwo+PiDCoCAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGkv
c3BpLW5vci1jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGkvc3BpLW5vci1jb3JlLmMKPj4gaW5kZXgg
ZWI0OWE2YzExYy4uNTFlMDYxM2Q0YyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpL3Nw
aS1ub3ItY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS9zcGktbm9yLWNvcmUuYwo+PiBA
QCAtMTAsNiArMTAsNyBAQAo+PiDCoMKgICovCj4+IMKgIMKgICNpbmNsdWRlIDxjb21tb24uaD4K
Pj4gKyNpbmNsdWRlIDx3YXRjaGRvZy5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4+
IMKgICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgvbG9nMi5o
Pgo+PiBAQCAtNTU3LDYgKzU1OCw3IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9lcmFzZShzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwgc3RydWN0IGVyYXNlX2luZm8gKmluc3RyKQo+PiDCoMKgwqDCoMKgIGxl
biA9IGluc3RyLT5sZW47Cj4+IMKgIMKgwqDCoMKgwqAgd2hpbGUgKGxlbikgewo+PiArwqDCoMKg
wqDCoMKgwqAgV0FUQ0hET0dfUkVTRVQoKTsKPj4gwqAgI2lmZGVmIENPTkZJR19TUElfRkxBU0hf
QkFSCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSB3cml0ZV9iYXIobm9yLCBhZGRyKTsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+PiBAQCAtMTIzNSw2ICsxMjM3LDcgQEAg
c3RhdGljIGludCBzcGlfbm9yX3dyaXRlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgdG8s
IHNpemVfdCBsZW4sCj4+IMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IGxlbjsgKSB7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBzc2l6ZV90IHdyaXR0ZW47Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBs
b2ZmX3QgYWRkciA9IHRvICsgaTsKPj4gK8KgwqDCoMKgwqDCoMKgIFdBVENIRE9HX1JFU0VUKCk7
Cj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIElm
IHBhZ2Vfc2l6ZSBpcyBhIHBvd2VyIG9mIHR3bywgdGhlIG9mZnNldCBjYW4gYmUgcXVpY2tseQo+
IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZv
c3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IAo+IFBhdHJpY2sKPiAKPiAKCkFwcGxpZWQgdG8gdS1i
b290LXN0bS9uZXh0CgpUaGFua3MKClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
