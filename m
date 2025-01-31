Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A8DA23A6D
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2025 09:08:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7382C78002;
	Fri, 31 Jan 2025 08:08:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 576C6C71292
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 08:08:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V80xfh004473;
 Fri, 31 Jan 2025 09:08:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 tzqB2D+gPWA1/DHDXKjsqKp7TJoarHmh+8pXKgMuqow=; b=E4B8hJbwSh+71CiR
 xrLbnUr52yp0+C5sN1h8iCmDT0ZMAAUJYpOlIasQbV8C+6y9xMjE9HwpKwVtum8N
 4eCmtRZ3cKF9aVt/PTPvWi/rBD1VuonEWGEshEkmUnDnJw4KLXZpPVcKPdv0G+GK
 Ue978DJX7H9zywPZkwDskDrfgnXzb3ll4J2h1/DYzlY6t7vpBB/2h+0GzdQh5ZPS
 otDyItEnyCYSZh+XewT1IT5RWApf1qhQuXPDZ/DlTdqoATgFdxWSwK+TXKe2q3Ap
 kFNsKbdgE7uCTfVtAmxEiiUgnAhSaPJ/5khxHbJ5kBCsXyCHcEoHLV4mVmQfNwOl
 powyEg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44gf7dsu02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 09:08:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 29D064002D;
 Fri, 31 Jan 2025 09:08:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 712222B2E3C;
 Fri, 31 Jan 2025 09:05:22 +0100 (CET)
Received: from [10.252.27.7] (10.252.27.7) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 31 Jan
 2025 09:05:21 +0100
Message-ID: <9d8f52df-01a6-4075-ab9b-e9e481783bb1@foss.st.com>
Date: Fri, 31 Jan 2025 09:05:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241129124857.443093-1-patrice.chotard@foss.st.com>
 <b4006420-b89c-488b-8148-5af4740f34bb@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <b4006420-b89c-488b-8148-5af4740f34bb@foss.st.com>
X-Originating-IP: [10.252.27.7]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_03,2025-01-30_01,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] board: st: stm32mp1: Clean
	env_get_location()
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

CgpPbiAxMi81LzI0IDEzOjQ4LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDExLzI5LzI0IDEzOjQ4LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEVOVl9JU19JTl9FWFQ0
IGZsYWcgaXMgbm8gbW9yZSB1c2VkIGluIGFueSBTVE0zMiBkZWZjb25maWcsCj4+IHJlbW92ZSB0
aGUgcmVsYXRlZCBjb2RlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBh
dHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGJvYXJkL3N0L3N0bTMy
bXAxL3N0bTMybXAxLmMgfCAyIC0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYm9hcmQvc3Qvc3RtMzJtcDEvc3RtMzJtcDEuYyBiL2JvYXJk
L3N0L3N0bTMybXAxL3N0bTMybXAxLmMKPj4gaW5kZXggZDVlNWU3NzZkMmEuLjE1ZmI5ZTRiMDYy
IDEwMDY0NAo+PiAtLS0gYS9ib2FyZC9zdC9zdG0zMm1wMS9zdG0zMm1wMS5jCj4+ICsrKyBiL2Jv
YXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmMKPj4gQEAgLTc1MSw4ICs3NTEsNiBAQCBlbnVtIGVu
dl9sb2NhdGlvbiBlbnZfZ2V0X2xvY2F0aW9uKGVudW0gZW52X29wZXJhdGlvbiBvcCwgaW50IHBy
aW8pCj4+IMKgwqDCoMKgwqAgY2FzZSBCT09UX0ZMQVNIX0VNTUM6Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoQ09ORklHX0lTX0VOQUJMRUQoRU5WX0lTX0lOX01NQykpCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiBFTlZMX01NQzsKPj4gLcKgwqDCoMKgwqDCoMKgIGVsc2Ug
aWYgKENPTkZJR19JU19FTkFCTEVEKEVOVl9JU19JTl9FWFQ0KSkKPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIEVOVkxfRVhUNDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVOVkxfTk9XSEVSRTsKPj4gwqAgCj4g
Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlA
Zm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IApBcHBsaWVkIHRvIHUtYm9vdC1z
dG0zMi9tYXN0ZXIKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
