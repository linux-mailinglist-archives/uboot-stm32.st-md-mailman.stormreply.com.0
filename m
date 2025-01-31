Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B988A23A5A
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2025 08:59:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D77BEC78F6D;
	Fri, 31 Jan 2025 07:59:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98B85C78002
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 07:59:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V7ox6b029612;
 Fri, 31 Jan 2025 08:59:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 WBkgGQDCM5OuxuBnDLjVSPkKFFSrAW8lPe56tvYwIOM=; b=1VsGQpOaegDIWGSI
 TF/ZgLWfkwfddbnkSwbirrJ9dVfT9EYSeE709uuY8pjV6Gy1nqPcUT9uwMdTkMwk
 gteWLYNV3nJPgcHWYHPmVpVhxYG5dHSUo0FgmgmzmWiSAAAKtsucEfTBEe0vz5qq
 AMeIYY3IB+5nDcLh7WF7XGfowBsBUeYl59cpy+WVoFgzv9Ii3U2dpHrI5BCi7Top
 m3OpsMEBO44vxwOgdjJ9egUKCxcIuKJbyE/t8DRKD2xKlMUYs6cnbSewGD5YcZmR
 22dLbqU0KiqW5hZGMxQt0nFxzYJQ5dYrNk9Dzuh4MAkfy0GPdDoT3c0fXxFeuszr
 6x6URA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44gf7e1r13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 08:59:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A2ABD4005A;
 Fri, 31 Jan 2025 08:58:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0DC192A8750;
 Fri, 31 Jan 2025 08:56:53 +0100 (CET)
Received: from [10.252.27.7] (10.252.27.7) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 31 Jan
 2025 08:56:52 +0100
Message-ID: <7c4266ba-2ea4-44f8-bb52-d1d763d3def6@foss.st.com>
Date: Fri, 31 Jan 2025 08:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241129122711.411917-1-patrice.chotard@foss.st.com>
 <20241129122711.411917-4-patrice.chotard@foss.st.com>
 <aede5c04-b1bd-42da-93e4-8c2cc7a5a9a1@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <aede5c04-b1bd-42da-93e4-8c2cc7a5a9a1@foss.st.com>
X-Originating-IP: [10.252.27.7]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_03,2025-01-30_01,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 3/6] arm: stm32mp: stm32prog: update
 multiplier is part-size is above SZ_1G
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

CgpPbiAxLzgvMjUgMTk6NDksIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGkKPiAKPiBPbiAx
MS8yOS8yNCAxMzoyNywgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBTZXQgbXVsdGlwbGllciB0
byAnRycgaWYgcGFydC0+c2l6ZSBpZiBhYm92ZSBTWl8xRy4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
UGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+
PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvY21kX3N0bTMycHJvZy9zdG0zMnByb2cuYyB8IDUg
KysrKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMnByb2cv
c3RtMzJwcm9nLmMgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvY21kX3N0bTMycHJvZy9zdG0zMnBy
b2cuYwo+PiBpbmRleCBmMGUwMTllOGRhMS4uMzUzYWVjYzA5ZGUgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvYXJtL21hY2gtc3RtMzJtcC9jbWRfc3RtMzJwcm9nL3N0bTMycHJvZy5jCj4+ICsrKyBiL2Fy
Y2gvYXJtL21hY2gtc3RtMzJtcC9jbWRfc3RtMzJwcm9nL3N0bTMycHJvZy5jCj4+IEBAIC0xMjI5
LDcgKzEyMjksMTAgQEAgc3RhdGljIGludCBzdG0zMnByb2dfYWx0X2FkZChzdHJ1Y3Qgc3RtMzJw
cm9nX2RhdGEgKmRhdGEsCj4+IMKgwqDCoMKgwqAgY2hhciBtdWx0aXBsaWVyLMKgIHR5cGU7Cj4+
IMKgIMKgwqDCoMKgwqAgLyogbWF4IDMgZGlnaXQgZm9yIHNlY3RvciBzaXplICovCj4+IC3CoMKg
wqAgaWYgKHBhcnQtPnNpemUgPiBTWl8xTSkgewo+PiArwqDCoMKgIGlmIChwYXJ0LT5zaXplID4g
U1pfMUcpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHNpemUgPSAodTMyKShwYXJ0LT5zaXplIC8gU1pf
MUcpOwo+PiArwqDCoMKgwqDCoMKgwqAgbXVsdGlwbGllciA9ICdHJzsKPj4gK8KgwqDCoCB9IGVs
c2UgaWYgKHBhcnQtPnNpemUgPiBTWl8xTSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZSA9
ICh1MzIpKHBhcnQtPnNpemUgLyBTWl8xTSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBtdWx0aXBs
aWVyID0gJ00nOwo+PiDCoMKgwqDCoMKgIH0gZWxzZSBpZiAocGFydC0+c2l6ZSA+IFNaXzFLKSB7
Cj4gCj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVu
YXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IApBcHBsaWVkIHRvIHUtYm9v
dC1zdG0zMi9tYXN0ZXIKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
