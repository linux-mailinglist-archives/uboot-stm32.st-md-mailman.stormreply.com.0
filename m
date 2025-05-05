Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF578AA9495
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 May 2025 15:31:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 619DFC78F63;
	Mon,  5 May 2025 13:31:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7243C78F62
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 13:31:01 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545B3Itx025904;
 Mon, 5 May 2025 15:30:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 1NuI3+dnIC0odN7Fmh/oPgsIP3b5c1GPYh6jvuLfVyc=; b=xWuWr+snhM7dspId
 037QVts56EsXZjiz8Yk5f5lHwFGhAJ+isVyyynB+0xb5PT2GGVhJfaHYdnsL8g7k
 m5lnZChn94zjLVEZs/xx6vknBjul/bw8gRxIE2q7V+nP7YXSkkGMV6O4rDIH5B5b
 g1DvFlHxFK3cYHHD53w3EClZI+vUfe3cVUFGwtk0K2aA0g+6r+QCC6YJYnyKDQGm
 YBYNIqb6NoG7PisMpymMm14LYP9AAwe/MqugYYZ7bt1OrMYK8ImTLOBxbr2H2kXC
 eeh30w7bWgnYUC90gWv9ivdq9N6CE1uf51oiRGlJBSGUSwPL+V/i7MIkohKx6z9R
 aOpdlQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dvq3vuwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 15:30:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2014D4002D;
 Mon,  5 May 2025 15:29:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4B26ABE7B5;
 Mon,  5 May 2025 15:28:57 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 15:28:57 +0200
Message-ID: <f345a3e0-7e14-41c7-9bfc-ac6aa042959a@foss.st.com>
Date: Mon, 5 May 2025 15:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 <u-boot@lists.denx.de>
References: <20250407170529.893307-1-vincent.stehle@arm.com>
 <20250407170529.893307-3-vincent.stehle@arm.com>
 <0e7b0b06-d100-4db5-aa84-9eb9767f4e0d@foss.st.com>
Content-Language: en-US
In-Reply-To: <0e7b0b06-d100-4db5-aa84-9eb9767f4e0d@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
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

CgpPbiA0LzIyLzI1IDA5OjMyLCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4gCj4gCj4gT24gNC83
LzI1IDE5OjA1LCBWaW5jZW50IFN0ZWhsw6kgd3JvdGU6Cj4+IFRoZSBzZXRfZGZ1X2FsdF9pbmZv
KCkgZnVuY3Rpb24gY2FsbHMgdGhlIEFMTE9DX0NBQ0hFX0FMSUdOX0JVRkZFUigpCj4+IG1hY3Jv
IHRvIGRlY2xhcmUgYSBgYnVmJyB2YXJpYWJsZSBwb2ludGVyIGludG8gYW4gYXJyYXkgYWxsb2Nh
dGVkIG9uIHRoZQo+PiBzdGFjay4gSXQgdGhlbiBjYWxscyB0aGUgbWVtc2V0KCkgZnVuY3Rpb24g
dG8gY2xlYXIgdGhlIHVzZWFibGUgcG9ydGlvbgo+PiBvZiB0aGUgYXJyYXkgdXNpbmcgdGhlIGlk
aW9tYXRpYyBleHByZXNzaW9uIGBzaXplb2YoYnVmKScuCj4+Cj4+IFdoaWxlIHRoaXMgd291bGQg
aW5kZWVkIHdvcmsgZmluZSBmb3IgYW4gYXJyYXksIGluIHRoZSBwcmVzZW50IGNhc2Ugd2UKPj4g
ZW5kIHVwIGNsZWFyaW5nIG9ubHkgdGhlIHNpemUgb2YgYSBwb2ludGVyLgo+PiBGaXggdGhpcyBi
eSBzcGVjaWZ5aW5nIHRoZSBleHBsaWNpdCBzaXplIGBERlVfQUxUX0JVRl9MRU4nIGluc3RlYWQu
Cj4+Cj4+IEZpeGVzOiBlYzI5MzNlNTQzZGYgKCJib2FyZDogc3RtMzJtcDE6IG1vdmUgc2V0X2Rm
dV9hbHRfaW5mbyBpbiBzdCBjb21tb24gZGlyZWN0b3J5IikKPj4gU2lnbmVkLW9mZi1ieTogVmlu
Y2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+PiBDYzogUGF0cmljayBEZWxh
dW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4gQ2M6IFBhdHJpY2UgQ2hvdGFy
ZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiBDYzogVG9tIFJpbmkgPHRyaW5pQGtv
bnN1bGtvLmNvbT4KPj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+PiAtLS0KPj4g
IGJvYXJkL3N0L2NvbW1vbi9zdG0zMm1wX2RmdS5jIHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9ib2FyZC9z
dC9jb21tb24vc3RtMzJtcF9kZnUuYyBiL2JvYXJkL3N0L2NvbW1vbi9zdG0zMm1wX2RmdS5jCj4+
IGluZGV4IDFkYjhlNDU0ODBlLi44YzFmODBiNjc4YSAxMDA2NDQKPj4gLS0tIGEvYm9hcmQvc3Qv
Y29tbW9uL3N0bTMybXBfZGZ1LmMKPj4gKysrIGIvYm9hcmQvc3QvY29tbW9uL3N0bTMybXBfZGZ1
LmMKPj4gQEAgLTEwNSw3ICsxMDUsNyBAQCB2b2lkIHNldF9kZnVfYWx0X2luZm8oY2hhciAqaW50
ZXJmYWNlLCBjaGFyICpkZXZzdHIpCj4+ICAJaWYgKGVudl9nZXQoImRmdV9hbHRfaW5mbyIpKQo+
PiAgCQlyZXR1cm47Cj4+ICAKPj4gLQltZW1zZXQoYnVmLCAwLCBzaXplb2YoYnVmKSk7Cj4+ICsJ
bWVtc2V0KGJ1ZiwgMCwgREZVX0FMVF9CVUZfTEVOKTsKPj4gIAo+PiAgCXNucHJpbnRmKGJ1Ziwg
REZVX0FMVF9CVUZfTEVOLAo+PiAgCQkgInJhbSAwPSVzIiwgQ09ORklHX0RGVV9BTFRfUkFNMCk7
Cj4gCj4gSGkgVmluY2VudCwKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRy
aWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCkFwcGxpZWQgdG8gdS1ib290LXN0
bTMyL21hc3RlcgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
