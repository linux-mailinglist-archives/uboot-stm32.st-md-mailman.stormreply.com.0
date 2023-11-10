Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A435D7E7C84
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Nov 2023 14:23:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B6FDC6C83F;
	Fri, 10 Nov 2023 13:23:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF3D7C6C83F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 13:23:55 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AABdBrC006188; Fri, 10 Nov 2023 14:23:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=5uhme6BvYSilLlKpwn+XNWeoPB4HLWE9/Q5kSbsbAzY=; b=LE
 RFJOkZl3bkG/q+K0EnK7aZ82S5a2NduXIwhcHc1SltTqJBNoG6U6e3NWYmIB+3FH
 HVi9ycfpvgxA+SAu9eiiswOLyGM1L/pgfISHSI6yysL31rESxYia0PNxVZBgL+7u
 LIwbh8wVEeriZ+m4L000g0maZjit1Uw9APA/BiMlb/s8il5jy+KpnodC8kaELNb7
 XACEY5tNZu3LNhadMyIvYN/fPFvZSu9Z5Pqm8LDAGrgOe8Plnl4dIkf3iY8TqO7j
 2qZvZw7ZXET6ABfFzX5DU8ZYjE8c2dzILMAiArj6ZNJWAcJXAqTI1Qe7Ia1G+PHk
 xKq5YFyYYujsKHVtwegA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u9fmn9x8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 14:23:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 92D9210005E;
 Fri, 10 Nov 2023 14:23:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B00824C443;
 Fri, 10 Nov 2023 14:23:46 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 10 Nov
 2023 14:23:46 +0100
Message-ID: <43bd0525-5c04-4fb8-b02a-727f45d6f27e@foss.st.com>
Date: Fri, 10 Nov 2023 14:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
 <20231027144304.1002307-9-patrice.chotard@foss.st.com>
 <3f645d34-476e-49a1-9e3a-95e5142d6c32@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <3f645d34-476e-49a1-9e3a-95e5142d6c32@foss.st.com>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_10,2023-11-09_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 8/9] ARM: dts: stm32: Add STM32MP257F
 Evaluation board support
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

CgpPbiAxMS85LzIzIDEwOjE3LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDEwLzI3LzIzIDE2OjQzLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEFkZCBTVE0zMk1QMjU3
RiBFdmFsdWF0aW9uIGJvYXJkIHN1cHBvcnQuIEl0IGVtYmVkcyBhIFNUTTMyTVAyNTdGQUkgU29D
LAo+PiB3aXRoIDRHQiBvZiBERFI0LCBUU04gc3dpdGNoICgyKzEgcG9ydHMpLCAyKlVTQiB0eXBl
QSwgMSpVU0IyIHR5cGVDLAo+PiBTTk9SIE9jdG9TUEksIG1pbmkgUENJZSwgU1RQTUlDMiBmb3Ig
cG93ZXIgZGlzdHJpYnV0aW9uIC4uLgo+Pgo+PiBTeW5jIGRldmljZSB0cmVlIHdpdGgga2VybmVs
IHY2LjYtcmMxLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2Uu
Y2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGFyY2gvYXJtL2R0cy9NYWtlZmls
ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgKwo+
PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDI1LXBpbmN0cmwuZHRzacKgwqDCoMKgwqDCoMKgwqAg
fMKgIDM4ICsrKwo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDI1LXUtYm9vdC5kdHNpwqDCoMKg
wqDCoMKgwqDCoMKgIHwgMTAyICsrKysrKysKPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAyNTEu
ZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDI4NSArKysrKysrKysrKysrKysr
KysrKwo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDI1My5kdHNpwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAyMyArKwo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDI1NS5kdHNp
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDkgKwo+PiDCoCBhcmNoL2FybS9k
dHMvc3RtMzJtcDI1Ny5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDkg
Kwo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDI1N2YtZXYxLXUtYm9vdC5kdHNpwqDCoMKgIHzC
oCAyMCArKwo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDI1N2YtZXYxLmR0c8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDU1ICsrKysKPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAyNXhjLmR0
c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDggKwo+PiDCoCBhcmNoL2FybS9k
dHMvc3RtMzJtcDI1eGYuZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOCAr
Cj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMjV4eGFpLXBpbmN0cmwuZHRzacKgwqDCoMKgIHzC
oCA4MyArKysrKysKPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAyNXh4YWstcGluY3RybC5kdHNp
wqDCoMKgwqAgfMKgIDcxICsrKysrCj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMjV4eGFsLXBp
bmN0cmwuZHRzacKgwqDCoMKgIHzCoCA3MSArKysrKwo+PiDCoCBpbmNsdWRlL2R0LWJpbmRpbmdz
L3BpbmN0cmwvc3RtMzItcGluZnVuYy5oIHzCoMKgIDMgKwo+PiDCoCAxNSBmaWxlcyBjaGFuZ2Vk
LCA3ODggaW5zZXJ0aW9ucygrKQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vZHRz
L3N0bTMybXAyNS1waW5jdHJsLmR0c2kKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJt
L2R0cy9zdG0zMm1wMjUtdS1ib290LmR0c2kKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
YXJtL2R0cy9zdG0zMm1wMjUxLmR0c2kKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJt
L2R0cy9zdG0zMm1wMjUzLmR0c2kKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0
cy9zdG0zMm1wMjU1LmR0c2kKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0cy9z
dG0zMm1wMjU3LmR0c2kKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0cy9zdG0z
Mm1wMjU3Zi1ldjEtdS1ib290LmR0c2kKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJt
L2R0cy9zdG0zMm1wMjU3Zi1ldjEuZHRzCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2Fy
bS9kdHMvc3RtMzJtcDI1eGMuZHRzaQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0v
ZHRzL3N0bTMybXAyNXhmLmR0c2kKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0
cy9zdG0zMm1wMjV4eGFpLXBpbmN0cmwuZHRzaQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9hcm0vZHRzL3N0bTMybXAyNXh4YWstcGluY3RybC5kdHNpCj4+IMKgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBhcmNoL2FybS9kdHMvc3RtMzJtcDI1eHhhbC1waW5jdHJsLmR0c2kKPj4KPiAKPiBSZXZp
ZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4K
PiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCkFwcGxpZWQgdG8gdS1ib290LXN0bTMyL25leHQKClRo
YW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==
