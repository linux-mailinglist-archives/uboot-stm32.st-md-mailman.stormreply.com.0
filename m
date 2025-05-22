Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2641DAC091D
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 May 2025 11:54:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1781C7A825;
	Thu, 22 May 2025 09:54:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6D82C78F98
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 May 2025 09:54:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8iWtO005516;
 Thu, 22 May 2025 11:54:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 eJFHq+BJdrJnp0xd0+zsTL/z+X5oREcHDumtX1as9nU=; b=oED0rE6yxidsw1Cx
 bS5kofv5VqVgIxNJVO8ZCxwJawY4gppOYGdG6i0kIT/YjDmt58PuUmson7ljIy1D
 GeS4MbWIY5afBT/tvVx4H2WxUj5eQzXXcDkhGbAkVLsgMY5tFvc25/J8RHS3cktH
 W126kFO2gZ03zTThe9tn3hn2ayGPgKELG/+EcglUMJp4jsOlu4n8I1kOtin87Kj1
 OOEeLd/NJSUJZnOVIpzv0H79L+MM+Fq/C3gCPNflKnCmt4gM+rK031Bs+f6KtQGU
 9/F0MlO72BVgxwBHfn+G0Uxq9zudVOH4NCJ6IBO3Lfpizy3Ky36mLjw7IIH+dOTZ
 g7d1Xg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfc85ug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 May 2025 11:54:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 28D5E4004D;
 Thu, 22 May 2025 11:53:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4AF67B132B9;
 Thu, 22 May 2025 11:53:40 +0200 (CEST)
Received: from [10.48.86.182] (10.48.86.182) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 11:53:39 +0200
Message-ID: <a22cb1c0-bcee-4b12-bed8-2eb7e19e0939@foss.st.com>
Date: Thu, 22 May 2025 11:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Antonio Borneo <antonio.borneo@foss.st.com>, <u-boot@lists.denx.de>,
 Stefan Roese <sr@denx.de>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Marek Vasut <marex@denx.de>
References: <20250521122755.265760-1-antonio.borneo@foss.st.com>
 <20250521122755.265760-5-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250521122755.265760-5-antonio.borneo@foss.st.com>
X-Originating-IP: [10.48.86.182]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_05,2025-05-22_01,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGksCgpPbiA1LzIxLzI1IDE0OjI3LCBBbnRvbmlvIEJvcm5lbyB3cm90ZToKPiBGcm9tOiBQYXRy
aWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPgo+IFRoZSBTVE0zMk1Q
MiBib2FyZHMgaGF2ZSB3YXRjaGRvZyBzdGFydGVkIGJ5IGEgcHJldmlvdXMgYm9vdAoKd2h5IG9u
bHkgZm9yIFNUTTMyTVAyLi4uCgpJIHRoaW5rIGl0IGlzIGNhc2UgZm9yIFNUTTMyTVAxIGFsc28u
CgoKYW5kIGluIHRoZSBwYXRjaCBpdCBpcyB0aGUgY2FzZSA9PiBkZWZhdWx0IG4gZm9yIEFSQ0hf
U1RNMzJNUAoKPSBhbGwgU1RNMzIgTVBVOiBTVE0zMk1QMShBUk12NykgJiBTVE0zMk1QMihBUk12
OCkKCgo+IHN0YWdlIChlLmcuIGJvb3Ryb20gb3Igc2VjdXJlIE9TKSwgV0FUQ0hET0dfQVVUT1NU
QVJUIGlzIHVzZWxlc3MuCj4gUHJlZmVyIHRvIHJlbHkgb24gRFQgcHJvcGVydGllcyAidS1ib290
LGF1dG9zdGFydCIgb3IgInUtYm9vdCxub2F1dG9zdGFydCIKPiBpZiBuZWVkZWQuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEJvcm5lbyA8YW50b25pby5ib3JuZW9AZm9zcy5zdC5j
b20+Cj4gLS0tCj4gICBkcml2ZXJzL3dhdGNoZG9nL0tjb25maWcgfCAxICsKPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cv
S2NvbmZpZyBiL2RyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZwo+IGluZGV4IDFiYjY3ZjUwMzUyLi41
MTAzMzBiZThhNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcKPiArKysg
Yi9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcKPiBAQCAtMTUsNiArMTUsNyBAQCBjb25maWcgV0FU
Q0hET0dfQVVUT1NUQVJUCj4gICAJYm9vbCAiQXV0b21hdGljYWxseSBzdGFydCB3YXRjaGRvZyB0
aW1lciIKPiAgIAlkZXBlbmRzIG9uIFdEVAo+ICAgCWRlZmF1bHQgbiBpZiBBUkNIX1NVTlhJCj4g
KwlkZWZhdWx0IG4gaWYgQVJDSF9TVE0zMk1QCj4gICAJZGVmYXVsdCB5Cj4gICAJaGVscAo+ICAg
CSAgQXV0b21hdGljYWxseSBzdGFydCB3YXRjaGRvZyB0aW1lciBhbmQgc3RhcnQgc2VydmljaW5n
IGl0IGR1cmluZwoKCldpdGggdGhpcyBwYXRjaCB5b3UgYXJlIGNoYW5nZSB0aGUgYmVoYXZpb3Ig
Zm9yIEFMTCB1c2VycyBvZiBTVE0zMk1QIGFyY2guLi4KCkl0IGlzIE9LIGZvciBhbnkgYm9vdCB3
aXRoIFRGLUEvT1AtVEVFLi4uLgoKc28gZm9yIHN0bTMybXAxNV9kZWZjb25maWcvc3RtMzJtcDE1
X3RydXN0ZWRfZGVmY29uZmlnCgoKYnV0IHdoYXQgYXBwZW5kIGZvciBib290IHdpdGggU1BMIG9u
IFNUIGJvYXJkcyA/CgpzdG0zMm1wMTVfYmFzaWNfZGVmY29uZmlnCgphbmQgd2hhdCBhcHBlbmRz
IGZvcsKgIGN1c3RvbWVyIGRlZmNvbmZpZ8KgIHdpdGggU1BMID8KCnN0bTMybXAxNS1taWNyb2dl
YS1zdG0zMm1wMS1taWNyb2RldjJfZGVmY29uZmlnCnN0bTMybXAxNS1pY29yZS1zdG0zMm1wMS1j
dG91Y2gyX2RlZmNvbmZpZwpzdG0zMm1wMTVfZGhjb3JfYmFzaWNfZGVmY29uZmlnCnN0bTMybXAx
NV9kaGNvbV9iYXNpY19kZWZjb25maWcKc3RtMzJtcDE1LW1pY3JvZ2VhLXN0bTMybXAxLW1pY3Jv
ZGV2Mi1vZjdfZGVmY29uZmlnCnN0bTMybXAxNS1pY29yZS1zdG0zMm1wMS1lZGltbTIuMl9kZWZj
b25maWcKCmlmIHlvdSB3YW50IGhhdmUgbm8gaW1wYWN0IG9uIG90aGVyIGJvYXJkcywgSSB0aGlu
ayBhIGRlZmNvbmZpZyAKbW9kaWZpY2F0aW9uIGlzIG1pc3NpbmcgZm9yIGFsbCB0aGVzZSBkZWZj
b25maWcgd2l0aG91dCBURi1BL09QLVRFRSBzdXBwb3J0CgpDT05GSUdfV0FUQ0hET0dfQVVUT1NU
QVJUPXkKCm9yIHlvdSBhcmUgZXhwZWN0aW5nIFNUTTMyTVAxNSBib2FyZCBkZXZpY2UgdHJlZSBt
b2RpZmljYXRpb24gCigidS1ib290LGF1dG9zdGFydCIpID8KCgpSZWdhcmRzCgpQYXRyaWNrCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK
