Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5385588CBB
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Aug 2022 15:12:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 271A4C640F8;
	Wed,  3 Aug 2022 13:12:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3926C640F1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Aug 2022 13:12:09 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27394Kw3006751;
 Wed, 3 Aug 2022 15:11:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=o3uuwrO+tJMk4kUAmfeIT4MOgOjhbX5YGFNjJy264iw=;
 b=GWXIGSud4dxegXwpdbTmLxofIz7rC4J5aMysYrobjqlfcyq1yRPRxbeOHzJuH40yjfsz
 hHxseHyGB/RcQriI8i1SWaCn52HGSMjfHIGmKFjR5sDiWMEoqTvJTw+QtibiZ1zjwf8y
 5lOAawLoHetTXnJkL5oQGlDNh+3n6ZjEXJ8XOGatqOQlEaCN9/HF1HPnIoMa0RaSXFDi
 9oV9gqZGVr+VxTFiOBKdDM6brhH8407OPldqIfAmEPqCW0ZOhGwmKI8SMmtrhdPK/6dh
 tDf1Uo1gI5V73KxL5b3oxQqGOfJfM5GeO/HBnYuYggV3K+aRhL9ERjSXl9wgm+0UEhi7 Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hmt2kmf09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Aug 2022 15:11:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94B5510002A;
 Wed,  3 Aug 2022 15:11:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D3B3621ED52;
 Wed,  3 Aug 2022 15:11:50 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 3 Aug
 2022 15:11:50 +0200
Message-ID: <1037cc80-4e74-2ef7-5e35-367006f0c112@foss.st.com>
Date: Wed, 3 Aug 2022 15:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20220802090910.277343-1-patrice.chotard@foss.st.com>
 <b6f6e2af-741b-6de6-8b14-c69b8d4d333d@gmx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <b6f6e2af-741b-6de6-8b14-c69b8d4d333d@gmx.de>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_03,2022-08-02_01,2022-06-22_01
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Simon Glass <sjg@chromium.org>, Eddie James <eajames@linux.ibm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 0/3] gpio: update gpio_get_status()
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

SGkgSGVpbnJpY2gKCk9uIDgvMi8yMiAxNjo1NiwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToK
PiBPbiA4LzIvMjIgMTE6MDksIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4KPj4gQ3VycmVudGx5
LCBpZiBwaW4ncyBmdW5jdGlvbiBpcyBHUElPRl9GVU5DLCBvbmx5ICJmdW5jIiBpZiBkaXNwbGF5
ZWQKPj4gd2l0aG91dCBhbnkgb3RoZXIgaW5mb3JtYXRpb24uIEl0IHdvdWxkIGJlIGludGVyZXN0
aW5nLCBpZiBpbmZvcm1hdGlvbiBpcwo+PiBhdmFpbGFibGUsIHRvIGluZGljYXRlIHdoaWNoIHBp
bm11eGluZydzIG5hbWUgaXMgdXNlZC4KPiAKPiBNYXliZSB5b3UgY2FuIGFkZCBvbiB0b3Agb2Yg
bXkgZ3BpbyBtYW4tcGFnZSBwYXRjaCBhIGRlc2NyaXB0aW9uIG9mIHRoZQo+IG91dHB1dCBmaWVs
ZHMgb2YgZ3BpbyBzdGF0dXMuCj4gCj4gW1BBVENIIDEvMV0gZG9jOiBtYW4tcGFnZSBmb3IgZ3Bp
byBjb21tYW5kCj4gaHR0cHM6Ly9saXN0cy5kZW54LmRlL3BpcGVybWFpbC91LWJvb3QvMjAyMi1B
dWd1c3QvNDkwNjY2Lmh0bWwKClllcyBmb3Igc3VyZSwgdGhhbmtzIGZvciB0aGUgbGluawoKUGF0
cmljZQoKPiAKPiBCZXN0IHJlZ2FyZHMKPiAKPiBIZWlucmljaAo+IAo+Pgo+Pgo+PiBQYXRyaWNl
IENob3RhcmQgKDMpOgo+PiDCoMKgIGdwaW86IEFsbG93IHRvIHByaW50IHBpbidzIGxhYmVsIGV2
ZW4gZm9yIHBpbiB3aXRoIEdQSU9GX0ZVTkMgZnVuY3Rpb24KPj4gwqDCoCBncGlvOiBGaXggcGlu
J3Mgc3RhdHVzIGRpc3BsYXkgZm9yIHBpbiB3aXRoIEdQSU9GX1VOVVNFRCBmdW5jdGlvbgo+PiDC
oMKgIHBpbmN0cmw6IHBpbmN0cmxfc3RtMzI6IFBvcHVsYXRlIHVjX3ByaXYtPm5hbWVbXSB3aXRo
IHBpbm11eCBub2RlJ3MKPj4gwqDCoMKgwqAgbmFtZQo+Pgo+PiDCoCBkcml2ZXJzL2dwaW8vZ3Bp
by11Y2xhc3MuY8KgwqDCoMKgwqAgfCAxOCArKysrKysrKysrKystLS0tLS0KPj4gwqAgZHJpdmVy
cy9waW5jdHJsL3BpbmN0cmxfc3RtMzIuYyB8wqAgOCArKysrKystLQo+PiDCoCAyIGZpbGVzIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4+Cj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcg
bGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
