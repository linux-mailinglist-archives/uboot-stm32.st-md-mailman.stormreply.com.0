Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C02A96483
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 11:34:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB9DEC78F67;
	Tue, 22 Apr 2025 09:34:32 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AF38C7801A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 09:34:31 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M64XMS030077;
 Tue, 22 Apr 2025 11:34:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 i0MG8/SwXZQvqYJeYjYaxE0bnIBTLYiQnLo2u/pfJ/8=; b=X+sSgAv+BqCjqWCX
 sPL11kRaouZIm5Ui7whsZKmFD2XAiIPJrQthpR8iQj04FfBM3u5xplsebppIgER/
 vaF2JJtAtjO0cdQTywNloTdQTTZx8k8bI2QPI1D9XtvMROmmKyIF6YnZ5xYdpIy4
 5lB901aw4I2FerzLU657jAlxb5n6AmOckSG5qMCKydamv1Sll//HY+oyP9OF06wE
 vA01vDnKUbM2lC2Ssz3A7W1Cesn8vhlYfhKKtn82F7FBnVh7S3xW47jlSlUqLboy
 hWx7vMfbq7PtT7wzmYHnCxrhM1TSLGYDMcafdC/u3Z9E8ffbXl/HDqrBefHjVULs
 7XYhXw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 464psp70yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 11:34:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 06EB940047;
 Tue, 22 Apr 2025 11:33:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E0689EB084;
 Tue, 22 Apr 2025 11:33:18 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 11:33:17 +0200
Message-ID: <e6452d26-75a6-4d90-90f0-21376adca0ee@foss.st.com>
Date: Tue, 22 Apr 2025 11:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250401131413.387139-1-patrice.chotard@foss.st.com>
 <20250401131413.387139-10-patrice.chotard@foss.st.com>
 <a7491caf-a8a1-427d-a4e3-fe70add98218@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <a7491caf-a8a1-427d-a4e3-fe70add98218@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 09/13] ARM: stm32mp: add ETZPC system bus
 driver for STM32MP1
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

CgpPbiA0LzIyLzI1IDEwOjMxLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IAo+
IE9uIDQvMS8yNSAxNToxNCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBGcm9tOiBMaW9uZWwg
RGViaWV2ZSA8bGlvbmVsLmRlYmlldmVAZm9zcy5zdC5jb20+Cj4+Cj4+IFRoaXMgZHJpdmVyIGlz
IGNoZWNraW5nIHRoZSBhY2Nlc3MgcmlnaHRzIG9mIHRoZSBkaWZmZXJlbnQKPj4gcGVyaXBoZXJh
bHMgY29ubmVjdGVkIHRvIHRoZSBFVFpQQyBidXMuIElmIGFjY2VzcyBpcyBkZW5pZWQsCj4+IHRo
ZSBhc3NvY2lhdGVkIGRldmljZSBpcyBub3QgYm91bmQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IExp
b25lbCBEZWJpZXZlIDxsaW9uZWwuZGViaWV2ZUBmb3NzLnN0LmNvbT4KPj4gU2lnbmVkLW9mZi1i
eTogR2F0aWVuIENoZXZhbGxpZXIgPGdhdGllbi5jaGV2YWxsaWVyQGZvc3Muc3QuY29tPgo+PiBT
aWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3Qu
Y29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBm
b3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRl
L21hY2gvZXR6cGMuaCB8wqAgMzIgKysrKwo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvc3Rt
MzJtcDEvTWFrZWZpbGXCoMKgwqAgfMKgwqAgMSArCj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJt
cC9zdG0zMm1wMS9ldHpwYy5jwqDCoMKgwqAgfCAxOTQgKysrKysrKysrKysrKysrKysrKysrCj4+
IMKgIDMgZmlsZXMgY2hhbmdlZCwgMjI3IGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGFyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvZXR6cGMuaAo+PiDCoCBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL2V0enBjLmMK
Pj4KPiAuLi4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9l
dHpwYy5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL2V0enBjLmMKPj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAuLmI3YWVmYjg0MDY5Cj4+IC0tLSAv
ZGV2L251bGwKPj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL2V0enBjLmMK
Pj4gQEAgLTAsMCArMSwxOTQgQEAKPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9yLWxhdGVyIE9SIEJTRC0zLUNsYXVzZQo+PiArLyoKPj4gKyAqIENvcHlyaWdodCAoQykg
MjAyMywgU1RNaWNyb2VsZWN0cm9uaWNzIC0gQWxsIFJpZ2h0cyBSZXNlcnZlZAo+PiArICovCj4+
ICsKPj4gKyNkZWZpbmUgTE9HX0NBVEVHT1JZIFVDTEFTU19TSU1QTEVfQlVTCj4gCj4gCj4gbWlu
b3LCoCA9PiB3aHkgU0lNUExFX0JVUyBoZXJlID8KPiAKPiAKPiAjZGVmaW5lIExPR19DQVRFR09S
WSBVQ0xBU1NfTk9QCgpPayB3aWxsIHVwZGF0ZSBpdAoKVGhhbmtzCgo+IAo+IAo+PiArCj4+ICsj
aW5jbHVkZSA8ZG0uaD4KPj4gKyNpbmNsdWRlIDxhc20vaW8uaD4KPj4gKyNpbmNsdWRlIDxkbS9k
ZXZpY2UuaD4KPj4gKyNpbmNsdWRlIDxkbS9kZXZpY2VfY29tcGF0Lmg+Cj4+ICsjaW5jbHVkZSA8
ZG0vbGlzdHMuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgo+PiArI2luY2x1ZGUg
PG1hY2gvZXR6cGMuaD4KPj4gKwo+IC4uLgo+PiArCj4+ICtVX0JPT1RfRFJJVkVSKHN0bTMyX2V0
enBjKSA9IHsKPj4gK8KgwqDCoCAubmFtZSA9ICJzdG0zMl9ldHpwYyIsCj4+ICvCoMKgwqAgLmlk
ID0gVUNMQVNTX05PUCwKPj4gK8KgwqDCoCAub2ZfbWF0Y2ggPSBzdG0zMl9ldHpwY19pZHMsCj4+
ICvCoMKgwqAgLmJpbmQgPSBzdG0zMl9ldHpwY19iaW5kLAo+PiArwqDCoMKgIC5wbGF0X2F1dG8g
PSBzaXplb2Yoc3RydWN0IHN0bTMyX2V0enBjX3BsYXQpLAo+PiArfTsKPiAKPiAKPiAKPiBSZXZp
ZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4K
PiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCj4gCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
