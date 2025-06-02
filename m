Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8CCACAEE3
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Jun 2025 15:23:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC2BEC3F943;
	Mon,  2 Jun 2025 13:23:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 099B9C36B30
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Jun 2025 13:23:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552AAUIp025771;
 Mon, 2 Jun 2025 15:22:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 NFRzpONjkzxInKD6B71SZTPTAP9ulp7F6Zl0fnX7Mg4=; b=0sVSOrPfhKoTz837
 u0XOy9CimrInU43HPqcAnbkDJqc+t6RPMRBzF5iOGw0NJXiAbhSeK06VcSyx0rxl
 e+YfspcJSgQr2PlfvwnIJH+uCsmHZpTZ9NQ+yLHzFkyYxk2vGQ9DYNgauECJD49m
 tv49kbVwcaM4EJmxYYDZobqzZsWwvIiQOn3CAP7awqz3BkIxFbzSMy+Y/+QNSekX
 7cSJXXR2p3omrENru/BQdqADBpbWdhv47AN2Ft3TXse+mATP6kEkGdI6pdMz/tcG
 dc6YvaI8678I94CsfwYJBal7b8TD72/ypSrDGBLGl2e4jJkx1UyprwUvNH/MpLKk
 tiIdUQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46yrngxsmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Jun 2025 15:22:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AB4CE40058;
 Mon,  2 Jun 2025 15:21:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EEF8BB5FE4D;
 Mon,  2 Jun 2025 15:20:27 +0200 (CEST)
Received: from [10.48.86.182] (10.48.86.182) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 15:20:27 +0200
Message-ID: <59d147bd-7772-4d49-8236-e2be61930bb0@foss.st.com>
Date: Mon, 2 Jun 2025 15:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>
References: <20250523091140.149298-1-patrick.delaunay@foss.st.com>
 <20250530202740.GA4068177@bill-the-cat>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250530202740.GA4068177@bill-the-cat>
X-Originating-IP: [10.48.86.182]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_05,2025-06-02_01,2025-03-28_01
Cc: caleb.connolly@linaro.org, jerome.forissier@linaro.org,
 Casey Connolly <casey.connolly@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Adriano Cordova <adrianox@gmail.com>, Simon Glass <sjg@chromium.org>,
 ilias.apalodimas@linaro.org, u-boot@lists.denx.de,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 0/3] Restore support of short name for
 type UUID parameter
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGksCgpPbiA1LzMwLzI1IDIyOjI3LCBUb20gUmluaSB3cm90ZToKPiBPbiBGcmksIE1heSAyMywg
MjAyNSBhdCAxMToxMTozN0FNICswMjAwLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+Cj4+IEZp
eCBhbmQgYWRkIGRvY3VtZW50YXRpb24vdGVzdHMgZm9yIHNlbGVjdGlvbiBieSBzdHJpbmcgZm9y
IGtub3duCj4+IHBhcnRpdGlvbiB0eXBlIEdVSUQgaW50cm9kdWNlZCBieSBiY2I0MWRjYWVmYWMg
KCJ1dWlkOiBhZGQKPj4gc2VsZWN0aW9uIGJ5IHN0cmluZyBmb3Iga25vd24gcGFydGl0aW9uIHR5
cGUgR1VJRCIpOgo+Pgo+PiAtIHNwbGl0IGxpc3RfZ3VpZCBmb3Igc2hvcnQgbmFtZSAodXNlZCBh
bHNvIGZvciBwYXJ0aXRvbgo+PiAgICBkZXNjcmlwdGlvbiB3aXRoIHR5cGUgcGFyYW1ldGVyKSBh
bmQgZnVsbCBuYW1lIHRvIGRpc3BsYXkKPj4gICAgaW5mb3JtYXRpb24KPj4KPj4gLSBhcyB0aGUg
ZnVuY3Rpb24gYXJlIHV1aWRfc3RyX3RvX2JpbigpIC8gdXVpZF9ndWlkX2dldF9zdHIoKQo+PiAg
ICBhcmUgbm8gbW9yZSB1bmRlciBDT05GSUdfUEFSVElUSU9OX1RZUEVfR1VJRCwgIHNpbmNlIGNv
bW1pdAo+PiAgICAzMWNlMzY3Y2QxMDAgKCJsaWIvdXVpZC5jOiBjaGFuZ2UgcHJvdG90eXBlIG9m
IHV1aWRfZ3VpZF9nZXRfc3RyKCkiKQo+PiAgICBhbmQgY29tbWl0IGMxNTI4ZjMyNGM2MCAoImxp
YjogY29tcGlsZSB1dWlkX2d1aWRfZ2V0X3N0ciBpZgo+PiAgICBDT05GSUdfTElCX1VVSUQ9eSIp
IG1vdmUgdGhlIGNvbnRlbnQgb2YgYXJyYXkgdW5kZXIgRUZJX1BBUlRJVElPTgo+PiAgICBhbmQg
bGlua2VyIHdpbGwgcmVtb3ZlIGl0IGlzIG5vdCB1c2VkIGl0IChpbiBTUEwpCj4+Cj4+IC0gQWRk
IGFuZCBmaXggZG9jdW1lbnRhdGlvbiBmb3IgZ3B0IGNvbW1hbmQKPj4KPj4gLSBBZGQgdGVzdCB0
ZXN0X2dwdF93cml0ZV9wYXJ0X3R5cGUgdG8gdGVzdCAidHlwZT0iIHBhcmFtZXRlcnMKPj4KPj4g
VGhpcyBmaXJzdCBwYXRjaCBzb2x2ZXMgYW4gaXNzdWUgZm9yIHRoZSAic3lzdGVtIiBzaG9ydGN1
dCBmb3IgRVNQLAo+PiByZW1vdmVkIGJ5IGNvbW1pdCBkNTRlMTAwNGI4YjEgKCJsaWIvdXVpZC5j
OiB1c2UgdW5pcXVlIG5hbWUKPj4gZm9yIFBBUlRJVElPTl9TWVNURU1fR1VJRCIpIGJ1dCB1c2Vk
IGluIDIgbG9jYXRpb24gKGF0IGxlYXN0KToKPj4KPj4gMS0gYm9hcmQvc2Ftc3VuZy9lODUwLTk2
L2U4NTAtOTYuZW52OjEwOgo+Pgo+PiBwYXJ0aXRpb25zPW5hbWU9ZXNwLHN0YXJ0PTUxMkssc2l6
ZT0xMjhNLGJvb3RhYmxlLHR5cGU9c3lzdGVtOwo+PiBwYXJ0aXRpb25zKz1uYW1lPXJvb3Rmcyxz
aXplPS0sYm9vdGFibGUsdHlwZT1saW51eAo+Pgo+PiAyLSBhcmNoL2FybS9tYWNoLXN0bTMybXAv
Y21kX3N0bTMycHJvZy9zdG0zMnByb2cuYzoxMTUxCj4+Cj4+IAkJCWNhc2UgUEFSVF9FU1A6Cj4+
IAkJCQkvKiBFRkkgU3lzdGVtIFBhcnRpdGlvbiAqLwo+PiAJCQkJdHlwZV9zdHIgPSAic3lzdGVt
Igo+PiAuLi4uCj4+IAkJCW9mZnNldCArPSBzbnByaW50ZihidWYgKyBvZmZzZXQsCj4+IAkJCQkJ
ICAgYnVmbGVuIC0gb2Zmc2V0LAo+PiAJCQkJCSAgICIsdHlwZT0lcyIsIHR5cGVfc3RyKTsKPiBU
aGlzIGxlYWRzIHRvIGZhaWx1cmUgaW4gQ0k6Cj4gaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJv
b3QvdS1ib290Ly0vam9icy8xMTUxNTExCj4KCkhpLCBJIHVuZGVyc3Rvb2QgcHJvYmxlbSwKCml0
IGlzIHRoZSBkZWZpbml0aW9uIGZvciAic3lzdGVtIiAiRUZJIHN5c3RlbSBwYXJ0aXRvbiIgdW5k
ZXIgdG9vIApyZXN0cmljdGlmIGNvbXBpbGF0aW9uIGZsYWcKCnNvIHRoZSB0ZXN0IGlzIE9LIG9u
bHnCoCBpZiBvbmUgZmxhZyBpcyBhY3RpdmF0ZWQgaW46CgotIENPTkZJR19DTURfRUZJREVCVUcg
b3IKCi0gQ09ORklHX0VGSSAoZm9yICJVLUJvb3QgYXMgVUVGSSBhcHBsaWNhdGlvbiI9PiAiU3Vw
cG9ydCBydW5uaW5nIFUtQm9vdCAKZnJvbSBFRkkiKQoKCmJ1dCBub3QgYWN0aXZhdGVkIGZvciBR
RU1VIG9yIGZvciBub21hbCB1c2UgY2FzZSwKCndoZW4gVS1Cb290IGlzIGEganVzdCBFRkkgbG9h
ZGVyIHdpdGggQ09ORklHX0NNRF9CT09URUZJCgoKbXkgZXJyb3Igb24gRUZJIGNvbXBpbGF0aW9u
IGZsYWdzOiBDT05GSUdfRUZJIDw9PiBDT05GSUdfQ01EX0JPT1RFRkkKCgpJIHdpbGwgc2VuZCBh
IFYzwqAgd2l0aCBhIHVwZGF0ZSB0byBzb2x2ZSB0aGUgaXNzdWUKCgpQYXRyaWNrCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
