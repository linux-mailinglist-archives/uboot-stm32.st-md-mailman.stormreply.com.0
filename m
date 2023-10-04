Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED237B7E52
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Oct 2023 13:39:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11E93C6C831;
	Wed,  4 Oct 2023 11:39:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A3F8C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 11:39:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3947jGOG008905; Wed, 4 Oct 2023 13:39:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=hReQH4uPiBXRHJk0qvYx9bup7q0NtewxgDJbZYx0Wsc=; b=ts
 93CPXK+YTPVaycxb3gQMsISYk4WWRIyxwT3IYZP+NiY3TygyPpYWoFaIz1L1ojeq
 7E9HyxRqJ5KVgENj8pjZTEa6VMISB4JRPkBABxzq6LuWzemnWXSihS87OfENv8+m
 oMQyxJrfREvMtVaCbDBgI2wZlCZ50TUeFxapTku3L2jRxOiIMPByCy1m71IxIdvF
 BaBMM+S1cpOG05eJfq56R+kJ2i9Q1MznpqRYUKzN8/CFC/df7+fV4xO304dVNmsG
 urC2HLn/8p3T5FXXRNApS/GC4tdyyohFvxUJ4WheuY2lAep/A8ctTgmLDKu+KbkB
 VvUhOZWzTKZLdDXuLmuQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3te8t5113k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 13:39:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D0B0A100053;
 Wed,  4 Oct 2023 13:39:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C99ED21B533;
 Wed,  4 Oct 2023 13:39:23 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 13:39:23 +0200
Message-ID: <93a94efb-327e-5d24-ee0d-063fca6abf84@foss.st.com>
Date: Wed, 4 Oct 2023 13:39:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230926150924.1150082-1-patrice.chotard@foss.st.com>
 <20230926150924.1150082-3-patrice.chotard@foss.st.com>
 <e9fff0fc-27db-20f9-b2b5-1abee5ac739e@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <e9fff0fc-27db-20f9-b2b5-1abee5ac739e@foss.st.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_03,2023-10-02_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/6] ARM: dts: stm32: force
 b-session-valid for otg on stm32mp135f-dk board
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

CgpPbiAxMC80LzIzIDExOjU1LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDkvMjYvMjMgMTc6MDksIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gRnJvbTogRmFicmljZSBH
YXNuaWVyIDxmYWJyaWNlLmdhc25pZXJAZm9zcy5zdC5jb20+Cj4+Cj4+IHN0bTMybXAxMzVmLWRr
IGJvYXJkIGhhcyBhIHR5cGUtYyBjb25uZWN0b3IgdG8gcmV0cmlldmUgdGhlIGNvbm5lY3Rpb24K
Pj4gc3RhdGUuIEZvciBub3csIHNpbXBseSBmb3JjZSBhbiBhY3RpdmUgcGVyaXBoZXJhbCBtb2Rl
IGluIHUtYm9vdCBmb3IKPj4gZmxhc2hpbmcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2Ug
R2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBQ
YXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+
IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTM1Zi1kay11LWJvb3QuZHRzaSB8IDQgKysrKwo+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybS9kdHMvc3RtMzJtcDEzNWYtZGstdS1ib290LmR0c2kgYi9hcmNoL2FybS9kdHMvc3RtMzJt
cDEzNWYtZGstdS1ib290LmR0c2kKPj4gaW5kZXggNDg2MDVmZjhiYmUuLmJhMGMwMjQ4OWQxIDEw
MDY0NAo+PiAtLS0gYS9hcmNoL2FybS9kdHMvc3RtMzJtcDEzNWYtZGstdS1ib290LmR0c2kKPj4g
KysrIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxMzVmLWRrLXUtYm9vdC5kdHNpCj4+IEBAIC0zOCwz
ICszOCw3IEBACj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBib290cGgtYWxsOwo+PiDCoMKgwqDCoMKg
IH07Cj4+IMKgIH07Cj4+ICsKPj4gKyZ1c2JvdGdfaHMgewo+PiArwqDCoMKgIHUtYm9vdCxmb3Jj
ZS1iLXNlc3Npb24tdmFsaWQ7Cj4+ICt9Owo+IAo+IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNr
IERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBh
dHJpY2sKPiAKPiAKPiAKQXBwbHkgb24gc3RtMzIvbmV4dAoKVGhhbmtzClBhdHJpY2UKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFp
bGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3Rt
MzIK
