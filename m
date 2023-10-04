Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E7B7B7E55
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Oct 2023 13:39:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CCBBC6C831;
	Wed,  4 Oct 2023 11:39:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCCDEC6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 11:39:46 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 394ATau4022722; Wed, 4 Oct 2023 13:39:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=JldkG0wkxzw1qyHSCVh/A4kGvKM0130xv33MLzwR+VI=; b=xv
 h7cQcuA+jCAJX9gmNCxem6z46sjHv5cfFwmnSkDLv+SsRKwkkMLLjC+nN4NoaBa+
 IEf/VknYIdGll/eBBSpAUvXMyoNn0Oi2MDljLJjcMfNTpFEGsrQjaKtR2XMJhtcu
 TuDUdwKHbefdx1ouHGpcr/4YgZ2pbmrKRZWFH7Jfsw18+LJK5WNxzwfNDEdUtAVg
 qydosIeq5gnLGtEnETh+tX1z3WP07+Z9lI5z3bJ4LJr+1NCAcJr2t0/R8ua5wKv4
 ACda3RLkMxBD6xA1qwWdySSCR8XFHhI3HhHT9Dlb+U8W8PPIJ/Uxpu2Xjs10QGR8
 VegEeAyG02goh0eJ1Wng==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tggx359cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 13:39:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D4733100053;
 Wed,  4 Oct 2023 13:39:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD2BD235F11;
 Wed,  4 Oct 2023 13:39:44 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 13:39:44 +0200
Message-ID: <9a7983aa-3049-f057-1dce-7f1c6e84d854@foss.st.com>
Date: Wed, 4 Oct 2023 13:39:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230926150924.1150082-1-patrice.chotard@foss.st.com>
 <20230926150924.1150082-6-patrice.chotard@foss.st.com>
 <fb1f4a63-40b5-e675-70a5-2b80e93f945a@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <fb1f4a63-40b5-e675-70a5-2b80e93f945a@foss.st.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_03,2023-10-02_01,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 5/6] configs: stm32mp13: add support of
	usb boot
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

CgpPbiAxMC80LzIzIDExOjU3LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDkvMjYvMjMgMTc6MDksIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gRnJvbTogUGF0cmljayBE
ZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4KPj4gQWRkIHN1cHBvcnQg
b2YgVVNCIGtleSBib290IGluIGRpc3RybyBib290IGNvbW1hbmQuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IFNp
Z25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29t
Pgo+PiAtLS0KPj4KPj4gwqAgaW5jbHVkZS9jb25maWdzL3N0bTMybXAxM19jb21tb24uaCB8IDkg
KysrKysrKystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvY29uZmlncy9zdG0zMm1wMTNfY29tbW9u
LmggYi9pbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDEzX2NvbW1vbi5oCj4+IGluZGV4IGQzNmZiZjAw
NTQ4Li41YjA2NThjZWQ5MiAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9jb25maWdzL3N0bTMybXAx
M19jb21tb24uaAo+PiArKysgYi9pbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDEzX2NvbW1vbi5oCj4+
IEBAIC0zNSw5ICszNSwxNiBAQAo+PiDCoCAjZGVmaW5lIEJPT1RfVEFSR0VUX01NQzEoZnVuYykK
Pj4gwqAgI2VuZGlmCj4+IMKgICsjaWZkZWYgQ09ORklHX0NNRF9VU0IKPj4gKyNkZWZpbmUgQk9P
VF9UQVJHRVRfVVNCKGZ1bmMpwqDCoMKgIGZ1bmMoVVNCLCB1c2IsIDApCj4+ICsjZWxzZQo+PiAr
I2RlZmluZSBCT09UX1RBUkdFVF9VU0IoZnVuYykKPj4gKyNlbmRpZgo+PiArCj4+IMKgICNkZWZp
bmUgQk9PVF9UQVJHRVRfREVWSUNFUyhmdW5jKcKgwqDCoCBcCj4+IMKgwqDCoMKgwqAgQk9PVF9U
QVJHRVRfTU1DMShmdW5jKcKgwqDCoMKgwqDCoMKgIFwKPj4gLcKgwqDCoCBCT09UX1RBUkdFVF9N
TUMwKGZ1bmMpCj4+ICvCoMKgwqAgQk9PVF9UQVJHRVRfTU1DMChmdW5jKcKgwqDCoMKgwqDCoMKg
IFwKPj4gK8KgwqDCoCBCT09UX1RBUkdFVF9VU0IoZnVuYykKPj4gwqAgwqAgLyoKPj4gwqDCoCAq
IGRlZmF1bHQgYm9vdGNtZCBmb3Igc3RtMzJtcDEzOgo+IAo+IAo+IAo+IFJldmlld2VkLWJ5OiBQ
YXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5r
cwo+IFBhdHJpY2sKPiAKPiAKPiAKQXBwbHkgb24gc3RtMzIvbmV4dAoKVGhhbmtzClBhdHJpY2UK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK
