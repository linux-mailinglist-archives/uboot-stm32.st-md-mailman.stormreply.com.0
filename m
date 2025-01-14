Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92016A1079C
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Jan 2025 14:20:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44A32C78031;
	Tue, 14 Jan 2025 13:20:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1504DC7802D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 13:20:39 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EAnHTP005088;
 Tue, 14 Jan 2025 14:20:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 qqlkF4IIs1CKd6IjktYb2lkl7cdo9Lu+GcHVMJBBMyo=; b=JS+b8VadN5nmgHZQ
 D1h/TIHhblTCBDet11xfHYcG/Yte0NlJVUGo2Uee+EmD7qDVXoYUf5jmHVnjXC4r
 PCSkMj2o4LZq+JvoRmGANkNMBZYeEaW8BNILS7IEZTl9IB+aDjzANRHZZbhDDj4O
 3D7ceJwn/stLZwDygttutJ30xwnfPt7jjQ6kl+8hxgtt+E7zjKA8bR0cM0eQr5ml
 ETm/bYjb8SHmh9lfBUzCzX81I/J/sRpdSWBFLZVzq2+CvBd2IY0Ye8iucP9/5mc6
 fYdjUHUNyFKcZM8Kehm2kTeVBw5uUGtx0e5G7tx7aqxcic5t64dVBiFwHvv+W8Dd
 za4Ckw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 445pgt0kpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2025 14:20:31 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B357D40046;
 Tue, 14 Jan 2025 14:19:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9AA6B29ADC4;
 Tue, 14 Jan 2025 14:19:07 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 14 Jan
 2025 14:19:07 +0100
Message-ID: <44119479-07a7-4679-9be5-3d914d55d554@foss.st.com>
Date: Tue, 14 Jan 2025 14:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stefan Roese <sr@denx.de>, <u-boot@lists.denx.de>
References: <20250108150940.558671-1-patrice.chotard@foss.st.com>
 <ef52a3dd-3851-44e8-878e-09c10265ff7b@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ef52a3dd-3851-44e8-878e-09c10265ff7b@denx.de>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Rasmus Villemoes <ravi@prevas.dk>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] cyclic: Fix rollover every 72 min on
 32 bits platforms
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

CgpPbiAxLzkvMjUgMDg6NTYsIFN0ZWZhbiBSb2VzZSB3cm90ZToKPiBPbiAwOC4wMS4yNSAxNjow
OSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBPbiAzMiBiaXRzIHBsYXRmb3JtcywgdGltZXJf
Z2V0X3VzKCkgcmV0dXJucyBhbiB1bnNpZ25lZCBsb25nIHdoaWNoCj4+IGlzIGEgMzIgYml0cy4g
dGltZXJfZ2V0X3VzKCkgd3JhcHMgYXJvdW5kIGV2ZXJ5IDcyIG1pbnV0ZXMKPj4gKDIgXiAzMiAv
IDEwMDAwMDAgPX4gNDI5NSBzZWMgPX4gNzIgbWluKS4KPj4KPj4gU28gdGhlIHRlc3QgImlmIHRp
bWVfYWZ0ZXJfZXE2NChub3csIGN5Y2xpYy0+bmV4dF9jYWxsKSIgaXMgbm8gbW9yZQo+PiB0cnVl
IHdoZW4gY3ljbGljLT5uZXh0X2NhbGwgYmVjb21lcyBhYm92ZSAzMiBiaXRzIG1heCB2YWx1ZSAo
NDI5NDk2NzI5NSkuCj4+Cj4+IEF0IHRoaXMgcG9pbnQgYWZ0ZXIgNzIgbWluLCBubyBtb3JlIGN5
Y2xpYyBmdW5jdGlvbiBhcmUKPj4gZXhlY3V0ZWQgaW5jbHVkZWQgd2F0Y2hkb2cgb25lLgo+Pgo+
PiBJbnN0ZWFkIG9mIHVzaW5nIHRpbWVyX2dldF91cygpLCB1c2UgZ2V0X3RpbWVyX3VzKCkgd2hp
Y2ggcmV0dXJucyBhCj4+IHVpbnQ2NF90LCB0aGlzIGFsbG93cyBhIHJvbGxvdmVyIGV2ZXJ5IDU4
NDk0MiB5ZWFycy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNl
LmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBjb21tb24vY3ljbGljLmMgfCAy
ICstCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvY29tbW9uL2N5Y2xpYy5jIGIvY29tbW9uL2N5Y2xpYy5jCj4+IGlu
ZGV4IDE5Njc5N2ZkNjFlLi5lM2YwM2ExOWQ1NSAxMDA2NDQKPj4gLS0tIGEvY29tbW9uL2N5Y2xp
Yy5jCj4+ICsrKyBiL2NvbW1vbi9jeWNsaWMuYwo+PiBAQCAtNjEsNyArNjEsNyBAQCBzdGF0aWMg
dm9pZCBjeWNsaWNfcnVuKHZvaWQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICogQ2hlY2sgaWYg
dGhpcyBjeWNsaWMgZnVuY3Rpb24gbmVlZHMgdG8gZ2V0IGNhbGxlZCwgZS5nLgo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqIGRvIG5vdCBjYWxsIHRoZSBjeWNsaWMgZnVuYyB0b28gb2Z0ZW4KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4gLcKgwqDCoMKgwqDCoMKgIG5vdyA9IHRpbWVyX2dl
dF91cygpOwo+PiArwqDCoMKgwqDCoMKgwqAgbm93ID0gZ2V0X3RpbWVyX3VzKDApOwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKHRpbWVfYWZ0ZXJfZXE2NChub3csIGN5Y2xpYy0+bmV4dF9jYWxs
KSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBDYWxsIGN5Y2xpYyBmdW5jdGlv
biBhbmQgYWNjb3VudCBpdCdzIGNwdS10aW1lICovCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGN5Y2xpYy0+bmV4dF9jYWxsID0gbm93ICsgY3ljbGljLT5kZWxheV91czsKPiAKPiBSZXZp
ZXdlZC1ieTogU3RlZmFuIFJvZXNlIDxzckBkZW54LmRlPgo+IAo+IFRoYW5rcywKPiBTdGVmYW4K
PiAKSGkgU3RlZmFuCgpJIGZvdW5kIGFub3RoZXIgaXNzdWUgcmVnYXJkaW5nIGN5Y2xpYy4KSSBk
aWRuJ3Qgbm90aWNlIGl0IGR1ZSB0byBkZWJ1ZyB0cmFjZSBpIGFjdGl2YXRlZCB0byBmaW5kIHRo
aXMgaXNzdWUsIGJ1dAphZnRlciA3MiBtaW4gLCBpIGdvdCA6CgpFUlJPUjogY3ljbGljIGZ1bmN0
aW9uIHdhdGNoZG9nIHRvb2sgdG9vIGxvbmc6IC00Mjk0OTY3MjkzdXMgdnMgMTAwMHVzIG1heAoK
VGhpcyBpcyBkdWUgdG8gcmVtYWluaW5nIHVzYWdlIG9mIHRpbWVyX2dldF91cygpIGluIGN5Y2xp
Y19yZWdpc3RlcigpIGFuZCBpbiBjeWNsaWNfcnVuKCkuCnRoZXkgYWxzbyBuZWVkIHRvIGJlIHJl
cGxhY2VkIGJ5IGdldF90aW1lcl91cygwKS4KCkkgd2lsbCBzZW5kIGEgdjIgZm9yIHRoYXQuCgpQ
YXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
