Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4034D7E7C7A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Nov 2023 14:21:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 059EBC6B44F;
	Fri, 10 Nov 2023 13:21:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0A48C6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 13:21:19 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AA9mEJw021404; Fri, 10 Nov 2023 14:21:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=47RpwYXIA449T2dbkQsM/YKkKuehk1m2CZaKb5HbWkA=; b=sg
 1gws49INRsMIKdCvPsO/1g75CNxJkU5SqiuBdgxoxtZLmnxG2QgBz/BXH3NhjVOt
 HpIGuOjcx3m6PYMgRz5ZaTgfW6vjiDIGpXFTp4TR5qK7eNiVk1b+cxJTNRvTh5gY
 3vCEqNAdrQtmaLcIcvszErxiMYVKnVqxx9rApCw54Sj07Qa+oXRz0siAtU39olc/
 RV2ZtS4QGMAuFY8/8s19hby4vYd3ZdyFew4/ekncXKtYAwBW4xUelc+uTqt7E+XQ
 G53MPZmwy4dL1iYhQJ0QbHv0hGYZM2sylTvYW7HJAmDCU7MqD8uiKhJXX3ax6/NE
 +2iKQjtSHwYnI5T722NA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u84a5n1h5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 14:21:19 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AD901100056;
 Fri, 10 Nov 2023 14:21:18 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A6F2E25E53D;
 Fri, 10 Nov 2023 14:21:18 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 10 Nov
 2023 14:21:18 +0100
Message-ID: <a0b63137-8d10-4aa9-a012-00d4a99075dd@foss.st.com>
Date: Fri, 10 Nov 2023 14:21:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
 <20231027144304.1002307-5-patrice.chotard@foss.st.com>
 <6b6b7f17-039b-4e00-8bef-984d762ad98b@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <6b6b7f17-039b-4e00-8bef-984d762ad98b@foss.st.com>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_10,2023-11-09_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v1 4/9] stm32mp: dram_init: Limit DDR
 usage under 4GB boundary for STM32MP
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

CgpPbiAxMS85LzIzIDEwOjEzLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDEwLzI3LzIzIDE2OjQyLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IExpbWl0IEREUiB1c2Fn
ZSB1bmRlciA0R0IgYm91bmRhcnkgb24gU1RNMzJNUCByZWdhcmRsZXNzIG9mCj4+IG1lbW9yeSBz
aXplIGRlY2xhcmVkIGluIGRldmljZSB0cmVlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNl
IENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGFy
Y2gvYXJtL21hY2gtc3RtMzJtcC9kcmFtX2luaXQuYyB8IDggKysrKysrKy0KPj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2RyYW1faW5pdC5jIGIvYXJjaC9hcm0vbWFjaC1zdG0z
Mm1wL2RyYW1faW5pdC5jCj4+IGluZGV4IGNiMzVlZDYwY2ExLi5mYjEyMDhmYzVkNSAxMDA2NDQK
Pj4gLS0tIGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2RyYW1faW5pdC5jCj4+ICsrKyBiL2FyY2gv
YXJtL21hY2gtc3RtMzJtcC9kcmFtX2luaXQuYwo+PiBAQCAtNTIsOSArNTIsMTUgQEAgcGh5c19h
ZGRyX3QgYm9hcmRfZ2V0X3VzYWJsZV9yYW1fdG9wKHBoeXNfc2l6ZV90IHRvdGFsX3NpemUpCj4+
IMKgwqDCoMKgwqAgaWYgKCF0b3RhbF9zaXplKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IGdkLT5yYW1fdG9wOwo+PiDCoCArwqDCoMKgIC8qCj4+ICvCoMKgwqDCoCAqIG1ha2Ugc3VyZSBV
LUJvb3QgdXNlcyBhZGRyZXNzIHNwYWNlIGJlbG93IDRHQiBib3VuZGFyaWVzIGV2ZW4KPj4gK8Kg
wqDCoMKgICogaWYgdGhlIGVmZmVjdGl2ZSBhdmFpbGFibGUgbWVtb3J5IGlzIGJpZ2dlcgo+PiAr
wqDCoMKgwqAgKi8KPj4gK8KgwqDCoCBnZC0+cmFtX3RvcCA9IGNsYW1wX3ZhbChnZC0+cmFtX3Rv
cCwgMCwgU1pfNEcgLSAxKTsKPj4gKwo+PiDCoMKgwqDCoMKgIC8qIGZvdW5kIGVub3VnaCBub3Qt
cmVzZXJ2ZWQgbWVtb3J5IHRvIHJlbG9jYXRlZCBVLUJvb3QgKi8KPj4gwqDCoMKgwqDCoCBsbWJf
aW5pdCgmbG1iKTsKPj4gLcKgwqDCoCBsbWJfYWRkKCZsbWIsIGdkLT5yYW1fYmFzZSwgZ2V0X2Vm
ZmVjdGl2ZV9tZW1zaXplKCkpOwo+PiArwqDCoMKgIGxtYl9hZGQoJmxtYiwgZ2QtPnJhbV9iYXNl
LCBnZC0+cmFtX3RvcCAtIGdkLT5yYW1fYmFzZSk7Cj4+IMKgwqDCoMKgwqAgYm9vdF9mZHRfYWRk
X21lbV9yc3ZfcmVnaW9ucygmbG1iLCAodm9pZCAqKWdkLT5mZHRfYmxvYik7Cj4+IMKgwqDCoMKg
wqAgLyogYWRkIDhNIGZvciByZXNlcnZlZCBtZW1vcnkgZm9yIGRpc3BsYXksIGZkdCwgZ2QsLi4u
ICovCj4+IMKgwqDCoMKgwqAgc2l6ZSA9IEFMSUdOKFNaXzhNICsgQ09ORklHX1NZU19NQUxMT0Nf
TEVOICsgdG90YWxfc2l6ZSwgTU1VX1NFQ1RJT05fU0laRSksCj4gCj4gCj4gUmV2aWV3ZWQtYnk6
IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhh
bmtzCj4gUGF0cmljawo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9uZXh0CgpUaGFua3MKUGF0
cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=
