Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD7F52E61B
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 09:22:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85A37C56630;
	Fri, 20 May 2022 07:22:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 359E1C5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 07:22:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K6Pm1e022160;
 Fri, 20 May 2022 09:22:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WOcjQWpCtEZeDJ9JoDjvSWy09F2FAH+3//IBjhiTW4s=;
 b=DjrJaMLaUdKPQf00XT7VWvCyvoMocPus5jdI9Q8vpEfZqanbeov4J5r5nyV1q13b0uqv
 AxhTdaSQu7jRa/ALOw3ffyG/5rYYpj3t50JChYl+HOCCEW6YFwRgFPtN8gS5s61Afjv1
 qf0UWrEroSeQCY4M5rICkfzjgXH0yUsakmsqcYi+uMinbnH3jx+kvFzx2nZOSNKZJY93
 tSJXtDtEUPklyvOFBk6KPNcgSIXZT+tD982rju5JQ+iTxfFw5iFxl9e5es7/APR0y0Zs
 ADI05fjhGXQ6v9RYH6FVlZ6ZFOMb9tB4q99tTUJEPyxFZSS17TfZ0gk9wfw+lDtHVWWT Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23aj6ehx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:22:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8226C10002A;
 Fri, 20 May 2022 09:22:24 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7BC752128DB;
 Fri, 20 May 2022 09:22:24 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.48) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 09:22:19 +0200
Message-ID: <fd6c6571-3c37-edd4-14f0-933dda857b4c@foss.st.com>
Date: Fri, 20 May 2022 09:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220512071738.741406-1-patrice.chotard@foss.st.com>
 <20220512071738.741406-3-patrice.chotard@foss.st.com>
 <45c9f2be-df7b-2caf-3142-21ea27c987ca@foss.st.com>
In-Reply-To: <45c9f2be-df7b-2caf-3142-21ea27c987ca@foss.st.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] spi: stm32_qspi: Remove SR_BUSY
 bit check before sending command
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

SGksCgpPbiA1LzE3LzIyIDEwOjI0LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpIFBhdHJp
Y2UKPgo+IE9uIDUvMTIvMjIgMDk6MTcsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gV2FpdGlu
ZyBmb3IgU1JfQlVTWSBiaXQgd2hlbiByZWNlaXZpbmcgYSBuZXcgY29tbWFuZCBpcyBub3QgbmVl
ZGVkLgo+PiBTUl9CVVNZIGJpdCBpcyBhbHJlYWR5IG1hbmFnZWQgaW4gdGhlIHByZXZpb3VzIGNv
bW1hbmQgdHJlYXRtZW50Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBh
dHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4KPj4gLS0tCj4+Cj4+IMKgIGRyaXZlcnMvc3Bp
L3N0bTMyX3FzcGkuYyB8IDQgLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3N0bTMyX3FzcGkuYyBiL2RyaXZlcnMv
c3BpL3N0bTMyX3FzcGkuYwo+PiBpbmRleCAzYzhmYWVjYjU0Li5jZWJhNDEzNzI3IDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL3NwaS9zdG0zMl9xc3BpLmMKPj4gKysrIGIvZHJpdmVycy9zcGkvc3Rt
MzJfcXNwaS5jCj4+IEBAIC0yNTUsMTAgKzI1NSw2IEBAIHN0YXRpYyBpbnQgc3RtMzJfcXNwaV9l
eGVjX29wKHN0cnVjdCBzcGlfc2xhdmUgCj4+ICpzbGF2ZSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IG9wLT5kdW1teS5idXN3aWR0aCwgb3AtPmRhdGEuYnVzd2lkdGgsCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBvcC0+YWRkci52YWwsIG9wLT5kYXRhLm5ieXRlcyk7Cj4+IMKgIC3CoMKgwqAgcmV0ID0g
X3N0bTMyX3FzcGlfd2FpdF9mb3Jfbm90X2J1c3kocHJpdik7Cj4+IC3CoMKgwqAgaWYgKHJldCkK
Pj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+IC0KPj4gwqDCoMKgwqDCoCBhZGRyX21h
eCA9IG9wLT5hZGRyLnZhbCArIG9wLT5kYXRhLm5ieXRlcyArIDE7Cj4+IMKgIMKgwqDCoMKgwqAg
aWYgKG9wLT5kYXRhLmRpciA9PSBTUElfTUVNX0RBVEFfSU4gJiYgb3AtPmRhdGEubmJ5dGVzKSB7
Cj4KPgo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZv
c3Muc3QuY29tPgo+Cj4gVGhhbmtzCj4gUGF0cmljawo+Cj4KCkFwcGxpZWQgdG8gdS1ib290LXN0
bS9tYXN0ZXIsIHRoYW5rcyEKClJlZ2FyZHMKUGF0cmljawoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
