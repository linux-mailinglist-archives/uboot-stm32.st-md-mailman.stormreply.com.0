Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7D252E619
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 09:21:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 629A0C03FEB;
	Fri, 20 May 2022 07:21:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F087C03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 07:21:55 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JN8u5b012162;
 Fri, 20 May 2022 09:21:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=gHOdC8LDex0i8d7BQnHmPq/u4pCdx8HfGoPCmgGOy7w=;
 b=MTQpIlUhaplLuAk0tVtoyrMOscghoCP2HRa5ef/keyT3WQAACNQON7tH5kH8lsIQTZG3
 qh9rmbNTXvLsiplioQP/h9FuxqF8yNxWyF908xw2BBLX1/b9y13f/aq5kmoSKlRoi9Il
 F8ANOiIe0n4+6AhPf9whE4+hkPmP8wMhtjuJq6VS4Tc+95cTkz5MO0nUq9UK7GwuMGce
 yE0BBNC5nUZbvweuFJ/Ipe0hSz/QrqVl7zzOTYwi6sZ6/6HTCR0JoYSGqik54hnSVpd3
 1sONbjY2MhI6ZnOIGxel8vFitHYE29i5nFbx0HfPuAtd+jTI0s/wQPvV1MVDWr1Xx0Ew Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21umau4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:21:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9BDD100034;
 Fri, 20 May 2022 09:21:53 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9E73D212319;
 Fri, 20 May 2022 09:21:53 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.48) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 09:21:50 +0200
Message-ID: <4c1cb309-fae1-ec69-031f-c57fbc46a3f7@foss.st.com>
Date: Fri, 20 May 2022 09:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220512071738.741406-1-patrice.chotard@foss.st.com>
 <20220512071738.741406-2-patrice.chotard@foss.st.com>
 <134edda6-ac32-4ee2-d5a7-97aa906fb53e@foss.st.com>
In-Reply-To: <134edda6-ac32-4ee2-d5a7-97aa906fb53e@foss.st.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/2] spi: stm32_qspi: Always check
 SR_TCF flags in stm32_qspi_wait_cmd()
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

SGksCgpPbiA1LzE3LzIyIDEwOjIzLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpIFBhdHJp
Y2UsCj4KPiBPbiA1LzEyLzIyIDA5OjE3LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEN1cnJl
bnRseSwgU1JfVENGIGZsYWcgaXMgY2hlY2tlZCBpbiBjYXNlIHRoZXJlIGlzIGRhdGEsIHRoaXMg
Y3JpdGVyaWEKPj4gaXMgbm90IGNvcnJlY3QuCj4+Cj4+IFNSX1RDRiBmbGFncyBpcyBzZXQgd2hl
biBwcm9ncmFtbWVkIG51bWJlciBvZiBieXRlcyBoYXZlIGJlZW4gCj4+IHRyYW5zZmVycmVkCj4+
IHRvIHRoZSBtZW1vcnkgZGV2aWNlICgiYnl0ZXMiIGNvbXByaXNlZCBjb21tYW5kIGFuZCBkYXRh
IHNlbmQgdG8gdGhlCj4+IFNQSSBkZXZpY2UpLgo+PiBTbyBldmVuIGlmIHRoZXJlIGlzIG5vIGRh
dGEsIHdlIG11c3QgY2hlY2sgU1JfVENGIGZsYWcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJp
Y2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAg
ZHJpdmVycy9zcGkvc3RtMzJfcXNwaS5jIHwgMjMgKysrKysrKysrKystLS0tLS0tLS0tLS0KPj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3RtMzJfcXNwaS5jIGIvZHJpdmVycy9zcGkvc3Rt
MzJfcXNwaS5jCj4+IGluZGV4IDhmNGFhYmMzZDEuLjNjOGZhZWNiNTQgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvc3BpL3N0bTMyX3FzcGkuYwo+PiArKysgYi9kcml2ZXJzL3NwaS9zdG0zMl9xc3Bp
LmMKPj4gQEAgLTE1MCwyMCArMTUwLDE5IEBAIHN0YXRpYyBpbnQgX3N0bTMyX3FzcGlfd2FpdF9j
bWQoc3RydWN0IAo+PiBzdG0zMl9xc3BpX3ByaXYgKnByaXYsCj4+IMKgwqDCoMKgwqAgdTMyIHNy
Owo+PiDCoMKgwqDCoMKgIGludCByZXQgPSAwOwo+PiDCoCAtwqDCoMKgIGlmIChvcC0+ZGF0YS5u
Ynl0ZXMpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IHJlYWRsX3BvbGxfdGltZW91dCgmcHJp
di0+cmVncy0+c3IsIHNyLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzciAmIFNUTTMyX1FTUElfU1JfVENGLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBTVE0zMl9RU1BJX0NNRF9USU1FT1VUX1VTKTsKPj4gLcKgwqDCoMKg
wqDCoMKgIGlmIChyZXQpIHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9nX2VycigiY21k
IHRpbWVvdXQgKHN0YXQ6JSN4KVxuIiwgc3IpOwo+PiAtwqDCoMKgwqDCoMKgwqAgfSBlbHNlIGlm
IChyZWFkbCgmcHJpdi0+cmVncy0+c3IpICYgU1RNMzJfUVNQSV9TUl9URUYpIHsKPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbG9nX2VycigidHJhbnNmZXIgZXJyb3IgKHN0YXQ6JSN4KVxuIiwg
c3IpOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRUlPOwo+PiAtwqDCoMKgwqDC
oMKgwqAgfQo+PiAtwqDCoMKgwqDCoMKgwqAgLyogY2xlYXIgZmxhZ3MgKi8KPj4gLcKgwqDCoMKg
wqDCoMKgIHdyaXRlbChTVE0zMl9RU1BJX0ZDUl9DVENGIHwgU1RNMzJfUVNQSV9GQ1JfQ1RFRiwg
Cj4+ICZwcml2LT5yZWdzLT5mY3IpOwo+PiArwqDCoMKgIHJldCA9IHJlYWRsX3BvbGxfdGltZW91
dCgmcHJpdi0+cmVncy0+c3IsIHNyLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3IgJiBTVE0zMl9RU1BJX1NSX1RDRiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFNUTTMyX1FTUElfQ01EX1RJTUVPVVRfVVMpOwo+PiArwqDCoMKgIGlmIChyZXQpIHsK
Pj4gK8KgwqDCoMKgwqDCoMKgIGxvZ19lcnIoImNtZCB0aW1lb3V0IChzdGF0OiUjeClcbiIsIHNy
KTsKPj4gK8KgwqDCoCB9IGVsc2UgaWYgKHJlYWRsKCZwcml2LT5yZWdzLT5zcikgJiBTVE0zMl9R
U1BJX1NSX1RFRikgewo+PiArwqDCoMKgwqDCoMKgwqAgbG9nX2VycigidHJhbnNmZXIgZXJyb3Ig
KHN0YXQ6JSN4KVxuIiwgc3IpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVJTzsKPj4gwqDC
oMKgwqDCoCB9Cj4+IMKgICvCoMKgwqAgLyogY2xlYXIgZmxhZ3MgKi8KPj4gK8KgwqDCoCB3cml0
ZWwoU1RNMzJfUVNQSV9GQ1JfQ1RDRiB8IFNUTTMyX1FTUElfRkNSX0NURUYsIAo+PiAmcHJpdi0+
cmVncy0+ZmNyKTsKPj4gKwo+PiDCoMKgwqDCoMKgIGlmICghcmV0KQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0ID0gX3N0bTMyX3FzcGlfd2FpdF9mb3Jfbm90X2J1c3kocHJpdik7Cj4KPgo+IFJl
dmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29t
Pgo+Cj4gVGhhbmtzCj4gUGF0cmljawo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKPiBVYm9vdC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4gaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIKCgoKQXBwbGllZCB0byB1
LWJvb3Qtc3RtL21hc3RlciwgdGhhbmtzIQoKUmVnYXJkcwpQYXRyaWNrCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxp
c3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
