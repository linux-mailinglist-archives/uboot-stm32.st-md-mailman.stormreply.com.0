Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E858AAE8D
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:34:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CADBEC6DD9A;
	Fri, 19 Apr 2024 12:34:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F20BDC6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:34:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43JACAjC030287; Fri, 19 Apr 2024 14:34:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=rmwMjaOFjwQ/vpl1nmqGFIKW9BnSQAeTR5larCs56ak=; b=Jn
 6Le0THiOeihRnzgTO2FMix1i5qsDfPtwf/Brd9i24o0vQoPD3DNiZqARKZKQttj2
 ZAAMPDIsSyRhVw2vDENt/8UcDlr8IZzav0Nckbod7bMmSBC+MPQAZ1oVHtiBkMEm
 oJyGUuU4Zsft59ZLkrF0OKUJ93N4WwsfSV5ItZZmGbaja/cr4aYIjdaJj3Cw4D3w
 dKgzgvT8/HgD0gnzusGFdB/L9dv+rEEoMf9xLdbY6ENKMaU5v5VTkCvF92MTcRkc
 UVc1I8KVbW5348n+d9aw43l2xNpjxYs9lp6wXSWA/PkxVf3QEcyBNaqiI3zUppQ2
 d494u2yrDPyv2lxkRLXw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xff64uvkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:34:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E05E24002D;
 Fri, 19 Apr 2024 14:34:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36CC021ADC0;
 Fri, 19 Apr 2024 14:33:51 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:33:50 +0200
Message-ID: <d588152f-15ad-4ed3-93ae-14cf8597ae2f@foss.st.com>
Date: Fri, 19 Apr 2024 14:33:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240308135009.2621719-1-patrice.chotard@foss.st.com>
 <20240308135009.2621719-3-patrice.chotard@foss.st.com>
 <9577dc11-5018-4b12-913c-27d00ce92dee@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <9577dc11-5018-4b12-913c-27d00ce92dee@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, u-boot@dh-electronics.com,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32: Fix partition node
 name for stm32mp15xx-dhcom-u-boot
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

CgpPbiA0LzE3LzI0IDExOjAwLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDMvOC8yNCAxNDo1MCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBGaXggZmxhc2hAMCBwYXJ0
aXRpb24gbm9kZSBuYW1lIHdpdGggY29ycmVjdCBvZmZzZXQuCj4+Cj4+IEZpeGVzOiA5MGY5OTJl
NmE1OGMgKCJhcm06IGR0czogc3RtMzI6IEFkZCBwYXJ0aXRpb25zIGluIGZsYXNoMCBhbmQgbmFu
ZAo+PiBub2RlIGZvciBzdG0zMm1wMTV4eC1kaGNvbS9kaGNvciIpCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0K
Pj4KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29tLXUtYm9vdC5kdHNpIHwgNiAr
KystLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvbS11LWJv
b3QuZHRzaSBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTV4eC1kaGNvbS11LWJvb3QuZHRzaQo+PiBp
bmRleCAyZjcwYjA2OTBkMi4uMWI0NDU2MTkzMjUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2R0
cy9zdG0zMm1wMTV4eC1kaGNvbS11LWJvb3QuZHRzaQo+PiArKysgYi9hcmNoL2FybS9kdHMvc3Rt
MzJtcDE1eHgtZGhjb20tdS1ib290LmR0c2kKPj4gQEAgLTEwNiwxNSArMTA2LDE1IEBACj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhYmVsID0gImZzYmwyIjsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MDAwNDAwMDAgMHgwMDA0MDAwMD47Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCB9Owo+PiAtwqDCoMKgwqDCoMKgwqAgcGFydGl0aW9uQDUwMDAwMCB7Cj4+ICvC
oMKgwqDCoMKgwqDCoCBwYXJ0aXRpb25AODAwMDAgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBsYWJlbCA9ICJ1Ym9vdCI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9
IDwweDAwMDgwMDAwIDB4MDAxNjAwMDA+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gLcKg
wqDCoMKgwqDCoMKgIHBhcnRpdGlvbkA5MDAwMDAgewo+PiArwqDCoMKgwqDCoMKgwqAgcGFydGl0
aW9uQDFlMDAwMCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhYmVsID0gImVudjEi
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwMDFFMDAwMCAweDAwMDEw
MDAwPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+IC3CoMKgwqDCoMKgwqDCoCBwYXJ0aXRp
b25AOTgwMDAwIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHBhcnRpdGlvbkAxZjAwMDAgewo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsYWJlbCA9ICJlbnYyIjsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmVnID0gPDB4MDAxRjAwMDAgMHgwMDAxMDAwMD47Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCB9Owo+IAo+IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRy
aWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBhdHJpY2sKPiAKCkFwcGxp
ZWQgb24gdS1ib290LXN0bTMyL21hc3RlciAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
