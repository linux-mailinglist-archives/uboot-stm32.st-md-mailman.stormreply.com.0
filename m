Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9EA9C5A14
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2024 15:16:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74E66C78F84;
	Tue, 12 Nov 2024 14:16:43 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63CEBC5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 14:16:36 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACC0omY023409;
 Tue, 12 Nov 2024 15:16:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 BpQkWu4a0Ul1tszjClpwsATsihkDXF17BuTREX6ugQs=; b=pq5wXKYKnXNr8fVN
 3J6kqzsm7GXZ4oRqcggl8tMmcM+5AlEjkPFWMdp8R5CZL/BxfVuEp1rK9dnii6XT
 quhv8fwnerArtW5hHVYarvndgCfc/1aGgJCXcX0WN2DGoIgbaMssyiKEa4GftFN9
 0stS6DLV4f/js7OjaS0Kdut/sOwUGRo8sn0SrzG89f/XLSktiQq+h6shZCrGQsUz
 LgEo012OTVYoi9+d0t+2rZvtIKFSrSjgbqjhJVev1W+7IKEwYGyxIfI5+HIn4hMB
 QhnL1yPEhv2BtVvCx7TWXODURfySAcMJx4SvJn2bw/GWY7HPZRIILKYQW80EqFLJ
 iCpNng==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42tkjnj4qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2024 15:16:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 55B2940048;
 Tue, 12 Nov 2024 15:15:20 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 77C072B612A;
 Tue, 12 Nov 2024 15:14:51 +0100 (CET)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 12 Nov
 2024 15:14:50 +0100
Message-ID: <a9eec52f-b7de-40fe-a500-908e29989243@foss.st.com>
Date: Tue, 12 Nov 2024 15:14:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241106190516.224197-1-marex@denx.de>
 <8b1b3d45-217d-486c-a52c-98e459f160a0@foss.st.com>
Content-Language: en-US
In-Reply-To: <8b1b3d45-217d-486c-a52c-98e459f160a0@foss.st.com>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add optional manufacturing
 environment to DH STM32MP15xx DHSOM
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

Ck9uIDExLzEyLzI0IDEyOjIzLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+Cj4gT24g
MTEvNi8yNCAyMDowNCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IEFkZCBtYW51ZmFjdHVyaW5nIGVu
dmlyb25tZW50IGludG8gU1RNMzJNUDE1eHggREggZWxlY3Ryb25pY3MgREhTT00KPj4gY29uZmln
dXJhdGlvbi4gVGhpcyBlbnZpcm9ubWVudCBpcyBwYXJ0IG9mIGV2ZXJ5IGJvYXJkIGJ1aWxkLCBi
dXQgb25seQo+PiB0YWtlcyBlZmZlY3Qgb24gc3lzdGVtcyBib290ZWQgd2l0aCB0aGUgZGgsc3Rt
MzJtcDE1eHgtZGhjb3ItdGVzdGJlbmNoCj4+IGRldmljZSB0cmVlLCBpLmUuIHN5c3RlbXMgcG9w
dWxhdGVkIHdpdGggZmFjdG9yeSBidWlsZCBvZiBVLUJvb3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+PiAtLS0KPj4gQ2M6IFBhdHJpY2UgQ2hvdGFy
ZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiBDYzogUGF0cmljayBEZWxhdW5heSA8
cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4gQ2M6IFNlYW4gQW5kZXJzb24gPHNlYW5n
YTJAZ21haWwuY29tPgo+PiBDYzogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4+IENj
OiBUb20gUmluaSA8dHJpbmlAa29uc3Vsa28uY29tPgo+PiBDYzogdS1ib290QGRoLWVsZWN0cm9u
aWNzLmNvbQo+PiBDYzogdS1ib290QGxpc3RzLmRlbnguZGUKPj4gQ2M6IHVib290LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4gLS0tCj4+IMKgIGNvbmZpZ3Mvc3RtMzJtcDE1
X2Roc29tLmNvbmZpZ8KgwqDCoMKgwqDCoCB8wqAgMSArCj4+IMKgIGluY2x1ZGUvY29uZmlncy9z
dG0zMm1wMTVfZGhfZGhzb20uaCB8IDE3ICsrKysrKysrKysrKysrKystCj4+IMKgIDIgZmlsZXMg
Y2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvY29uZmlncy9zdG0zMm1wMTVfZGhzb20uY29uZmlnIAo+PiBiL2NvbmZpZ3Mvc3RtMzJtcDE1
X2Roc29tLmNvbmZpZwo+PiBpbmRleCA0ZjhlOThiZWVjNi4uZWZjMTQ5NTc3ZWEgMTAwNjQ0Cj4+
IC0tLSBhL2NvbmZpZ3Mvc3RtMzJtcDE1X2Roc29tLmNvbmZpZwo+PiArKysgYi9jb25maWdzL3N0
bTMybXAxNV9kaHNvbS5jb25maWcKPj4gQEAgLTY0LDYgKzY0LDcgQEAgQ09ORklHX1NZU1JFU0VU
X1NZU0NPTj15Cj4+IMKgIENPTkZJR19TWVNfQk9PVENPVU5UX0FERFI9MHg1QzAwQTE0Qwo+PiDC
oCBDT05GSUdfU1lTX01BTExPQ19GX0xFTj0weDMwMDAKPj4gwqAgQ09ORklHX1NZU19QQlNJWkU9
MTA1MAo+PiArQ09ORklHX1BSRUJPT1Q9InJ1biBkaF9wcmVib290Igo+PiDCoCBDT05GSUdfU1lT
X1NQSV9VX0JPT1RfT0ZGUz0weDgwMDAwCj4+IMKgIENPTkZJR19UQVJHRVRfREhfU1RNMzJNUDFf
UERLMj15Cj4+IMKgIENPTkZJR19VU0VfU0VSVkVSSVA9eQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9jb25maWdzL3N0bTMybXAxNV9kaF9kaHNvbS5oIAo+PiBiL2luY2x1ZGUvY29uZmlncy9zdG0z
Mm1wMTVfZGhfZGhzb20uaAo+PiBpbmRleCAyNzk3ZmM2MWQxNy4uYzAwNGE4Y2VjODIgMTAwNjQ0
Cj4+IC0tLSBhL2luY2x1ZGUvY29uZmlncy9zdG0zMm1wMTVfZGhfZGhzb20uaAo+PiArKysgYi9p
bmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDE1X2RoX2Roc29tLmgKPj4gQEAgLTE4LDYgKzE4LDggQEAK
Pj4gwqAgI2VuZGlmCj4+IMKgIMKgICNkZWZpbmUgU1RNMzJNUF9CT0FSRF9FWFRSQV9FTlbCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoCAi
ZGhfcHJlYm9vdD0iwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwKPj4gK8KgwqDCoMKgwqDCoMKgICJydW4gZGhfdGVzdGJlbmNoX2JhY2t3YXJk
X2NvbXBhdFwwIsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiDCoMKgwqDCoMKgICJkaF91cGRh
dGVfc2RfdG9fZW1tYz0iIC8qIEluc3RhbGwgVS1Cb290IGZyb20gU0QgdG8gZU1NQyAqL8KgwqDC
oCBcCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAic2V0ZXhwciBsb2FkYWRkcjEgJHtsb2FkYWRkcn0g
KyAweDEwMDAwMDAgJiYgIsKgwqDCoMKgwqDCoMKgIFwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgICJs
b2FkIG1tYyAwOjQgJHtsb2FkYWRkcjF9IGJvb3QvdS1ib290LXNwbC5zdG0zMiAmJiAiwqDCoMKg
IFwKPj4gQEAgLTYxLDcgKzYzLDIwIEBACj4+IMKgwqDCoMKgwqAgInN0ZG91dD1zZXJpYWxcMCLC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gwqDCoMKg
wqDCoCAic3RkZXJyPXNlcmlhbFwwIsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+PiDCoMKgwqDCoMKgICJ1cGRhdGVfc2Y9cnVuIGRoX3VwZGF0ZV9zZF90
b19zZlwwIsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IC3CoMKgwqAgInVzYl9w
Z29vZF9kZWxheT0xMDAwXDAiCj4+ICvCoMKgwqAgInVzYl9wZ29vZF9kZWxheT0xMDAwXDAiwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgIC8qIE9sZCB0
ZXN0YmVuY2gtb25seSBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IGVudmlyb25tZW50ICovwqDCoMKg
IFwKPj4gK8KgwqDCoCAiZGhfdGVzdGJlbmNoX2JhY2t3YXJkX2NvbXBhdD0iwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgwqDCoMKgwqAgInRlc3QgJHti
b2FyZF9uYW1lfSA9IFwiZGgsc3RtMzJtcDE1eHgtZGhjb3ItdGVzdGJlbmNoXCIgJiYgIiBcCj4+
ICvCoMKgwqDCoMKgwqDCoCAicnVuIGxvYWRfYm9vdGVudiBpbXBvcnRib290ZW52XDAiwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqAgImltcG9ydGJvb3RlbnY9IsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgwqDCoMKgwqAg
ImVjaG8gSW1wb3J0aW5nIGVudmlyb25tZW50IGZyb20gREh1cGRhdGUuaW5pLi4uOyLCoMKgwqAg
XAo+PiArwqDCoMKgwqDCoMKgwqAgImVudiBpbXBvcnQgLXQgJHtsb2FkYWRkcn0gJHtmaWxlc2l6
ZX1cMCLCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqAgImxvYWRfYm9vdGVudj0iwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDC
oMKgwqDCoMKgICJ1c2IgcmVzZXQgJiYgIsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgwqDCoMKgwqAgImxvYWQgdXNiICR7dXNiZGV2fTok
e3VzYnBhcnR9ICR7bG9hZGFkZHJ9IERIdXBkYXRlLmluaSAmJiAiIFwKPj4gK8KgwqDCoMKgwqDC
oMKgICJlY2hvIFwiLS0+IFVwZGF0ZTogZm91bmQgREh1cGRhdGUuaW5pICgke2ZpbGVzaXplfSAK
Pj4gYnl0ZXMpXCJcMCIgXAo+PiArwqDCoMKgICJ1c2JkZXY9MFwwIsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqAgInVzYnBh
cnQ9MVwwIgo+PiDCoCDCoCAjaW5jbHVkZSA8Y29uZmlncy9zdG0zMm1wMTVfY29tbW9uLmg+Cj4K
Pgo+Cj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9z
cy5zdC5jb20+Cj4KPiBUaGFua3MKPiBQYXRyaWNrCgoKCgpBcHBsaWVkIHRvIHUtYm9vdC1zdG0v
bWFzdGVyLCB0aGFua3MhCgpSZWdhcmRzClBhdHJpY2sKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
