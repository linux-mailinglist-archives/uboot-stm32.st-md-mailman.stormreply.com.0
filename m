Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C125490B77
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Jan 2022 16:36:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D802CC57B6C;
	Mon, 17 Jan 2022 15:36:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E386AC57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jan 2022 15:36:15 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20HDeET1007704;
 Mon, 17 Jan 2022 16:36:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ou/VVkGTDx28JiEW6c1S4PigkJIe5/YV3ANvq4mRtQc=;
 b=Ejsr45jjPor+xLZ7/sU9aaZmEcUGxSlhkRS6pTMIBy5yjwhrFPAyHIOcC+6vo5x2SPAu
 29m9vcbroxRXu2Ogc03iT/LVXbjGQxbE1sUg4zDoVhsmgX2eby0a2Mz0S7Mj6tsZj1Si
 O6gZcU9YsAomVpuGb9c6tUB3hMqIdLQ9QXcCdwrRjrS1Rp1bOQpu4v8DLLdA2yrGY4s4
 t4IRLUEZov0e9/DQMi6LzeMpkHsFuD9mzp3Mq1U+996W5fQru5Y5GDVs25PyyfOVlhcG
 ntmEm5wAhvxkCvhmWqp1mCBbeUv58ljssX32I/2+VH1Cernnq9bB7P663Guc7YPWLNmm MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dmwkwkmxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 16:36:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F9D8100038;
 Mon, 17 Jan 2022 16:36:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5995921D3B2;
 Mon, 17 Jan 2022 16:36:13 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.46) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 17 Jan
 2022 16:36:12 +0100
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
References: <20220111162713.632395-1-patrick.delaunay@foss.st.com>
 <852bbfb816e1c6cde3364563e479766c46c0b9ce.camel@toradex.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <2482b737-25ad-69e8-db67-b46b71c23985@foss.st.com>
Date: Mon, 17 Jan 2022 16:36:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <852bbfb816e1c6cde3364563e479766c46c0b9ce.camel@toradex.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_07,2022-01-14_01,2021-12-02_01
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "sjg@chromium.org" <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 0/3] sandox: test: activate tests for the
	command LOG
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

Ck9uIDEvMTIvMjIgMTA6MjkgQU0sIE1hcmNlbCBaaXN3aWxlciB3cm90ZToKPiBPbiBUdWUsIDIw
MjItMDEtMTEgYXQgMTc6MjcgKzAxMDAsIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4+IFRoaXMg
cGF0Y2hlcyBhY3RpdmF0ZSB0aGUgY29tbWFuZCBMT0cgYW5kIHRoZSBhc3NvY2lhdGVkIHRlc3Rz
Cj4+IGluIHNhbmRib3ggd2l0aCBDT05GSUdfQ01EX0xPRz15IGFuZCBzb2x2ZSB0aGUgYXNzb2Np
YXRlZCBpc3N1ZXMKPj4gd2hlbiB0aGVzZSB0ZXN0cyBhcmUgZXhlY3V0ZWQuCj4+Cj4+IFBhdHJp
Y2sKPj4KPj4KPj4gUGF0cmljayBEZWxhdW5heSAoMyk6Cj4+ICDCoCBkbTogZml4IHVwIGRvY3Vt
ZW50YXRpb24gZm9yIHVjbGFzc19nZXRfYnlfbmFtZV9sZW4KPj4gIMKgIGRtOiBjb21wYXJlIGZ1
bGwgbmFtZSBpbiB1Y2xhc3NfZ2V0X2J5X25hbWUKPj4gIMKgIHNhbmRveDogdGVzdDogYWN0aXZh
dGUgdGVzdHMgZm9yIHRoZSBjb21tYW5kIExPRwo+IFByb2JhYmx5IHNob3VsZCByZWFkIHNhbmRi
b3guIFNhbWUgZm9yIHRoaXMgY292ZXItbGV0dGVyJ3Mgc3ViamVjdCA7LXAuCm91cHMsIHllcwo+
Cj4+ICDCoGNvbmZpZ3Mvc2FuZGJveF9kZWZjb25maWcgfMKgIDIgKy0KPj4gIMKgZHJpdmVycy9j
b3JlL3VjbGFzcy5jwqDCoMKgwqAgfCAxMSArKysrKysrKysrLQo+PiAgwqBpbmNsdWRlL2RtL3Vj
bGFzcy5owqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0KPj4gIMKgdGVzdC9weS90ZXN0cy90ZXN0X2xv
Zy5weSB8wqAgOCArKysrLS0tLQo+PiAgwqA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
