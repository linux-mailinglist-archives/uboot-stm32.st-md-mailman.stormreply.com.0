Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3602A95F89
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 09:34:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91404C78F68;
	Tue, 22 Apr 2025 07:34:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC153C78F62
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 07:34:09 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6uxGC025914;
 Tue, 22 Apr 2025 09:33:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Q6JnMBhdQ8eCM5gU1rctVgN5bEImPk63D7ScnGyAwco=; b=jDyPXzUTrXUc23rv
 TwY8HQ4MDPGjmq+7Wk/ePcDZ9bHTkEiW53edpe7jcy1oD1peJJhgYbNRTFJC0BNh
 uiMrYr8RQlcBM7kTMlJiG1Sz1T/xGI4l3xawHlaU6WdjFLmuUCsVKDnNPrSxo5uy
 81yN7/1aGnqluZ2S28m9zdAHiM+VpEf/wLH/JtH4Ub3G3HnNs3jkN7uAKgkNnayk
 lh/83kyN3T9a1wT68UkyxOqc4uhCamwXVwz3xpWnvG4QkUA54k1r78zPK/dy2Bqa
 bG+ELjWG1ihIk45yhois++PlDM8Y50dIG5wxvTlCASqEoPF7p846CVyKmVDYdaqz
 kC/ydQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4643628vg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 09:33:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DE12240049;
 Tue, 22 Apr 2025 09:32:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2FE889A7575;
 Tue, 22 Apr 2025 09:32:14 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 09:32:13 +0200
Message-ID: <0e7b0b06-d100-4db5-aa84-9eb9767f4e0d@foss.st.com>
Date: Tue, 22 Apr 2025 09:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 <u-boot@lists.denx.de>
References: <20250407170529.893307-1-vincent.stehle@arm.com>
 <20250407170529.893307-3-vincent.stehle@arm.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250407170529.893307-3-vincent.stehle@arm.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: Re: [Uboot-stm32] [PATCH 2/5] board: st: common: fix dfu alt buffer
	clearing
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

CgpPbiA0LzcvMjUgMTk6MDUsIFZpbmNlbnQgU3RlaGzDqSB3cm90ZToKPiBUaGUgc2V0X2RmdV9h
bHRfaW5mbygpIGZ1bmN0aW9uIGNhbGxzIHRoZSBBTExPQ19DQUNIRV9BTElHTl9CVUZGRVIoKQo+
IG1hY3JvIHRvIGRlY2xhcmUgYSBgYnVmJyB2YXJpYWJsZSBwb2ludGVyIGludG8gYW4gYXJyYXkg
YWxsb2NhdGVkIG9uIHRoZQo+IHN0YWNrLiBJdCB0aGVuIGNhbGxzIHRoZSBtZW1zZXQoKSBmdW5j
dGlvbiB0byBjbGVhciB0aGUgdXNlYWJsZSBwb3J0aW9uCj4gb2YgdGhlIGFycmF5IHVzaW5nIHRo
ZSBpZGlvbWF0aWMgZXhwcmVzc2lvbiBgc2l6ZW9mKGJ1ZiknLgo+IAo+IFdoaWxlIHRoaXMgd291
bGQgaW5kZWVkIHdvcmsgZmluZSBmb3IgYW4gYXJyYXksIGluIHRoZSBwcmVzZW50IGNhc2Ugd2UK
PiBlbmQgdXAgY2xlYXJpbmcgb25seSB0aGUgc2l6ZSBvZiBhIHBvaW50ZXIuCj4gRml4IHRoaXMg
Ynkgc3BlY2lmeWluZyB0aGUgZXhwbGljaXQgc2l6ZSBgREZVX0FMVF9CVUZfTEVOJyBpbnN0ZWFk
Lgo+IAo+IEZpeGVzOiBlYzI5MzNlNTQzZGYgKCJib2FyZDogc3RtMzJtcDE6IG1vdmUgc2V0X2Rm
dV9hbHRfaW5mbyBpbiBzdCBjb21tb24gZGlyZWN0b3J5IikKPiBTaWduZWQtb2ZmLWJ5OiBWaW5j
ZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gQ2M6IFBhdHJpY2sgRGVsYXVu
YXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8
cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IENjOiBUb20gUmluaSA8dHJpbmlAa29uc3Vs
a28uY29tPgo+IENjOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPiAtLS0KPiAgYm9hcmQv
c3QvY29tbW9uL3N0bTMybXBfZGZ1LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9ib2FyZC9zdC9jb21tb24v
c3RtMzJtcF9kZnUuYyBiL2JvYXJkL3N0L2NvbW1vbi9zdG0zMm1wX2RmdS5jCj4gaW5kZXggMWRi
OGU0NTQ4MGUuLjhjMWY4MGI2NzhhIDEwMDY0NAo+IC0tLSBhL2JvYXJkL3N0L2NvbW1vbi9zdG0z
Mm1wX2RmdS5jCj4gKysrIGIvYm9hcmQvc3QvY29tbW9uL3N0bTMybXBfZGZ1LmMKPiBAQCAtMTA1
LDcgKzEwNSw3IEBAIHZvaWQgc2V0X2RmdV9hbHRfaW5mbyhjaGFyICppbnRlcmZhY2UsIGNoYXIg
KmRldnN0cikKPiAgCWlmIChlbnZfZ2V0KCJkZnVfYWx0X2luZm8iKSkKPiAgCQlyZXR1cm47Cj4g
IAo+IC0JbWVtc2V0KGJ1ZiwgMCwgc2l6ZW9mKGJ1ZikpOwo+ICsJbWVtc2V0KGJ1ZiwgMCwgREZV
X0FMVF9CVUZfTEVOKTsKPiAgCj4gIAlzbnByaW50ZihidWYsIERGVV9BTFRfQlVGX0xFTiwKPiAg
CQkgInJhbSAwPSVzIiwgQ09ORklHX0RGVV9BTFRfUkFNMCk7CgpIaSBWaW5jZW50LAoKUmV2aWV3
ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgoKVGhh
bmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290
LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3Vib290LXN0bTMyCg==
