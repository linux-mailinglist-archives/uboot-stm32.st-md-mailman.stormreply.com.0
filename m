Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4B39C5A1E
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2024 15:19:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B163DC78F84;
	Tue, 12 Nov 2024 14:19:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15646C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 14:19:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACBXSW2014169;
 Tue, 12 Nov 2024 15:19:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 fpv6ZXFBhrt5V4EaBgepg+hykcUAFa9+RabueVWqvUc=; b=6NKlJ8uQ4NnjFvdN
 FJjOG5NvRjgi3B4EnA8rgCJ8cDEeIb9HmKNHLnUx6Rtr08S/aoHKep0/89n3i0Y5
 ATbb7QR7hJmeX+LRlMWCKVyaIIWRmwG//RZQ4qaXQ8gfz/8mH8O4jcO9gL+xFWGN
 76eABz2tgmOZEqJX8iVh0XOF2WwWqc2TAd8czO4wF4GqBQdniQnP339v99RkOoEL
 kOc6lFK0ei31+lf9K03SPrV2hAl+GZRmUr7FfRll3zT9v8ulN3ELudtcOsFnSkQb
 xvxIB3ISYroV04fUlmAn/gBBcvBMJycOCWvhHpzqzu2Y49dlP4pUj33c07cdf1Da
 NrDL0Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42swr8vrn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2024 15:19:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 14F87400A1;
 Tue, 12 Nov 2024 15:18:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 981DA2B77EE;
 Tue, 12 Nov 2024 15:16:31 +0100 (CET)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 12 Nov
 2024 15:16:31 +0100
Message-ID: <27780a15-a056-42fb-be71-dcc129066c39@foss.st.com>
Date: Tue, 12 Nov 2024 15:16:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241027010437.350243-1-marex@denx.de>
 <20241027010437.350243-2-marex@denx.de>
 <828ae2de-1f7b-49ca-9733-66f7846dac8b@foss.st.com>
Content-Language: en-US
In-Reply-To: <828ae2de-1f7b-49ca-9733-66f7846dac8b@foss.st.com>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, u-boot@dh-electronics.com,
 Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] ARM: stm32: Deduplicate DH STM32MP1xx
 DHSOM defconfigs
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

Ck9uIDExLzEyLzI0IDEyOjQ5LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+Cj4gT24g
MTAvMjcvMjQgMDI6MDMsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBEZWR1cGxpY2F0ZSBkZWZjb25m
aWdzIGZvciBhbGwgREggU1RNMzJNUDF4eCBESFNPTSBzeXN0ZW1zIGJ5IGZhY3RvcmluZwo+PiBv
dXQgdGhlIGNvbW1vbiBwYXJ0cyBpbnRvIGdlbmVyaWMgc3RtMzJtcF9kaHNvbS5jb25maWcgYW5k
IGluY2x1ZGluZwo+PiB0aG9zZSB1c2luZyB0aGUgI2luY2x1ZGUgPGNvbmZpZ3MvLi4uPiBwcmVw
cm9jZXNzb3IgbWFjcm8gaW4gdGhlIGN1cnJlbnQKPj4gc2V0IG9mIGJvYXJkIHNwZWNpZmljIGRl
ZmNvbmZpZ3MuIFRoZSBwcmVwcm9jZXNzb3IgbWFjcm8gaXMgYXBwbGljYWJsZQo+PiB0byBkZWZj
b25maWdzIGFzIHdlbGwuCj4+Cj4+IFRoaXMgaW50cm9kdWNlcyBubyBmdW5jdGlvbmFsIGNoYW5n
ZSwgdGhlIHJlc3VsdGluZyAuY29uZmlnIGlzIGlkZW50aWNhbAo+PiBmb3IgYWxsIERIIFNUTTMy
TVAxeHggREhTT00gc3lzdGVtcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+Cj4+IC0tLQo+PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3Rh
cmRAZm9zcy5zdC5jb20+Cj4+IENjOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5
QGZvc3Muc3QuY29tPgo+PiBDYzogU2VhbiBBbmRlcnNvbiA8c2VhbmdhMkBnbWFpbC5jb20+Cj4+
IENjOiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4KPj4gQ2M6IFRvbSBSaW5pIDx0cmlu
aUBrb25zdWxrby5jb20+Cj4+IENjOiB1LWJvb3RAZGgtZWxlY3Ryb25pY3MuY29tCj4+IENjOiB1
LWJvb3RAbGlzdHMuZGVueC5kZQo+PiBDYzogdWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQo+PiAtLS0KPj4gwqAgY29uZmlncy9zdG0zMm1wMTNfZGhjb3JfZGVmY29uZmln
IHwgMTA3ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiDCoCBjb25maWdzL3N0bTMy
bXAxNV9kaHNvbS5jb25maWfCoMKgwqAgfCAxMDcgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4+IMKgIGNvbmZpZ3Mvc3RtMzJtcF9kaHNvbS5jb25maWfCoMKgwqDCoMKgIHwgMTA1ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMTA5IGlu
c2VydGlvbnMoKyksIDIxMCBkZWxldGlvbnMoLSkKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGNv
bmZpZ3Mvc3RtMzJtcF9kaHNvbS5jb25maWcKPj4KPgo+Cj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sg
RGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4KPiBUaGFua3MKPiBQYXRy
aWNrCj4KCgoKQXBwbGllZCB0byB1LWJvb3Qtc3RtL21hc3RlciwgdGhhbmtzIQoKUmVnYXJkcwpQ
YXRyaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpV
Ym9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby91Ym9vdC1zdG0zMgo=
