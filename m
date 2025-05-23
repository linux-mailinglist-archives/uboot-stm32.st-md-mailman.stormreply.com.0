Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE2CAC1FBA
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 May 2025 11:27:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E34AC7A82B;
	Fri, 23 May 2025 09:27:27 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61CFEC7A82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 09:27:26 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N821QH005102;
 Fri, 23 May 2025 11:27:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 9GCqtJqLA4S98+rZvFfoS/uxi48A4QlMUYqXuyF3y2A=; b=NK7LI9YTzHAq/vjI
 obREHd0US1wjhYvXmXv0xs6KVsJ/VQdB5zf2s5DCNQHCebuOBrF8jzlaAA7zqz2d
 76psewZ0BZ8cgN6UnCay8cQDG7DKJliJ3aHzaNnhI+I9nsxdRFxM0QY0UlGrEcrU
 9ZKu/rccOoFA90CnMLbvaynCTnu5WaDxmou6brEeqjbtcXn5jVxzmNQlqTXNIn6x
 KRDsg8ID4E2C1W8qHYgPqBVByG/zEaRs3KwxhjrsAkTMfrQs8Fq+hKwGUsCqSN4H
 oIAinyY/Kj2yGBeHQCOwQOOflrPU35jcEZ5iGnNkcPxY94LvOLMVLsqUEkdJqzrw
 uA+xCA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfad4k5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 11:27:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4652E40079;
 Fri, 23 May 2025 11:26:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F199ACFF63;
 Fri, 23 May 2025 11:26:05 +0200 (CEST)
Received: from [192.168.8.15] (10.48.86.132) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 11:26:04 +0200
Message-ID: <e3e67c90fce020b2d02a2fa98ca9587e1ef12f91.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>,
 Stefan Roese <sr@denx.de>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Marek Vasut <marex@denx.de>
Date: Fri, 23 May 2025 11:26:02 +0200
In-Reply-To: <a22cb1c0-bcee-4b12-bed8-2eb7e19e0939@foss.st.com>
References: <20250521122755.265760-1-antonio.borneo@foss.st.com>
 <20250521122755.265760-5-antonio.borneo@foss.st.com>
 <a22cb1c0-bcee-4b12-bed8-2eb7e19e0939@foss.st.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 =?ISO-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] watchdog: don't autostart watchdog on
	STM32MP boards
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

T24gVGh1LCAyMDI1LTA1LTIyIGF0IDExOjUzICswMjAwLCBQYXRyaWNrIERFTEFVTkFZIHdyb3Rl
Ogo+IEhpLAo+IAo+IE9uIDUvMjEvMjUgMTQ6MjcsIEFudG9uaW8gQm9ybmVvIHdyb3RlOgo+ID4g
RnJvbTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gPiAK
PiA+IFRoZSBTVE0zMk1QMiBib2FyZHMgaGF2ZSB3YXRjaGRvZyBzdGFydGVkIGJ5IGEgcHJldmlv
dXMgYm9vdAo+IAo+IHdoeSBvbmx5IGZvciBTVE0zMk1QMi4uLgo+IAo+IEkgdGhpbmsgaXQgaXMg
Y2FzZSBmb3IgU1RNMzJNUDEgYWxzby4KPiAKPiAKPiBhbmQgaW4gdGhlIHBhdGNoIGl0IGlzIHRo
ZSBjYXNlID0+IGRlZmF1bHQgbiBmb3IgQVJDSF9TVE0zMk1QCj4gCj4gPSBhbGwgU1RNMzIgTVBV
OiBTVE0zMk1QMShBUk12NykgJiBTVE0zMk1QMihBUk12OCkKCk15IG1pc3Rha2UuIEkgd2lsbCBm
aXggaXQgaW4gVjIuCgo+ID4gc3RhZ2UgKGUuZy4gYm9vdHJvbSBvciBzZWN1cmUgT1MpLCBXQVRD
SERPR19BVVRPU1RBUlQgaXMgdXNlbGVzcy4KPiA+IFByZWZlciB0byByZWx5IG9uIERUIHByb3Bl
cnRpZXMgInUtYm9vdCxhdXRvc3RhcnQiIG9yICJ1LWJvb3Qsbm9hdXRvc3RhcnQiCj4gPiBpZiBu
ZWVkZWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5j
aG90YXJkQGZvc3Muc3QuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQW50b25pbyBCb3JuZW8gPGFu
dG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgo+ID4gLS0tCj4gPiDCoCBkcml2ZXJzL3dhdGNoZG9n
L0tjb25maWcgfCAxICsKPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4g
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9LY29uZmlnIGIvZHJpdmVycy93YXRj
aGRvZy9LY29uZmlnCj4gPiBpbmRleCAxYmI2N2Y1MDM1Mi4uNTEwMzMwYmU4YTUgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hk
b2cvS2NvbmZpZwo+ID4gQEAgLTE1LDYgKzE1LDcgQEAgY29uZmlnIFdBVENIRE9HX0FVVE9TVEFS
VAo+ID4gwqDCoMKgwqDCoMKgwqDCoGJvb2wgIkF1dG9tYXRpY2FsbHkgc3RhcnQgd2F0Y2hkb2cg
dGltZXIiCj4gPiDCoMKgwqDCoMKgwqDCoMKgZGVwZW5kcyBvbiBXRFQKPiA+IMKgwqDCoMKgwqDC
oMKgwqBkZWZhdWx0IG4gaWYgQVJDSF9TVU5YSQo+ID4gK8KgwqDCoMKgwqDCoMKgZGVmYXVsdCBu
IGlmIEFSQ0hfU1RNMzJNUAo+ID4gwqDCoMKgwqDCoMKgwqDCoGRlZmF1bHQgeQo+ID4gwqDCoMKg
wqDCoMKgwqDCoGhlbHAKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCBBdXRvbWF0aWNhbGx5IHN0YXJ0
IHdhdGNoZG9nIHRpbWVyIGFuZCBzdGFydCBzZXJ2aWNpbmcgaXQgZHVyaW5nCj4gCj4gCj4gV2l0
aCB0aGlzIHBhdGNoIHlvdSBhcmUgY2hhbmdlIHRoZSBiZWhhdmlvciBmb3IgQUxMIHVzZXJzIG9m
IFNUTTMyTVAgYXJjaC4uLgo+IAo+IEl0IGlzIE9LIGZvciBhbnkgYm9vdCB3aXRoIFRGLUEvT1At
VEVFLi4uLgo+IAo+IHNvIGZvciBzdG0zMm1wMTVfZGVmY29uZmlnL3N0bTMybXAxNV90cnVzdGVk
X2RlZmNvbmZpZwo+IAo+IAo+IGJ1dCB3aGF0IGFwcGVuZCBmb3IgYm9vdCB3aXRoIFNQTCBvbiBT
VCBib2FyZHMgPwo+IAo+IHN0bTMybXAxNV9iYXNpY19kZWZjb25maWcKPiAKPiBhbmQgd2hhdCBh
cHBlbmRzIGZvcsKgIGN1c3RvbWVyIGRlZmNvbmZpZ8KgIHdpdGggU1BMID8KPiAKPiBzdG0zMm1w
MTUtbWljcm9nZWEtc3RtMzJtcDEtbWljcm9kZXYyX2RlZmNvbmZpZwo+IHN0bTMybXAxNS1pY29y
ZS1zdG0zMm1wMS1jdG91Y2gyX2RlZmNvbmZpZwo+IHN0bTMybXAxNV9kaGNvcl9iYXNpY19kZWZj
b25maWcKPiBzdG0zMm1wMTVfZGhjb21fYmFzaWNfZGVmY29uZmlnCj4gc3RtMzJtcDE1LW1pY3Jv
Z2VhLXN0bTMybXAxLW1pY3JvZGV2Mi1vZjdfZGVmY29uZmlnCj4gc3RtMzJtcDE1LWljb3JlLXN0
bTMybXAxLWVkaW1tMi4yX2RlZmNvbmZpZwo+IAo+IGlmIHlvdSB3YW50IGhhdmUgbm8gaW1wYWN0
IG9uIG90aGVyIGJvYXJkcywgSSB0aGluayBhIGRlZmNvbmZpZyAKPiBtb2RpZmljYXRpb24gaXMg
bWlzc2luZyBmb3IgYWxsIHRoZXNlIGRlZmNvbmZpZyB3aXRob3V0IFRGLUEvT1AtVEVFIHN1cHBv
cnQKPiAKPiBDT05GSUdfV0FUQ0hET0dfQVVUT1NUQVJUPXkKPiAKPiBvciB5b3UgYXJlIGV4cGVj
dGluZyBTVE0zMk1QMTUgYm9hcmQgZGV2aWNlIHRyZWUgbW9kaWZpY2F0aW9uIAo+ICgidS1ib290
LGF1dG9zdGFydCIpID8KCllvdSBhcmUgcmlnaHQhCkkgd2lsbCB1cGRhdGUgdGhlIGRlZmNvbmZp
ZyBmb3IgdGhlIFNQTCBiYXNlZCBib2FyZHMgaW4gVjIuCgpUaGFua3MgZm9yIHRoZSByZXZpZXcK
ClJlZ2FyZHMKQW50b25pbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
