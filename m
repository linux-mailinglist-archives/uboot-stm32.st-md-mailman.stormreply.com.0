Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E9A79A706
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Sep 2023 11:51:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E43EC6B46E;
	Mon, 11 Sep 2023 09:51:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83DDAC65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 09:51:20 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38B9SvjU023324; Mon, 11 Sep 2023 11:51:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=6KoLANZw2GZQ0fvfBNZpQL3T7V/SfT/NHJKNuINKmEE=; b=Oa
 DlMCaRbH1ansgME7Knkb/9SL4qUEVHiMdCq/LTSsGE9OCensKwGlEepQs3XuSizC
 IjMXQIFT4spcuuPCP2/Z0SyUgyHdEG39/eVLogsnOwfx/kfwIMba1Sap7UfMYGj7
 V4QDh5G9o8CsBW5nUQ7QdRFC16Fd/AdyxUhM13+mwxN7fgam06So16Fa6Vdf0uGJ
 ZsshRV4tkFmDatnU9xu3JtGvB49Id4ye7Do84jdUfIAc35lhAIwAC/MDJMOZ3Zxa
 ATmkz0CWs58F08crI6zfTztTewK3EOmM0YWEonJH9BaarEaJh83huLuvewRICatX
 chVuFfV7HSAnhgDc6mcA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t0g21yan6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Sep 2023 11:51:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4CF9810005A;
 Mon, 11 Sep 2023 11:51:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 469E123A163;
 Mon, 11 Sep 2023 11:51:18 +0200 (CEST)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 11:51:17 +0200
Message-ID: <64679ab9-ecde-2af7-a16e-658172d5b57a@foss.st.com>
Date: Mon, 11 Sep 2023 11:51:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20230907162200.205602-1-gatien.chevallier@foss.st.com>
 <20230907162200.205602-2-gatien.chevallier@foss.st.com>
 <7cad48d4-7dd2-474d-b8cc-20de2e75e33b@gmx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <7cad48d4-7dd2-474d-b8cc-20de2e75e33b@gmx.de>
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 2/7] configs: default activate
 CONFIG_RNG_STM32 for STM32MP13x platforms
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

CgpPbiA5LzgvMjMgMjA6NTgsIEhlaW5yaWNoIFNjaHVjaGFyZHQgd3JvdGU6Cj4gT24gOS83LzIz
IDE4OjIxLCBHYXRpZW4gQ2hldmFsbGllciB3cm90ZToKPj4gRGVmYXVsdCBlbWJlZCB0aGlzIGNv
bmZpZ3VyYXRpb24uIElmIE9QLVRFRSBQVEEgUk5HIGlzIHByZXNlbnQgYXMgd2VsbCwKPj4gdGhl
IHByaW9yaXR5IHdpbGwgYmUgZ2l2ZW4gdG8gaXQgaW5zdGVhZCBvZiB0aGUgVS1Cb290IGRyaXZl
ci4KPiAKPiBBcmUgeW91IHJlbHlpbmcgaGVyZSBvbiBkcml2ZXJzIGJlaW5nIHByb2JlZCBpbiBh
bHBoYWJldGljYWwgc2VxdWVuY2U/Cj4gCj4gQmVzdCByZWdhcmRzCj4gCj4gSGVpbnJpY2gKPiAK
CkhlbGxvIEhlaW5yaWNoLAoKSSd2ZSBtYWRlIGEgc3RyYW5nZSB3b3JkaW5nIGhlcmUuCgpPUC1U
RUUgUk5HIFBUQSBzaG91bGRuJ3QgYmUgZXhwb3NlZCBpZiB0aGUgUk5HIGlzIG5vbi1zZWN1cmUg
YXMgaXQKc2hvdWxkbid0IGJlIGhhbmRsZWQgYnkgdGhlIHNlY3VyZSB3b3JsZC4gSWYgaXQgaXMs
IGl0IGlzIGEgYmFkCk9QLVRFRSBjb25maWd1cmF0aW9uLgoKT24gdGhlIGNvbnRyYXJ5LCBpZiB0
aGUgUk5HIE9QVEVFIFBUQSBpcyBleHBvc2VkLCB0aGVuIHRoZSBPUC1URUUKUk5HIFBUQSBzaG91
bGQgYmUgdXNlZC4gVGhlcmVmb3JlLCB0aGUgUk5HIG5vZGUgc3RhdHVzIHNob3VsZG4ndApiZSBz
ZXQgdG8gIm9rYXkiIGluIFUtYm9vdCdzIGRldmljZSB0cmVlLgoKSG9wZSB0aGlzIHNvbHZlcyB0
aGUgY29uZnVzaW9uLCBJJ2xsIHJld29yZCB0aGUgc2VudGVuY2UuCgpCZXN0IHJlZ2FyZHMsCkdh
dGllbgoKPj4KPj4gU2lnbmVkLW9mZi1ieTogR2F0aWVuIENoZXZhbGxpZXIgPGdhdGllbi5jaGV2
YWxsaWVyQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gwqAgY29uZmlncy9zdG0zMm1wMTNfZGVmY29u
ZmlnIHwgMSArCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvY29uZmlncy9zdG0zMm1wMTNfZGVmY29uZmlnIGIvY29uZmlncy9zdG0zMm1wMTNf
ZGVmY29uZmlnCj4+IGluZGV4IDgyYjYyNzQ0ZjYuLjRhODk5Yzg1ZGUgMTAwNjQ0Cj4+IC0tLSBh
L2NvbmZpZ3Mvc3RtMzJtcDEzX2RlZmNvbmZpZwo+PiArKysgYi9jb25maWdzL3N0bTMybXAxM19k
ZWZjb25maWcKPj4gQEAgLTY1LDYgKzY1LDcgQEAgQ09ORklHX0RNX1JFR1VMQVRPUl9HUElPPXkK
Pj4gwqAgQ09ORklHX0RNX1JFR1VMQVRPUl9TQ01JPXkKPj4gwqAgQ09ORklHX1JFU0VUX1NDTUk9
eQo+PiDCoCBDT05GSUdfRE1fUk5HPXkKPj4gK0NPTkZJR19STkdfU1RNMzI9eQo+PiDCoCBDT05G
SUdfRE1fUlRDPXkKPj4gwqAgQ09ORklHX1JUQ19TVE0zMj15Cj4+IMKgIENPTkZJR19TRVJJQUxf
UlhfQlVGRkVSPXkKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
