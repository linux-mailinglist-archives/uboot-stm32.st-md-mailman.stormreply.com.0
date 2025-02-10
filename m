Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D281A2E977
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2025 11:32:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAA74C78F88;
	Mon, 10 Feb 2025 10:32:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25D09C78F85
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 10:32:20 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9ekw3003703;
 Mon, 10 Feb 2025 11:32:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 H/plYcKfUN7OVXBsLbqMqWi84AgK0qu1wBDzevYXICE=; b=BFf6SSQoHwk/DzmD
 R2RFebhrD0fbfwojeZHyFYdMYwrCdyhs/MUGYmZJuPiDMK1zD4tXq/1s2KhNwTdd
 w3SQKFyhx1euTNnR3P2AjYKwQYONxWdSdXUKk9N/yUx/3VJao2D+IFhZjkNOdTzH
 dtZhBZcXYDNkmhJ5YaXuz+rHUfupMbbKlOzQ/ZUzAgiWJIaQO3x9vWgPYp6yZTLs
 RpvI/tN6+jk3HN1oQs1fMwdYSUDC9ajcWIu7yeG6wrQyrauvW0TDR9nwppFBhL8Y
 9seS3kzZHHiqJzsG16J+UqbHbQWBCVbVn4TLzWFu1pX6zJUcw7x4rGHTXb2DtO6+
 Usg+9g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44phq3m0up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2025 11:32:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DD7F440052;
 Mon, 10 Feb 2025 11:31:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E6162D1652;
 Mon, 10 Feb 2025 11:28:08 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 11:28:07 +0100
Message-ID: <c89e94bf-0ed6-4b3f-9f3b-eee9d30a91df@foss.st.com>
Date: Mon, 10 Feb 2025 11:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>, <u-boot@lists.denx.de>,
 Marek Vasut <marex@denx.de>
References: <20241202074644.5380-1-patrice.chotard@foss.st.com>
 <87zfldnlmw.fsf@baylibre.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <87zfldnlmw.fsf@baylibre.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] usb: gadget: f_mass_storage: Add
 schedule() in sleep_thread()
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

SGkgTWFyZWsKCkFueSBjaGFuY2UgdG8gZ2V0IHRoaXMgcGF0Y2ggbWVyZ2VkIGluIG5leHQgVS1C
b290IHRhZyAyMDI1LjA0LXJjMiA/CgpUaGFua3MKUGF0cmljZQoKT24gMTIvMy8yNCAxMDo0Nywg
TWF0dGlqcyBLb3JwZXJzaG9layB3cm90ZToKPiBIaSBQYXRyaWNlLAo+IAo+IFRoYW5rIHlvdSBm
b3IgdGhlIHBhdGNoLgo+IAo+IE9uIGx1bi4sIGTDqWMuIDAyLCAyMDI0IGF0IDA4OjQ2LCBQYXRy
aWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4gCj4+IElu
IGNhc2UgInVtcyIgY29tbWFuZCBpcyB1c2VkIG9uIHBsYXRmb3JtcyB3aGljaCBkb24ndCBpbXBs
ZW1lbnQKPj4gZ19kbmxfYm9hcmRfdXNiX2NhYmxlX2Nvbm5lY3RlZCgpIGFuZCBVU0IgY2FibGUg
aXMgbm90IGNvbm5lY3RlZCwKPj4gd2Ugc3RheSBpbnNpZGUgc2xlZXBfdGhyZWFkKCkgZm9yZXZl
ciBhbmQgd2F0Y2hkb2cgaXMgdHJpZ2dlcmVkLgo+Pgo+PiBBZGQgc2NoZWR1bGUoKSBjYWxsIHRv
IGF2b2lkIHRoaXMgaXNzdWUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8
cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBNYXR0aWpzIEtv
cnBlcnNob2VrIDxta29ycGVyc2hvZWtAYmF5bGlicmUuY29tPgo+IAo+Pgo+PiAtLS0KPj4KPj4g
Q2hhbmdlcyBpbiB2MjoKPj4gICAtIG1vdmUgc2NoZWR1bGUoKSByaWdodCBiZWZvcmUgZG1fdXNi
X2dhZGdldF9oYW5kbGVfaW50ZXJydXB0cygpCj4+Cj4+ICBkcml2ZXJzL3VzYi9nYWRnZXQvZl9t
YXNzX3N0b3JhZ2UuYyB8IDEgKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvZl9tYXNzX3N0b3JhZ2UuYyBiL2Ry
aXZlcnMvdXNiL2dhZGdldC9mX21hc3Nfc3RvcmFnZS5jCj4+IGluZGV4IGZmZTFhZTZlYjczLi5k
M2ZjNGFjYjQwMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L2ZfbWFzc19zdG9y
YWdlLmMKPj4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2ZfbWFzc19zdG9yYWdlLmMKPj4gQEAg
LTY4Miw2ICs2ODIsNyBAQCBzdGF0aWMgaW50IHNsZWVwX3RocmVhZChzdHJ1Y3QgZnNnX2NvbW1v
biAqY29tbW9uKQo+PiAgCQkJayA9IDA7Cj4+ICAJCX0KPj4gIAo+PiArCQlzY2hlZHVsZSgpOwo+
PiAgCQlkbV91c2JfZ2FkZ2V0X2hhbmRsZV9pbnRlcnJ1cHRzKHVkY2Rldik7Cj4+ICAJfQo+PiAg
CWNvbW1vbi0+dGhyZWFkX3dha2V1cF9uZWVkZWQgPSAwOwo+PiAtLSAKPj4gMi4yNS4xCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
