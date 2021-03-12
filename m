Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1879D338C72
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:13:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD2C8C57196;
	Fri, 12 Mar 2021 12:13:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96A1DC57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:13:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CC79qM023436; Fri, 12 Mar 2021 13:13:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=gccvn2arkIT1jFH+2agdLNPbX49vMKoht4NkqYuYhrU=;
 b=MWeG+MUF7Pz+6INikflXoKiyCY3M060NNygAt9mSUWFmfWEesxRkyOOTvfxeXXjmH4Fy
 Cpi53ZxTiWIf47Va1ptawJFdy2hVrGEqOQOxCzE4KjVSiKNiLd9AzKB/Hufz2o+IJ8sZ
 X/v1eGsoef/UlwNAG5FOLPBRkyS5FjtzQTLuE0u2H4GwRSM8tIfcK6ASY8yKw3nblC9Q
 IeRMTBJ4RoJEdBqu8gYRV2g1rNg2bdbEMs92AMfdheqXOr3iA8ZyEZSrmVhZdGIT/oXv
 erbT5PjuLcxWak1oOUl1XzzYntqNZ65AQIBr0+/8Gb+shuAEOdK7FTzMb9/DsFe6NlDp 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 374037cxks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:13:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C01CA10002A;
 Fri, 12 Mar 2021 13:13:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B2D91234B83;
 Fri, 12 Mar 2021 13:13:12 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:13:11 +0100
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210224125327.21937-1-patrice.chotard@foss.st.com>
 <74458edd-be41-8f3f-b220-f81130274f35@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <a1f32a6a-bbc1-9cd1-ffa8-dab58f9bad69@foss.st.com>
Date: Fri, 12 Mar 2021 13:13:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <74458edd-be41-8f3f-b220-f81130274f35@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp: Fix compilation issue when
 SYS_DCACHE_OFF and/or SYS_DCACHE_SYS are enabled
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

SGkKCk9uIDMvMTIvMjEgMTA6NTIgQU0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGkgUGF0
cmljZSwKPiAKPiBPbiAyLzI0LzIxIDE6NTMgUE0sIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4g
RnJvbTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPgo+Pgo+PiBGaXgg
Zm9sbG93aW5nIGNvbXBpbGF0aW9uIGlzc3VlIHdoZW4gU1lTX0RDQUNIRV9PRkYgYW5kL29yIFNZ
U19EQ0FDSEVfU1lTCj4+IGFyZSBlbmFibGVkIDoKPj4KPj4gYXJjaC9hcm0vbWFjaC1zdG0zMm1w
L2NwdS5jOiBJbiBmdW5jdGlvbiDigJhlYXJseV9lbmFibGVfY2FjaGVz4oCZOgo+PiBhcmNoL2Fy
bS9tYWNoLXN0bTMybXAvY3B1LmM6MjIzOjEwOiBlcnJvcjog4oCYdm9sYXRpbGUgc3RydWN0IGFy
Y2hfZ2xvYmFsX2RhdGHigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJh0bGJfc2l6ZeKAmQo+PiDC
oMKgIDIyMyB8wqAgZ2QtPmFyY2gudGxiX3NpemUgPSBQR1RBQkxFX1NJWkU7Cj4+IMKgwqDCoMKg
wqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgIF4KPj4gYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NwdS5j
OjIyNDoxMDogZXJyb3I6IOKAmHZvbGF0aWxlIHN0cnVjdCBhcmNoX2dsb2JhbF9kYXRh4oCZIGhh
cyBubyBtZW1iZXIgbmFtZWQg4oCYdGxiX2FkZHLigJkKPj4gwqDCoCAyMjQgfMKgIGdkLT5hcmNo
LnRsYl9hZGRyID0gKHVuc2lnbmVkIGxvbmcpJmVhcmx5X3RsYjsKPj4gwqDCoMKgwqDCoMKgIHzC
oMKgwqDCoMKgwqDCoMKgwqAgXgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQg
PHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFy
ZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgYXJjaC9hcm0v
bWFjaC1zdG0zMm1wL2NwdS5jIHwgNiArKysrLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmlj
ayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQ
YXRyaWNrCgpBcHBsaWVkIHRvIHUtYm9vdC1zdG0vbmV4dAoKVGhhbmtzCgpQYXRyaWNlCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
