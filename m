Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2FF9DFB3C
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Dec 2024 08:30:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E56CC6DD66;
	Mon,  2 Dec 2024 07:30:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B83BC03FC0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2024 07:30:39 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B27GlX7004910;
 Mon, 2 Dec 2024 08:30:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 HSAsbV4pjxZWIASvbK5KX8HegebFGAU2WgM3HY/SRIQ=; b=Y3IZqd6dRLeWT45C
 g4sv/X7g0po/KUwVlD7jCjKuZ7833AuHITNBtmul++rSOKdQKdVt6iqqcXcdIOGN
 ILRHRri5lr4PwkFki1d3ReALKA2BvWgn6Hvj90JRBxPh5RiI3f4jhfWLZ6sXhMw9
 6LnC0DxHQRtiD+a4huoH17UZ01w350wS7SSYgDTnmUnZnFGKm4zwhvn20k9BdP61
 CQUsRWWP4sogWDyXvz2pL3lGQxoXup/O7bDOJbcJeeigCc8ABNzUljuu16yFtTki
 K9A5x+aASml3xAyDYRx1FKloj0CE5ShXVk3FD+t8fhwZdn7/1/iXQVhD8vP5o+k4
 RCi3lA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 437rq8xcvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2024 08:30:33 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A382440049;
 Mon,  2 Dec 2024 08:29:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0038C266A5D;
 Mon,  2 Dec 2024 08:28:49 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 2 Dec
 2024 08:28:49 +0100
Message-ID: <e884dd0e-7ff1-4e1c-9e77-dadb0fd26891@foss.st.com>
Date: Mon, 2 Dec 2024 08:28:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241129124617.436381-1-patrice.chotard@foss.st.com>
 <98fb1df2-b5ba-4ccf-97c8-d0555c1cdb61@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <98fb1df2-b5ba-4ccf-97c8-d0555c1cdb61@denx.de>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: gadget: f_mass_storage: Add
 schedule() in sleep_thread()
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

CgpPbiAxMS8yOS8yNCAxODozNSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMTEvMjkvMjQgMTo0
NiBQTSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBJbiBjYXNlICJ1bXMiIGNvbW1hbmQgaXMg
dXNlZCBvbiBwbGF0Zm9ybXMgd2hpY2ggZG9uJ3QgaW1wbGVtZW50Cj4+IGdfZG5sX2JvYXJkX3Vz
Yl9jYWJsZV9jb25uZWN0ZWQoKSBhbmQgVVNCIGNhYmxlIGlzIG5vdCBjb25uZWN0ZWQsCj4+IHdl
IHN0YXkgaW5zaWRlIHNsZWVwX3RocmVhZCgpIGZvcmV2ZXIgYW5kIHdhdGNoZG9nIGlzIHRyaWdn
ZXJlZC4KPj4KPj4gQWRkIHNjaGVkdWxlKCkgY2FsbCB0byBhdm9pZCB0aGlzIGlzc3VlLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0
LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGRyaXZlcnMvdXNiL2dhZGdldC9mX21hc3Nfc3RvcmFnZS5j
IHwgMSArCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L2ZfbWFzc19zdG9yYWdlLmMgYi9kcml2ZXJzL3VzYi9n
YWRnZXQvZl9tYXNzX3N0b3JhZ2UuYwo+PiBpbmRleCBmZmUxYWU2ZWI3My4uNmRjNzNlZjQ0N2Ig
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC9mX21hc3Nfc3RvcmFnZS5jCj4+ICsr
KyBiL2RyaXZlcnMvdXNiL2dhZGdldC9mX21hc3Nfc3RvcmFnZS5jCj4+IEBAIC02ODAsNiArNjgw
LDcgQEAgc3RhdGljIGludCBzbGVlcF90aHJlYWQoc3RydWN0IGZzZ19jb21tb24gKmNvbW1vbikK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTzsKPj4gwqAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgayA9IDA7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNjaGVkdWxlKCk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IMKgIMKgwqDCoMKgwqDC
oMKgwqDCoCBkbV91c2JfZ2FkZ2V0X2hhbmRsZV9pbnRlcnJ1cHRzKHVkY2Rldik7Cj4gCj4gU2hv
dWxkbid0IHRoYXQgc2NoZWR1bGUoKSBiZSBwbGFjZWQgcmlnaHQgYmVmb3JlL2FmdGVyIGRtX3Vz
Yl9nYWRnZXRfaGFuZGxlX2ludGVycnVwdHMoKSA/CgpIaSBNYXJlawoKWWVzIHNjaGVkdWxlKCkg
Y2FuIGJlIHB1dCBiZWZvcmUvYWZ0ZXIgZG1fdXNiX2dhZGdldF9oYW5kbGVfaW50ZXJydXB0cygp
LgpJIHdpbGwgc2VuZCBhIHYyLgoKUGF0cmljZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
