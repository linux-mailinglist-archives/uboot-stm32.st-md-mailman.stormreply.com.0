Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B4C8AAE45
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:16:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 110E6C6DD72;
	Fri, 19 Apr 2024 12:16:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9D02C69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:16:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9iFPS031727; Fri, 19 Apr 2024 14:16:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=uCGdQVfV7ltRXdJoI9mBMelowAjDmaNDDND7DS9trXk=; b=St
 TCGQfgMD9rQohbVgqcNWGs+eKeZXlT8GZxvu4Uc75hE/G55+8bu1PkqzrtQKX+dC
 VViA9nnT4C+8pX3kKKB4nfYNXAAzljHczNf6jWqlVh8q5stzbf6HGTgCsG1//8XJ
 McxQTnz9O60pwMVZd57CwoA+1ZeFP2DZXj9XEv0SlzAOD1EoQ2bnx+/XXwKdTik8
 8nf0u2btdv00xmaxxexy06p8HU3Ro0hvCjl4sPChKqHzT9EN3DDDStldnmyKaWYE
 DHHPDKg0Ut9EJuIrIUdrGasn85WqSeZRw0LyMi+R557ld9b2YPajVFaIX4Y5BosE
 /nclEvs7pF67bXEn6YoQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xgecyrbf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:16:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6FF414002D;
 Fri, 19 Apr 2024 14:16:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8955B2194FA;
 Fri, 19 Apr 2024 14:16:15 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:16:14 +0200
Message-ID: <859f32b1-206d-4f75-9f8b-4725cad509da@foss.st.com>
Date: Fri, 19 Apr 2024 14:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Igor Opaniuk <igor.opaniuk@gmail.com>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-2-patrice.chotard@foss.st.com>
 <CAByghJa_3MwcY74oNR0cKA2+XOA6R6J8LGhnecvZoJr_ONxTXw@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAByghJa_3MwcY74oNR0cKA2+XOA6R6J8LGhnecvZoJr_ONxTXw@mail.gmail.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, Igor Opaniuk <igor.opaniuk@foundries.io>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 01/25] configs: stm32mp13: Enable
	FASTBOOT
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

CgpPbiA0LzE4LzI0IDEzOjQ4LCBJZ29yIE9wYW5pdWsgd3JvdGU6Cj4gT24gVHVlLCBBcHIgOSwg
MjAyNCBhdCA1OjE54oCvUE0gUGF0cmljZSBDaG90YXJkCj4gPHBhdHJpY2UuY2hvdGFyZEBmb3Nz
LnN0LmNvbT4gd3JvdGU6Cj4+Cj4+IEVuYWJsZSBGQVNUQk9PVCByZWxhdGl2ZSBmbGFncyBmb3Ig
c3RtMzJtcDEzX2RlZmNvbmZpZy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJk
IDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+Cj4+IC0tLQo+Pgo+PiAgY29uZmlncy9z
dG0zMm1wMTNfZGVmY29uZmlnIHwgOSArKysrKysrKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mvc3Rt
MzJtcDEzX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvc3RtMzJtcDEzX2RlZmNvbmZpZwo+PiBpbmRleCBj
ODkzZTI3MmRiOS4uZGIwOWU2MzEwMGUgMTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3Mvc3RtMzJtcDEz
X2RlZmNvbmZpZwo+PiArKysgYi9jb25maWdzL3N0bTMybXAxM19kZWZjb25maWcKPj4gQEAgLTE1
LDYgKzE1LDcgQEAgQ09ORklHX0NNRF9TVE0zMlBST0c9eQo+PiAgQ09ORklHX1NZU19MT0FEX0FE
RFI9MHhjMjAwMDAwMAo+PiAgQ09ORklHX1NZU19NRU1URVNUX1NUQVJUPTB4YzAwMDAwMDAKPj4g
IENPTkZJR19TWVNfTUVNVEVTVF9FTkQ9MHhjNDAwMDAwMAo+PiArIyBDT05GSUdfQU5EUk9JRF9C
T09UX0lNQUdFIGlzIG5vdCBzZXQKPj4gIENPTkZJR19GSVQ9eQo+PiAgQ09ORklHX1NZU19CT09U
TV9MRU49MHgyMDAwMDAwCj4+ICBDT05GSUdfRElTVFJPX0RFRkFVTFRTPXkKPj4gQEAgLTUzLDYg
KzU0LDEzIEBAIENPTkZJR19TWVNfTU1DX0VOVl9ERVY9LTEKPj4gIENPTkZJR19FTlZfTU1DX1VT
RV9EVD15Cj4+ICBDT05GSUdfQ0xLX1NDTUk9eQo+PiAgQ09ORklHX1NFVF9ERlVfQUxUX0lORk89
eQo+PiArQ09ORklHX1VTQl9GVU5DVElPTl9GQVNUQk9PVD15Cj4+ICtDT05GSUdfRkFTVEJPT1Rf
QlVGX0FERFI9MHhjMDAwMDAwMAo+PiArQ09ORklHX0ZBU1RCT09UX0JVRl9TSVpFPTB4MDIwMDAw
MDAKPj4gK0NPTkZJR19GQVNUQk9PVF9GTEFTSD15Cj4+ICtDT05GSUdfRkFTVEJPT1RfRkxBU0hf
TU1DX0RFVj0wCj4+ICtDT05GSUdfRkFTVEJPT1RfQ01EX09FTV9GT1JNQVQ9eQo+PiArQ09ORklH
X0ZBU1RCT09UX0NNRF9PRU1fUEFSVENPTkY9eQo+PiAgQ09ORklHX0dQSU9fSE9HPXkKPj4gIENP
TkZJR19ETV9JMkM9eQo+PiAgQ09ORklHX1NZU19JMkNfU1RNMzJGNz15Cj4+IEBAIC05Miw3ICsx
MDAsNiBAQCBDT05GSUdfVVNCX0dBREdFVF9NQU5VRkFDVFVSRVI9IlNUTWljcm9lbGVjdHJvbmlj
cyIKPj4gIENPTkZJR19VU0JfR0FER0VUX1ZFTkRPUl9OVU09MHgwNDgzCj4+ICBDT05GSUdfVVNC
X0dBREdFVF9QUk9EVUNUX05VTT0weDU3MjAKPj4gIENPTkZJR19VU0JfR0FER0VUX0RXQzJfT1RH
PXkKPj4gLUNPTkZJR19VU0JfR0FER0VUX0RPV05MT0FEPXkKPj4gIENPTkZJR19FUlJOT19TVFI9
eQo+PiAgIyBDT05GSUdfTE1CX1VTRV9NQVhfUkVHSU9OUyBpcyBub3Qgc2V0Cj4+ICBDT05GSUdf
TE1CX01FTU9SWV9SRUdJT05TPTIKPj4gLS0KPj4gMi4yNS4xCj4+Cj4gUmV2aWV3ZWQtYnk6IEln
b3IgT3Bhbml1ayA8aWdvci5vcGFuaXVrQGdtYWlsLmNvbT4KPiAKCkFwcGxpZWQgb24gdS1ib290
LXN0bTMyL21hc3RlciAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
