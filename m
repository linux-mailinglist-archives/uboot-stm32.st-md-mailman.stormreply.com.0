Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F372908788
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2024 11:34:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00DD2C6C83A;
	Fri, 14 Jun 2024 09:34:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6869C5E2CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:33:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E7uqHt014919;
 Fri, 14 Jun 2024 11:33:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Rxn50EVHSTMPLDkZzQ0R08E+8Wuw78OUmsqWkaRQVNw=; b=jJJFltBxApob9WML
 NWgB/B4Ao0jHMbSaShw7af8pGGVloColN0iU7oUZNV7epVRtaH4IIa9KTydpaOEH
 IoCkasGVrAzLbMG6183Pgj38Mpoyn5N9o9w0h+W6QzVi3B79AsPDk12SAx+Cj9C+
 YEZRBiRcfLAqDnqfgLW5EXEEtIHI0X9eNgIT3FijCdBHbRCJO2nRmQwbJoxHq17H
 KZFfpfSi2ao4+PgNIlKDz9KIa+B6pgjRG+13H0xDzPK5RKrK0NUoqdnSsJTqnAcM
 Nyzvf3jysRtVGG6YxBA07DRM0tciFab2OjuVRLRg7YEazYl8KUXpcgQ6WvSEzbQh
 scvQFg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp502rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 11:33:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CE39640045;
 Fri, 14 Jun 2024 11:33:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E215C2115E8;
 Fri, 14 Jun 2024 11:33:34 +0200 (CEST)
Received: from [10.252.18.60] (10.252.18.60) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 14 Jun
 2024 11:33:34 +0200
Message-ID: <d7b11fc6-41af-4056-a506-73546464eb80@foss.st.com>
Date: Fri, 14 Jun 2024 11:33:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240611095239.16026-1-patrice.chotard@foss.st.com>
 <20240611095239.16026-2-patrice.chotard@foss.st.com>
 <53f4d52c-0b87-4bae-91f4-9529321cc549@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <53f4d52c-0b87-4bae-91f4-9529321cc549@foss.st.com>
X-Originating-IP: [10.252.18.60]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] stm32mp1: spl: Update
 optee_get_reserved_memory() return value
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

CgpPbiA2LzE0LzI0IDA5OjU5LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpIFBhdHJpY2UK
PiAKPiBPbiA2LzExLzI0IDExOjUyLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEluIGNhc2Ug
bm9kZSAiL3Jlc2VydmVkLW1lbW9yeS9vcHRlZSIgaXMgbm90IGZvdW5kLCByZXR1cm4gLUVOT0VO
VAo+PiBpbnN0ZWFkIG9mIDAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8
cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgYXJjaC9hcm0vbWFj
aC1zdG0zMm1wL3N0bTMybXAxL3NwbC5jIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21h
Y2gtc3RtMzJtcC9zdG0zMm1wMS9zcGwuYyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1w
MS9zcGwuYwo+PiBpbmRleCAxMGFiYmVkODdmMC4uYmVkYTY5ZjMzNTkgMTAwNjQ0Cj4+IC0tLSBh
L2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9zcGwuYwo+PiArKysgYi9hcmNoL2FybS9t
YWNoLXN0bTMybXAvc3RtMzJtcDEvc3BsLmMKPj4gQEAgLTExOCw3ICsxMTgsNyBAQCBzdGF0aWMg
aW50IG9wdGVlX2dldF9yZXNlcnZlZF9tZW1vcnkodWludDMyX3QgKnN0YXJ0LCB1aW50MzJfdCAq
c2l6ZSkKPj4gwqAgwqDCoMKgwqDCoCBub2RlID0gb2Zub2RlX3BhdGgoIi9yZXNlcnZlZC1tZW1v
cnkvb3B0ZWUiKTsKPj4gwqDCoMKgwqDCoCBpZiAoIW9mbm9kZV92YWxpZChub2RlKSkKPj4gLcKg
wqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9FTlQ7
Cj4+IMKgIMKgwqDCoMKgwqAgZmR0X3N0YXJ0ID0gb2Zub2RlX2dldF9hZGRyX3NpemUobm9kZSwg
InJlZyIsICZmZHRfbWVtX3NpemUpOwo+PiDCoMKgwqDCoMKgICpzdGFydCA9IGZkdF9zdGFydDsK
PiAKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5h
eUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCj4gCj4gCkFwcGxpZWQgdG8g
dS1ib290LXN0bTMyL21hc3RlcgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
