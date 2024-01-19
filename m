Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC8C832BA2
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jan 2024 15:50:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7296C6DD73;
	Fri, 19 Jan 2024 14:50:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDC93C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 14:50:14 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40JDZa1j028640; Fri, 19 Jan 2024 15:50:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=oiCTDR5NjZt3M37SDqZelyP+cjxXkHjSjojP+oIAv/c=; b=3w
 uMJaQtU44wfsQgqI59B4Q6NpTKEBmAjSXbvqni9Lj90a7hiqELy22TI7gvsk7FQT
 c3PHndzB+Ha0aWXMC95nHzY0ZEyflrAv6iIN9wRxOROUk+zobw8FxLvaDjh2ZwG4
 geKga1C/bQE8+Jn/TttMR7VCTmyCkDiw0TnCj9tF401kW2KA4tDj4mVyplxn7+YD
 5v9tdaP83h4HhCXsLq0bDNPXF6DsIAtGQ/V8zxrjwWYNLPCRVvDkZxE3KfQKmwyl
 E0TFQ1juHMtfwtzoJHjFgi6d9QdxYjbbVDZxfvxPuckT/0ZrcJF2+dTlUMNPDC4J
 iHeLA22EyxjZHF0D+ftw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmfyxpdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jan 2024 15:50:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83683100081;
 Fri, 19 Jan 2024 15:50:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78F3825E53B;
 Fri, 19 Jan 2024 15:50:12 +0100 (CET)
Received: from [10.252.4.250] (10.252.4.250) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Jan
 2024 15:50:12 +0100
Message-ID: <ee90da1b-0b59-47a7-9aa7-6dd1f0231f29@foss.st.com>
Date: Fri, 19 Jan 2024 15:50:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240109140018.2015396-1-patrice.chotard@foss.st.com>
 <ea333297-abc4-4807-bd52-506b44703aa8@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ea333297-abc4-4807-bd52-506b44703aa8@foss.st.com>
X-Originating-IP: [10.252.4.250]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp2: Fix CONFIG_STM32MP25X flag usage
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

CgpPbiAxLzE5LzI0IDE1OjQ1LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpCj4gCj4gT24g
MS85LzI0IDE1OjAwLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+ICIjaWYiIHdhcyB1c2VkIGlu
c3RlYWQgb2YgIiNpZmRlZiIKPj4KPj4gRml4ZXM6IDAxYTcwMTk5NGIwNSAoInN0bTMybXAyOiBp
bml0aWFsIHN1cHBvcnQiKQo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGFyY2gvYXJtL21hY2gtc3Rt
MzJtcC9pbmNsdWRlL21hY2gvc3RtMzIuaCB8IDIgKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9t
YWNoLXN0bTMybXAvaW5jbHVkZS9tYWNoL3N0bTMyLmggYi9hcmNoL2FybS9tYWNoLXN0bTMybXAv
aW5jbHVkZS9tYWNoL3N0bTMyLmgKPj4gaW5kZXggNDZkNDY5ODgxYjMuLjE3NWYyYTg4NDkwIDEw
MDY0NAo+PiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvaW5jbHVkZS9tYWNoL3N0bTMyLmgK
Pj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2luY2x1ZGUvbWFjaC9zdG0zMi5oCj4+IEBA
IC0xNTcsNyArMTU3LDcgQEAgZW51bSBmb3JjZWRfYm9vdF9tb2RlIHsKPj4gwqAgI2VuZGlmIC8q
IF9fQVNTRU1CTFlfXyAqLwo+PiDCoCAjZW5kaWYgLyogQ09ORklHX1NUTTMyTVAxNVggfHwgQ09O
RklHX1NUTTMyTVAxM1ggKi8KPj4gwqAgLSNpZiBDT05GSUdfU1RNMzJNUDI1WAo+PiArI2lmZGVm
IENPTkZJR19TVE0zMk1QMjVYCj4+IMKgICNkZWZpbmUgU1RNMzJfUkNDX0JBU0XCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDB4NDQyMDAwMDAKPj4gwqAgI2RlZmluZSBTVE0zMl9UQU1QX0JBU0XCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDB4NDYwMTAwMDAKPj4gwqAgCj4gCj4gCj4gUmV2aWV3ZWQtYnk6
IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhh
bmtzCj4gUGF0cmljawo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9tYXN0ZXIKClRoYW5rcwpQ
YXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
