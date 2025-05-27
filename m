Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2DAC4E28
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 May 2025 14:03:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 681A0C36B1E;
	Tue, 27 May 2025 12:03:48 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C013CC36B19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 12:03:46 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R8tWia030822;
 Tue, 27 May 2025 14:03:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 tBQShpcuc6wGv92S+q904eI1fNtkZcz9CHuQRA2G2MM=; b=O1Xq38y2tiauUCB+
 904wRajnkfkXRBmMro0lNZYF021h6bKhf2itEwC3dWpr51EFT4sP6e374w7q/zPr
 x/Go8a0jR0zdSZzOmXddrRLlaYYbtppMfJiVIB8RrY4WMLpVwkTlZXa+DjrLRWjZ
 99o3NB3mST+AlQAAqaOSXxoWTUusslKulprT2uAjnU4O7oOH1cI5gmgHohPJYgt1
 KD4zLxHYuzgew2DGz2AmmEJM4DKJB+X42uoCs/mugqMcy1SUH6DfPNQ19H+8g8j+
 zStpY9WBo6ezQpE6UlZRNVKuVrddaUreXFVkAfCGmdOzI3dtwAxCNJ8dGW6/yg07
 /4lIXQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46w54hjaun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 14:03:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0059340054;
 Tue, 27 May 2025 14:02:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DEECA7F83A;
 Tue, 27 May 2025 14:02:28 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 14:02:28 +0200
Message-ID: <fb71475a-17df-4e53-96f5-2a33bd3fd79a@foss.st.com>
Date: Tue, 27 May 2025 14:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>, <u-boot@lists.denx.de>
References: <20250521134117.2828335-1-patrice.chotard@foss.st.com>
 <20250521134117.2828335-3-patrice.chotard@foss.st.com>
 <b4c857a8-141a-43d4-b2d3-15427997c3d0@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <b4c857a8-141a-43d4-b2d3-15427997c3d0@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 02/13] clk: stm32mp25: Add clock driver
	support
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

CgpPbiA1LzIyLzI1IDA5OjA4LCBHYWJyaWVsIEZFUk5BTkRFWiB3cm90ZToKPiAKPiBPbiA1LzIx
LzI1IDE1OjQxLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEZyb206IEdhYnJpZWwgRmVybmFu
ZGV6IDxnYWJyaWVsLmZlcm5hbmRlekBmb3NzLnN0LmNvbT4KPj4KPj4gQWRkIGNsb2NrIGRyaXZl
ciBzdXBwb3J0IGZvciBTVE0zMk1QMjUgU29Dcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogR2Ficmll
bCBGZXJuYW5kZXogPGdhYnJpZWwuZmVybmFuZGV6QGZvc3Muc3QuY29tPgo+PiBTaWduZWQtb2Zm
LWJ5OiBWYWxlbnRpbiBDYXJvbiA8dmFsZW50aW4uY2Fyb25AZm9zcy5zdC5jb20+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+
PiBDYzogTHVrYXN6IE1hamV3c2tpIDxsdWttYUBkZW54LmRlPgo+PiBDYzogU2VhbiBBbmRlcnNv
biA8c2VhbmdhMkBnbWFpbC5jb20+Cj4+IC0tLQoKWy4uLl0KCj4+ICvCoMKgwqAgR0FURV9VQVJU
NywKPj4gK8KgwqDCoCBHQVRFX1VBUlQ4LAo+PiArwqDCoMKgIEdBVEVfVUFSVDksCj4+ICvCoMKg
wqAgR0FURV9VU0FSVDEsCj4+ICvCoMKgwqAgR0FURV9VU0FSVDIsCj4+ICvCoMKgwqAgR0FURV9V
U0FSVDMsCj4+ICvCoMKgwqAgR0FURV9VU0FSVDYsCj4+ICvCoMKgwqAgR0FURV9VU0IyLAo+IHBs
ZWFzZSByZW5hbWUgR0FURV9VU0IyIGludG8gR0FURV9VU0JIIHRvIGJlIGNvbmZvcm0gd2l0aCBs
YXN0IHJlZmVyZW5jZSBtYW51YWwKCk9rCgo+PiArwqDCoMKgIEdBVEVfVVNCMlBIWTEsCj4+ICvC
oMKgwqAgR0FURV9VU0IyUEhZMiwKPj4gK8KgwqDCoCBHQVRFX1VTQjNEUiwKPj4gK8KgwqDCoCBH
QVRFX1VTQjNQQ0lFUEhZLAo+PiArwqDCoMKgIEdBVEVfVVNCVEMsCj4+ICvCoMKgwqAgR0FURV9W
REVDLAo+PiArwqDCoMKgIEdBVEVfVkVOQywKPj4gK8KgwqDCoCBHQVRFX1ZSRUYsCj4+ICvCoMKg
wqAgR0FURV9XV0RHMSwKPj4gK8KgwqDCoCBHQVRFX1dXREcyLAoKWy4uLl0KCj4+ICvCoMKgwqAg
R0FURV9DRkcoR0FURV9FVEgyLMKgwqDCoMKgwqDCoMKgIFJDQ19FVEgyQ0ZHUizCoMKgwqDCoMKg
wqDCoCA1LMKgwqDCoCAwKSwKPj4gK8KgwqDCoCBHQVRFX0NGRyhHQVRFX0VUSDJUWCzCoMKgwqDC
oMKgwqDCoCBSQ0NfRVRIMkNGR1IswqDCoMKgwqDCoMKgwqAgOCzCoMKgwqAgMCksCj4+ICvCoMKg
wqAgR0FURV9DRkcoR0FURV9FVEgyUlgswqDCoMKgwqDCoMKgwqAgUkNDX0VUSDJDRkdSLMKgwqDC
oMKgwqDCoMKgIDEwLMKgwqDCoCAwKSwKPj4gK8KgwqDCoCBHQVRFX0NGRyhHQVRFX1VTQjIswqDC
oMKgwqDCoMKgwqAgUkNDX1VTQjJDRkdSLMKgwqDCoMKgwqDCoMKgIDEswqDCoMKgIDApLAo+IAo+
IMKgwqDCoCBHQVRFX0NGRyhHQVRFX1VTQkgswqDCoMKgIMKgwqDCoCBSQ0NfVVNCSENGR1IswqDC
oMKgIMKgwqDCoCAxLMKgwqDCoCAwKSwKCk9rCgo+IAo+PiArwqDCoMKgIEdBVEVfQ0ZHKEdBVEVf
VVNCMlBIWTEswqDCoMKgwqDCoMKgwqAgUkNDX1VTQjJQSFkxQ0ZHUizCoMKgwqAgMSzCoMKgwqAg
MCksCj4+ICvCoMKgwqAgR0FURV9DRkcoR0FURV9VU0IyUEhZMizCoMKgwqDCoMKgwqDCoCBSQ0Nf
VVNCMlBIWTJDRkdSLMKgwqDCoCAxLMKgwqDCoCAwKSwKPj4gK8KgwqDCoCBHQVRFX0NGRyhHQVRF
X1VTQjNEUizCoMKgwqDCoMKgwqDCoCBSQ0NfVVNCM0RSQ0ZHUizCoMKgwqDCoMKgwqDCoCAxLMKg
wqDCoCAwKSwKPj4gK8KgwqDCoCBHQVRFX0NGRyhHQVRFX1VTQjNQQ0lFUEhZLMKgwqDCoCBSQ0Nf
VVNCM1BDSUVQSFlDRkdSLMKgwqDCoCAxLMKgwqDCoCAwKSwKPj4gK8KgwqDCoCBHQVRFX0NGRyhH
QVRFX1BDSUUswqDCoMKgwqDCoMKgwqAgUkNDX1BDSUVDRkdSLMKgwqDCoMKgwqDCoMKgIDEswqDC
oMKgIDApLAoKWy4uLl0KCgo+PiArwqDCoMKgIFNUTTMyX0NPTVBPU0lURV9OT0RJVihDS19LRVJf
VVNCMlBIWTEsICJja19rZXJfdXNiMnBoeTEiLCAwLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBTRUNGX05PTkUsIEdBVEVfVVNCMlBIWTEsIE1VWF9VU0IyUEhZMSksCj4+
ICsKPj4gK8KgwqDCoCAvKiBVU0JIICovCj4+ICvCoMKgwqAgU1RNMzJfR0FURShDS19CVVNfVVNC
Mk9IQ0ksICJja19pY25fbV91c2Iyb2hjaSIsICJja19pY25faHNsIiwgMCwgR0FURV9VU0IyLCBT
RUNGX05PTkUpLAo+PiArwqDCoMKgIFNUTTMyX0dBVEUoQ0tfQlVTX1VTQjJFSENJLCAiY2tfaWNu
X21fdXNiMmVoY2kiLCAiY2tfaWNuX2hzbCIsIDAsIEdBVEVfVVNCMiwgU0VDRl9OT05FKSwKPiAK
PiBTVE0zMl9HQVRFKENLX0JVU19VU0IyT0hDSSwgImNrX2ljbl9tX3VzYjJvaGNpIiwgImNrX2lj
bl9oc2wiLCAwLCBHQVRFX1VTQkgsIFNFQ0ZfTk9ORSksCj4gU1RNMzJfR0FURShDS19CVVNfVVNC
MkVIQ0ksICJja19pY25fbV91c2IyZWhjaSIsICJja19pY25faHNsIiwgMCwgR0FURV9VU0JILCBT
RUNGX05PTkUpLAo+IAo+PiArCj4+ICvCoMKgwqAgLyogVVNCMlBIWTIgKi8KPj4gK8KgwqDCoCBT
VE0zMl9DT01QT1NJVEVfTk9ESVYoQ0tfS0VSX1VTQjJQSFkyRU4sICJja19rZXJfdXNiMnBoeTJf
ZW4iLCAwLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTRUNGX05PTkUs
IEdBVEVfVVNCMlBIWTIsIE1VWF9VU0IyUEhZMiksCj4+ICsKPj4gK8KgwqDCoCAvKiBVU0IzIFBD
SWUgQ09NQk9QSFkgKi8KClsuLi5dCgo+PiArI2RlZmluZSBSQ0NfQURDMTJDRkdSwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4N0U4Cj4+ICsjZGVmaW5lIFJDQ19BREMzQ0ZHUsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDdFQwo+PiArI2RlZmluZSBSQ0NfRVRIMUNGR1LC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHg3RjAKPj4gKyNkZWZpbmUgUkNDX0VUSDJD
RkdSwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4N0Y0Cj4+ICsjZGVmaW5lIFJDQ19V
U0IyQ0ZHUsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDdGQwo+IAo+ICNkZWZpbmUg
UkNDX1VTQkhDRkdSCgoKT2sKCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IEdhYnJpZWwKPiAKPj4g
KyNkZWZpbmUgUkNDX1VTQjJQSFkxQ0ZHUsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHg4MDAKPj4g
KyNkZWZpbmUgUkNDX1VTQjJQSFkyQ0ZHUsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHg4MDQKPj4g
KyNkZWZpbmUgUkNDX1VTQjNEUkNGR1LCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHg4
MDgKPj4gKyNkZWZpbmUgUkNDX1VTQjNQQ0lFUEhZQ0ZHUsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
MHg4MEMKPj4gKyNkZWZpbmUgUkNDX1BDSUVDRkdSwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDB4ODEwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3Vib290LXN0bTMyCg==
