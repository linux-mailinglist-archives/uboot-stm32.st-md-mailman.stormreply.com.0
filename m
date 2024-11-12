Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1F99C5A19
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2024 15:19:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8CEDC78F86;
	Tue, 12 Nov 2024 14:19:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4516BC5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 14:19:19 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACD676f008150;
 Tue, 12 Nov 2024 15:19:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 NSLkuKVwxuXT/8oeC1ZmgSbpAlfSk/CcFqcGDOKmacg=; b=NsQ/zEnD3O3223Gs
 RNl7udTVQg/LJA7uNtaUPJNBjV424xwKxGsloxvOu67ZHO2ETTAr3rTv0K+FYzN2
 CSscFeY3DnoZISMiIBgbUtr9LXO2fWL6trgpqFrcx16v/ilZWjqbPMVlHFDM6CNL
 /2rWAmNwMm6iJ20haGSMdREYA3ZXEsqWhBVfYrHogEKlzKFY3U3uqp1YEGNecJKn
 k3NkXsHCJUeJ5fXDFnTHTSKLeMWv3m0uUolyGoTVA1eNb90BBbKL9DXaNg3jcDEP
 r4ipwu5+aPU0HfM45Sz/sNGK5ThxLHJmSCE8R4dKsds5xFhyMQGMqJYfZHuqbYQ+
 GrqpfQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42tj642gcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2024 15:19:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3CC584005A;
 Tue, 12 Nov 2024 15:17:38 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 42C532A1E9A;
 Tue, 12 Nov 2024 15:15:10 +0100 (CET)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 12 Nov
 2024 15:15:09 +0100
Message-ID: <0ca4f01b-d743-4634-9031-4ea490dee67f@foss.st.com>
Date: Tue, 12 Nov 2024 15:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241021193522.195834-1-marex@denx.de>
 <67aeed9c-73f5-462b-becd-7bb370a022d0@foss.st.com>
Content-Language: en-US
In-Reply-To: <67aeed9c-73f5-462b-becd-7bb370a022d0@foss.st.com>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Drop remnants of
 upstream DT switch on DH STM32 DHSOM
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

Ck9uIDExLzEyLzI0IDEyOjI5LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+Cj4gT24g
MTAvMjEvMjQgMjE6MzQsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBSZW1vdmUgdW51c2VkIGxvY2Fs
IERUIGNvcGllcyBhZnRlciB0aGUgT0ZfVVBTVFJFQU0gY29udmVyc2lvbi4KPj4KPj4gRml4ZXM6
IGNjY2IyOWZjMTI3MCAoIkFSTTogZHRzOiBzdG0zMjogU3dpdGNoIHRvIHVzaW5nIHVwc3RyZWFt
IERUIG9uIAo+PiBESCBTVE0zMiBESFNPTSIpCj4+IFJlcG9ydGVkLWJ5OiBQYXRyaWNrIERlbGF1
bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJl
ayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4gLS0tCj4+IENjOiBQYXRyaWNlIENob3RhcmQgPHBh
dHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJp
Y2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IENjOiBUb20gUmluaSA8dHJpbmlAa29uc3Vsa28u
Y29tPgo+PiBDYzogdS1ib290QGRoLWVsZWN0cm9uaWNzLmNvbQo+PiBDYzogdS1ib290QGxpc3Rz
LmRlbnguZGUKPj4gQ2M6IHVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
Pj4gLS0tCj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTN4eC1kaGNvci1zb20uZHRzacKgwqDC
oMKgwqDCoCB8IDMwOCAtLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgLi4uL2FybS9kdHMvc3RtMzJt
cDE1M2MtZGhjb3ItZHJjLWNvbXBhY3QuZHRzIHzCoCAzMCAtLQo+PiDCoCBhcmNoL2FybS9kdHMv
c3RtMzJtcDE1N2EtZGhjb3ItYXZlbmdlcjk2LmR0c8KgIHzCoCAzOCAtLS0KPj4gwqAgMyBmaWxl
cyBjaGFuZ2VkLCAzNzYgZGVsZXRpb25zKC0pCj4+IMKgIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybS9kdHMvc3RtMzJtcDEzeHgtZGhjb3Itc29tLmR0c2kKPj4gwqAgZGVsZXRlIG1vZGUgMTAw
NjQ0IGFyY2gvYXJtL2R0cy9zdG0zMm1wMTUzYy1kaGNvci1kcmMtY29tcGFjdC5kdHMKPj4gwqAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3YS1kaGNvci1hdmVuZ2Vy
OTYuZHRzCj4+Cj4KPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxh
dW5heUBmb3NzLnN0LmNvbT4KPgo+IFRoYW5rcwo+IFBhdHJpY2sKPgo+CkFwcGxpZWQgdG8gdS1i
b290LXN0bS9tYXN0ZXIsIHRoYW5rcyEKClJlZ2FyZHMKUGF0cmljawoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0
ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
