Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CCDA13380
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Jan 2025 08:01:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8CE5C78F70;
	Thu, 16 Jan 2025 07:01:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B02FAC78F6E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 07:01:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FJknFE008409;
 Thu, 16 Jan 2025 08:01:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 iId8J6+V4r89/XZmfa+aFRz6ZShH7Lwzcl/YTmCqMiY=; b=YozBpGubZRgUkNyk
 v4R5RaqB+FWwNQJXht6VNt1KZJzolYrIp9OWQxWrqWLNteB3HT0GThW5PfuG+W3G
 BXmXnYjdkRkI7Hv1l7LywpWl09grPjNUqAsd8zxMxDKMRnh5wLALQTebFYqzWRtb
 GM7OzmPrXsA2aCL6xoHextrRLGj5FZ64A3i606Z/WILNtgXg+24kw8PC6+h3wHKa
 HWNr5dBAoSFxeWBfWxy9Xj2pEPZuTjPJ3VBx7buMVRXgQOD7x3inbAqEH7caOK8+
 sIV1kE2b+u75YpsCwe3WNZMcZDIXvwuXmzgtTTl/XtDxdKuIVYW2lw5Isfnbufc6
 +JgmhQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 446kfg1k5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2025 08:01:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 352B640046;
 Thu, 16 Jan 2025 08:00:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9BDEC2839D7;
 Thu, 16 Jan 2025 07:59:37 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 16 Jan
 2025 07:59:37 +0100
Message-ID: <5885696e-f083-42ef-9828-a23bf4f52fb1@foss.st.com>
Date: Thu, 16 Jan 2025 07:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20250114144528.1612168-1-patrice.chotard@foss.st.com>
 <20250114144528.1612168-7-patrice.chotard@foss.st.com>
 <de9e66e1-ab5a-4d46-9ec9-b19627f4ea9b@denx.de>
 <cbb93a24-4b4e-4254-b031-39c1abfa67ba@foss.st.com>
 <21b58bc6-df13-4639-86e8-8f44c6439e5d@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <21b58bc6-df13-4639-86e8-8f44c6439e5d@denx.de>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_02,2025-01-15_02,2024-11-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Sjoerd Simons <sjoerd@collabora.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 06/10] dw3-generic: Add dependencies whith
 SYSCON and REGMAP
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

CgpPbiAxLzE1LzI1IDIwOjI5LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiAxLzE1LzI1IDExOjQz
IEFNLCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDEvMTQvMjUgMTU6NTQsIE1h
cmVrIFZhc3V0IHdyb3RlOgo+Pj4gT24gMS8xNC8yNSAzOjQ1IFBNLCBQYXRyaWNlIENob3RhcmQg
d3JvdGU6Cj4+Pj4gU2luY2UgYWRkaXRpb24gb2YgU1RpSDQwNyBzdXBwb3J0IGluIGR3YzMtZ2Vu
ZXJpYywgU1lTQ09OIGFuZCBSRUdNQVAKPj4+PiBzdXBwb3J0IGFyZSBuZWVkZWQuCj4+Pj4KPj4+
PiBBZGQgZGVwZW5kZW5jaWVzIHdpdGggU1BMX1JFR01BUCBhbmQgU1BMX1NZU0NPTiBmb3I6Cj4+
Pj4gcWNtNjQ5MCwgaW14OG1wX2V2aywgcGh5Y29yZS1pbXg4bXAsIGxpYnJlbTUsIHFjb20sCj4+
Pj4geGlsaW54X3ZlcnNhbF9uZXRfdmlydCwgYW1kX3ZlcnNhbDJfdmlydCwgeGlsaW54X3p5bnFt
cF9rcmlhCj4+Pj4geGlsaW54X3p5bnFtcF92aXJ0Lgo+Pj4+Cj4+Pj4gQWRkIGRlcGVuZGVuY2ll
cyB3aXRoIFNQTF9SRUdNQVAgYW5kIFNQTF9TWVNDT04gZm9yIGFtNTd4eF9oc19ldm1fdXNiLgo+
Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRA
Zm9zcy5zdC5jb20+Cj4+Pj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+Pj4+IC0t
LQo+Pj4+Cj4+Pj4gwqDCoCBkcml2ZXJzL3VzYi9kd2MzL0tjb25maWcgfCA0ICsrKysKPj4+PiDC
oMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9kd2MzL0tjb25maWcgYi9kcml2ZXJzL3VzYi9kd2MzL0tjb25maWcKPj4+
PiBpbmRleCAwMTAwNzIzYTY4Yi4uZWY4MmEzZTk2MjYgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVy
cy91c2IvZHdjMy9LY29uZmlnCj4+Pj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnCj4+
Pj4gQEAgLTI2LDYgKzI2LDEwIEBAIGNvbmZpZyBVU0JfRFdDM19PTUFQCj4+Pj4gwqDCoCBjb25m
aWcgVVNCX0RXQzNfR0VORVJJQwo+Pj4+IMKgwqDCoMKgwqDCoCBib29sICJHZW5lcmljIGltcGxl
bWVudGF0aW9uIG9mIGEgRFdDMyB3cmFwcGVyIChha2EgZHdjMyBnbHVlKSIKPj4+PiDCoMKgwqDC
oMKgwqAgZGVwZW5kcyBvbiBETV9VU0IgJiYgVVNCX0RXQzMgJiYgTUlTQwo+Pj4+ICvCoMKgwqAg
c2VsZWN0IFNQTF9SRUdNQVAgaWYgU1BMCj4+Pj4gK8KgwqDCoCBzZWxlY3QgU1BMX1NZU0NPTiBp
ZiBTUEwKPj4+PiArwqDCoMKgIHNlbGVjdCBSRUdNQVAKPj4+PiArwqDCoMKgIHNlbGVjdCBTWVND
T04KPj4+IFdoeSB3YXMgdGhpcyBub3QgbmVlZGVkIHNvIGZhciA/IE9yIGlzIHRoaXMgYSBidWdm
aXggPwo+Pgo+PiBNeSBjb21tZW50IGxhY2tzIG9mIGRldGFpbC4KPj4gQnkgYWRkaW5nIHN0aWg0
MDcgc3VwcG9ydCwgaSBhbSB1c2luZyBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKCkg
d2hpY2gKPj4gbmVlZCB0aGF0IFJFR01BUCBhbmQgU1lTQ09uIHN1cHBvcnQgYXJlIGVuYWJsZWQu
Cj4gSSBzdXNwZWN0IHRoaXMgd2lsbCBub3cgYmUgc3BlY2lmaWMgdG8gdGhlIHN0aWggZ2x1ZSBk
cml2ZXIgLCByaWdodD8KClJpZ2h0IGl0J3Mgc3BlY2lmaWMgdG8gU1RpIGdsdWUgZHJpdmVyLiBC
dXQgYXMgaSBzYWlkIGluIG15IHJlcGx5IG9mIHBhdGNoIDA0LzEwLCAKdGhlIHJld29yayBvZiBw
YXRjaCAwNC8xMCB3aWxsIHJlbW92ZSB0aGUgbmVlZCBvZiBwYXRjaCAwNi8xMC4KClRoYW5rcwpQ
YXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
