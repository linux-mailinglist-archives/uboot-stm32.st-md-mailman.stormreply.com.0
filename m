Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A797E7C79
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Nov 2023 14:21:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0A06C6B44F;
	Fri, 10 Nov 2023 13:21:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09CFBC6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 13:21:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AAAIMaC010116; Fri, 10 Nov 2023 14:21:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=xexKF8UIrKmP99Q8IcuS1bzGmGClRbtrWWHrBgVbG0w=; b=dR
 x+IZEjKSbpPM5yAXEVaXvJfL9evCox3lhClLNE+38blAOcC0Ay9whFabNTZs4+Jy
 +Cc7b1E7aNdij7s9d3FxVjogUC3YI5AOU7E6pZZmxgbmk39aP6qaZcSbLwH1Bbz0
 YtWYEv4WjdhLCE4EiDILqz3X95mgX2n6Xbcd/iStfnb4RysiYdZLpSeSniY4I3Lx
 zg25pnWTWbhmTd9XB0Z9LbHsdItWXxB+DwzPs32fCvrDnrPwXBDpWNw2HbIdqJX/
 hIhjAUfcJv+iVrODm5w7zcSeeSGMCGBTp6MN8W5eMIFeeU3iyq5CODhU7onk+NXd
 lcI5aM0eDSfJkf7doqfw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u7w26pddh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 14:21:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D5B82100056;
 Fri, 10 Nov 2023 14:21:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE15325E535;
 Fri, 10 Nov 2023 14:21:12 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 10 Nov
 2023 14:21:12 +0100
Message-ID: <d3e8e391-a4a0-4efd-8b3c-2c8aea8634b8@foss.st.com>
Date: Fri, 10 Nov 2023 14:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
 <20231027144304.1002307-4-patrice.chotard@foss.st.com>
 <473399db-ac71-4cdc-9f2c-fe2b2645d9d5@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <473399db-ac71-4cdc-9f2c-fe2b2645d9d5@foss.st.com>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_10,2023-11-09_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v1 3/9] stm32mp: dram_init: Fix AARCH64
 compilation warnings
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

CgpPbiAxMS85LzIzIDEwOjEzLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IAo+
IE9uIDEwLzI3LzIzIDE2OjQyLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEZyb206IFBhdHJp
Y2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+Cj4+IFdoZW4gYnVp
bGRpbmcgd2l0aCBBQVJDSDY0IGRlZmNvbmZpZywgd2UgZ290IHdhcm5pbmdzIGZvciBkZWJ1Zwo+
PiBtZXNzYWdlCj4+IC0gZm9ybWF0ICcleCcgZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBlICd1bnNp
Z25lZCBpbnQnLAo+PiDCoMKgwqAgYnV0IGFyZ3VtZW50IDMgaGFzIHR5cGUgJ3NpemVfdCcge2Fr
YSAnbG9uZyB1bnNpZ25lZCBpbnQnfSkuCj4+IC0gZm9ybWF0ICclbHgnIGV4cGVjdHMgYXJndW1l
bnQgb2YgdHlwZSAnbG9uZyB1bnNpZ25lZCBpbnQnLAo+PiDCoMKgIGJ1dCBhcmd1bWVudCAyIGhh
cyB0eXBlICdwaHlzX2FkZHJfdCcge2FrYSAnbG9uZyBsb25nIHVuc2lnbmVkCj4+IMKgwqAgaW50
J30KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5h
eUBmb3NzLnN0LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNl
LmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMy
bXAvZHJhbV9pbml0LmMgfCAyICstCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1w
L2RyYW1faW5pdC5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2RyYW1faW5pdC5jCj4+IGluZGV4
IGExZTc3YTQyZTRmLi5jYjM1ZWQ2MGNhMSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vbWFjaC1z
dG0zMm1wL2RyYW1faW5pdC5jCj4+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9kcmFtX2lu
aXQuYwo+PiBAQCAtMzYsNyArMzYsNyBAQCBpbnQgZHJhbV9pbml0KHZvaWQpCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBsb2dfZGVidWcoIkNhbm5vdCBnZXQgUkFNIHNpemU6ICVkXG4iLCByZXQpOwo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gwqDCoMKgwqDCoCB9Cj4+IC3CoMKg
wqAgbG9nX2RlYnVnKCJSQU0gaW5pdCBiYXNlPSVseCwgc2l6ZT0leFxuIiwgcmFtLmJhc2UsIHJh
bS5zaXplKTsKPj4gK8KgwqDCoCBsb2dfZGVidWcoIlJBTSBpbml0IGJhc2U9JXAsIHNpemU9JXp4
XG4iLCAodm9pZCAqKXJhbS5iYXNlLCByYW0uc2l6ZSk7Cj4+IMKgIMKgwqDCoMKgwqAgZ2QtPnJh
bV9zaXplID0gcmFtLnNpemU7Cj4+IMKgIAo+IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERl
bGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBhdHJp
Y2sKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbmV4dAoKVGhhbmtzClBhdHJpY2UKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFp
bGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3Rt
MzIK
